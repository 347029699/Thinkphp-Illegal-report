<?php /*a:1:{s:65:"D:\phpstudy_pro\WWW\test\application\report\view\index\login.html";i:1616750560;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>宁海县自然资源和规划</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="/test/public/static/report/js/jquery.min.js"></script>
    <script src="/test/public/static/report/js/layer.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <link rel="stylesheet" href="/test/public/static/report/css/iconfont.css?v=1">
    <link rel="stylesheet" type="text/css" href="/test/public/static/report/css/style.css?v=12">
    <script type="text/javascript">
      (function (doc, win) {
            var docEl = doc.documentElement,
                resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                recalc = function () {
                    var clientWidth = docEl.clientWidth;
                    if (!clientWidth) return;
                    if(clientWidth>=750){
                        docEl.style.fontSize = '100px';
                    }else{
                        docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
                    }
                };
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);
    </script>
</head>
<body>
<form method="post">
  <div id="main" class="login">
    <div class="banner"><img src="/test/public/static/report/img/images/login_banner.jpg" alt=""></div>
    <div class="login_title">
        欢迎登录
    </div>
    <div class="login_form">
        <div class="row">
            <label><i class="iconfont icon-xingming"></i></label><input type="text" id="username" name="name" placeholder="请输入您的姓名">
        </div>
        <div class="row">
            <label><i class="iconfont icon-credentials_icon"></i></label><input type="text" id="usercode" name="idcard" placeholder="请输入您的身份证号码">
        </div>
        <div class="row">
            <label><i class="iconfont icon-dianhua"></i></label><input type="text" id="mobile" placeholder="请输入您的手机号码" name="number" maxlength="11"><input type="button" id="getting" name="check" value="获取验证码">
        </div>
        <div class="row">
            <label><i class="iconfont icon-yanzhengma"></i></label><input type="text" placeholder="请输入您的验证码" name="yzm" id="yzm">
        </div>
        <button class="btn" name="submit" id="submit">登录</button>
    </div>
  </div>
<form>
</body>
<script>
	$(function(){

		/*仿刷新：检测是否存在cookie*/
		/*if($.cookie("captcha")){
			var count = $.cookie("captcha");
			var btn = $('#getting');
        	btn.val(count+'秒后可重新获取').attr('disabled',true).css('cursor','not-allowed');
        	var resend = setInterval(function(){
	        	count--;
	        	if (count > 0){
	            	btn.val(count+'秒后可重新获取').attr('disabled',true).css('cursor','not-allowed');
	            	$.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
	        	}else {
	        		clearInterval(resend);
	       	 		btn.val("获取验证码").removeClass('disabled').removeAttr('disabled style');
	        	}
	    	}, 1000);
		}*/
		/*点击改变按钮状态，已经简略掉ajax发送短信验证的代码*/
		$('#getting').click(function(){
            var mobile = $("#mobile").val();
            var btn = $(this);
            var count = 60;     //需要倒计时的秒数
            if(mobile == ''){
                layer.open({
                    content: '请填写您的手机号！'
                    ,skin: 'msg'
                    ,time: 2 //2秒后自动关闭
                });
                return false;
            }
            if (!mobile.match(/^(?:(?:\+|00)86)?1[3-9]\d{9}$/)) {
                layer.open({
                    content: '请填正确的手机号！'
                    ,skin: 'msg'
                    ,time: 2 //2秒后自动关闭
                });
                return false;
            }

             $.ajax({
                 type:"post",
                 url:"login",
                 dataType:"text",
                 data :{mobile:mobile},
                 success : function(result){
                     var resend = setInterval(function(){
                         count--;
                         if (count > 0){
                             btn.val(count+"秒后可重新获取");
                             $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
                         }else {
                             clearInterval(resend);
                             btn.val("获取验证码").removeAttr('disabled style');
                         }
                     }, 1000);
                     btn.attr('disabled',true).css('cursor','not-allowed');
                 }
             })

        	var resend = setInterval(function(){
	        	count--;
	        	if (count > 0){
	            	btn.val(count+"秒后可重新获取");
	            	$.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
	        	}else {
	        		clearInterval(resend);
	       	 		btn.val("获取验证码").removeAttr('disabled style');
	        	}
	    	}, 1000);
	    	btn.attr('disabled',true).css('cursor','not-allowed');
		});


        $('#submit').click(function(){
            var username = $("#username").val();
            var mobile = $("#mobile").val();
            var yzm = $("#yzm").val();
            if(username == ''){
                layer.open({
                    content: '请填写您的姓名！'
                    ,skin: 'msg'
                    ,time: 2 //2秒后自动关闭
                });
                return false;
            }
            if(mobile == ''){
                layer.open({
                    content: '请填写您的手机号！'
                    ,skin: 'msg'
                    ,time: 2 //2秒后自动关闭
                });
                return false;
            }
            if (!mobile.match(/^(?:(?:\+|00)86)?1[3-9]\d{9}$/)) {
                layer.open({
                    content: '请填正确的手机号！'
                    ,skin: 'msg'
                    ,time: 2 //2秒后自动关闭
                });
                return false;
            }
            if(yzm == ''){
                layer.open({
                    content: '请填写验证码！'
                    ,skin: 'msg'
                    ,time: 2 //2秒后自动关闭
                });
                return false;
            }
        })

	});
</script>
</html>