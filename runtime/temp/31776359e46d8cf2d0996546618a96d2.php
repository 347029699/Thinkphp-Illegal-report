<?php /*a:1:{s:65:"D:\phpstudy_pro\WWW\test\application\admin/view/dispatch_jump.tpl";i:1589356742;}*/ ?>
<!DOCTYPE html>
<!--[if IE 9]>         <html class="ie9 no-focus" lang="zh"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-focus" lang="zh"> <!--<![endif]-->
<head>
    <meta charset="utf-8">

    <title>跳转提示 | <?php echo config('web_site_title'); ?></title>

    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">

    <!-- Icons -->
    <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
    <link rel="shortcut icon" href="/test/public/static/img/favicons/favicon.png">
    <!-- END Icons -->

    <!-- Stylesheets -->
    <!-- Bootstrap and OneUI CSS framework -->
    <link rel="stylesheet" href="/test/public/static/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/test/public/static/admin/css/oneui.css">
    <link rel="stylesheet" href="/test/public/static/admin/css/ma.css">
    <!-- END Stylesheets -->
</head>
<body>
<!-- Error Content -->
<div class="content bg-white text-center pulldown overflow-hidden">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <!-- Error Titles -->
            <h1 class="font-w300 <?php echo !empty($code) ? 'text-success'  :  'text-city'; ?> push-10 animated flipInX"><i class="fa fa-<?php echo !empty($code) ? 'check'  :  'times'; ?>-circle"></i> <?php echo(strip_tags($msg));?></h1>
            <p class="font-w300 push-20 animated fadeInUp">页面自动 <a id="href" href="<?php echo($url);?>">跳转</a> 等待时间： <b id="wait"><?php echo($wait);?></b>秒</p>
            <div class="push-50">
                <a class="btn btn-minw btn-rounded btn-success" href="<?php echo($url);?>"><i class="fa fa-external-link-square"></i> 立即跳转</a>
                <button class="btn btn-minw btn-rounded btn-warning" type="button" onclick="stop()"><i class="fa fa-ban"></i> 禁止跳转</button>
                <a class="btn btn-minw btn-rounded btn-default" href="<?php echo htmlentities(app('request')->baseFile()); ?>"><i class="fa fa-home"></i> 返回首页</a>
            </div>
            <!-- END Error Titles -->

        </div>
    </div>
</div>
<!-- END Error Content -->

<!-- Error Footer -->
<div class="content pulldown text-muted text-center">

</div>
<!-- END Error Footer -->

<script type="text/javascript">
    (function(){
        let wait  = document.getElementById('wait'),
            href  = document.getElementById('href').href,
            pop   = '<?php echo htmlentities(app('request')->param('_pop')); ?>'; //获取窗口索引

        let interval = setInterval(function(){
            let time = --wait.innerHTML;
            if(time <= 0) {
                if (pop === '1' && parent.layer !== undefined) {
                    let index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                } else {
                    location.href = href;
                }
                clearInterval(interval);
            }
        }, 1000);

        // 禁止跳转
        window.stop = function (){
            clearInterval(interval);
        }
    })();
</script>
</body>
</html>