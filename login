<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录|注册</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_945948_gt5kk2bxc2g.css">
    <style>
        main {
            background: linear-gradient(to right top, rgba(38,50,105,0.78), rgba(255,152,0,0.45)), url(imgs/background.jpg) center center no-repeat ;
            background-size: cover;
        }
        header {
            position: absolute;
            top: 10px;
            width: 100%;
        }
        header .login {
            float: right;
            margin-right: 20px;
            font-size: 20px;
        }
        .flip-model {
            display: none;
        }
        .show {
            display: block!important;
        }
        .model {
            position: absolute;
            left: 40%;
            top: 40%;
            transform: translate(-50%.-50%);
            width: 400px;
            padding: 16px;
            background-color: #fff;
            box-shadow: 0 3px 4px 5px rgba(0,0,0,0.2);
        }
        .model .close {
            position: absolute;
            right: 10px;
            top: 10px; 
        }
        .model .tabs {
            text-align: center;
        }
        .model .tabs a {
            display: inline-block;
            font-size: 16px;
            margin: 0 10px;
            color: #666;
        }
        .model .tabs a.active {
            border-bottom: 2px solid #444;
            color: #444;
        }
        .model .content {
            padding: 20px 40px;
        }
        .model .errormsg {
            color: #ff9800;
            font-size: 12px;
        }
        .model .content .input-field {
            position: relative;
            margin-top: 10px;
        }
        .model .content .input-field .iconfont {
            position: absolute;
            left: 13px;
            top: 13px;
        }
        .model .content input[type=text],
        .model .content input[type=password] {
            width: 100%;
            padding: 10px 10px 10px 28px;
            outline: none;
        }
        .model .content input[type=submit] {
            padding: 6px 10px;
            border: none;
            background: #fff;
            box-shadow: 0px 0px 2px rgba(0,0,0,0.4);
            outline: none;
        }
        .flip-model.login .model-login,
        .flip-model.register .model-register {
            transform: translate(-50%,-50%) rotateY(0deg);
            backface-visibility: hidden;
            transition: all 1s;
        }
        .flip-model.login .model-register,
        .flip-model.register .model-login {
            transform: translate(-50%,-50%) rotateY(180deg);
            backface-visibility: hidden;
            transition: all 1s;
        }
    </style>
</head>
<body>
    <header>
        <a href="#" class="login">
            <i class="iconfont icon-user"></i>
        </a>
    </header>
    <main>
        <div class="flip-model">
            <div class="model model-login">
                <a href="#" class="close">
                    <i class="iconfont icon-close"></i>
                </a>
                <div class="tabs">
                    <a href="#" class="login active">登录</a>
                    <a href="#" class="register">注册</a>
                </div>
                <div class="content">
                    <div class="errormsg"></div>
                    <form action="/login" method="post">
                        <div class="input-field">
                            <i class="iconfont icon-username"></i>
                            <input type="text" name="username" placeholder="用户名">
                        </div>
                        <div class="input-field">
                            <i class="iconfont icon-Password"></i>
                            <input type="password" name="password" placeholder="密码">
                        </div>
                        <div class="input-field">
                            <input type="submit"  placeholder="登录">
                        </div>
                    </form>
                </div>
            </div>
            <div class="model model-register">
                <a href="#" class="close"></a>
                <div class="tabs">
                    <a href="#" class="login">登录</a>
                    <a href="#" class="register active">注册</a>
                </div>
                <div class="content">
                    <div class="errormsg"></div>
                    <form action="/register" method="post">
                        <div class="input-field">
                            <i class="iconfont icon-username"></i>
                            <input type="text" name="username" placeholder="输入用户名">
                        </div>
                        <div class="input-field">
                            <i class="iconfont icon-Password"></i>
                            <input type="password" name="password" placeholder="输入密码">
                        </div>
                        <div class="input-field">
                            <i class="iconfont icon-Password"></i>
                            <input type="password" name="password" placeholder="再次输入密码">
                        </div>
                        <div class="input-field">
                            <input type="submit"  placeholder="注册">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <script>

        function $(selector){
            return document.querySelector(selector)
        }
        function $$(selector){
            return document.querySelector(selector)
        }

        $('header .login').click = function(e){
            console.log(1211)
            e.stopPropagation()
            $('.flip-model').style.display = 'block'
        }

        $('.flip-model').addEventListener('click', function(e){
            e.stopPropagation()
            if(e.target.classList.contains('login')){
                $('.flip-model').classList.remove('register')
                $('.flip-model').classList.add('login')
            }
            if(e.target.classList.contains('register')){
                $('.flip-model').classList.add('register')
                $('.flip-model').classList.remove('login')
            }
            console.log(e.target)
            console.log(this)
            window.target = e.target
            if(e.target.classList.contains('close')){
                $('.flip-model').style.display = 'none'
            }
        })
        $('.model-login form').addEventListener('sumbit', function(e)){
            e.preventDefault()
            if(!/^w(3,8)$/.test($('.model-login input[name=username]').value)){
                $('.model-login .errormsg').innerText = '用户名需输入3-8个字符,包括字母数字下划线'
            }
            if(!/^w(6,12)$/.test($('.model-login input[name=password]').value)){
                $('.model-login .errormsg').innerText = '密码需输入6-12个字符,包括字母数字下划线'
            }
            this.submit()
        }
        $('.model-register form').addEventListener('sumbit', function(e)){
            e.preventDefault()
            if(!/^w(3,8)$/.test($('.model-register input[name=username]').value)){
                $('.model-register .errormsg').innerText = '用户名需输入3-8个字符,包括字母数字下划线'
            }
            if(!/^ljj$|^chitoge$/.test($('.model-register input[name=username]').value)){
                $('.model-register .errormsg').innerText = '用户名已存在'
            }
            if(!/^w(6,12)$/.test($('.model-register input[name=password]').value)){
                $('.model-register .errormsg').innerText = '密码需输入6-12个字符,包括字母数字下划线'
            }
            if($('.model-register input[name=password]').value !== $('.model-register input[name=password2]').value){
                $('.model-register .errormsg').innerText = '两次输入的密码不一致'
                return false
            }
            this submit()
        }
    </script>
</body>
</html>
