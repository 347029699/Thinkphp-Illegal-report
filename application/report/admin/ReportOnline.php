<?php

namespace app\report\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use think\Db;

/**
 * 内容控制器
 * @package app\cms\admin
 */
class ReportOnline extends Admin
{
	public function index(){
		$map = $this->getMap();
		$order = $this->getOrder();
		$data_list = Db::name('report_online')
						->where($map)
						->order($order)
						->paginate();
		$pages = $data_list->render();
		$feedbackbtn = [
			'title'=>'详情反馈',
			'icon'=>'fa fa-pencil-square-o',
			'href'=>url('feedback',['id'=>'__id__'])
		];
		for($i = 0;$i<count($data_list);$i++){
			$name[$i] = Db::name('report_user')->where('number',$data_list[$i]['number'])->select();
			$data[$i] = array_merge($name[$i][0],$data_list[$i]);
		}
		
		return ZBuilder::make('table')
			->setTableName('report_online')
			->addColumns([
				['id','ID'],
				['name','举报人姓名'],
				['number','举报人联系方式'],
				['report_date','问题发生时间'],
				['create_time','提交时间'],
				['back_info','是否已反馈'],
				['shenhe','审核是否通过','switch'],
				['right_button','操作','btn']
				])
			->hideCheckbox()
			->setSearch(['name'=>'举报人姓名','back_info'=>'是否反馈'])
			->addOrder('id,report_date,create_time')
			->setPages($pages)
			->setSearchArea([['daterange', 'create_time', '创建时间', '', '', ['min-date' => '2018-01-01', 'max-date' => '2022-12-31']],['daterange', 'report_date', '问题发生时间', '', '', ['min-date' => '2018-01-01', 'max-date' => '2022-12-31']]])
			->setRowList($data)
			->addRightButton('feedback',$feedbackbtn)
			->fetch();
	}

	public function feedback($id=''){
		$data_list = Db::name('report_online')
						->where('id',$id)
						->find();		
		$data_img = $data_list['report_img'];
		$img_id = explode(";",$data_img);
		for($i = 0;count($img_id)-1>$i;$i++){
			$img_path[$i] = db('admin_attachment')->where('id',$img_id[$i])->value('path');
		}
		echo "举报人姓名";
		return ZBuilder::make('form')
			->addStatic('name', '举报人姓名')
			->addStatic('report_date','问题发生时间')
			->addStatic('report_street','问题发生街道')
			->addStatic('report_address','详细地址')
			->addStatic('report_people','被举报人详情(可空)')
			->addStatic('report_mine','涉及矿种(可空)')
			->addGallery('report_img','举报图片(可空)','','')
			->addStatic('report_description','举报详情')
			->addTextarea('feedback','反馈内容','','')
			->setFormData($data_list)
			->setUrl(url('save',['id'=>$id]))
			->fetch();
	}

	public function save(){
		$post = request()->post();
		$data['id'] = request()->param('id');
		$data['feedback'] = $post['feedback'];
		if(!empty($data['feedback'])){
			$data['back_info'] = '是';
		}else{
			$data['back_info'] = '否';
		}
		$res = Db::name('report_online')->update($data);
		$arr['code'] = '1';
		$arr['msg'] = '反馈成功';
		$arr['data'] = $res;
		return json($arr);
	}
}