<%@ page import="java.util.List" %>
<%@ page import="Bean.DormBean" %><%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-12
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公寓信息</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script src="layui/layui.js"></script>
    <script>


        $(document).ready(function () {

            $("#build_numebr").click(function () {
               $("#table_content tbody").html("");
               $("#table_content").hide();
               $("#table_content_show_name tbody").html("");
               $("#table_content_show_name").hide();
            }),

            $("#input_search").click(function () {
                $("#table_content tbody").html("")
                $("#table_content_show_name tbody").html("")
                var buildNumber = document.getElementById("build_numebr").value;
                var dormNumber = document.getElementById("input_query").value;
                if (dormNumber.trim() != ""){
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "/handledorm",
                        data: "type="+4+"&buildNumber="+buildNumber+"&dormNumber="+dormNumber,
                        success: function (resJson) {
                            $("#table_content").hide();
                            $("#table_content_show_name").show();
                            $.each(resJson,function (index,context) {
                                //console.log(index + " : " + context['studentName']);
                                $("#table_content_show_name").append("<tr><td>"+context['dormNumber']+"</td>\n" +
                                    "        <td>"+context['buildNumber']+"</td>\n" +
                                    "        <td>"+context['studentID']+"</td>\n" +
                                    "        <td>"+context['classNum']+"</td>\n" +
                                    "        <td>"+context['studentName']+"</td></tr>")
                            })
                        },
                        error: function () {

                        }
                    })
                }
                if(dormNumber.trim() == ""){
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "/handledorm",
                        data: "type="+3+"&buildNumber="+buildNumber,
                        success: function (resjson) {
                            $("#table_content_show_name").hide();
                            $("#table_content").show();
                            $.each(resjson,function (index,context) {
                                console.log(index+" : "+context['dormNumber'])
                                $("#table_content").append("<tr><td>"+context['dormNumber']+"</td>\n" +
                                    "            <td>"+context['buildNumber']+"</td>\n" +
                                    "            <td>"+context['floorNumber']+"</td>\n" +
                                    "            <td>"+context['peopleCount']+"</td></tr>");

                            })
                        },
                        error: function () {

                        }
                    })
                }

            })
        })
    </script>
    <style>

    </style>
</head>
<body>
<%
    //List<DormBean> list = (List<DormBean>) request.getAttribute("list");
%>
<br>
<br>
<br>
<br>
<br>
<br>
<div id="div_title" style="margin-top: 50px;">
    <h1 id="title" align="center">寝室信息查询</h1>
</div>
<br>
<br>
<div id="div_query" align="center" >

    <select style="width: 80px;" class="layui-btn layui-bg-gray" id="build_numebr" name="build_numebr">
        <option value="1">1 号楼</option>
        <option value="2">2 号楼</option>
        <option value="3">3 号楼</option>
        <option value="4">4 号楼</option>
        <option value="5">5 号楼</option>
        <option value="6">6 号楼</option>
        <option value="7">7 号楼</option>
        <option value="8">8 号楼</option>
        <option value="9">9 号楼</option>
    </select>

    <div class="layui-input-inline">
        <input id="input_query" style="width: 300px" type="text" name="input_query" required lay-verify="required" placeholder="请输入寝室号" autocomplete="off" class="layui-input">
    </div>
    <button id="input_search" class="layui-btn">
        <i class="layui-icon">&#xe608;</i> 查询
    </button>
</div>
<br>
<br>
<br>
<div id="div_contnet" align="center">


    <table hidden style="width: 700px" id="table_content" class="layui-table">
        <colgroup>
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>寝室号</th>
            <th>楼号</th>
            <th>学号</th>
            <th>人数</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>


    <table hidden style="width: 700px" id="table_content_show_name" class="layui-table">
        <colgroup>
            <col>
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>寝室号</th>
            <th>楼号</th>
            <th>学号</th>
            <th>班级</th>
            <th>学生名单</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>

</div>
</body>
</html>
