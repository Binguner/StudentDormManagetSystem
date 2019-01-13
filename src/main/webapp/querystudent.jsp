<%@ page import="Bean.StudentBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-11
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询学生信息</title>
    <style type="text/css">
        #div_title{
            height: 150px;
        }
        #title{
            font-size: 30px;
            position: relative;
            top: 50%;
        }
        #div_query{
            text-align: center;
        }
        #input_query{
            width: 200px;
            height: 50px;
        }
        #input_search{
            background-color: aliceblue;
            height: 50px;
        }
        #div_contnet{
            position: relative;
            text-align: center;
            top: 50px;
        }
        #table_content{
            width: 600px;
        }

    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script type="text/javascript" language="JavaScript">



        $(document).ready(function () {
            $("#input_search").click(function () {
                    var studentID = document.getElementById("input_query").value;
                $.ajax({
                    type: "POST",
                    url: "/getStudentInfo",
                    dataType: "json",
                    data: "studentID="+studentID,
                    success: function (jsonStr) {
                        var alertStr = "";
                        $.each(jsonStr,function (index,content) {
                            console.log(index +" : " + content);
                            alertStr = alertStr+ index + " : " + content + "\n";
                        });
                        alert(alertStr)
                    },
                    error: function () {
                        alert("查询失败，请重试！");
                    }
                });
            });

        });

    </script>
</head>
<body>
<div id="div_title">
    <p id="title" align="center">欢迎使用学生公寓管理系统</p>
</div>
<%
    List<StudentBean> list = (List<StudentBean>) request.getAttribute("list");
%>
<div id="div_query">
    <input id="input_query" type="text" placeholder="请输入学生学号" />
    <input id="input_search" type="submit" value="搜索">
</div>
<div id="div_contnet">
    <table id="table_content" align="center" border="1">
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>系别</th>
            <th>年级</th>
            <th>班级</th>
            <th>楼号</th>
            <th>寝室号</th>
        </tr>
        <%
            if (null != list) {
                for (StudentBean studentBean : list) {
                  %><tr>
                        <td><%=studentBean.getStudentID()%></td>
                        <td><%=studentBean.getStudentName()%></td>
                        <td><%=studentBean.getSex()%></td>
                        <td><%=studentBean.getMajorName()%></td>
                        <td><%=studentBean.getGrade()%></td>
                        <td><%=studentBean.getClassNum()%></td>
                        <td><%=studentBean.getBuildNumber()%></td>
                        <td><%=studentBean.getDormNumber()%></td>
                    </tr>
        <%      }
           }%>

    </table>
</div>


</body>
</html>
