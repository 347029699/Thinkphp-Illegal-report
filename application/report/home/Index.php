<?php
namespace app\report\home;

header("Content-Type: text/html; charset=utf-8");

use think\Config;
use think\Controller;
use think\Session;
use util\Tree;
use think\facade\Request;
use think\Db;
use think\facade\Env;
use think\Collection;
use think\Response;
use app\index\controller\Attachment;
use app\common\controller\Common;
use app\index\controller\Upload;

/**
 * 前台首页控制器
 * @package app\index\controller
 */
class Index extends Common
{
    public function login()
    {
        $checkcode = mt_rand(0000,9999);
    	if($this->request->isAjax()){
            $number = $_POST['mobile'];
            //短信接口
			$target = "http://sms.106jiekou.com/utf8/sms.aspx";
			$post_data = "account=Hanyue&password=123456&mobile=$number&content=".rawurlencode("尊敬的用户您已经注册成功，用户名：Hanyue 密码：$checkcode 感谢您的注册！");
			$gets = $this->Post($post_data,$target);
            dump(substr($gets,-3))or die;
    	}
    	if(isset($_POST['submit'])){
	    	$name = $_POST['name'];
	    	$idcard = $_POST['idcard'];
	    	$number = $_POST['number'];
            session('number',$number);
	    	$yzm = $_POST['yzm'];
	    	//if($yzm == $checkcode){
				$user = Db::name('report_user')->where('number',$number)->find();
		    	if(!empty($user)){
                    if($name == $user['name']){
                        $data['number'] = $number;
                        $this->redirect('online',$data);
                    }else{
                        $this->error('该手机号已注册');
                    }
		    	}else{
                    $data['name'] = $name;
                    $data['idcard'] = $idcard;
                    $data['number'] = $number;
                    $res = Db::name('report_user')->insert($data); 
                    if($res){
                        $this->success('用户添加成功',url('xy',['number'=>$number])); 
                    }else{
                        $this->error('用户添加失败');
                    }                    		
		    	}	    		
	    	//}else{echo"验证码错误";}
	    }
    	return $this->fetch();
    }

    public function xy()
    {
        return $this->fetch();
    }

    public function online(){
        $data = Request::param();
        $number = $data['number'];  
        $this->assign('number',$number);
        if(isset($_POST['submit'])) {
            $data['report_street'] = $_POST['street'];
            $data['report_address'] = $_POST['address'];
            $data['report_people'] = $_POST['people'];
            $data['report_date'] = $_POST['date'];
            $data['report_description'] = $_POST['description'];
            $data['report_mine'] = $_POST['mine'];
            $data['number'] = $number;
            $data['shenhe'] = 0;

            if($this->request->post('imgid')){
                $data['report_img'] = join(",",$_POST['imgid']);
            }

            $res = Db::name('report_online')->insert($data);
            if($res){
                $this->success('提交成功',url('grzx',['number'=>$number]));
            }else{
                $this->error('提交失败');
            }
        }

        if($number != session('number')){
            echo"ERROR！！！";
        }
        else{
            return $this->fetch();
        }

    }

    public function grzx()
    {
        $param = input('');
        $number = $param['number'];
        
        
        if($this->request->isAjax()){
            $data_list = Db::name('report_online')->where('number',$number)->select();
            if(!empty($data_list)){
                for($i = 0; $i < count($data_list) ; $i++){
                    if($data_list[$i]['shenhe']==1){
                        $data_list[$i]['Status'] = '审核通过'; 
                    }else{
                        $data_list[$i]['Status'] = '审核未过';
                    }                     
                }
                echo json_encode($data_list);   die;         
            }
            else{
                echo "未查到任何举报信息<br>"; 
            }
        }
        
        if($number != session('number')){
            echo"NUMBER ERROR！！！";
        }
        else{
            return $this->fetch();
        }
    }


    public function more()
    {
        $id = $_GET['id'];
        $data_list = Db::name('report_online')->where('id',$id)->select();
        if(!empty($data_list)){
            if($data_list[0]['shenhe']==1){
                $data_list[0]['status'] = '审核通过'; 
            }else{
                $data_list[0]['status'] = '审核未过';
            }
            $this->assign('data',$data_list);
            $img_id = $data_list[0]['report_img'];
            $img_arr = $this->dealimg($img_id);
            $this->assign('img',$img_arr);

            $session_number = session('number');
            $find_id = db('report_online')->where('number',$session_number)->column('id');
            if(!in_array($id,$find_id)){
                echo"ID ERROR!!!";
            }else{
               return $this->fetch(); 
            }
        }else{
            echo"QUERY ERROR!!!";
        }

        
    }

    public function delete()
    {
        $id = Request::param('id');
        $res = Db::name('report_online')->where('id',$id)->delete();
        if($res){
            $this->success('删除成功！');
        }else{
            $this->error('删除失败');
        }
    }

    public function edit()
    {
        $id = Request::param('id');
        $res = Db::name('report_online')->where('id',$id)->select();
        $this->assign('res',$res);
        $number = $res[0]['number'];
        $img_id = $res[0]['report_img'];
        $img_arr = $this->dealimg($img_id);
        $this->assign('img',$img_arr);

        if(isset($_POST['submit'])){
            $data['report_street'] = $_POST['street'];
            $data['report_address'] = $_POST['address'];
            $data['report_people'] = $_POST['people'];
            $data['report_date'] = $_POST['date'];
            $data['report_description'] = $_POST['description'];
            $data['report_mine'] = $_POST['mine'];

            if($this->request->post('imgid')){
                $data['report_img'] = join(",",$_POST['imgid']);
            }   

            $res = Db::name('report_online')->where('id',$id)->update($data);
            //dump(Db::name('report_online')->getLastSql());
            if($res){
                $this->success('更新成功',url('grzx',['number'=>$number]));
            }else{
                $this->error('更新失败');
            }
        }
        return $this->fetch();
    }
    
	function Post($data, $target) {
	    $url_info = parse_url($target);
	    $httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
	    $httpheader .= "Host:" . $url_info['host'] . "\r\n";
	    $httpheader .= "Content-Type:application/x-www-form-urlencoded\r\n";
	    $httpheader .= "Content-Length:" . strlen($data) . "\r\n";
	    $httpheader .= "Connection:close\r\n\r\n";
	    //$httpheader .= "Connection:Keep-Alive\r\n\r\n";
	    $httpheader .= $data;

	    $fd = fsockopen($url_info['host'], 80);
	    fwrite($fd, $httpheader);
	    $gets = "";
	    while(!feof($fd)) {
	        $gets .= fread($fd, 128);
	    }
	    fclose($fd);
	    return $gets;
	}

    function upload(){
        $Upload = new Upload;
        $ret = $Upload->fileupload();
        $ret = json_decode($ret->getcontent());
        $ret = $this->object2Array($ret);
        echo json_encode($ret,320);
    }

    function object2Array($object)
    {
      $result = array();  
      if (!$object) {return $result;}
      $object = is_object($object) ? get_object_vars($object) : $object;
      foreach ($object as $key => $val) {
          $val = (is_object($val) || is_array($val)) ? self::object2Array($val) : $val;
          $result[$key] = $val;  
      }  
      return $result;  
    }

    function dealimg($img_id){
        $img_arr = explode(",",$img_id);
        return $img_arr;
    }

}
