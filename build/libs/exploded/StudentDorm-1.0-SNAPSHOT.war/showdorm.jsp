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
    <style>
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
</head>
<body>
<%
    List<DormBean> list = (List<DormBean>) request.getAttribute("list");
%>
<div id="div_title">
    <p id="title" align="center">欢迎使用学生公寓管理系统</p>
</div>
<div id="div_query">
    <input id="input_query" type="text" placeholder="请输入寝室号" />
    <input id="input_search" type="submit" value="搜索">
</div>
<div id="div_contnet">
    <table id="table_content" align="center" border="1">
        <tr>
            <th>寝室号</th>
            <th>楼号</th>
            <th>层号</th>
            <th>人数</th>
            <th>学生名单</th>
        </tr>
        <%
            if (null != list) {
                for (DormBean dormBean : list) {
        %>      <tr>
                    <td><%=dormBean.getDormNumber()%></td>
                    <td><%=dormBean.getBuildNumber()%></td>
                    <td><%=dormBean.getFloorNumber()%></td>
                    <td><%=dormBean.getPeopleCount()%></td>
                    <td><%=dormBean.getPeopleCount()%></td>
                </tr>
        <%      }
        }%>

    </table>
</div>
</body>
</html>
