<%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-14
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>寝室分配</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script src="layui/layui.js"></script>
    <script type="text/javascript" language="JavaScript">

        function clearData(){
            $("#table_list tbody").html("");
        }

        function edit(stuId){
            console.log('edit!' + stuId);
             layui.use('layer', function(){
                 var layer = layui.layer;
                 layer.open({
                     type: 2,
                     area: ['80%','450px'],
                     title: '我是标题',
                     shadeClose: true,
                     offset:[
                         30,
                         20
                     ],
                     content: ['index.jsp', 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                 })
             });


        }

        $(document).ready(function () {
            $("#auto_dim").click(function () {
               $.ajax({
                   type: "POST",
                   url: "/handledorm",
                   dataType: "text",
                   data: "type=0",
                   success: function () {
                       console.log("ok~");
                       layui.use('layer', function(){
                           var layer = layui.layer;
                           layer.open({
                               title: '分配结果',
                               content: '分配成功!'
                           })
                       });
                   },
                   error: function () {
                       layui.use('layer', function(){
                           var layer = layui.layer;
                           layer.open({
                               title: '分配结果',
                               content: '分配失败!'
                           })
                       });
                   }
               })
            });
            $("#search_list").click(function () {
                $.ajax({
                    type: "POST",
                    dataType: "JSON",
                    url: "/handledorm",
                    data: "type=1",
                    success: function (resdata) {
                        var html="";
                        $.each(resdata,function (index,data) {
                            //console.log(index + " " + data['buildNumber'] + " " + data['studentName'])
                            $("#table_list").append("<tr>\n" +
                                "            <td>"+data['studentID']+"</td>\n" +
                                "            <td>"+data['studentName']+"</td>\n" +
                                "            <td>"+data['sex']+"</td>\n" +
                                "            <td>"+data['majorName']+"</td>\n" +
                                "            <td>"+data['classNum']+"</td>\n" +
                                "            <td>"+data['buildNumber']+"</td>\n" +
                                "            <td>"+data['dormNumber']+"</td>\n" +
                                "            <td><button onclick='edit("+data['id']+")' class=\"layui-btn\">\n" +
                                "        <i class=\"layui-icon\">&#xe642;</i>编辑" +
                                "    </button></td>\n" +
                                "        </tr>");
                        });

                    },
                    error: function () {
                        
                    }
                })
            })
        })
    </script>
</head>
<body>
<div  align="center" id="div_title" style="margin-top: 100px">
    <h1>宿舍分配</h1>
</div>
<br>
<br>
<br>
<div id="div_btn">
    <div class="layui-row" align="center">
        <div class="layui-col-md3">
            <button id="auto_dim" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal">自动分配</button>
        </div>
        <div class="layui-col-md3">
            <button class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal">手动分配</button>
        </div>
        <div class="layui-col-md3">
            <button id="search_list" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal">查看数据</button>
        </div>
        <div class="layui-col-md3">
            <button onclick="clearData()" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal">清空列表</button>
        </div>
    </div>
</div>
<table style="margin-left: 40px; margin-right: 40px" id="table_list" class="layui-table">
    <colgroup>
        <col>
        <col>
        <col>
        <col>
        <col>
        <col>
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>专业</th>
        <th>班级</th>
        <th>楼号</th>
        <th>宿舍号码</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>

</body>
</html>
