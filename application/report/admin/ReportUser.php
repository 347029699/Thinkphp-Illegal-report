<?php

namespace app\report\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use think\facade\Request;
use think\Db;

/**
 * 内容控制器
 * @package app\cms\admin
 */
class ReportUser extends Admin
{
	public function index(){
		$map = $this->getMap();
		$order = $this->getOrder();
		$data_list = Db::name('report_user')
					->where($map)
					->order($order)
					->paginate();
		$pages = $data_list->render();

		return ZBuilder::make('table')
			->setPageTitle('用户信息')
			->setTableName('report_user')
			->setSearch(['name'=>'姓名','idcard'=>'身份证','number'=>'手机号'])
			->addColumns([
				['id','ID'],
				['name','姓名'],
				['idcard','身份证号'],
				['number','手机号'],
				['right_button','操作','btn']
				])
			->addOrder('id')
			->setColumnWidth('id', 40)
			->setRowList($data_list)
			->addRightButton('edit','',['title'=>'编辑','id'=>'__id__'])
			->addTopButtons('add','',['title'=>'添加用户'])
			->addTopButton('delete')
			->setPages($pages)
			->fetch();
	}
	public function add(){
		return ZBuilder::make('form')
			->setPageTitle('新增用户')
			->addText('name','姓名')
			->addText('idcard','身份证号')
			->addText('number','手机号')
			->setUrl('save')
			->fetch();
	}

	public function save(){
		$post = request()->post();
		$data = [
			'name'=>$post['name'],
			'idcard'=>$post['idcard'],
			'number'=>$post['number']
		];
		$res = Db::name('report_user')
				->insert($data);
		$arr['code'] = '1';
		$arr['msg'] = '新增成功';
		$arr['data'] = $res;
		return json($arr);
	}

	public function edit($id=''){
		$data_list = Db::name('report_user')->where('id',$id)->find();
		return ZBuilder::make('form')
			->addText('name','姓名')
			->addText('number','号码')
			->addText('idcard','身份证号')
			->setFormData($data_list)
			->setUrl(url('editsave',['id'=>$id]))
			->fetch();
	}

	public function editsave(){
		$post = $this->request->post();
		$data['id'] = $this->request->param('id');
		$data['name'] = $post['name'];
		$data['number'] = $post['number'];
		$data['idcard'] = $post['idcard'];
		$res = Db::name('report_user')->update($data);
		$arr['code'] = '1';
		$arr['msg'] = '反馈成功';
		$arr['data'] = $res;
		return json($arr);
	}
}