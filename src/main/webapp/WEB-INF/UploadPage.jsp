<%@ page language="java" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, minimum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>导入数据</title>
<!-- JQUERY -->
<script type="text/javascript" src="js/jquery-3.2.0.min.js" charset="utf-8"></script>
<!-- BOOTSTRAP -->
<link rel="stylesheet" type="text/css" href="../css/default.css">
<link rel="stylesheet" type="text/css" href="../css/fileinput.css" media="all" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css"/>
<script type="text/javascript" src="../js/bootstrap.js" charset="utf-8"></script>
<!-- js -->
<script type="text/javascript" src="../js/fileinput.js" ></script>
<script type="text/javascript" src="../js/fileinput_locale_zh.js" ></script>
<!-- /BOOTSTRAP -->
<link rel="stylesheet" type="text/css" href="css/base.css"/>
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
                        <a href="/ShowServlet"><span>数据总览</span></a>
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
    <!--------------------------------------中部内容-->
    <div class="mid-col">
        <div class="mid-col-container">
            <div id="content" >
                <article class="post post-list">
                    <div class="htmleaf-container">
                        <h2>第一部分：上传学生等级考试信息</h2>
                        <div class="kv-main">
                            <input id="fileUpload1" class="file" type="file" name="fileUpload"  multiple  data-show-preview="true">
                        </div>
                    </div>
                </article>
                <article class="post post-list">
                    <div class="htmleaf-container">
                        <h2>第二部分：上传学生选课成绩信息</h2>
                        <div class="kv-main">
                            <input id="fileUpload2" class="file" type="file" name="fileUpload"  multiple  data-show-preview="true">
                        </div>
                    </div>
                </article>
                <article class="post post-list">
                    <div class="htmleaf-container">
                        <h2>第三部分：上传学生绩点信息</h2>
                        <div class="kv-main">
                            <input id="fileUpload3" class="file" type="file" name="fileUpload"  multiple  data-show-preview="true">
                        </div>
                    </div>
                </article>
                <article class="post post-list">
                    <div class="htmleaf-container">
                        <h2>第四部分：上传学生获奖信息</h2>
                        <div class="kv-main">
                            <input id="fileUpload4" class="file" type="file" name="fileUpload"  multiple  data-show-preview="true">
                        </div>
                    </div>
                </article>
                <article class="post post-list">
                    <div class="htmleaf-container">
                        <h2>第五部分：上传学生就业信息</h2>
                        <div class="kv-main">
                            <input id="fileUpload5" class="file" type="file" name="fileUpload"  multiple  data-show-preview="true">
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <!--------------------------------------结尾部分-->
        <footer id="footer" class="inner">© 2017 - 版权所有：@kevin_zxf</footer>
    </div>
</div>
<script>
    $("#fileUpload1").fileinput({
        language : "zh",//设置语言
        uploadUrl: "/UploadExcelFileServlet?action=degree_exam",//上传地址
        uploadAsync: true,//同步还是异步
        showCaption:false,//是否显示标题
        showUpload: true,//是否显示上传按钮
        browseClass: "btn btn-primary", //按钮样式
        allowedFileExtensions : ['jpg', 'png','gif','xls'],//接收的文件后缀
        allowedFileTypes: ['image', 'video', 'flash','excel'],//接收的文件类型['image', 'html', 'text', 'video', 'audio', 'flash','object']
        maxFileCount: 6,//最大上传文件数限制
        overwriteInitial: false,
        maxFileSize: 10000,
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        previewFileIcon: '<i class="glyphicon glyphicon-file"></i>',
        enctype: 'multipart/form-data',
        /* allowedPreviewTypes: null, */
        previewFileIconSettings: {
            'docx': '<i class="glyphicon glyphicon-file"></i>',
            'xlsx': '<i class="glyphicon glyphicon-file"></i>',
            'pptx': '<i class="glyphicon glyphicon-file"></i>',
            'jpg': '<i class="glyphicon glyphicon-picture"></i>',
            'pdf': '<i class="glyphicon glyphicon-file"></i>',
            'zip': '<i class="glyphicon glyphicon-file"></i>'
        }
        /* ,
         uploadExtraData: function() {
         var extraValue = null;
         var radios = document.getElementsByName('excelType');
         for(var i=0;i<radios.length;i++){
         if(radios[i].checked){
         extraValue = radios[i].value;
         }
         }
         return {"excelType": extraValue};
         } */
        /*     slugCallback: function(filename) {
         console.info(filename);
         return filename.replace('(', '_').replace(']', '_');
         }   */
    });

    $("#fileUpload1").on("fileuploaded", function(event, data, previewId, index) {
        console.info(event);
        console.info(data.response.obj);
        console.info(previewId);
        console.info(index);
    });

    $("#fileUpload2").fileinput({
        language : "zh",//设置语言
        uploadUrl: "/UploadExcelFileServlet?action=course_score",//上传地址
        uploadAsync: true,//同步还是异步
        showCaption:false,//是否显示标题
        showUpload: true,//是否显示上传按钮
        browseClass: "btn btn-primary", //按钮样式
        allowedFileExtensions : ['jpg', 'png','gif','xls'],//接收的文件后缀
        allowedFileTypes: ['image', 'video', 'flash','excel'],//接收的文件类型['image', 'html', 'text', 'video', 'audio', 'flash','object']
        maxFileCount: 6,//最大上传文件数限制
        overwriteInitial: false,
        maxFileSize: 10000,
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        previewFileIcon: '<i class="glyphicon glyphicon-file"></i>',
        enctype: 'multipart/form-data',
        /* allowedPreviewTypes: null, */
        previewFileIconSettings: {
            'docx': '<i class="glyphicon glyphicon-file"></i>',
            'xlsx': '<i class="glyphicon glyphicon-file"></i>',
            'pptx': '<i class="glyphicon glyphicon-file"></i>',
            'jpg': '<i class="glyphicon glyphicon-picture"></i>',
            'pdf': '<i class="glyphicon glyphicon-file"></i>',
            'zip': '<i class="glyphicon glyphicon-file"></i>'
        }
        /* ,
         uploadExtraData: function() {
         var extraValue = null;
         var radios = document.getElementsByName('excelType');
         for(var i=0;i<radios.length;i++){
         if(radios[i].checked){
         extraValue = radios[i].value;
         }
         }
         return {"excelType": extraValue};
         } */
        /*     slugCallback: function(filename) {
         console.info(filename);
         return filename.replace('(', '_').replace(']', '_');
         }   */
    });

    $("#fileUpload2").on("fileuploaded", function(event, data, previewId, index) {
        console.info(event);
        console.info(data.response.obj);
        console.info(previewId);
        console.info(index);
    });

    $("#fileUpload3").fileinput({
        language : "zh",//设置语言
        uploadUrl: "/UploadExcelFileServlet?action=grade_point",//上传地址
        uploadAsync: true,//同步还是异步
        showCaption:false,//是否显示标题
        showUpload: true,//是否显示上传按钮
        browseClass: "btn btn-primary", //按钮样式
        allowedFileExtensions : ['jpg', 'png','gif','xls'],//接收的文件后缀
        allowedFileTypes: ['image', 'video', 'flash','excel'],//接收的文件类型['image', 'html', 'text', 'video', 'audio', 'flash','object']
        maxFileCount: 6,//最大上传文件数限制
        overwriteInitial: false,
        maxFileSize: 10000,
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        previewFileIcon: '<i class="glyphicon glyphicon-file"></i>',
        enctype: 'multipart/form-data',
        /* allowedPreviewTypes: null, */
        previewFileIconSettings: {
            'docx': '<i class="glyphicon glyphicon-file"></i>',
            'xlsx': '<i class="glyphicon glyphicon-file"></i>',
            'pptx': '<i class="glyphicon glyphicon-file"></i>',
            'jpg': '<i class="glyphicon glyphicon-picture"></i>',
            'pdf': '<i class="glyphicon glyphicon-file"></i>',
            'zip': '<i class="glyphicon glyphicon-file"></i>'
        }
        /* ,
         uploadExtraData: function() {
         var extraValue = null;
         var radios = document.getElementsByName('excelType');
         for(var i=0;i<radios.length;i++){
         if(radios[i].checked){
         extraValue = radios[i].value;
         }
         }
         return {"excelType": extraValue};
         } */
        /*     slugCallback: function(filename) {
         console.info(filename);
         return filename.replace('(', '_').replace(']', '_');
         }   */
    });

    $("#fileUpload3").on("fileuploaded", function(event, data, previewId, index) {
        console.info(event);
        console.info(data.response.obj);
        console.info(previewId);
        console.info(index);
    });

    $("#fileUpload4").fileinput({
        language : "zh",//设置语言
        uploadUrl: "/UploadExcelFileServlet?action=award_info",//上传地址
        uploadAsync: true,//同步还是异步
        showCaption:false,//是否显示标题
        showUpload: true,//是否显示上传按钮
        browseClass: "btn btn-primary", //按钮样式
        allowedFileExtensions : ['jpg', 'png','gif','xls'],//接收的文件后缀
        allowedFileTypes: ['image', 'video', 'flash','excel'],//接收的文件类型['image', 'html', 'text', 'video', 'audio', 'flash','object']
        maxFileCount: 6,//最大上传文件数限制
        overwriteInitial: false,
        maxFileSize: 10000,
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        previewFileIcon: '<i class="glyphicon glyphicon-file"></i>',
        enctype: 'multipart/form-data',
        /* allowedPreviewTypes: null, */
        previewFileIconSettings: {
            'docx': '<i class="glyphicon glyphicon-file"></i>',
            'xlsx': '<i class="glyphicon glyphicon-file"></i>',
            'pptx': '<i class="glyphicon glyphicon-file"></i>',
            'jpg': '<i class="glyphicon glyphicon-picture"></i>',
            'pdf': '<i class="glyphicon glyphicon-file"></i>',
            'zip': '<i class="glyphicon glyphicon-file"></i>'
        }
        /* ,
         uploadExtraData: function() {
         var extraValue = null;
         var radios = document.getElementsByName('excelType');
         for(var i=0;i<radios.length;i++){
         if(radios[i].checked){
         extraValue = radios[i].value;
         }
         }
         return {"excelType": extraValue};
         } */
        /*     slugCallback: function(filename) {
         console.info(filename);
         return filename.replace('(', '_').replace(']', '_');
         }   */
    });

    $("#fileUpload4").on("fileuploaded", function(event, data, previewId, index) {
        console.info(event);
        console.info(data.response.obj);
        console.info(previewId);
        console.info(index);
    });

    $("#fileUpload5").fileinput({
        language : "zh",//设置语言
        uploadUrl: "/UploadExcelFileServlet?action=graduation_info",//上传地址
        uploadAsync: true,//同步还是异步
        showCaption:false,//是否显示标题
        showUpload: true,//是否显示上传按钮
        browseClass: "btn btn-primary", //按钮样式
        allowedFileExtensions : ['jpg', 'png','gif','xls'],//接收的文件后缀
        allowedFileTypes: ['image', 'video', 'flash','excel'],//接收的文件类型['image', 'html', 'text', 'video', 'audio', 'flash','object']
        maxFileCount: 6,//最大上传文件数限制
        overwriteInitial: false,
        maxFileSize: 10000,
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        previewFileIcon: '<i class="glyphicon glyphicon-file"></i>',
        enctype: 'multipart/form-data',
        /* allowedPreviewTypes: null, */
        previewFileIconSettings: {
            'docx': '<i class="glyphicon glyphicon-file"></i>',
            'xlsx': '<i class="glyphicon glyphicon-file"></i>',
            'pptx': '<i class="glyphicon glyphicon-file"></i>',
            'jpg': '<i class="glyphicon glyphicon-picture"></i>',
            'pdf': '<i class="glyphicon glyphicon-file"></i>',
            'zip': '<i class="glyphicon glyphicon-file"></i>'
        }
        /* ,
         uploadExtraData: function() {
         var extraValue = null;
         var radios = document.getElementsByName('excelType');
         for(var i=0;i<radios.length;i++){
         if(radios[i].checked){
         extraValue = radios[i].value;
         }
         }
         return {"excelType": extraValue};
         } */
        /*     slugCallback: function(filename) {
         console.info(filename);
         return filename.replace('(', '_').replace(']', '_');
         }   */
    });

    $("#fileUpload5").on("fileuploaded", function(event, data, previewId, index) {
        console.info(event);
        console.info(data.response.obj);
        console.info(previewId);
        console.info(index);
    });
</script>
</body>
</html>