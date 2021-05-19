-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-04-06 09:41:01
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_access`
--

CREATE TABLE `jd_admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` varchar(16) NOT NULL DEFAULT '' COMMENT '授权节点id',
  `tag` varchar(16) NOT NULL DEFAULT '' COMMENT '分组标签'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统一授权表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_action`
--

CREATE TABLE `jd_admin_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统行为表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_action`
--

INSERT INTO `jd_admin_action` (`id`, `module`, `name`, `title`, `remark`, `rule`, `log`, `status`, `create_time`, `update_time`) VALUES
(1, 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', 1, 1480156399, 1480163853),
(2, 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', 1, 1480164578, 1480297748),
(3, 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', 1, 1480168582, 1480168616),
(4, 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', 1, 1480169185, 1480169185),
(5, 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', 1, 1480169214, 1480170581),
(6, 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', 1, 1480221441, 1480221563),
(7, 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', 1, 1480251473, 1480251473),
(8, 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', 1, 1480252369, 1480252369),
(9, 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', 1, 1480252580, 1480252580),
(10, 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', 1, 1480252620, 1480252620),
(11, 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', 1, 1480252651, 1480252651),
(12, 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', 1, 1480253226, 1480253332),
(13, 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', 1, 1480253267, 1480253340),
(14, 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', 1, 1480253323, 1480253323),
(15, 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', 1, 1480296196, 1480296196),
(16, 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', 1, 1480296960, 1480296960),
(17, 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', 1, 1480298479, 1480298479),
(18, 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', 1, 1480298506, 1480298506),
(19, 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', 1, 1480298532, 1480298532),
(20, 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', 1, 1480298946, 1480298946),
(21, 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', 1, 1480301990, 1480302022),
(22, 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', 1, 1480302616, 1480302616),
(23, 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', 1, 1480302798, 1480302798),
(24, 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', 1, 1480302870, 1480302870),
(25, 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', 1, 1480303198, 1480303198),
(26, 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', 1, 1480303229, 1480303229),
(27, 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', 1, 1480303264, 1480303264),
(28, 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', 1, 1480303294, 1480303294),
(29, 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', 1, 1480303409, 1480303409),
(30, 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', 1, 1480305468, 1480305468),
(31, 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', 1, 1480305513, 1480305513),
(32, 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', 1, 1480305562, 1480305562),
(33, 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', 1, 1480305630, 1480305630),
(34, 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', 1, 1480305659, 1480305659),
(35, 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', 1, 1480307558, 1480307558),
(36, 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', 1, 1480307588, 1480307588),
(37, 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', 1, 1480307618, 1480307618),
(38, 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', 1, 1480307653, 1480307653),
(39, 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', 1, 1480307682, 1480307682),
(40, 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', 1, 1480308342, 1480308342),
(41, 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', 1, 1480308372, 1480308372),
(42, 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', 1, 1480309555, 1480309642);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_attachment`
--

CREATE TABLE `jd_admin_attachment` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `width` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片高度'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_attachment`
--

INSERT INTO `jd_admin_attachment` (`id`, `uid`, `name`, `module`, `path`, `thumb`, `url`, `mime`, `ext`, `size`, `md5`, `sha1`, `driver`, `download`, `create_time`, `update_time`, `sort`, `status`, `width`, `height`) VALUES
(3, 0, '20200403111914_iwJx3.jpeg', '', 'uploads/images/20210331/0f70dcb054041b30c8a2cd2918f64d65.jpeg', '', '', 'image/jpeg', 'jpeg', 155813, '3c467c7301a99380aa95105b56cb436c', '22403ea7dc27560627ea239a94962ffe17a24885', 'local', 0, 1617173709, 1617173709, 100, 1, 1000, 1000),
(2, 0, '5c1823233b08e8d942627b7139e5e13.png', '', 'uploads/images/20210331/8322ada379c4daca55a09caae05fa4e6.png', '', '', 'image/png', 'png', 74728, '53faffb813205d220292765decf9d247', '0537163f36342eb955003369804847bb836a2373', 'local', 0, 1617169242, 1617169242, 100, 1, 1097, 749),
(4, 1, '1.jpg', 'manage', 'uploads/images/20210401/26828f325f40ff209b7526b9c11c09ab.jpg', 'uploads/images/20210401/thumb/26828f325f40ff209b7526b9c11c09ab.jpg', '', 'image/jpeg', 'jpg', 8240, '589b9f075abc2d848a9cf93fcc2a07d8', 'd2ae3492d2332d43bc82cd4c1f0582377cc08e5a', 'local', 0, 1617269523, 1617269523, 100, 1, 500, 500),
(5, 1, '11.jpeg', 'manage', 'uploads/images/20210402/e7bfdf2c81f8595940980a8ed41f0ca1.jpeg', 'uploads/images/20210402/thumb/e7bfdf2c81f8595940980a8ed41f0ca1.jpeg', '', 'image/jpeg', 'jpeg', 155835, '7bcf506645bf27917b4035f571b79470', '14308169eadd191613f807070ebd1f54bc66535c', 'local', 0, 1617351266, 1617351266, 100, 1, 1000, 1000);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_config`
--

CREATE TABLE `jd_admin_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `value` text NOT NULL COMMENT '配置值',
  `options` text NOT NULL COMMENT '配置项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '配置提示',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_config`
--

INSERT INTO `jd_admin_config` (`id`, `name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', 2, '', '', '', '', 1475240395, 1477403914, 1, 1),
(2, 'web_site_title', '站点标题', 'base', 'text', '尖端管理系统', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240646, 1477710341, 2, 1),
(3, 'web_site_slogan', '站点标语', 'base', 'text', '极简、极速、极致', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240994, 1477710357, 3, 1),
(4, 'web_site_logo', '站点LOGO', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241067, 1475241067, 4, 1),
(5, 'web_site_description', '站点描述', 'base', 'textarea', '', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', 2, '', '', '', '', 1475241186, 1475241186, 6, 1),
(6, 'web_site_keywords', '站点关键词', 'base', 'text', 'PHP开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', 2, '', '', '', '', 1475241328, 1475241328, 7, 1),
(7, 'web_site_copyright', '版权信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241416, 1477710383, 8, 1),
(8, 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241441, 1477710441, 9, 1),
(9, 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241498, 1477710455, 10, 1),
(10, 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241716, 1477649446, 100, 1),
(11, 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241835, 1495853193, 100, 1),
(12, 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475241897, 1477663520, 100, 1),
(13, 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475241975, 1477649489, 100, 1),
(14, 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475242015, 1477663529, 100, 1),
(15, 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475242056, 1477649506, 100, 1),
(16, 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', 2, '', '', '', '', 1475242066, 1476074507, 101, 1),
(17, 'system_color', '后台配色方案', 'system', 'radio', 'city', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', 2, '', '', '', '', 1475250066, 1477316689, 102, 1),
(18, 'develop_mode', '开发模式', 'develop', 'radio', '0', '0:关闭\r\n1:开启', '', '', '', '', '', '', 2, '', '', '', '', 1476864205, 1476864231, 100, 1),
(19, 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', 2, '', '', '', '', 1476866355, 1476866355, 100, 1),
(21, 'data_backup_path', '数据库备份根路径', 'database', 'text', '../data/', '', '路径必须以 / 结尾', '', '', '', '', '', 2, '', '', '', '', 1477017745, 1477018467, 100, 1),
(22, 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', 2, '', '', '', '', 1477017886, 1477017886, 100, 1),
(23, 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', 2, '', '', '', '', 1477017978, 1477018172, 100, 1),
(24, 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', 2, '', '', '', '', 1477018083, 1477018083, 100, 1),
(25, 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', 2, '', '', '', '', 1477579289, 1477579289, 103, 1),
(26, 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1477620643, 1477620643, 5, 1),
(27, 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '300,300', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', 2, '', '', '', '', 1477644150, 1477649513, 100, 1),
(28, 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', 2, '', '', '', '', 1477646271, 1477649521, 100, 1),
(29, 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', 2, '', '', '', '', 1477649648, 1477649648, 100, 1),
(30, 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656390, 1477656390, 100, 1),
(31, 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656528, 1477656528, 100, 1),
(32, 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', 2, '', '', '', '', 1477656714, 1477661309, 100, 1),
(33, 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', 2, '', '', '', '', 1477727305, 1477727305, 100, 1),
(34, 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', 2, '', '', '', '', 1478771958, 1478771958, 99, 1),
(35, 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', 0, '', '', '', '', 1486714723, 1486715620, 104, 1),
(36, 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', 0, '', '', '', '', 1487035843, 1487035843, 99, 1),
(37, 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', 0, '', '', '', '', 1501488567, 1501490821, 100, 1),
(38, 'system_log', '系统日志', 'system', 'switch', '1', '', '是否开启系统日志功能', '', '', '', '', '', 0, '', '', '', '', 1512635391, 1512635391, 99, 1),
(39, 'asset_version', '资源版本号', 'develop', 'text', '20180327', '', '可通过修改版号强制用户更新静态文件', '', '', '', '', '', 0, '', '', '', '', 1522143239, 1522143239, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_hook`
--

CREATE TABLE `jd_admin_hook` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='钩子表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_hook`
--

INSERT INTO `jd_admin_hook` (`id`, `name`, `plugin`, `description`, `system`, `create_time`, `update_time`, `status`) VALUES
(1, 'admin_index', '', '后台首页', 1, 1468174214, 1477757518, 1),
(2, 'plugin_index_tab_list', '', '插件扩展tab钩子', 1, 1468174214, 1468174214, 1),
(3, 'module_index_tab_list', '', '模块扩展tab钩子', 1, 1468174214, 1468174214, 1),
(4, 'page_tips', '', '每个页面的提示', 1, 1468174214, 1468174214, 1),
(5, 'signin_footer', '', '登录页面底部钩子', 1, 1479269315, 1479269315, 1),
(6, 'signin_captcha', '', '登录页面验证码钩子', 1, 1479269315, 1479269315, 1),
(7, 'signin', '', '登录控制器钩子', 1, 1479386875, 1479386875, 1),
(8, 'upload_attachment', '', '附件上传钩子', 1, 1501493808, 1501493808, 1),
(9, 'page_plugin_js', '', '页面插件js钩子', 1, 1503633591, 1503633591, 1),
(10, 'page_plugin_css', '', '页面插件css钩子', 1, 1503633591, 1503633591, 1),
(11, 'signin_sso', '', '单点登录钩子', 1, 1503633591, 1503633591, 1),
(12, 'signout_sso', '', '单点退出钩子', 1, 1503633591, 1503633591, 1),
(13, 'user_add', '', '添加用户钩子', 1, 1503633591, 1503633591, 1),
(14, 'user_edit', '', '编辑用户钩子', 1, 1503633591, 1503633591, 1),
(15, 'user_delete', '', '删除用户钩子', 1, 1503633591, 1503633591, 1),
(16, 'user_enable', '', '启用用户钩子', 1, 1503633591, 1503633591, 1),
(17, 'user_disable', '', '禁用用户钩子', 1, 1503633591, 1503633591, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_hook_plugin`
--

CREATE TABLE `jd_admin_hook_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='钩子-插件对应表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_hook_plugin`
--

INSERT INTO `jd_admin_hook_plugin` (`id`, `hook`, `plugin`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'admin_index', 'SystemInfo', 1584345576, 1584345576, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_icon`
--

CREATE TABLE `jd_admin_icon` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图标css地址',
  `prefix` varchar(32) NOT NULL DEFAULT '' COMMENT '图标前缀',
  `font_family` varchar(32) NOT NULL DEFAULT '' COMMENT '字体名',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图标表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_icon_list`
--

CREATE TABLE `jd_admin_icon_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属图标id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '图标标题',
  `class` varchar(255) NOT NULL DEFAULT '' COMMENT '图标类名',
  `code` varchar(128) NOT NULL DEFAULT '' COMMENT '图标关键词'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='详细图标列表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_log`
--

CREATE TABLE `jd_admin_log` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `action_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_log`
--

INSERT INTO `jd_admin_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 35, 1, 2130706433, 'admin_module', 0, '超级管理员 安装了模块：新闻', 1, 1615447379),
(2, 30, 1, 2130706433, 'admin_menu', 635, '超级管理员 添加了节点：所属模块(news),所属节点ID(0),节点标题(新闻板块),节点链接(news/index/index)', 1, 1615447517),
(3, 30, 1, 2130706433, 'admin_menu', 636, '超级管理员 添加了节点：所属模块(news),所属节点ID(635),节点标题(新闻开发),节点链接(news/index/index)', 1, 1615447675),
(4, 30, 1, 2130706433, 'admin_menu', 637, '超级管理员 添加了节点：所属模块(news),所属节点ID(636),节点标题(新增新闻),节点链接(news/index/add)', 1, 1615450596),
(5, 31, 1, 2130706433, 'admin_menu', 637, '超级管理员 编辑了节点：节点ID(637)', 1, 1615452719),
(6, 30, 1, 2130706433, 'admin_menu', 638, '超级管理员 添加了节点：所属模块(news),所属节点ID(636),节点标题(保存),节点链接(news/index/save)', 1, 1615452774),
(7, 30, 1, 2130706433, 'admin_menu', 639, '超级管理员 添加了节点：所属模块(news),所属节点ID(636),节点标题(编辑),节点链接(news/index/edit)', 1, 1615452801),
(8, 30, 1, 2130706433, 'admin_menu', 640, '超级管理员 添加了节点：所属模块(news),所属节点ID(636),节点标题(删除),节点链接(news/index/del)', 1, 1615452817),
(9, 31, 1, 2130706433, 'admin_menu', 640, '超级管理员 编辑了节点：节点ID(640)', 1, 1615516511),
(10, 30, 1, 2130706433, 'admin_menu', 641, '超级管理员 添加了节点：所属模块(news),所属节点ID(636),节点标题(quickedit),节点链接(news/index/quickedit)', 1, 1615520127),
(11, 31, 1, 2130706433, 'admin_menu', 641, '超级管理员 编辑了节点：节点ID(641)', 1, 1615520146),
(12, 32, 1, 2130706433, 'admin_menu', 641, '超级管理员 删除了节点：节点ID(641),节点标题(),节点链接()', 1, 1615520357),
(13, 35, 1, 2130706433, 'admin_module', 0, '超级管理员 安装了模块：留言板', 1, 1615533659),
(14, 30, 1, 2130706433, 'admin_menu', 642, '超级管理员 添加了节点：所属模块(message),所属节点ID(0),节点标题(留言板模块),节点链接(message/index/index)', 1, 1615533837),
(15, 30, 1, 2130706433, 'admin_menu', 643, '超级管理员 添加了节点：所属模块(message),所属节点ID(642),节点标题(留言板开发),节点链接(message/index/index)', 1, 1615533878),
(16, 31, 1, 2130706433, 'admin_menu', 643, '超级管理员 编辑了节点：节点ID(643)', 1, 1615534056),
(17, 30, 1, 2130706433, 'admin_menu', 644, '超级管理员 添加了节点：所属模块(message),所属节点ID(643),节点标题(删除),节点链接(message/index/delete)', 1, 1615534790),
(18, 30, 1, 2130706433, 'admin_menu', 645, '超级管理员 添加了节点：所属模块(message),所属节点ID(643),节点标题(反馈),节点链接(message/index/feedback)', 1, 1615534844),
(19, 22, 1, 2130706433, 'database', 0, '超级管理员 优化了数据表：jd_news', 1, 1615539757),
(20, 30, 1, 2130706433, 'admin_menu', 646, '超级管理员 添加了节点：所属模块(message),所属节点ID(643),节点标题(留言导出),节点链接(message/index/export)', 1, 1615540149),
(21, 40, 1, 0, 'admin_packet', 0, '超级管理员 安装了数据包：微信地区数据包', 1, 1615878899),
(22, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：门户', 1, 1615951606),
(23, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：采矿举报', 1, 1616565590),
(24, 32, 1, 0, 'admin_menu', 635, '超级管理员 删除了节点：节点ID(635),节点标题(新闻板块),节点链接(news/index/index)', 1, 1616565624),
(25, 30, 1, 0, 'admin_menu', 740, '超级管理员 添加了节点：所属模块(report),所属节点ID(0),节点标题(采矿举报系统),节点链接(report/index/index)', 1, 1616566324),
(26, 31, 1, 0, 'admin_menu', 740, '超级管理员 编辑了节点：节点ID(740)', 1, 1616566393),
(27, 30, 1, 0, 'admin_menu', 741, '超级管理员 添加了节点：所属模块(report),所属节点ID(740),节点标题(采矿举报系统),节点链接(report/report_online/index)', 1, 1616567104),
(28, 31, 1, 0, 'admin_menu', 741, '超级管理员 编辑了节点：节点ID(741)', 1, 1616567132),
(29, 30, 1, 0, 'admin_menu', 742, '超级管理员 添加了节点：所属模块(report),所属节点ID(740),节点标题(用户管理),节点链接(report/report_user/index)', 1, 1616567173),
(30, 31, 1, 0, 'admin_menu', 742, '超级管理员 编辑了节点：节点ID(742)', 1, 1616567189),
(31, 30, 1, 0, 'admin_menu', 743, '超级管理员 添加了节点：所属模块(report),所属节点ID(742),节点标题(新增用户),节点链接(report/report_user/add)', 1, 1616570908),
(32, 31, 1, 0, 'admin_menu', 742, '超级管理员 编辑了节点：节点ID(742)', 1, 1616571980),
(33, 31, 1, 0, 'admin_menu', 742, '超级管理员 编辑了节点：节点ID(742)', 1, 1616571997),
(34, 30, 1, 0, 'admin_menu', 744, '超级管理员 添加了节点：所属模块(report),所属节点ID(741),节点标题(反馈),节点链接(report/report_online/feedback)', 1, 1616574892),
(35, 30, 1, 0, 'admin_menu', 745, '超级管理员 添加了节点：所属模块(report),所属节点ID(742),节点标题(编辑用户),节点链接(report/report_user/edit)', 1, 1617066692),
(36, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：杭州市应急管理局', 1, 1617257816),
(37, 36, 1, 0, 'admin_module', 0, '超级管理员 卸载了模块：杭州市应急管理局系统', 1, 1617257872),
(38, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：杭州市应急管理局系统', 1, 1617257876),
(39, 30, 1, 0, 'admin_menu', 746, '超级管理员 添加了节点：所属模块(manage),所属节点ID(0),节点标题(应急管理局系统),节点链接(manage/index/index)', 1, 1617258013),
(40, 30, 1, 0, 'admin_menu', 747, '超级管理员 添加了节点：所属模块(manage),所属节点ID(746),节点标题(精品库管理),节点链接(manage/Boutique_library/index)', 1, 1617258318),
(41, 30, 1, 0, 'admin_menu', 748, '超级管理员 添加了节点：所属模块(manage),所属节点ID(746),节点标题(新媒体矩阵管理),节点链接(manage/Media/index)', 1, 1617258418),
(42, 30, 1, 0, 'admin_menu', 749, '超级管理员 添加了节点：所属模块(manage),所属节点ID(746),节点标题(地图管理),节点链接(manage/Map/index)', 1, 1617258506),
(43, 30, 1, 0, 'admin_menu', 750, '超级管理员 添加了节点：所属模块(manage),所属节点ID(746),节点标题(违法举报管理),节点链接(manage/report/index)', 1, 1617258573),
(44, 31, 1, 0, 'admin_menu', 747, '超级管理员 编辑了节点：节点ID(747)', 1, 1617258599),
(45, 30, 1, 0, 'admin_menu', 751, '超级管理员 添加了节点：所属模块(manage),所属节点ID(747),节点标题(新增),节点链接(manage/Library/add)', 1, 1617262809),
(46, 30, 1, 0, 'admin_menu', 752, '超级管理员 添加了节点：所属模块(manage),所属节点ID(747),节点标题(编辑),节点链接(manage/Library/edit)', 1, 1617262835),
(47, 30, 1, 0, 'admin_menu', 753, '超级管理员 添加了节点：所属模块(manage),所属节点ID(748),节点标题(新增),节点链接(manage/Media/add)', 1, 1617268857),
(48, 30, 1, 0, 'admin_menu', 754, '超级管理员 添加了节点：所属模块(manage),所属节点ID(748),节点标题(编辑),节点链接(manage/Media/edit)', 1, 1617268881),
(49, 42, 1, 0, 'admin_config', 0, '超级管理员 更新了系统设置：分组(upload)', 1, 1617269268),
(50, 30, 1, 0, 'admin_menu', 755, '超级管理员 添加了节点：所属模块(manage),所属节点ID(749),节点标题(体验馆地点管理),节点链接(manage/Map/tiyan)', 1, 1617270201),
(51, 30, 1, 0, 'admin_menu', 756, '超级管理员 添加了节点：所属模块(manage),所属节点ID(749),节点标题(培训地点管理),节点链接(manage/Map/peixun)', 1, 1617270240),
(52, 31, 1, 0, 'admin_menu', 749, '超级管理员 编辑了节点：节点ID(749)', 1, 1617270326),
(53, 30, 1, 0, 'admin_menu', 757, '超级管理员 添加了节点：所属模块(manage),所属节点ID(750),节点标题(条文规定),节点链接(manage/report/rule)', 1, 1617326329),
(54, 32, 1, 0, 'admin_menu', 749, '超级管理员 删除了节点：节点ID(749),节点标题(地图管理),节点链接(manage/map/index)', 1, 1617329663),
(55, 30, 1, 0, 'admin_menu', 758, '超级管理员 添加了节点：所属模块(manage),所属节点ID(746),节点标题(体验馆地点设置),节点链接(manage/Map/tiyan)', 1, 1617329710),
(56, 31, 1, 0, 'admin_menu', 758, '超级管理员 编辑了节点：节点ID(758)', 1, 1617329743),
(57, 30, 1, 0, 'admin_menu', 759, '超级管理员 添加了节点：所属模块(manage),所属节点ID(746),节点标题(培训地点设置),节点链接(manage/Map/peixun)', 1, 1617329785),
(58, 30, 1, 0, 'admin_menu', 760, '超级管理员 添加了节点：所属模块(manage),所属节点ID(758),节点标题(新增),节点链接(manage/Map/peixunadd)', 1, 1617333605),
(59, 30, 1, 0, 'admin_menu', 761, '超级管理员 添加了节点：所属模块(manage),所属节点ID(759),节点标题(编辑),节点链接(manage/Map/peixunedit)', 1, 1617333647),
(60, 30, 1, 0, 'admin_menu', 762, '超级管理员 添加了节点：所属模块(manage),所属节点ID(758),节点标题(新增),节点链接(manage/Map/tiyanadd)', 1, 1617333671),
(61, 30, 1, 0, 'admin_menu', 763, '超级管理员 添加了节点：所属模块(manage),所属节点ID(758),节点标题(编辑),节点链接(manage/Map/tiyanedit)', 1, 1617333686),
(62, 31, 1, 0, 'admin_menu', 758, '超级管理员 编辑了节点：节点ID(758)', 1, 1617333868),
(63, 31, 1, 0, 'admin_menu', 762, '超级管理员 编辑了节点：节点ID(762)', 1, 1617333881),
(64, 31, 1, 0, 'admin_menu', 763, '超级管理员 编辑了节点：节点ID(763)', 1, 1617333891),
(65, 31, 1, 0, 'admin_menu', 759, '超级管理员 编辑了节点：节点ID(759)', 1, 1617333903),
(66, 31, 1, 0, 'admin_menu', 760, '超级管理员 编辑了节点：节点ID(760)', 1, 1617333912),
(67, 31, 1, 0, 'admin_menu', 761, '超级管理员 编辑了节点：节点ID(761)', 1, 1617333922),
(68, 30, 1, 0, 'admin_menu', 764, '超级管理员 添加了节点：所属模块(manage),所属节点ID(746),节点标题(地图管理),节点链接()', 1, 1617345219),
(69, 31, 1, 0, 'admin_menu', 764, '超级管理员 编辑了节点：节点ID(764)', 1, 1617345329),
(70, 30, 1, 0, 'admin_menu', 765, '超级管理员 添加了节点：所属模块(manage),所属节点ID(764),节点标题(地区筛选),节点链接(manage/zone/index)', 1, 1617345562),
(71, 30, 1, 0, 'admin_menu', 766, '超级管理员 添加了节点：所属模块(manage),所属节点ID(765),节点标题(新增),节点链接(manage/zone/add)', 1, 1617346867),
(72, 7, 1, 0, 'admin_role', 2, '超级管理员 添加了角色：区域管理员', 1, 1617351886),
(73, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：字段(access)，原值(0)，新值：(true)', 1, 1617351897),
(74, 1, 1, 0, 'admin_user', 2, '超级管理员 添加了用户：test manager', 1, 1617351957),
(75, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：test manager', 1, 1617352046),
(76, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：test manager', 1, 1617352071),
(77, 36, 1, 0, 'admin_module', 0, '超级管理员 卸载了模块：门户', 1, 1617352151),
(78, 22, 1, 0, 'database', 0, '超级管理员 优化了数据表：jd_cms_menu', 1, 1617352187);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_menu`
--

CREATE TABLE `jd_admin_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台菜单表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_menu`
--

INSERT INTO `jd_admin_menu` (`id`, `pid`, `module`, `title`, `icon`, `url_type`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`) VALUES
(1, 0, 'admin', '首页', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', 0, 1467617722, 1477710540, 1, 1, 1, ''),
(2, 1, 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1467618170, 1477710695, 1, 1, 1, ''),
(3, 2, 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', 0, 1467618273, 1489049773, 3, 1, 1, ''),
(4, 0, 'admin', '系统', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', 0, 1467618361, 1477710540, 2, 1, 1, ''),
(5, 4, 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', 0, 1467618441, 1477710695, 1, 1, 1, ''),
(6, 5, 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', 0, 1467618490, 1477710695, 1, 1, 1, ''),
(7, 5, 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', 0, 1467618618, 1477710695, 2, 1, 1, ''),
(8, 7, 'admin', '新增', '', 'module_admin', 'admin/config/add', '_self', 0, 1467618648, 1477710695, 1, 1, 1, ''),
(9, 7, 'admin', '编辑', '', 'module_admin', 'admin/config/edit', '_self', 0, 1467619566, 1477710695, 2, 1, 1, ''),
(10, 7, 'admin', '删除', '', 'module_admin', 'admin/config/delete', '_self', 0, 1467619583, 1477710695, 3, 1, 1, ''),
(11, 7, 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', 0, 1467619609, 1477710695, 4, 1, 1, ''),
(12, 7, 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', 0, 1467619637, 1477710695, 5, 1, 1, ''),
(13, 5, 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', 0, 1467619882, 1477710695, 3, 1, 1, ''),
(14, 13, 'admin', '新增', '', 'module_admin', 'admin/menu/add', '_self', 0, 1467619902, 1477710695, 1, 1, 1, ''),
(15, 13, 'admin', '编辑', '', 'module_admin', 'admin/menu/edit', '_self', 0, 1467620331, 1477710695, 2, 1, 1, ''),
(16, 13, 'admin', '删除', '', 'module_admin', 'admin/menu/delete', '_self', 0, 1467620363, 1477710695, 3, 1, 1, ''),
(17, 13, 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', 0, 1467620386, 1477710695, 4, 1, 1, ''),
(18, 13, 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', 0, 1467620404, 1477710695, 5, 1, 1, ''),
(19, 68, 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', 0, 1467688065, 1477710702, 1, 1, 1, ''),
(20, 19, 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1467688137, 1477710702, 1, 1, 1, ''),
(21, 20, 'user', '新增', '', 'module_admin', 'user/index/add', '_self', 0, 1467688177, 1477710702, 1, 1, 1, ''),
(22, 20, 'user', '编辑', '', 'module_admin', 'user/index/edit', '_self', 0, 1467688202, 1477710702, 2, 1, 1, ''),
(23, 20, 'user', '删除', '', 'module_admin', 'user/index/delete', '_self', 0, 1467688219, 1477710702, 3, 1, 1, ''),
(24, 20, 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', 0, 1467688238, 1477710702, 4, 1, 1, ''),
(25, 20, 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', 0, 1467688256, 1477710702, 5, 1, 1, ''),
(211, 64, 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', 0, 1480299320, 1480299320, 100, 0, 1, ''),
(32, 4, 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', 0, 1467688853, 1477710695, 2, 1, 1, ''),
(33, 32, 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', 0, 1467689008, 1477710695, 1, 1, 1, ''),
(34, 33, 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', 0, 1467689153, 1477710695, 1, 1, 1, ''),
(35, 33, 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', 0, 1467689173, 1477710695, 2, 1, 1, ''),
(36, 33, 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', 0, 1467689192, 1477710695, 3, 1, 1, ''),
(37, 33, 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', 0, 1467689241, 1477710695, 4, 1, 1, ''),
(38, 33, 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', 0, 1467689294, 1477710695, 5, 1, 1, ''),
(39, 33, 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', 0, 1467689312, 1477710695, 6, 1, 1, ''),
(40, 33, 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', 0, 1467689341, 1477710695, 7, 1, 1, ''),
(41, 32, 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', 0, 1467689527, 1477710695, 2, 1, 1, ''),
(42, 41, 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', 0, 1467689650, 1477710695, 1, 1, 1, ''),
(43, 41, 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', 0, 1467689665, 1477710695, 2, 1, 1, ''),
(44, 41, 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', 0, 1467689680, 1477710695, 3, 1, 1, ''),
(45, 41, 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', 0, 1467689700, 1477710695, 4, 1, 1, ''),
(46, 41, 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', 0, 1467689730, 1477710695, 5, 1, 1, ''),
(47, 41, 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', 0, 1467689747, 1477710695, 6, 1, 1, ''),
(48, 41, 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', 0, 1467689789, 1477710695, 7, 1, 1, ''),
(49, 41, 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', 0, 1467689846, 1477710695, 8, 1, 1, ''),
(50, 5, 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', 0, 1467690161, 1477710695, 4, 1, 1, ''),
(51, 70, 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', 0, 1467690240, 1489049773, 1, 1, 1, ''),
(52, 50, 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', 0, 1467690334, 1477710695, 2, 1, 1, ''),
(53, 50, 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', 0, 1467690352, 1477710695, 3, 1, 1, ''),
(54, 50, 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', 0, 1467690369, 1477710695, 4, 1, 1, ''),
(55, 50, 'admin', '删除', '', 'module_admin', 'admin/attachment/delete', '_self', 0, 1467690396, 1477710695, 5, 1, 1, ''),
(56, 41, 'admin', '删除', '', 'module_admin', 'admin/plugin/delete', '_self', 0, 1467858065, 1477710695, 11, 1, 1, ''),
(57, 41, 'admin', '编辑', '', 'module_admin', 'admin/plugin/edit', '_self', 0, 1467858092, 1477710695, 10, 1, 1, ''),
(60, 41, 'admin', '新增', '', 'module_admin', 'admin/plugin/add', '_self', 0, 1467858421, 1477710695, 9, 1, 1, ''),
(61, 41, 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', 0, 1467879016, 1477710695, 14, 1, 1, ''),
(62, 13, 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', 0, 1468073039, 1477710695, 6, 1, 1, ''),
(64, 5, 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', 0, 1476111944, 1477710695, 6, 0, 1, ''),
(65, 5, 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', 0, 1476111992, 1477710695, 8, 0, 1, ''),
(66, 32, 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', 0, 1476112326, 1477710695, 4, 0, 1, ''),
(67, 19, 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', 0, 1476113025, 1477710702, 3, 0, 1, ''),
(68, 0, 'user', '用户', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1476193348, 1477710540, 3, 0, 1, ''),
(69, 32, 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', 0, 1476236193, 1477710695, 3, 0, 1, ''),
(70, 2, 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', 0, 1476237472, 1489049773, 1, 0, 1, ''),
(71, 67, 'user', '新增', '', 'module_admin', 'user/role/add', '_self', 0, 1476256935, 1477710702, 1, 0, 1, ''),
(72, 67, 'user', '编辑', '', 'module_admin', 'user/role/edit', '_self', 0, 1476256968, 1477710702, 2, 0, 1, ''),
(73, 67, 'user', '删除', '', 'module_admin', 'user/role/delete', '_self', 0, 1476256993, 1477710702, 3, 0, 1, ''),
(74, 67, 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', 0, 1476257023, 1477710702, 4, 0, 1, ''),
(75, 67, 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', 0, 1476257046, 1477710702, 5, 0, 1, ''),
(76, 20, 'user', '授权', '', 'module_admin', 'user/index/access', '_self', 0, 1476375187, 1477710702, 6, 0, 1, ''),
(77, 69, 'admin', '新增', '', 'module_admin', 'admin/hook/add', '_self', 0, 1476668971, 1477710695, 1, 0, 1, ''),
(78, 69, 'admin', '编辑', '', 'module_admin', 'admin/hook/edit', '_self', 0, 1476669006, 1477710695, 2, 0, 1, ''),
(79, 69, 'admin', '删除', '', 'module_admin', 'admin/hook/delete', '_self', 0, 1476669375, 1477710695, 3, 0, 1, ''),
(80, 69, 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', 0, 1476669427, 1477710695, 4, 0, 1, ''),
(81, 69, 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', 0, 1476669564, 1477710695, 5, 0, 1, ''),
(183, 66, 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', 0, 1476851362, 1477710695, 1, 0, 1, ''),
(184, 66, 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', 0, 1476851382, 1477710695, 2, 0, 1, ''),
(185, 5, 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', 0, 1476882441, 1477710695, 7, 0, 1, ''),
(186, 185, 'admin', '新增', '', 'module_admin', 'admin/action/add', '_self', 0, 1476884439, 1477710695, 1, 0, 1, ''),
(187, 185, 'admin', '编辑', '', 'module_admin', 'admin/action/edit', '_self', 0, 1476884464, 1477710695, 2, 0, 1, ''),
(188, 185, 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', 0, 1476884493, 1477710695, 3, 0, 1, ''),
(189, 185, 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', 0, 1476884534, 1477710695, 4, 0, 1, ''),
(190, 185, 'admin', '删除', '', 'module_admin', 'admin/action/delete', '_self', 0, 1476884551, 1477710695, 5, 0, 1, ''),
(191, 65, 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', 0, 1476972746, 1477710695, 1, 0, 1, ''),
(192, 65, 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', 0, 1476972772, 1477710695, 2, 0, 1, ''),
(193, 65, 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', 0, 1476972800, 1477710695, 3, 0, 1, ''),
(194, 65, 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', 0, 1476972825, 1477710695, 4, 0, 1, ''),
(195, 65, 'admin', '删除备份', '', 'module_admin', 'admin/database/delete', '_self', 0, 1476973457, 1477710695, 5, 0, 1, ''),
(210, 41, 'admin', '快速编辑', '', 'module_admin', 'admin/plugin/quickedit', '_self', 0, 1477713981, 1477713981, 100, 0, 1, ''),
(209, 185, 'admin', '快速编辑', '', 'module_admin', 'admin/action/quickedit', '_self', 0, 1477713939, 1477713939, 100, 0, 1, ''),
(208, 7, 'admin', '快速编辑', '', 'module_admin', 'admin/config/quickedit', '_self', 0, 1477713808, 1477713808, 100, 0, 1, ''),
(207, 69, 'admin', '快速编辑', '', 'module_admin', 'admin/hook/quickedit', '_self', 0, 1477713770, 1477713770, 100, 0, 1, ''),
(212, 2, 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', 0, 1489049767, 1489049773, 2, 0, 1, ''),
(213, 70, 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', 0, 1490588610, 1490588610, 100, 0, 1, ''),
(225, 32, 'admin', '图标管理', 'fa fa-fw fa-tint', 'module_admin', 'admin/icon/index', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(226, 225, 'admin', '新增', '', 'module_admin', 'admin/icon/add', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(227, 225, 'admin', '编辑', '', 'module_admin', 'admin/icon/edit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(228, 225, 'admin', '删除', '', 'module_admin', 'admin/icon/delete', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(229, 225, 'admin', '启用', '', 'module_admin', 'admin/icon/enable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(230, 225, 'admin', '禁用', '', 'module_admin', 'admin/icon/disable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(231, 225, 'admin', '快速编辑', '', 'module_admin', 'admin/icon/quickedit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(232, 225, 'admin', '图标列表', '', 'module_admin', 'admin/icon/items', '_self', 0, 1520923368, 1520923368, 100, 0, 1, ''),
(233, 225, 'admin', '更新图标', '', 'module_admin', 'admin/icon/reload', '_self', 0, 1520931908, 1520931908, 100, 0, 1, ''),
(234, 20, 'user', '快速编辑', '', 'module_admin', 'user/index/quickedit', '_self', 0, 1526028258, 1526028258, 100, 0, 1, ''),
(235, 67, 'user', '快速编辑', '', 'module_admin', 'user/role/quickedit', '_self', 0, 1526028282, 1526028282, 100, 0, 1, ''),
(236, 6, 'admin', '快速编辑', '', 'module_admin', 'admin/system/quickedit', '_self', 0, 1559054310, 1559054310, 100, 0, 1, ''),
(634, 50, 'admin', '新增', '', 'module_admin', 'admin/attachment/add', '_self', 0, 1593741735, 1593741735, 100, 0, 1, ''),
(746, 0, 'manage', '应急管理局系统', 'fa fa-fw fa-soundcloud', 'module_admin', 'manage/index/index', '_self', 0, 1617258013, 1617258013, 100, 0, 1, ''),
(745, 742, 'report', '编辑用户', '', 'module_admin', 'report/report_user/edit', '_self', 0, 1617066692, 1617066692, 100, 0, 1, ''),
(744, 741, 'report', '反馈', '', 'module_admin', 'report/report_online/feedback', '_self', 0, 1616574892, 1616574892, 100, 0, 1, ''),
(743, 742, 'report', '新增用户', '', 'module_admin', 'report/report_user/add', '_self', 0, 1616570908, 1616570908, 100, 0, 1, ''),
(740, 0, 'report', '采矿举报系统', 'fa fa-fw fa-volume-control-phone', 'module_admin', 'report/index/index', '_self', 0, 1616566324, 1616566393, 100, 0, 1, ''),
(741, 740, 'report', '在线举报', 'fa fa-fw fa-bell', 'module_admin', 'report/report_online/index', '_self', 0, 1616567104, 1616567132, 100, 0, 1, ''),
(742, 740, 'report', '用户信息', 'fa fa-fw fa-mortar-board', 'module_admin', 'report/report_user/index', '_self', 0, 1616567174, 1616571997, 100, 0, 1, ''),
(747, 746, 'manage', '精品库管理', 'fa fa-fw fa-cc-visa', 'module_admin', 'manage/library/index', '_self', 0, 1617258318, 1617345268, 1, 0, 1, ''),
(748, 746, 'manage', '新媒体矩阵管理', 'fa fa-fw fa-twitter', 'module_admin', 'manage/media/index', '_self', 0, 1617258418, 1617345268, 2, 0, 1, ''),
(760, 759, 'manage', '新增', '', 'module_admin', 'manage/peixunmap/add', '_self', 0, 1617333605, 1617345268, 1, 0, 1, ''),
(750, 746, 'manage', '违法举报管理', 'fa fa-fw fa-bullhorn', 'module_admin', 'manage/report/index', '_self', 0, 1617258573, 1617345268, 3, 0, 1, ''),
(751, 747, 'manage', '新增', '', 'module_admin', 'manage/library/add', '_self', 0, 1617262810, 1617345268, 1, 0, 1, ''),
(752, 747, 'manage', '编辑', '', 'module_admin', 'manage/library/edit', '_self', 0, 1617262835, 1617345268, 2, 0, 1, ''),
(753, 748, 'manage', '新增', '', 'module_admin', 'manage/media/add', '_self', 0, 1617268857, 1617345268, 1, 0, 1, ''),
(754, 748, 'manage', '编辑', '', 'module_admin', 'manage/media/edit', '_self', 0, 1617268881, 1617345268, 2, 0, 1, ''),
(759, 764, 'manage', '培训地点设置', 'fa fa-fw fa-heartbeat', 'module_admin', 'manage/peixunmap/index', '_self', 0, 1617329785, 1617345268, 2, 0, 1, ''),
(758, 764, 'manage', '体验馆地点设置', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'manage/tiyanmap/index', '_self', 0, 1617329710, 1617345268, 1, 0, 1, ''),
(757, 750, 'manage', '条文规定', '', 'module_admin', 'manage/report/rule', '_self', 0, 1617326329, 1617345268, 1, 0, 1, ''),
(761, 759, 'manage', '编辑', '', 'module_admin', 'manage/peixunmap/edit', '_self', 0, 1617333647, 1617345268, 2, 0, 1, ''),
(762, 758, 'manage', '新增', '', 'module_admin', 'manage/tiyanmap/add', '_self', 0, 1617333671, 1617345268, 1, 0, 1, ''),
(763, 758, 'manage', '编辑', '', 'module_admin', 'manage/tiyanmap/edit', '_self', 0, 1617333686, 1617345268, 2, 0, 1, ''),
(764, 746, 'manage', '地图管理', 'fa fa-fw fa-map-o', 'module_admin', '', '_self', 0, 1617345219, 1617345329, 4, 0, 1, ''),
(765, 764, 'manage', '地区筛选', 'si si-magnifier-add', 'module_admin', 'manage/zone/index', '_self', 0, 1617345562, 1617345562, 100, 0, 1, ''),
(766, 765, 'manage', '新增', '', 'module_admin', 'manage/zone/add', '_self', 0, 1617346867, 1617346867, 100, 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_module`
--

CREATE TABLE `jd_admin_module` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名称（标识）',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模块标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text COMMENT '配置信息',
  `access` text COMMENT '授权配置',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '模块唯一标识符',
  `system_module` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_module`
--

INSERT INTO `jd_admin_module` (`id`, `name`, `title`, `icon`, `description`, `author`, `author_url`, `config`, `access`, `version`, `identifier`, `system_module`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，核心模块', 'ma', 'http://www.###.com', '', '', '1.0.0', 'admin.ma.module', 1, 1468204902, 1468204902, 100, 1),
(2, 'user', '用户', 'fa fa-fw fa-user', '用户模块，自带模块', 'ma', 'http://www.###.com', '', '', '1.0.0', 'user.ma.module', 1, 1468204902, 1468204902, 100, 1),
(3, 'news', '新闻', '', '新闻模块', 'demon', '', '', '', '1.0.0', 'emp.demon.module', 0, 1615447379, 1615447393, 100, 1),
(6, 'report', '采矿举报', '', '举报模块', 'demon', '', NULL, NULL, '1.0.0', 'report.demon.module', 0, 1616565590, 1616565590, 100, 1),
(8, 'manage', '杭州市应急管理局系统', '', '模块', 'demon', '', NULL, '', '1.0.0', 'report.demon.module', 0, 1617257876, 1617257876, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_packet`
--

CREATE TABLE `jd_admin_packet` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据包表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_packet`
--

INSERT INTO `jd_admin_packet` (`id`, `name`, `title`, `author`, `author_url`, `version`, `tables`, `create_time`, `update_time`, `status`) VALUES
(1, 'wechat_area', '微信地区数据包', 'ma', '', '1.0.0', '[\"packet_wechat_area\"]', 1615878899, 1615878899, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_plugin`
--

CREATE TABLE `jd_admin_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_plugin`
--

INSERT INTO `jd_admin_plugin` (`id`, `name`, `title`, `icon`, `description`, `author`, `author_url`, `config`, `version`, `identifier`, `admin`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'SystemInfo', '系统环境信息', 'fa fa-fw fa-info-circle', '在后台首页显示服务器信息', 'ma', '', '{\"display\":1,\"width\":6}', '1.0.0', 'system_info.ming.plugin', 0, 1584345576, 1584345576, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_role`
--

CREATE TABLE `jd_admin_role` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '角色id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  `default_module` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '默认访问模块'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_role`
--

INSERT INTO `jd_admin_role` (`id`, `pid`, `name`, `description`, `menu_auth`, `sort`, `create_time`, `update_time`, `status`, `access`, `default_module`) VALUES
(1, 0, '超级管理员', '系统默认创建的角色，拥有最高权限', '', 0, 1476270000, 1468117612, 1, 1, 0),
(2, 1, '区域管理员', '', '[]', 100, 1617351886, 1617351886, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_user`
--

CREATE TABLE `jd_admin_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `openid` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'openid',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `code` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '身份证',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` text CHARACTER SET utf8mb4 NOT NULL COMMENT '头像',
  `score` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录ip',
  `modpsd_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改密码时间',
  `last_signin_time` int(11) NOT NULL DEFAULT '0',
  `signin_days` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jd_admin_user`
--

INSERT INTO `jd_admin_user` (`id`, `openid`, `username`, `nickname`, `sex`, `code`, `password`, `email`, `email_bind`, `mobile`, `mobile_bind`, `avatar`, `score`, `role`, `group`, `signup_ip`, `create_time`, `update_time`, `last_login_time`, `last_login_ip`, `modpsd_time`, `last_signin_time`, `signin_days`, `sort`, `status`) VALUES
(1, NULL, 'admin', '超级管理员', NULL, NULL, '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', 0, '', 0, '', 0, 1, 0, 0, 1476065410, 1617672772, 1617672772, 0, 1594444903, 0, 0, 100, 1),
(2, NULL, 'admin1111', 'test manager', NULL, NULL, '$2y$10$gdZJNNwElS/YSKCbVPXv4uL2mANVJ7ldcE0hBRsCSYUJUL7DEAxVS', '', 0, '', 0, '', 0, 2, 0, 0, 1617351957, 1617352071, 1617351969, 0, 1617351957, 0, 0, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_advert`
--

CREATE TABLE `jd_cms_advert` (
  `id` int(11) UNSIGNED NOT NULL,
  `typeid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `tagname` varchar(30) NOT NULL DEFAULT '' COMMENT '广告位标识',
  `ad_type` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '广告类型',
  `timeset` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '时间限制:0-永不过期,1-在设内时间内有效',
  `start_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '结束时间',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `content` text NOT NULL COMMENT '广告内容',
  `expcontent` text NOT NULL COMMENT '过期显示内容',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_advert_type`
--

CREATE TABLE `jd_cms_advert_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告分类表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_column`
--

CREATE TABLE `jd_cms_column` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `model` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文档模型id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `content` text NOT NULL COMMENT '内容',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '字体图标',
  `index_template` varchar(32) NOT NULL DEFAULT '' COMMENT '封面模板',
  `list_template` varchar(32) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `detail_template` varchar(32) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `post_auth` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '投稿权限',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `hide` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `rank_auth` int(11) NOT NULL DEFAULT '0' COMMENT '浏览权限，-1待审核，0为开放浏览，大于0则为对应的用户角色id',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '栏目属性：0-最终列表栏目，1-外部链接，2-频道封面'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_document`
--

CREATE TABLE `jd_cms_document` (
  `id` int(11) UNSIGNED NOT NULL,
  `cid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '栏目id',
  `model` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文档模型ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(32) NOT NULL DEFAULT '' COMMENT '简略标题',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `flag` set('j','p','b','s','a','f','c','h') DEFAULT NULL COMMENT '自定义属性',
  `view` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读量',
  `comment` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论数',
  `good` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点赞数',
  `bad` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '踩数',
  `mark` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `trash` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '回收站'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档基础表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_field`
--

CREATE TABLE `jd_cms_field` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '字段名称',
  `name` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `define` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text COMMENT '默认值',
  `options` text COMMENT '额外选项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `fixed` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为固定字段',
  `show` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否显示',
  `model` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属文档模型id',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档字段表';

--
-- 转存表中的数据 `jd_cms_field`
--

INSERT INTO `jd_cms_field` (`id`, `name`, `title`, `type`, `define`, `value`, `options`, `tips`, `fixed`, `show`, `model`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'id', 'ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', 'ID', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480562978, 1480562978, 100, 1),
(2, 'cid', '栏目', 'select', 'int(11) UNSIGNED NOT NULL', '0', '', '请选择所属栏目', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480562978, 1480562978, 100, 1),
(3, 'uid', '用户ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563110, 1480563110, 100, 1),
(4, 'model', '模型ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563110, 1480563110, 100, 1),
(5, 'title', '标题', 'text', 'varchar(128) NOT NULL', '', '', '文档标题', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480575844, 1480576134, 1, 1),
(6, 'shorttitle', '简略标题', 'text', 'varchar(32) NOT NULL', '', '', '简略标题', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480575844, 1480576134, 1, 1),
(7, 'flag', '自定义属性', 'checkbox', 'set(\'j\',\'p\',\'b\',\'s\',\'a\',\'f\',\'h\',\'c\') NULL DEFAULT NULL', '', 'j:跳转\r\np:图片\r\nb:加粗\r\ns:滚动\r\na:特荐\r\nf:幻灯\r\nh:头条\r\nc:推荐', '自定义属性', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480671258, 1480671258, 100, 1),
(8, 'view', '阅读量', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480563149, 1480563149, 100, 1),
(9, 'comment', '评论数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563189, 1480563189, 100, 1),
(10, 'good', '点赞数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563279, 1480563279, 100, 1),
(11, 'bad', '踩数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563330, 1480563330, 100, 1),
(12, 'mark', '收藏数量', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563372, 1480563372, 100, 1),
(13, 'create_time', '创建时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563406, 1480563406, 100, 1),
(14, 'update_time', '更新时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563432, 1480563432, 100, 1),
(15, 'sort', '排序', 'text', 'int(11) NOT NULL', '100', '', '', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480563510, 1480563510, 100, 1),
(16, 'status', '状态', 'radio', 'tinyint(2) UNSIGNED NOT NULL', '1', '0:禁用\r\n1:启用', '', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480563576, 1480563576, 100, 1),
(17, 'trash', '回收站', 'text', 'tinyint(2) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563576, 1480563576, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_link`
--

CREATE TABLE `jd_cms_link` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型：1-文字链接，2-图片链接',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '链接标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `logo` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '链接LOGO',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `sort` int(11) NOT NULL DEFAULT '100',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='有钱链接表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_menu`
--

CREATE TABLE `jd_cms_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `nid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '导航id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `column` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '栏目id',
  `page` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '单页id',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '类型：0-栏目链接，1-单页链接，2-自定义链接',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `css` varchar(64) NOT NULL DEFAULT '' COMMENT 'css类',
  `rel` varchar(64) NOT NULL DEFAULT '' COMMENT '链接关系网',
  `target` varchar(16) NOT NULL DEFAULT '' COMMENT '打开方式',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜单表';

--
-- 转存表中的数据 `jd_cms_menu`
--

INSERT INTO `jd_cms_menu` (`id`, `nid`, `pid`, `column`, `page`, `type`, `title`, `url`, `css`, `rel`, `target`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 1, 0, 0, 0, 2, '首页', 'cms/index/index', '', '', '_self', 1492345605, 1492345605, 100, 1),
(2, 2, 0, 0, 0, 2, '关于我们', 'http://www.###.com', '', '', '_self', 1492346763, 1492346763, 100, 1),
(3, 3, 0, 0, 0, 2, '开发文档', 'http://www.###.cn/', '', '', '_self', 1492346812, 1492346812, 100, 1),
(4, 3, 0, 0, 0, 2, '开发者社区', 'http://bbs.###.com/', '', '', '_self', 1492346832, 1492346832, 100, 1),
(5, 1, 0, 0, 0, 2, '二级菜单', 'http://www.###.com', '', '', '_self', 1492347372, 1492347510, 100, 1),
(6, 1, 5, 0, 0, 2, '子菜单', 'http://www.###.com', '', '', '_self', 1492347388, 1492347520, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_model`
--

CREATE TABLE `jd_cms_model` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模型名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标题',
  `table` varchar(64) NOT NULL DEFAULT '' COMMENT '附加表名称',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '模型类别：0-系统模型，1-普通模型，2-独立模型',
  `icon` varchar(64) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否系统模型',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容模型表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_nav`
--

CREATE TABLE `jd_cms_nav` (
  `id` int(11) UNSIGNED NOT NULL,
  `tag` varchar(32) NOT NULL DEFAULT '' COMMENT '导航标识',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航表';

--
-- 转存表中的数据 `jd_cms_nav`
--

INSERT INTO `jd_cms_nav` (`id`, `tag`, `title`, `create_time`, `update_time`, `status`) VALUES
(1, 'main_nav', '顶部导航', 1492345083, 1492345083, 1),
(2, 'about_nav', '底部关于', 1492346685, 1492346685, 1),
(3, 'support_nav', '服务与支持', 1492346715, 1492346715, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_page`
--

CREATE TABLE `jd_cms_page` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '单页标题',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `keywords` varchar(32) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(250) NOT NULL DEFAULT '' COMMENT '页面描述',
  `template` varchar(32) NOT NULL DEFAULT '' COMMENT '模板文件',
  `cover` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '单页封面',
  `view` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读量',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_slider`
--

CREATE TABLE `jd_cms_slider` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '封面id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='滚动图片表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_cms_support`
--

CREATE TABLE `jd_cms_support` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '客服名称',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `msn` varchar(100) NOT NULL DEFAULT '' COMMENT 'msn',
  `taobao` varchar(100) NOT NULL DEFAULT '' COMMENT 'taobao',
  `alibaba` varchar(100) NOT NULL DEFAULT '' COMMENT 'alibaba',
  `skype` varchar(100) NOT NULL DEFAULT '' COMMENT 'skype',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客服表';

-- --------------------------------------------------------

--
-- 表的结构 `jd_manage_library`
--

CREATE TABLE `jd_manage_library` (
  `id` int(100) UNSIGNED NOT NULL COMMENT 'ID',
  `title` char(100) NOT NULL COMMENT '标题',
  `content` varchar(10000) DEFAULT NULL COMMENT '图文内容',
  `video` varchar(1000) DEFAULT NULL COMMENT '视频内容',
  `sort` char(100) NOT NULL COMMENT '分类',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jd_manage_library`
--

INSERT INTO `jd_manage_library` (`id`, `title`, `content`, `video`, `sort`, `create_time`, `update_time`, `status`) VALUES
(5, 'aa', '<p>d1212d1d12dd</p>', '', '图文', '2021-04-01 08:37:03', '2021-04-01 09:00:28', 1),
(6, '11', '<p>asd12d12</p>', '', '应急大讲堂', '2021-04-01 08:41:53', '2021-04-01 08:41:53', 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_manage_media`
--

CREATE TABLE `jd_manage_media` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `name` char(20) NOT NULL COMMENT '公众号名称',
  `qr_code` tinyint(10) NOT NULL COMMENT '公众号二维码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jd_manage_media`
--

INSERT INTO `jd_manage_media` (`id`, `name`, `qr_code`, `status`) VALUES
(1, '12', 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_manage_peixunmap`
--

CREATE TABLE `jd_manage_peixunmap` (
  `id` tinyint(10) UNSIGNED NOT NULL COMMENT 'ID',
  `zone` char(100) NOT NULL COMMENT '区域',
  `map` char(100) NOT NULL COMMENT '培训坐标',
  `name` char(100) NOT NULL COMMENT '培训名称',
  `image` char(50) NOT NULL COMMENT '培训图片',
  `map_address` char(100) NOT NULL COMMENT '培训地址',
  `info` varchar(1000) NOT NULL COMMENT '培训信息',
  `plan` char(200) NOT NULL COMMENT '培训计划',
  `time` char(100) NOT NULL COMMENT '培训时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jd_manage_peixunmap`
--

INSERT INTO `jd_manage_peixunmap` (`id`, `zone`, `map`, `name`, `image`, `map_address`, `info`, `plan`, `time`) VALUES
(1, '江北区', '106.580323,29.612549', 'aa', '3', '重庆市江北区江北区人民政府', 'bb', 'dd', 'cc');

-- --------------------------------------------------------

--
-- 表的结构 `jd_manage_report`
--

CREATE TABLE `jd_manage_report` (
  `id` tinyint(10) UNSIGNED NOT NULL COMMENT 'ID',
  `name` char(50) DEFAULT NULL COMMENT '姓名',
  `number` char(11) DEFAULT NULL COMMENT '电话',
  `email` char(50) DEFAULT NULL COMMENT '邮箱',
  `address` char(100) NOT NULL COMMENT '隐患地址',
  `img_vid` char(10) NOT NULL COMMENT '附件',
  `create_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_manage_rule`
--

CREATE TABLE `jd_manage_rule` (
  `id` tinyint(10) UNSIGNED NOT NULL COMMENT 'ID',
  `tip` char(100) NOT NULL COMMENT '默认文字',
  `rule` varchar(1000) NOT NULL COMMENT '条文规定',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jd_manage_rule`
--

INSERT INTO `jd_manage_rule` (`id`, `tip`, `rule`, `update_time`) VALUES
(1, '留下您的信息,以便我们调查后通知您!', '请ababababababababababababbabbababababaaba', '2021-04-02 01:53:48');

-- --------------------------------------------------------

--
-- 表的结构 `jd_manage_tiyanmap`
--

CREATE TABLE `jd_manage_tiyanmap` (
  `id` tinyint(10) UNSIGNED NOT NULL COMMENT 'ID',
  `zone` char(100) NOT NULL COMMENT '区域',
  `map` char(100) NOT NULL COMMENT '体验馆坐标',
  `name` char(100) NOT NULL COMMENT '体验名称',
  `image` char(20) NOT NULL COMMENT '体验馆图片',
  `map_address` char(200) NOT NULL COMMENT '体验馆地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jd_manage_tiyanmap`
--

INSERT INTO `jd_manage_tiyanmap` (`id`, `zone`, `map`, `name`, `image`, `map_address`) VALUES
(1, '鄞州区', '121.628653,29.865617', 'tes', '4', '宁波市鄞州区鄞州区行政服务中心');

-- --------------------------------------------------------

--
-- 表的结构 `jd_manage_zone`
--

CREATE TABLE `jd_manage_zone` (
  `id` tinyint(10) UNSIGNED NOT NULL COMMENT 'ID',
  `zone` char(100) NOT NULL COMMENT '区域',
  `order` tinyint(10) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jd_manage_zone`
--

INSERT INTO `jd_manage_zone` (`id`, `zone`, `order`, `status`) VALUES
(1, '鄞州区', 10, 1),
(2, '江北区', 10, 1),
(3, '高新区', 8, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jd_packet_wechat_area`
--

CREATE TABLE `jd_packet_wechat_area` (
  `id` int(11) UNSIGNED NOT NULL,
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '国家名称',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省份名称',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '城市名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='地区信息表';

--
-- 转存表中的数据 `jd_packet_wechat_area`
--

INSERT INTO `jd_packet_wechat_area` (`id`, `country`, `province`, `city`) VALUES
(1, '中国', '四川', '凉山'),
(2, '中国', '四川', '资阳'),
(3, '中国', '四川', '成都'),
(4, '中国', '四川', '自贡'),
(5, '中国', '四川', '泸州'),
(6, '中国', '四川', '攀枝花'),
(7, '中国', '四川', '绵阳'),
(8, '中国', '四川', '德阳'),
(9, '中国', '四川', '遂宁'),
(10, '中国', '四川', '广元'),
(11, '中国', '四川', '乐山'),
(12, '中国', '四川', '内江'),
(13, '中国', '四川', '南充'),
(14, '中国', '四川', '宜宾'),
(15, '中国', '四川', '眉山'),
(16, '中国', '四川', '达州'),
(17, '中国', '四川', '广安'),
(18, '中国', '四川', '巴中'),
(19, '中国', '四川', '雅安'),
(20, '中国', '四川', '甘孜'),
(21, '中国', '四川', '阿坝'),
(22, '中国', '重庆', '酉阳'),
(23, '中国', '重庆', '彭水'),
(24, '中国', '重庆', '合川'),
(25, '中国', '重庆', '永川'),
(26, '中国', '重庆', '江津'),
(27, '中国', '重庆', '南川'),
(28, '中国', '重庆', '铜梁'),
(29, '中国', '重庆', '大足'),
(30, '中国', '重庆', '荣昌'),
(31, '中国', '重庆', '璧山'),
(32, '中国', '重庆', '长寿'),
(33, '中国', '重庆', '綦江'),
(34, '中国', '重庆', '潼南'),
(35, '中国', '重庆', '梁平'),
(36, '中国', '重庆', '城口'),
(37, '中国', '重庆', '石柱'),
(38, '中国', '重庆', '秀山'),
(39, '中国', '重庆', '万州'),
(40, '中国', '重庆', '渝中'),
(41, '中国', '重庆', '涪陵'),
(42, '中国', '重庆', '江北'),
(43, '中国', '重庆', '大渡口'),
(44, '中国', '重庆', '九龙坡'),
(45, '中国', '重庆', '沙坪坝'),
(46, '中国', '重庆', '北碚'),
(47, '中国', '重庆', '南岸'),
(48, '中国', '重庆', '黔江'),
(49, '中国', '重庆', '巫溪'),
(50, '中国', '重庆', '双桥'),
(51, '中国', '重庆', '万盛'),
(52, '中国', '重庆', '巴南'),
(53, '中国', '重庆', '渝北'),
(54, '中国', '重庆', '忠县'),
(55, '中国', '重庆', '武隆'),
(56, '中国', '重庆', '垫江'),
(57, '中国', '重庆', '丰都'),
(58, '中国', '重庆', '巫山'),
(59, '中国', '重庆', '奉节'),
(60, '中国', '重庆', '云阳'),
(61, '中国', '重庆', '开县'),
(62, '中国', '陕西', '商洛'),
(63, '中国', '陕西', '西安'),
(64, '中国', '陕西', '宝鸡'),
(65, '中国', '陕西', '铜川'),
(66, '中国', '陕西', '渭南'),
(67, '中国', '陕西', '咸阳'),
(68, '中国', '陕西', '汉中'),
(69, '中国', '陕西', '延安'),
(70, '中国', '陕西', '安康'),
(71, '中国', '陕西', '榆林'),
(72, '中国', '甘肃', '定西'),
(73, '中国', '甘肃', '庆阳'),
(74, '中国', '甘肃', '陇南'),
(75, '中国', '甘肃', '甘南'),
(76, '中国', '甘肃', '临夏'),
(77, '中国', '甘肃', '兰州'),
(78, '中国', '甘肃', '金昌'),
(79, '中国', '甘肃', '嘉峪关'),
(80, '中国', '甘肃', '天水'),
(81, '中国', '甘肃', '白银'),
(82, '中国', '甘肃', '张掖'),
(83, '中国', '甘肃', '武威'),
(84, '中国', '甘肃', '酒泉'),
(85, '中国', '甘肃', '平凉'),
(86, '中国', '青海', '海南'),
(87, '中国', '青海', '果洛'),
(88, '中国', '青海', '玉树'),
(89, '中国', '青海', '海东'),
(90, '中国', '青海', '海北'),
(91, '中国', '青海', '黄南'),
(92, '中国', '青海', '海西'),
(93, '中国', '青海', '西宁'),
(94, '中国', '宁夏', '银川'),
(95, '中国', '宁夏', '吴忠'),
(96, '中国', '宁夏', '石嘴山'),
(97, '中国', '宁夏', '中卫'),
(98, '中国', '宁夏', '固原'),
(99, '中国', '云南', '红河'),
(100, '中国', '云南', '文山'),
(101, '中国', '云南', '楚雄'),
(102, '中国', '云南', '怒江'),
(103, '中国', '云南', '德宏'),
(104, '中国', '云南', '西双版纳'),
(105, '中国', '云南', '大理'),
(106, '中国', '云南', '迪庆'),
(107, '中国', '云南', '昆明'),
(108, '中国', '云南', '曲靖'),
(109, '中国', '云南', '保山'),
(110, '中国', '云南', '玉溪'),
(111, '中国', '云南', '丽江'),
(112, '中国', '云南', '昭通'),
(113, '中国', '云南', '临沧'),
(114, '中国', '云南', '普洱'),
(115, '中国', '澳门', ''),
(116, '中国', '香港', ''),
(117, '中国', '贵州', '毕节'),
(118, '中国', '贵州', '黔东南'),
(119, '中国', '贵州', '黔南'),
(120, '中国', '贵州', '铜仁'),
(121, '中国', '贵州', '黔西南'),
(122, '中国', '贵州', '贵阳'),
(123, '中国', '贵州', '遵义'),
(124, '中国', '贵州', '六盘水'),
(125, '中国', '贵州', '安顺'),
(126, '中国', '辽宁', '盘锦'),
(127, '中国', '辽宁', '辽阳'),
(128, '中国', '辽宁', '朝阳'),
(129, '中国', '辽宁', '铁岭'),
(130, '中国', '辽宁', '葫芦岛'),
(131, '中国', '辽宁', '沈阳'),
(132, '中国', '辽宁', '鞍山'),
(133, '中国', '辽宁', '大连'),
(134, '中国', '辽宁', '本溪'),
(135, '中国', '辽宁', '抚顺'),
(136, '中国', '辽宁', '锦州'),
(137, '中国', '辽宁', '丹东'),
(138, '中国', '辽宁', '阜新'),
(139, '中国', '辽宁', '营口'),
(140, '中国', '吉林', '延边'),
(141, '中国', '吉林', '长春'),
(142, '中国', '吉林', '四平'),
(143, '中国', '吉林', '吉林'),
(144, '中国', '吉林', '通化'),
(145, '中国', '吉林', '辽源'),
(146, '中国', '吉林', '松原'),
(147, '中国', '吉林', '白山'),
(148, '中国', '吉林', '白城'),
(149, '中国', '黑龙江', '黑河'),
(150, '中国', '黑龙江', '牡丹江'),
(151, '中国', '黑龙江', ' 绥化'),
(152, '中国', '黑龙江', '哈尔滨'),
(153, '中国', '黑龙江', '大兴安岭'),
(154, '中国', '黑龙江', '鸡西'),
(155, '中国', '黑龙江', '齐齐哈尔'),
(156, '中国', '黑龙江', '双鸭山'),
(157, '中国', '黑龙江', '鹤岗'),
(158, '中国', '黑龙江', '伊春'),
(159, '中国', '黑龙江', '大庆'),
(160, '中国', '黑龙江', '七台河'),
(161, '中国', '黑龙江', '佳木斯'),
(162, '中国', '海南', '乐东'),
(163, '中国', '海南', '昌江'),
(164, '中国', '海南', '白沙'),
(165, '中国', '海南', '西沙'),
(166, '中国', '海南', '琼中'),
(167, '中国', '海南', '保亭'),
(168, '中国', '海南', '陵水'),
(169, '中国', '海南', '中沙'),
(170, '中国', '海南', '南沙'),
(171, '中国', '海南', '海口'),
(172, '中国', '海南', '三亚'),
(173, '中国', '海南', '五指山'),
(174, '中国', '海南', '儋州'),
(175, '中国', '海南', '琼海'),
(176, '中国', '海南', '文昌'),
(177, '中国', '海南', '东方'),
(178, '中国', '海南', '万宁'),
(179, '中国', '海南', '定安'),
(180, '中国', '海南', '屯昌'),
(181, '中国', '海南', '澄迈'),
(182, '中国', '海南', '临高'),
(183, '中国', '广东', '揭阳'),
(184, '中国', '广东', '中山'),
(185, '中国', '广东', '广州'),
(186, '中国', '广东', '深圳'),
(187, '中国', '广东', '韶关'),
(188, '中国', '广东', '汕头'),
(189, '中国', '广东', '珠海'),
(190, '中国', '广东', '江门'),
(191, '中国', '广东', '佛山'),
(192, '中国', '广东', '茂名'),
(193, '中国', '广东', '湛江'),
(194, '中国', '广东', '惠州'),
(195, '中国', '广东', '肇庆'),
(196, '中国', '广东', '汕尾'),
(197, '中国', '广东', '梅州'),
(198, '中国', '广东', '阳江'),
(199, '中国', '广东', '河源'),
(200, '中国', '广东', '东莞'),
(201, '中国', '广东', '清远'),
(202, '中国', '广东', '潮州'),
(203, '中国', '广东', '云浮'),
(204, '中国', '广西', '贺州'),
(205, '中国', '广西', '百色'),
(206, '中国', '广西', '来宾'),
(207, '中国', '广西', '河池'),
(208, '中国', '广西', '崇左'),
(209, '中国', '广西', '南宁'),
(210, '中国', '广西', '桂林'),
(211, '中国', '广西', '柳州'),
(212, '中国', '广西', '北海'),
(213, '中国', '广西', '梧州'),
(214, '中国', '广西', '钦州'),
(215, '中国', '广西', '防城港'),
(216, '中国', '广西', '玉林'),
(217, '中国', '广西', '贵港'),
(218, '中国', '湖北', '黄冈'),
(219, '中国', '湖北', '荆州'),
(220, '中国', '湖北', '随州'),
(221, '中国', '湖北', '咸宁'),
(222, '中国', '湖北', '神农架'),
(223, '中国', '湖北', '恩施'),
(224, '中国', '湖北', '武汉'),
(225, '中国', '湖北', '十堰'),
(226, '中国', '湖北', '黄石'),
(227, '中国', '湖北', '宜昌'),
(228, '中国', '湖北', '鄂州'),
(229, '中国', '湖北', '襄樊'),
(230, '中国', '湖北', '孝感'),
(231, '中国', '湖北', '荆门'),
(232, '中国', '湖北', '潜江'),
(233, '中国', '湖北', '仙桃'),
(234, '中国', '湖北', '天门'),
(235, '中国', '湖南', '永州'),
(236, '中国', '湖南', '郴州'),
(237, '中国', '湖南', '娄底'),
(238, '中国', '湖南', '怀化'),
(239, '中国', '湖南', '湘西'),
(240, '中国', '湖南', '长沙'),
(241, '中国', '湖南', '湘潭'),
(242, '中国', '湖南', '株洲'),
(243, '中国', '湖南', '邵阳'),
(244, '中国', '湖南', '衡阳'),
(245, '中国', '湖南', '常德'),
(246, '中国', '湖南', '岳阳'),
(247, '中国', '湖南', '益阳'),
(248, '中国', '湖南', '张家界'),
(249, '中国', '河南', '漯河'),
(250, '中国', '河南', '许昌'),
(251, '中国', '河南', '南阳'),
(252, '中国', '河南', '三门峡'),
(253, '中国', '河南', '信阳'),
(254, '中国', '河南', '商丘'),
(255, '中国', '河南', '驻马店'),
(256, '中国', '河南', '周口'),
(257, '中国', '河南', '济源'),
(258, '中国', '河南', '郑州'),
(259, '中国', '河南', '洛阳'),
(260, '中国', '河南', '开封'),
(261, '中国', '河南', '安阳'),
(262, '中国', '河南', '平顶山'),
(263, '中国', '河南', '新乡'),
(264, '中国', '河南', '鹤壁'),
(265, '中国', '河南', '濮阳'),
(266, '中国', '河南', '焦作'),
(267, '中国', '台湾', '屏东县'),
(268, '中国', '台湾', '澎湖县'),
(269, '中国', '台湾', '台东县'),
(270, '中国', '台湾', '花莲县'),
(271, '中国', '台湾', '台北市'),
(272, '中国', '台湾', '基隆市'),
(273, '中国', '台湾', '高雄市'),
(274, '中国', '台湾', '台南市'),
(275, '中国', '台湾', '台中市'),
(276, '中国', '台湾', '嘉义市'),
(277, '中国', '台湾', '新竹市'),
(278, '中国', '台湾', '宜兰县'),
(279, '中国', '台湾', '台北县'),
(280, '中国', '台湾', '新竹县'),
(281, '中国', '台湾', '桃园县'),
(282, '中国', '台湾', '台中县'),
(283, '中国', '台湾', '苗栗县'),
(284, '中国', '台湾', '南投县'),
(285, '中国', '台湾', '彰化县'),
(286, '中国', '台湾', '嘉义县'),
(287, '中国', '台湾', '云林县'),
(288, '中国', '台湾', '高雄县'),
(289, '中国', '台湾', '台南县'),
(290, '中国', '北京', '房山'),
(291, '中国', '北京', '大兴'),
(292, '中国', '北京', '顺义'),
(293, '中国', '北京', '通州'),
(294, '中国', '北京', '昌平'),
(295, '中国', '北京', '密云'),
(296, '中国', '北京', '平谷'),
(297, '中国', '北京', '延庆'),
(298, '中国', '北京', '东城'),
(299, '中国', '北京', '怀柔'),
(300, '中国', '北京', '崇文'),
(301, '中国', '北京', '西城'),
(302, '中国', '北京', '朝阳'),
(303, '中国', '北京', '宣武'),
(304, '中国', '北京', '石景山'),
(305, '中国', '北京', '丰台'),
(306, '中国', '北京', '门头沟'),
(307, '中国', '北京', '海淀'),
(308, '中国', '河北', '衡水'),
(309, '中国', '河北', '廊坊'),
(310, '中国', '河北', '石家庄'),
(311, '中国', '河北', '秦皇岛'),
(312, '中国', '河北', '唐山'),
(313, '中国', '河北', '邢台'),
(314, '中国', '河北', '邯郸'),
(315, '中国', '河北', '张家口'),
(316, '中国', '河北', '保定'),
(317, '中国', '河北', '沧州'),
(318, '中国', '河北', '承德'),
(319, '中国', '天津', '西青'),
(320, '中国', '天津', '东丽'),
(321, '中国', '天津', '北辰'),
(322, '中国', '天津', '津南'),
(323, '中国', '天津', '宁河'),
(324, '中国', '天津', '武清'),
(325, '中国', '天津', '静海'),
(326, '中国', '天津', '宝坻'),
(327, '中国', '天津', '和平'),
(328, '中国', '天津', '河西'),
(329, '中国', '天津', '河东'),
(330, '中国', '天津', '河北'),
(331, '中国', '天津', '南开'),
(332, '中国', '天津', '塘沽'),
(333, '中国', '天津', '红桥'),
(334, '中国', '天津', '大港'),
(335, '中国', '天津', '汉沽'),
(336, '中国', '天津', '蓟县'),
(337, '中国', '内蒙古', '锡林郭勒'),
(338, '中国', '内蒙古', '兴安'),
(339, '中国', '内蒙古', '阿拉善'),
(340, '中国', '内蒙古', '呼和浩特'),
(341, '中国', '内蒙古', '乌海'),
(342, '中国', '内蒙古', '包头'),
(343, '中国', '内蒙古', '通辽'),
(344, '中国', '内蒙古', '赤峰'),
(345, '中国', '内蒙古', '呼伦贝尔'),
(346, '中国', '内蒙古', '鄂尔多斯'),
(347, '中国', '内蒙古', '乌兰察布'),
(348, '中国', '内蒙古', '巴彦淖尔'),
(349, '中国', '山西', '吕梁'),
(350, '中国', '山西', '临汾'),
(351, '中国', '山西', '太原'),
(352, '中国', '山西', '阳泉'),
(353, '中国', '山西', '大同'),
(354, '中国', '山西', '晋城'),
(355, '中国', '山西', '长治'),
(356, '中国', '山西', '晋中'),
(357, '中国', '山西', '朔州'),
(358, '中国', '山西', '忻州'),
(359, '中国', '山西', '运城'),
(360, '中国', '浙江', '丽水'),
(361, '中国', '浙江', '台州'),
(362, '中国', '浙江', '杭州'),
(363, '中国', '浙江', '温州'),
(364, '中国', '浙江', '宁波'),
(365, '中国', '浙江', '湖州'),
(366, '中国', '浙江', '嘉兴'),
(367, '中国', '浙江', '金华'),
(368, '中国', '浙江', '绍兴'),
(369, '中国', '浙江', '舟山'),
(370, '中国', '浙江', '衢州'),
(371, '中国', '江苏', '镇江'),
(372, '中国', '江苏', '扬州'),
(373, '中国', '江苏', '宿迁'),
(374, '中国', '江苏', '泰州'),
(375, '中国', '江苏', '南京'),
(376, '中国', '江苏', '徐州'),
(377, '中国', '江苏', '无锡'),
(378, '中国', '江苏', '苏州'),
(379, '中国', '江苏', '常州'),
(380, '中国', '江苏', '连云港'),
(381, '中国', '江苏', '南通'),
(382, '中国', '江苏', '盐城'),
(383, '中国', '江苏', '淮安'),
(384, '中国', '上海', '杨浦'),
(385, '中国', '上海', '南汇'),
(386, '中国', '上海', '宝山'),
(387, '中国', '上海', '闵行'),
(388, '中国', '上海', '浦东新'),
(389, '中国', '上海', '嘉定'),
(390, '中国', '上海', '松江'),
(391, '中国', '上海', '金山'),
(392, '中国', '上海', '崇明'),
(393, '中国', '上海', '奉贤'),
(394, '中国', '上海', '青浦'),
(395, '中国', '上海', '黄浦'),
(396, '中国', '上海', '卢湾'),
(397, '中国', '上海', '长宁'),
(398, '中国', '上海', '徐汇'),
(399, '中国', '上海', '普陀'),
(400, '中国', '上海', '静安'),
(401, '中国', '上海', '虹口'),
(402, '中国', '上海', '闸北'),
(403, '中国', '山东', '日照'),
(404, '中国', '山东', '威海'),
(405, '中国', '山东', '临沂'),
(406, '中国', '山东', '莱芜'),
(407, '中国', '山东', '聊城'),
(408, '中国', '山东', '德州'),
(409, '中国', '山东', '菏泽'),
(410, '中国', '山东', '滨州'),
(411, '中国', '山东', '济南'),
(412, '中国', '山东', '淄博'),
(413, '中国', '山东', '青岛'),
(414, '中国', '山东', '东营'),
(415, '中国', '山东', '枣庄'),
(416, '中国', '山东', '潍坊'),
(417, '中国', '山东', '烟台'),
(418, '中国', '山东', '泰安'),
(419, '中国', '山东', '济宁'),
(420, '中国', '江西', '上饶'),
(421, '中国', '江西', '抚州'),
(422, '中国', '江西', '南昌'),
(423, '中国', '江西', '萍乡'),
(424, '中国', '江西', '景德镇'),
(425, '中国', '江西', '新余'),
(426, '中国', '江西', '九江'),
(427, '中国', '江西', '赣州'),
(428, '中国', '江西', '鹰潭'),
(429, '中国', '江西', '宜春'),
(430, '中国', '江西', '吉安'),
(431, '中国', '福建', '福州'),
(432, '中国', '福建', '莆田'),
(433, '中国', '福建', '厦门'),
(434, '中国', '福建', '泉州'),
(435, '中国', '福建', '三明'),
(436, '中国', '福建', '南平'),
(437, '中国', '福建', '漳州'),
(438, '中国', '福建', '宁德'),
(439, '中国', '福建', '龙岩'),
(440, '中国', '安徽', '滁州'),
(441, '中国', '安徽', '黄山'),
(442, '中国', '安徽', '宿州'),
(443, '中国', '安徽', '阜阳'),
(444, '中国', '安徽', '六安'),
(445, '中国', '安徽', '巢湖'),
(446, '中国', '安徽', '池州'),
(447, '中国', '安徽', '亳州'),
(448, '中国', '安徽', '宣城'),
(449, '中国', '安徽', '合肥'),
(450, '中国', '安徽', '蚌埠'),
(451, '中国', '安徽', '芜湖'),
(452, '中国', '安徽', '马鞍山'),
(453, '中国', '安徽', '淮南'),
(454, '中国', '安徽', '铜陵'),
(455, '中国', '安徽', '淮北'),
(456, '中国', '安徽', '安庆'),
(457, '中国', '西藏', '那曲'),
(458, '中国', '西藏', '阿里'),
(459, '中国', '西藏', '林芝'),
(460, '中国', '西藏', '昌都'),
(461, '中国', '西藏', '山南'),
(462, '中国', '西藏', '日喀则'),
(463, '中国', '西藏', '拉萨'),
(464, '中国', '新疆', '博尔塔拉'),
(465, '中国', '新疆', '吐鲁番'),
(466, '中国', '新疆', '哈密'),
(467, '中国', '新疆', '昌吉'),
(468, '中国', '新疆', '和田'),
(469, '中国', '新疆', '喀什'),
(470, '中国', '新疆', '克孜勒苏'),
(471, '中国', '新疆', '巴音郭楞'),
(472, '中国', '新疆', '阿克苏'),
(473, '中国', '新疆', '伊犁'),
(474, '中国', '新疆', '塔城'),
(475, '中国', '新疆', '乌鲁木齐'),
(476, '中国', '新疆', '阿勒泰'),
(477, '中国', '新疆', '克拉玛依'),
(478, '中国', '新疆', '石河子'),
(479, '中国', '新疆', '图木舒克'),
(480, '中国', '新疆', '阿拉尔'),
(481, '中国', '新疆', '五家渠');

-- --------------------------------------------------------

--
-- 表的结构 `jd_report_online`
--

CREATE TABLE `jd_report_online` (
  `id` int(10) NOT NULL,
  `report_street` varchar(20) NOT NULL,
  `report_address` varchar(100) NOT NULL,
  `report_people` varchar(1000) DEFAULT NULL,
  `report_date` date NOT NULL,
  `report_mine` varchar(100) DEFAULT NULL,
  `report_description` varchar(1000) NOT NULL,
  `report_img` varchar(10000) DEFAULT NULL,
  `number` char(11) NOT NULL,
  `feedback` varchar(1000) DEFAULT NULL,
  `back_info` varchar(9) NOT NULL DEFAULT '否',
  `shenhe` int(1) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jd_report_online`
--

INSERT INTO `jd_report_online` (`id`, `report_street`, `report_address`, `report_people`, `report_date`, `report_mine`, `report_description`, `report_img`, `number`, `feedback`, `back_info`, `shenhe`, `create_time`) VALUES
(1, 'A街道', '火星', 'XXX', '2021-03-09', '钻石', '12345', '2,3', '13023777137', 'XXXXXXXXXXXXXXXXXXXXXXXXX', '是', 1, '2021-03-29 13:15:24'),
(2, 'A街道', '土星', '123', '2021-03-24', '锡矿', '123', '', '13023777137', NULL, '否', 0, '2021-03-29 13:49:58'),
(3, 'B街道', '百慕大', 'bbb', '2021-03-16', 'ccc', 'ddd', '', '13012345678', '123', '是', 1, '2021-03-29 16:20:30'),
(4, '2020', '', '123', '2021-03-16', '1222', '123123123', '', '13819885939', '123', '是', 1, '2021-03-30 08:38:05'),
(8, 'B街道', 'XXXX', '', '2021-03-16', '', '12345', '', '13012345678', NULL, '否', 0, '2021-03-30 16:16:57'),
(10, 'C街道', '东非大峡谷', '', '2021-03-16', 'TNT', '阿巴阿巴', '2,3', '13012345678', NULL, '否', 0, '2021-04-01 09:40:11');

-- --------------------------------------------------------

--
-- 表的结构 `jd_report_user`
--

CREATE TABLE `jd_report_user` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `idcard` varchar(18) DEFAULT NULL,
  `number` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jd_report_user`
--

INSERT INTO `jd_report_user` (`id`, `name`, `idcard`, `number`) VALUES
(2, 'Demon', '330283199900000000', '13023777137'),
(39, 'xyz', '330283199000000000', '13012345678'),
(40, 'ceshi', '330221211321332', '13819885939');

-- --------------------------------------------------------

--
-- 表的结构 `jd_sms`
--

CREATE TABLE `jd_sms` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '手机号',
  `value` varchar(250) NOT NULL DEFAULT '' COMMENT '验证码',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1验证码2模板',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信日志';

--
-- 转储表的索引
--

--
-- 表的索引 `jd_admin_action`
--
ALTER TABLE `jd_admin_action`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_attachment`
--
ALTER TABLE `jd_admin_attachment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_config`
--
ALTER TABLE `jd_admin_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_hook`
--
ALTER TABLE `jd_admin_hook`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_hook_plugin`
--
ALTER TABLE `jd_admin_hook_plugin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_icon`
--
ALTER TABLE `jd_admin_icon`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_icon_list`
--
ALTER TABLE `jd_admin_icon_list`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_log`
--
ALTER TABLE `jd_admin_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `action_ip_ix` (`action_ip`) USING BTREE,
  ADD KEY `action_id_ix` (`action_id`) USING BTREE,
  ADD KEY `user_id_ix` (`user_id`) USING BTREE;

--
-- 表的索引 `jd_admin_menu`
--
ALTER TABLE `jd_admin_menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_module`
--
ALTER TABLE `jd_admin_module`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_packet`
--
ALTER TABLE `jd_admin_packet`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_plugin`
--
ALTER TABLE `jd_admin_plugin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_role`
--
ALTER TABLE `jd_admin_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_admin_user`
--
ALTER TABLE `jd_admin_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `jd_cms_advert`
--
ALTER TABLE `jd_cms_advert`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_advert_type`
--
ALTER TABLE `jd_cms_advert_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_column`
--
ALTER TABLE `jd_cms_column`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_document`
--
ALTER TABLE `jd_cms_document`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_field`
--
ALTER TABLE `jd_cms_field`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_link`
--
ALTER TABLE `jd_cms_link`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_menu`
--
ALTER TABLE `jd_cms_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_model`
--
ALTER TABLE `jd_cms_model`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_nav`
--
ALTER TABLE `jd_cms_nav`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_page`
--
ALTER TABLE `jd_cms_page`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_slider`
--
ALTER TABLE `jd_cms_slider`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_cms_support`
--
ALTER TABLE `jd_cms_support`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_manage_library`
--
ALTER TABLE `jd_manage_library`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_manage_media`
--
ALTER TABLE `jd_manage_media`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_manage_peixunmap`
--
ALTER TABLE `jd_manage_peixunmap`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_manage_report`
--
ALTER TABLE `jd_manage_report`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_manage_rule`
--
ALTER TABLE `jd_manage_rule`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_manage_tiyanmap`
--
ALTER TABLE `jd_manage_tiyanmap`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_manage_zone`
--
ALTER TABLE `jd_manage_zone`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_packet_wechat_area`
--
ALTER TABLE `jd_packet_wechat_area`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_report_online`
--
ALTER TABLE `jd_report_online`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_report_user`
--
ALTER TABLE `jd_report_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jd_sms`
--
ALTER TABLE `jd_sms`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `jd_admin_action`
--
ALTER TABLE `jd_admin_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- 使用表AUTO_INCREMENT `jd_admin_attachment`
--
ALTER TABLE `jd_admin_attachment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `jd_admin_config`
--
ALTER TABLE `jd_admin_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用表AUTO_INCREMENT `jd_admin_hook`
--
ALTER TABLE `jd_admin_hook`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `jd_admin_hook_plugin`
--
ALTER TABLE `jd_admin_hook_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `jd_admin_icon`
--
ALTER TABLE `jd_admin_icon`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_admin_icon_list`
--
ALTER TABLE `jd_admin_icon_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_admin_log`
--
ALTER TABLE `jd_admin_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=79;

--
-- 使用表AUTO_INCREMENT `jd_admin_menu`
--
ALTER TABLE `jd_admin_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767;

--
-- 使用表AUTO_INCREMENT `jd_admin_module`
--
ALTER TABLE `jd_admin_module`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `jd_admin_packet`
--
ALTER TABLE `jd_admin_packet`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `jd_admin_plugin`
--
ALTER TABLE `jd_admin_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `jd_admin_role`
--
ALTER TABLE `jd_admin_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `jd_admin_user`
--
ALTER TABLE `jd_admin_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `jd_cms_advert`
--
ALTER TABLE `jd_cms_advert`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_cms_advert_type`
--
ALTER TABLE `jd_cms_advert_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_cms_column`
--
ALTER TABLE `jd_cms_column`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_cms_document`
--
ALTER TABLE `jd_cms_document`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_cms_field`
--
ALTER TABLE `jd_cms_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '字段名称', AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `jd_cms_link`
--
ALTER TABLE `jd_cms_link`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_cms_menu`
--
ALTER TABLE `jd_cms_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `jd_cms_model`
--
ALTER TABLE `jd_cms_model`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_cms_nav`
--
ALTER TABLE `jd_cms_nav`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `jd_cms_page`
--
ALTER TABLE `jd_cms_page`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_cms_slider`
--
ALTER TABLE `jd_cms_slider`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_cms_support`
--
ALTER TABLE `jd_cms_support`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `jd_manage_library`
--
ALTER TABLE `jd_manage_library`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `jd_manage_media`
--
ALTER TABLE `jd_manage_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `jd_manage_peixunmap`
--
ALTER TABLE `jd_manage_peixunmap`
  MODIFY `id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `jd_manage_report`
--
ALTER TABLE `jd_manage_report`
  MODIFY `id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `jd_manage_rule`
--
ALTER TABLE `jd_manage_rule`
  MODIFY `id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `jd_manage_tiyanmap`
--
ALTER TABLE `jd_manage_tiyanmap`
  MODIFY `id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `jd_manage_zone`
--
ALTER TABLE `jd_manage_zone`
  MODIFY `id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `jd_packet_wechat_area`
--
ALTER TABLE `jd_packet_wechat_area`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=482;

--
-- 使用表AUTO_INCREMENT `jd_report_online`
--
ALTER TABLE `jd_report_online`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `jd_report_user`
--
ALTER TABLE `jd_report_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 使用表AUTO_INCREMENT `jd_sms`
--
ALTER TABLE `jd_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
