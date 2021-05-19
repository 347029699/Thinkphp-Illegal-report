<?php

namespace app\index\controller;
use think\Session;
use util\Tree;
use think\Db;
use app\admin\model\Attachment as AttachmentModel;
use think\Image;
use think\File;
use think\facade\Env;

/**
 * 前台首页控制器
 * @package app\index\controller
 */
class Upload extends Home
{
    protected $except = [
        'login' => ['wechat','fileupload'],
        'wechat' => ['wechat','fileupload'],
    ];

    /**
     * 前端附件上传
     */
    public function fileupload(){
        $from = 'jcrop';
        $dir = 'images';
        // 附件大小限制
        $size_limit = $dir == 'images' ? config('upload_image_size') : config('upload_file_size');
        $size_limit = $size_limit * 1024;
        // 附件类型限制
        $ext_limit = $dir == 'images' ? config('upload_image_ext') : config('upload_file_ext');
        $ext_limit = $ext_limit != '' ? parse_attr($ext_limit) : '';
        // 缩略图参数
        $thumb = $this->request->post('thumb', '');
        // 水印参数
        $watermark = $this->request->post('watermark', '');

        // 获取附件数据
        $callback = '';
        $file_input_name = 'file';
        $file = $this->request->file($file_input_name);
        // 判断附件是否已存在
        if ($file_exists = AttachmentModel::get(['md5' => $file->hash('md5')])) {
            if ($file_exists['driver'] == 'local') {
                $file_path = PUBLIC_PATH. $file_exists['path'];
            } else {
                $file_path = $file_exists['path'];
            }

            // 附件已存在
            return json([
                'code'   => 1,
                'info'   => '上传成功',
                'class'  => 'success',
                'id'     => $file_exists['id'],
                'path'   => $file_path
            ]);
        }

        // 判断附件大小是否超过限制
        if ($size_limit > 0 && ($file->getInfo('size') > $size_limit)) {
            return  json([
                'code'   => 0,
                'info'   => '上传失败',
            ]);
        }
        // 判断附件格式是否符合
        $file_name = $file->getInfo('name');
        $file_ext  = strtolower(substr($file_name, strrpos($file_name, '.')+1));
        $error_msg = '';
        if ($ext_limit == '') {
            $error_msg = '获取文件信息失败！';
        }
        if ($file->getMime() == 'text/x-php' || $file->getMime() == 'text/html') {
            $error_msg = '禁止上传非法文件！';
        }
        if (preg_grep("/php/i", $ext_limit)) {
            $error_msg = '禁止上传非法文件！';
        }
        if (!preg_grep("/$file_ext/i", $ext_limit)) {
            $error_msg = '附件类型不正确！';
        }

        if ($error_msg != '') {
            // 上传错误
            return  json([
                'code'   => 0,
                'info'   => $error_msg,
            ]);
        }

        // 移动到框架应用根目录/uploads/ 目录下
        $info = $file->move(config('upload_path') . DIRECTORY_SEPARATOR . $dir);
        if($info){
            // 缩略图路径
            $thumb_path_name = '';
            // 图片宽度
            $img_width = '';
            // 图片高度
            $img_height = '';
            if ($dir == 'images') {
                $img = Image::open($info);
                $img_width  = $img->width();
                $img_height = $img->height();
                // 水印功能
                if ($watermark == '') {
                    if (config('upload_thumb_water') == 1 && config('upload_thumb_water_pic') > 0) {
                        $this->create_water($info->getRealPath(), config('upload_thumb_water_pic'));
                    }
                } else {
                    if (strtolower($watermark) != 'close') {
                        list($watermark_img, $watermark_pos, $watermark_alpha) = explode('|', $watermark);
                        $this->create_water($info->getRealPath(), $watermark_img, $watermark_pos, $watermark_alpha);
                    }
                }
            }

            // 获取附件信息
            $file_info = [
                'uid'    => 0,
                'name'   => $file->getInfo('name'),
                'mime'   => $file->getInfo('type'),
                'path'   => 'uploads/' . $dir . '/' . str_replace('\\', '/', $info->getSaveName()),
                'ext'    => $info->getExtension(),
                'size'   => $info->getSize(),
                'md5'    => $info->hash('md5'),
                'sha1'   => $info->hash('sha1'),
                'thumb'  => $thumb_path_name,
                'module' => '',
                'width'  => $img_width,
                'height' => $img_height,
            ];
            
            // 写入数据库
            if ($file_add = AttachmentModel::create($file_info)) {
                $file_path = PUBLIC_PATH. $file_info['path'];
                return json([
                    'code'   => 1,
                    'info'   => '上传成功',
                    'class'  => 'success',
                    'id'     => $file_add['id'],
                    'path'   => $file_path
                ]);
            } else {
                return  json([
                    'code'   => 0,
                    'info'   => '上传失败',
                ]);
            }
        }else{
            return  json([
                'code'   => 0,
                'info'   => $file->getError(),
            ]);
        }
    }

    /**
     * 添加水印
     * @param string $file 要添加水印的文件路径
     * @param string $watermark_img 水印图片id
     * @param string $watermark_pos 水印位置
     * @param string $watermark_alpha 水印透明度
     */
    private function create_water($file = '', $watermark_img = '', $watermark_pos = '', $watermark_alpha = '')
    {
        $AttachmentModel = new AttachmentModel();
        $path = $AttachmentModel->getFilePath($watermark_img, 1);
        $thumb_water_pic = realpath(Env::get('root_path') . 'public/' . $path);
        if (is_file($thumb_water_pic)) {
            // 读取图片
            $image = Image::open($file);
            // 添加水印
            $watermark_pos   = $watermark_pos   == '' ? config('upload_thumb_water_position') : $watermark_pos;
            $watermark_alpha = $watermark_alpha == '' ? config('upload_thumb_water_alpha') : $watermark_alpha;
            $image->water($thumb_water_pic, $watermark_pos, $watermark_alpha);
            // 保存水印图片，覆盖原图
            $image->save($file);
        }
    }

}
