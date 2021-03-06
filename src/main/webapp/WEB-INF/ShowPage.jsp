<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>数据总览</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/dataTables.bootstrap.css  "/>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
    <script type="text/javascript" language="javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="../js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="../js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" language="javascript" src="../js/bootstrap.min.js"></script>
    <!--script type="text/javascript" language="javascript" src="../js/bootstrap-datetimepicker.min.js"></script-->
    <script type="text/javascript" language="javascript" src="../js/handlebars-v3.0.1.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/base.css"/>
    <style>
        #nav-layout {
            margin-top: 4px;
            margin-bottom: -10px;
        }
        #nav-layout li {
            margin-right: 5px;
        }
    </style>
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
    <!-------------------------------------->
    <div class="mid-col">
        <div class="mid-col-container">
            <nav class="navbar navbar-default " id="nav-layout" role="navigation">
                <div class="navbar-header pagination-lg ">
                    　 <a href="#" class="navbar-brand">数据总览</a>
                </div>
                <ul class="nav navbar-nav pagination-lg">
                    <li class="active"><a href="#">等级考试表</a></li>
                    <li><a href="#">选课成绩表</a></li>
                    <li><a href="#">绩点信息表</a></li>
                    <li><a href="#">获奖信息表</a></li>
                    <li><a href="#">就业信息表</a></li>
                </ul>
            </nav>
            <div id="content" >
                <article class="post post-list">
                    <h2>等级考试表</h2>
                    <div class="tableDemo">
                        <table id="example" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th></th>
                                <th>学号</th>
                                <th>学院</th>
                                <th>班级</th>
                                <th>年级</th>
                                <th>考试名称</th>
                                <th>成绩</th>
                                <th>性别</th>
                                <th>专业</th>
                                <th>是否通过</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <!-- Button trigger modal -->


                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">新增</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="sid" placeholder="学号">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="college" placeholder="学院">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="classes" placeholder="班级">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="grade" placeholder="年级">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="examName" placeholder="考试名称">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="Score" placeholder="成绩">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="gender" placeholder="性别">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="major" placeholder="专业">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="pass" placeholder="是否通过">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info" id="initData">添加模拟数据</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="button" class="btn btn-primary" id="save">保存</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <footer id="footer" class="inner">© 2017 - 版权所有：@kevin_zxf</footer>
    </div>
</div>
</body>
</html>
<!--定义操作列按钮模板-->
<!--说下这里使用模板的作用，除了显示和数据分离好维护以外，绑定事件和传值也比较方便，希望大家能不拼接html则不拼接-->
<script id="tpl" type="text/x-handlebars-template">
    {{#each func}}
    <button type="button" class="btn btn-{{this.type}} btn-sm" onclick="{{this.fn}}">{{this.name}}</button>
    {{/each}}
</script>
<script>
    var table;
    var editFlag = false;
    $(function () {

        //$('#start_date').datetimepicker();

        var tpl = $("#tpl").html();
        //预编译模板
        var template = Handlebars.compile(tpl);

        table = $('#example').DataTable({
            ajax: {
                url: "/ShowListServlet"
            },
            "order": [[1, 'asc']],// dt默认是第一列升序排列 这里第一列为序号列，所以设置为不排序，并把默认的排序列设置到后面
            "serverSide": true,
            "columns": [
                {"data": null}, //因为要加行号，所以要多一列，不然会把第一列覆盖
                {"data": "SId"},
                {"data": "College"},
                {"data": "Classes"},
                {"data": "Grade"},
                {"data": "ExamName"},
                {"data": "Score"},
                {"data": "Gender"},
                {"data": "Major"},
                {"data": "Pass"},
                {"data": null}
            ],
            "columnDefs": [
                {
                    "searchable": false,
                    "orderable": false,
                    "targets": [0.-1]
                },
                {
                    "targets": 10,
                    "render": function (a, b, c, d) {
                        var context =
                            {
                                func: [
                                    {"name": "修改", "fn": "edit(\'" + c.SId + "\',\'" + c.College + "\',\'" + c.Classes + "\',\'" + c.Grade + "\',\'" + c.ExamName + "\',\'" + c.Score + "\',\'" + c.Gender+ "\',\'" + c.Major+ "\',\'" + c.Pass + "\')", "type": "primary"},
                                    {"name": "删除", "fn": "del(\'" + c.SId + "\')", "type": "danger"}
                                ]
                            };
                        var html = template(context);
                        return html;
                    }
                }

            ],
            "language": {
                "lengthMenu": "每页_MENU_ 条记录",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty": "无记录",
                "search": "搜索：",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "paginate": {
                    "previous": "上一页",
                    "next": "下一页"
                }
            },
            "dom": "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>" +
            "t" +
            "<'row'<'col-xs-6'i><'col-xs-6'p>>",
            "initComplete": function () {
                //$("#mytool").append('<button id="datainit" type="button" class="btn btn-primary btn-sm">增加基础数据</button>&nbsp');
                $("#mytool").append('<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">添加数据</button>');
                /*$("#datainit").on("click", initData);*/
            }
        });

        //添加序号
        //不管是排序，还是分页，还是搜索最后都会重画，这里监听draw事件即可
        table.on('draw.dt',function() {
            table.column(0, {
                search: 'applied',
                order: 'applied'
            }).nodes().each(function(cell, i) {
                //i 从0开始，所以这里先加1
                i = i+1;
                //服务器模式下获取分页信息
                var page = table.page.info();
                //当前第几页，从0开始
                var pageno = page.page;
                //每页数据
                var length = page.length;
                //行号等于 页数*每页数据长度+行号
                var columnIndex = (i+pageno*length);
                cell.innerHTML = columnIndex;
            });
        }).draw();

        $("#save").click(add);

        $("#initData").click(initSingleData);

    });

    /**
     * 初始化基础数据
     */
    /*function initData() {
        var flag = confirm("本功能将添加数据到数据库，你确定要添加么？");
        if (flag) {
            $.get("/objects.txt", function (data) {
                var jsondata = JSON.parse(data);
                $(jsondata.data).each(function (index, obj) {
                    ajax(obj);
                });
            });
        }
    }*/

    /**
     * 初始化基础数据
     */
    function initSingleData() {
        $("#sid").val("201109300619");
        $("#college").val("计算机科学与技术学院");
        $("#classes").val("软件工程1206");
        $("#grade").val("2012");
        $("#examName").val("CET-4");
        $("#Score").val("574");
        $("#gender").val("女");
        $("#major").val("软件工程");
        $("#pass").val("通过");
    }

    /**
     * 清除
     */
    function clear() {
        $("#sid").val("").attr("disabled",false);
        $("#college").val("");
        $("#classes").val("");
        $("#grade").val("");
        $("#examName").val("");
        $("#Score").val("");
        $("#gender").val("");
        $("#major").val("");
        $("#pass").val("");
        editFlag = false;
    }

    /**
     * 添加数据
     **/
    function add() {
        var addJson = {
            "SId": $("#sid").val(),
            "College": $("#college").val(),
            "Classes": $("#classes").val(),
            "Grade": $("#grade").val(),
            "ExamName": $("#examName").val(),
            "Score": $("#Score").val(),
            "Gender": $("#gender").val(),
            "Major": $("#major").val(),
            "Pass": $("#pass").val(),
        };

        ajax(addJson);
    }

    /**
     *编辑方法
     **/
    function edit(sid,college,classes,grade,examName,Score,gender,major,pass) {
        console.log(sid);
        editFlag = true;
        $("#myModalLabel").text("修改");
        $("#sid").val(sid).attr("disabled",true);
        $("#college").val(college);
        $("#classes").val(classes);
        $("#grade").val(grade);
        $("#examName").val(examName);
        $("#Score").val(Score);
        $("#gender").val(gender);
        $("#major").val(major);
        $("#pass").val(pass);
        $("#myModal").modal("show");
    }

    function ajax(obj) {
        var url ="/ShowAddServlet" ;
        if(editFlag){
            url = "/ShowEditServlet";
        }
        $.ajax({
            url:url ,
            data: {
                "sid": obj.SId,
                "college": obj.College,
                "classes": obj.Classes,
                "grade": obj.Grade,
                "examName": obj.ExamName,
                "Score": obj.Score,
                "gender": obj.Gender,
                "major": obj.Major,
                "pass": obj.Pass
            }, success: function (data) {
                table.ajax.reload();
                $("#myModal").modal("hide");
                $("#myModalLabel").text("新增");
                clear();
                console.log("结果" + data);
            }
        });
    }


    /**
     * 删除数据
     * @param name
     */
    function del(name) {
        $.ajax({
            url: "/ShowDelServlet",
            data: {
                "name": name
            }, success: function (data) {
                table.ajax.reload();
                console.log("删除成功" + data);
                console.log(name);
            }
        });
    }
</script>
