<%--
  Created by IntelliJ IDEA.
  User: zheng1718
  Date: 17-5-15
  Time: 下午11:35
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: zheng1718
  Date: 17-5-15
  Time: 下午8:47
  To change this template use File | Settings | File Templates.
--%>
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
            <nav class="navbar navbar-default " id="nav-layout" role="navigation">
                <div class="navbar-header pagination-lg ">
                    　 <a href="#" class="navbar-brand">数据总览</a>
                </div>
                <ul class="nav navbar-nav pagination-lg">
                    <li><a href="/ShowServlet?action=DE">等级考试表</a></li>
                    <li class="active"><a href="/ShowServlet?action=CS">选课成绩表</a></li>
                    <li><a href="/ShowServlet?action=GP">绩点信息表</a></li>
                    <li><a href="/ShowServlet?action=AI">获奖信息表</a></li>
                    <li><a href="/ShowServlet?action=GI">就业信息表</a></li>
                </ul>
            </nav>
            <div id="content" >
                <article class="post post-list">
                    <h2>选课成绩表</h2>
                    <div class="tableDemo">
                        <table id="example" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th></th>
                                <th>学院</th>
                                <th>课程</th>
                                <th>学分</th>
                                <th>学时</th>
                                <th>班级</th>
                                <th>学号</th>
                                <th>性别</th>
                                <th>成绩</th>
                                <th>课程性质</th>
                                <th>考试性质</th>
                                <th>实际学期</th>
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
                                        <input type="text" class="form-control" id="college" placeholder="学院">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="course" placeholder="课程">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="credit" placeholder="学分">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="hours" placeholder="学时">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="classes" placeholder="班级">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="sid" placeholder="学号">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="gender" placeholder="性别">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="score" placeholder="成绩">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="course_nature" placeholder="课程性质">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="test_nature" placeholder="考试性质">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="learn_term" placeholder="实际学期">
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
                url: "/ShowCSServlet?action=list"
            },
            "order": [[1, 'asc']],// dt默认是第一列升序排列 这里第一列为序号列，所以设置为不排序，并把默认的排序列设置到后面
            "serverSide": true,
            "columns": [
                {"data": null}, //因为要加行号，所以要多一列，不然会把第一列覆盖
                {"data": "college"},
                {"data": "course"},
                {"data": "credit"},
                {"data": "hours"},
                {"data": "classes"},
                {"data": "sid"},
                {"data": "gender"},
                {"data": "score"},
                {"data": "course_nature"},
                {"data": "test_nature"},
                {"data": "learn_term"},
                {"data": null}
            ],
            "columnDefs": [
                {
                    "searchable": false,
                    "orderable": false,
                    "targets": [0.-1]
                },
                {
                    "targets": 12,
                    "render": function (a, b, c, d) {
                        var context =
                            {
                                func: [
                                    {"name": "修改", "fn": "edit(\'" + c.college + "\',\'" + c.course + "\',\'" + c.credit + "\',\'" + c.hours + "\',\'" + c.classes + "\',\'" + c.sid + "\',\'" + c.gender+ "\',\'" + c.score+ "\',\'" + c.course_nature+ "\',\'" + c.test_nature+ "\',\'" + c.learn_term + "\')", "type": "primary"},
                                    {"name": "删除", "fn": "del(\'" + c.sid + "\')", "type": "danger"}
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
        $("#college").val("法学院");
        $("#course").val("《红楼梦》经典解读Ⅰ");
        $("#credit").val("2");
        $("#hours").val("32");
        $("#classes").val("计算机2012延长班");
        $("#sid").val("201109300619");
        $("#gender").val("女");
        $("#score").val("89");
        $("#course_nature").val("公选课");
        $("#test_nature").val("普通考试");
        $("#learn_term").val("2012/2013(2)");

    }

    /**
     * 清除
     */
    function clear() {
        $("#college").val("").attr("disabled",false);
        $("#course").val("");
        $("#credit").val("");
        $("#hours").val("");
        $("#classes").val("");
        $("#sid").val("").attr("disabled",false);
        $("#gender").val("");
        $("#score").val("");
        $("#course_nature").val("");
        $("#test_nature").val("");
        $("#learn_term").val("");
        editFlag = false;
    }

    /**
     * 添加数据
     **/
    function add() {
        var addJson = {
            "college": $("#college").val(),
            "course": $("#course").val(),
            "credit": $("#credit").val(),
            "hours": $("#hours").val(),
            "classes": $("#classes").val(),
            "sid": $("#sid").val(),
            "gender": $("#gender").val(),
            "score": $("#score").val(),
            "course_nature": $("#course_nature").val(),
            "test_nature": $("#test_nature").val(),
            "learn_term": $("#learn_term").val(),
        };
        ajax(addJson);
    }

    /**
     *编辑方法
     **/
    function edit(college,course,credit,hours,classes,sid,gender,score,course_nature, test_nature, learn_term ) {
        console.log(sid);
        editFlag = true;
        $("#myModalLabel").text("修改");
        $("#sid").val(sid).attr("disabled",true);
        $("#college").val(college);
        $("#course").val(course);
        $("#credit").val(credit);
        $("#hours").val(hours);
        $("#classes").val(classes);
        $("#gender").val(gender);
        $("#score").val(score);
        $("#course_nature").val(course_nature);
        $("#test_nature").val(test_nature);
        $("#learn_term").val(learn_term);
        $("#myModal").modal("show");
    }

    function ajax(obj) {
        var url ="/ShowCSServlet?action=add" ;
        if(editFlag){
            url = "/ShowCSServlet?action=edit";
        }
        $.ajax({
            url:url ,
            data: {
                "college": obj.college,
                "course": obj.course,
                "credit": obj.credit,
                "hours": obj.hours,
                "classes": obj.classes,
                "sid": obj.sid,
                "gender": obj.gender,
                "score": obj.score,
                "course_nature": obj.course_nature,
                "test_nature": obj.test_nature,
                "learn_term": obj.learn_term
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
            url: "/ShowCSServlet?action=del",
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

