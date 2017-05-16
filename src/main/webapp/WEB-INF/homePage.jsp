<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,minimum-scale=1">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="../css/base.css"/>

</head>
<body>
	<div class="base-container">
		<div class="left-col">
		<header id="header" class="inner">
		<div class="profilepic"><a href=""></a></div>
		<div class="text-size">
		<h1><a href="#"><%=session.getAttribute("name")%></a></h1>
		<p class="subtitle">个性签名</p>
		<nav id="main-nav">
		<ul>
			<li class="on">
				<a href="#"><span>操作总览</span></a>
			</li>	
			<li>
				<a href="/UploadServlet"><span>导入数据</span></a>
			</li>
			<li>
				<a href="/ShowServlet?action=DE"><span>数据总览</span></a>
			</li>
			<li>
				<a href="#"><span>数据分析</span></a>
			</li>		
			<li>
				<a href="/LogoutServlet"><span>退出系统</span></a>
			</li>
			<li>
				<a href="#"><span>关于</span></a>
			</li>
		</ul>		
		</nav>
		<nav id="sub-nav">
		<div class="social">
		<a class="twitter external" rel="nofollow" href="#" title="Twitter" aria-label="Twitter">Twitter</a>
		<a class="rss" href="#" title="RSS 订阅" aria-label="RSS 订阅">RSS</a>
		<a class="search" href="#" title="站内搜索" aria-label="站内搜索">Search</a>
		</div>
		</nav>
		</div>
		</header>
		</div>
		<!-------------------------------------->
		<div class="mid-col">
			<div class="mid-col-container">
			<div id="content" >
				<article class="post post-list">
				<div class="meta">
					<div class="date">
						<time>Dec 12, 2016</time>
					</div>
					<div class="comment">
						<a href="#">56 Comments</a>
					</div>
				</div>
				<h1 class="title">
					<a href="#">HTTPS 常见部署问题及解决方案</a>
				</h1>
				<div class="entry-content">
					<p>在最近几年里，我写了很多有关 HTTPS 和 HTTP/2 的文章，涵盖了证书申请、Nginx 编译及配置、性能优化等方方面面。在这些文章的评论中，不少读者提出了各种各样的问题，我的邮箱也经常收到类似的邮件。本文用来罗列其中有代表性、且我知道解决方案的问题。[...]</p>
					<p><a class="more-link" href="/post/troubleshooting-https.html">继续阅读 »</a></p>
				</div>
				</article>
			</div>
			</div>
		
		<footer id="footer" class="inner">© 2017 - 版权所有：@kevin_zxf</footer>
	</div>
	</div>
</body>

</html>
