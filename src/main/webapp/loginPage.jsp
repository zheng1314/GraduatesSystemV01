<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统登录界面</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
    <script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<style type="text/css">
		body {
			background-image:url("image/BG.jpg");
			background-size:cover;
			height: 100%;
			background-color:#c4b7c0;
			font-family:sans-serif;
		}
		.heading{
			margin:20px;
			padding: 20px;
		}
		.heading h2 {
			text-align:center;
			font-size: 3em;
		}
		.container{
			background-color: #fff;
			width:400px;
			height:280px;
			margin:10px auto;
			padding:5px;
			border-style:solid;
			border-width:1px;
			border-radius:20px;
			box-shadow: 10px 10px 5px #4d80a5;
		}
        .row {
            margin: 0 auto;
            padding: 0 1em;
        }
        .sub-row {
            margin: 0 auto;
            padding: 0 1.5em;
        }
		.top {
			text-align:center;
			display: block;
    			font-size: 30px;
    			font-weight: 700;
    			padding: 10px 0 20px 0;
    			border-bottom: 3px solid #f0f0f0;
    			margin-bottom: 20px;
		}
		.main-checkbox{
    			float: left;
    			width: 20px;
    			height: 20px;
    			background: #11a3fc;
    			border-radius: 50%;
    			position: relative;
    			margin: 5px 0 0 5px;
    			border: 1px solid #11a3fc;
		}
		.main-checkbox label{
    			width: 20px;
    			height: 20px;
    			position: absolute;
    			top: 0;
    			left: 0;
    			cursor: pointer;
		}
.main-checkbox label:after{
    content: "";
    width: 10px;
    height: 5px;
    position: absolute;
    top: 5px;
    left: 4px;
    border: 3px solid #fff;
    border-top: none;
    border-right: none;
    background: transparent;
    opacity: 0;
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg);
}
.main-checkbox input[type=checkbox]{
    visibility: hidden;
}
.main-checkbox input[type=checkbox]:checked + label:after{
    opacity: 1;
}
.text{
    float: left;
    margin-left: 7px;
    line-height: 20px;
    padding-top: 5px;
    text-transform: capitalize;
}
.btn{
	margin-left:4px;
    float: right;
    font-size: 14px;
    color: #fff;
    background: #00b4ef;
    border-radius: 30px;
    padding: 10px 25px;
    border: none;
    text-transform: capitalize;
    transition: all 0.5s ease 0s;
}
.btn a {
    color: #fff;
}
#footer {
	font-size: 0.9em;
	line-height: 2.2;
	padding: 15px 70px 15px 40px;
	text-align: center;
	width: auto;
}
	</style>
</head>
<body>
<div class="heading">
	<h2>高校毕业生就业分析系统</h2>
</div>
<div class="container">
    <div class="row">
        <div class="sub-row">
            <form class="form-horizontal" action="LoginServlet" method="post">
                <span class="top">用户登录</span>
                <div class="form-group">
                    <input type="email" name="username" class="form-control" id="inputEmail3" placeholder="用户名或电子邮件" required="required">
                </div>
                <div class="form-group help">
                    <input type="password" name="userpwd" class="form-control" id="inputPassword3" placeholder="密　码" required="required">
                </div>
                <div class="form-group">
                    <div class="main-checkbox">
                        <input type="checkbox" value="None" id="checkbox1" name="check"/>
                        <label for="checkbox1"></label>
                    </div>
                    <span class="text">Remember me</span>

                    <button type="register" class="btn btn-default"><a href="registerPage.jsp">注册</a></button>
                    <button type="submit" class="btn btn-default">登录</button>

                </div>
            </form>
        </div>
    </div>
</div>
<footer id="footer" class="inner">© 2017 - 版权所有：@kevin_zxf</footer>
</body>
</html>
