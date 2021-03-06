<?php /*a:1:{s:72:"D:\phpstudy_pro\WWW\test\application\user/view/admin/publics\signin.html";i:1589356742;}*/ ?>
<!DOCTYPE html>
<!--[if IE 9]>         <html class="ie9 no-focus" lang="zh"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-focus" lang="zh"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">

        <title><?php echo config('web_site_title'); ?></title>

        <meta name="description" content="">
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">

        <!-- Icons -->
        <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
        <link rel="shortcut icon" href="/test/public/static/admin/img/favicons/favicon.ico">

        <link rel="icon" type="image/png" href="/test/public/static/admin/img/favicons/favicon-16x16.png" sizes="16x16">
        <link rel="icon" type="image/png" href="/test/public/static/admin/img/favicons/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="/test/public/static/admin/img/favicons/favicon-96x96.png" sizes="96x96">
        <link rel="icon" type="image/png" href="/test/public/static/admin/img/favicons/favicon-160x160.png" sizes="160x160">
        <link rel="icon" type="image/png" href="/test/public/static/admin/img/favicons/favicon-192x192.png" sizes="192x192">

        <link rel="apple-touch-icon" sizes="57x57" href="/test/public/static/admin/img/favicons/apple-touch-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="/test/public/static/admin/img/favicons/apple-touch-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="/test/public/static/admin/img/favicons/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="/test/public/static/admin/img/favicons/apple-touch-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="/test/public/static/admin/img/favicons/apple-touch-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="/test/public/static/admin/img/favicons/apple-touch-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="/test/public/static/admin/img/favicons/apple-touch-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="/test/public/static/admin/img/favicons/apple-touch-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="/test/public/static/admin/img/favicons/apple-touch-icon-180x180.png">
        <!-- END Icons -->


        <!-- Stylesheets -->

        <!-- Page JS Plugins CSS -->
        <link rel="stylesheet" href="/test/public/static/libs/sweetalert/sweetalert.min.css">

        <!-- Bootstrap and OneUI CSS framework -->
        <link rel="stylesheet" href="/test/public/static/admin/css/bootstrap.min.css">
        <link rel="stylesheet" id="css-main" href="/test/public/static/admin/css/oneui.css">
        <link rel="stylesheet" href="/test/public/static/admin/css/dolphin.css">

        <!-- END Stylesheets -->
        <style>
            body{ background: url(/test/public/static/admin/img/bg.jpg) no-repeat; background-size: cover; }
            /*.login_box{ background: #fff; padding: 15px 10%; }*/
            .login_box{ background: rgba(255,255,255,.5); padding: 15px 10%;
                -webkit-box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
                box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
            }
            .form-control{ height: 46px; }
            .btn{ background: -webkit-linear-gradient(left,#363638,#9fa2ad);
                background: -o-linear-gradient(left,#363638,#9fa2ad);
                background: -moz-linear-gradient(left,#363638,#9fa2ad);
                background: -mos-linear-gradient(left,#363638,#9fa2ad);
                background: linear-gradient(left,#363638,#9fa2ad);
                border-color: #9fa2ad;
            width: 101%;
            }



        </style>
    </head>
    <body>
        <!-- Login Content -->
        <div class="pulldown">
            <div class="content content-boxed overflow-hidden">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
                        <div class="push-30-t  animated fadeIn">

                            <!-- Login Form -->
                            <div class="login_box">
                            <form class="js-validation-login form-horizontal push-30-t signin-form" name="signin-form" action="<?php echo url('signin'); ?>" method="post">
                                <div class="form-group">
                                    <label class="col-xs-12" for="login-username"></label>
                                    <div class="col-xs-12">
                                        <input class="form-control" type="text" id="login-username" name="username" placeholder="????????????????????????">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-12" for="login-password"></label>
                                    <div class="col-xs-12">
                                        <input class="form-control" type="password" id="login-password" name="password" placeholder="?????????????????????">
                                    </div>
                                </div>
                                <?php if(!(empty(app('config')->get('captcha_signin')) || ((app('config')->get('captcha_signin') instanceof \think\Collection || app('config')->get('captcha_signin') instanceof \think\Paginator ) && app('config')->get('captcha_signin')->isEmpty()))): ?>
                                <div class="form-group">
                                    <label class="col-xs-12" for="login-password">?????????</label>
                                    <div class="col-xs-7">
                                        <input class="form-control" type="text" name="captcha" placeholder="??????????????????">
                                    </div>
                                    <div class="col-xs-5">
                                        <img src="<?php echo captcha_src(); ?>" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src='<?php echo captcha_src(); ?>?d='+Math.random();" title="????????????" alt="captcha" />
                                    </div>
                                </div>
                                <?php endif; ?>
                                
                                <?php echo hook('signin_captcha'); ?>
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label class="css-input switch switch-sm switch-primary">
                                            <input type="checkbox" id="login-remember-me" name="remember-me"><span></span> 7???????????????????
                                        </label>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="font-s13 text-right push-5-t">
                                            <a href="" style="color: #6b6f73;">?????????????</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group push-30-t">
                                    <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
                                        <button class="btn btn-block btn-primary" type="submit">??? ???</button>
                                    </div>
                                </div>
                            </form>
                            </div>
                            <!-- END Login Form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Login Content -->

        <!-- Login Footer -->
        <div class="pulldown push-30-t text-center animated fadeInUp">
            <small class="text-muted" style="color: #fff;"><span class="js-year-copy"></span> &copy;  <?php echo config('ma.product_version'); ?></small>
        </div>
        <!-- END Login Footer -->

        <!-- OneUI Core JS: jQuery, Bootstrap, slimScroll, scrollLock, Appear, CountTo, Placeholder, Cookie and App.js -->
        <script src="/test/public/static/admin/js/core/jquery.min.js"></script>
        <script src="/test/public/static/admin/js/core/bootstrap.min.js"></script>
        <script src="/test/public/static/admin/js/core/jquery.slimscroll.min.js"></script>
        <script src="/test/public/static/admin/js/core/jquery.scrollLock.min.js"></script>
        <script src="/test/public/static/admin/js/core/jquery.appear.min.js"></script>
        <script src="/test/public/static/admin/js/core/jquery.countTo.min.js"></script>
        <script src="/test/public/static/admin/js/core/jquery.placeholder.min.js"></script>
        <script src="/test/public/static/admin/js/core/js.cookie.min.js"></script>
        <script src="/test/public/static/admin/js/app.js"></script>

        <!-- Page JS Plugins -->
        <script src="/test/public/static/libs/jquery-validation/jquery.validate.min.js"></script>
        <script src="/test/public/static/libs/bootstrap-notify/bootstrap-notify.min.js"></script>
        <script src="/test/public/static/libs/sweetalert/sweetalert.min.js"></script>

        <!-- Page JS Code -->
        <script src="/test/public/static/admin/js/ma.js"></script>
        <?php echo hook('signin_footer'); ?>
        <script>
            $(document).ready(function () {
                $('.signin-form').on('submit', function () {
                    var $data = $(this).serialize();

                    Ma.loading();
                    $.post($(this).attr('action'), $data, function (res) {
                        Ma.loading('hide');
                        if (res.code) {
                            Ma.notify('?????????????????????????????????~', 'success');
                            setTimeout(function () {
                                location.href = res.url;
                            }, 1500);
                        } else {
                            $('#captcha').click();
                            Ma.notify(res.msg, 'danger');
                        }
                    }).fail(function () {
                        Ma.loading('hide');
                        Ma.notify('???????????????~', 'danger');
                    });
                    return false;
                });
            });
        </script>
    </body>
</html>