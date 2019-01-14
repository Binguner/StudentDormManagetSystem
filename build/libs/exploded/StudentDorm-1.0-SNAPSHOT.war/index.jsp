<%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-08
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>公寓管理系统主界面</title>
    <style type="text/css">
      body{
        background-image:url(pictures/index_bg.jpg);
        background-size:cover;
      }
      #header{
        height:150px;
        font-family:"楷体";
        font-size: 50px;
        color:#9F5000;
      }
      #div{
        width:1200px;
        height:500px;
        margin:5px auto;
      }
      #button{
        color:	white;
        font-size:20px;
      }
      table{
        align:center;
        border-collapse:separate;
        border-spacing:0px 10px;
      }
    </style>
    <script language="JavaScript" type="text/javascript">
      function addStudentPage(){
        window.location.href = "/addStudent";
      }
    </script>
  </head>

  <body style="background-image:url(pictures/index_bg.jpg)">
  <br>
  <div align="center" id="header">
    <br>
    <b>欢迎使用学生公寓管理系统</b>
  </div>
  <div id="div">
    <form>
      <table align="center";style="border-collapse:separate;border-spacing:0px 10px;">
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr>
          <td>
            <a href="/addStudent">
              <input type="button" style="height:35px; width:120px;" value="录入学生信息">
            </a>
          </td>
          <td width="100"></td>
          <td>
            <a href="dorm">
              <input type="button" style="height:35px; width:120px;" value="寝室分配功能">
            </a>
          </td>
        </tr>
        <tr></tr>
        <tr>
          <td>
            <a href="/searchstudent">
              <input type="button" style="height:35px; width:120px;" value="查询学生信息">
            </a>
          </td>
          <td></td>
          <td>
            <a href="/querydorm">
              <input type="button" style="height:35px; width:120px;" value="查询寝室信息">
            </a>
          </td>
        </tr>
        <tr></tr>
        <tr>
          <td>
            <a href="/property">
              <input type="button" style="height:35px; width:120px;" value="查询财产信息">
            </a>
          </td>
          <td></td>
          <td>
            <a href="/addvisitor">
              <input type="button" style="height:35px; width:120px;" value="外来人员登记">
            </a>
          </td>
        </tr>
        <tr></tr>
        <tr>
          <td>
            <a href="/goods">
              <input type="button" style="height:35px; width:120px;" value="货物搬出登记">
            </a>
          </td>
          <td></td>
          <td>
            <%--<a href="javascript:window.opener=null;window.open('','_self');window.close();">--%>
            <a href="/logout" methods="get">
              <input type="button" style="height:35px; width:120px;" value="退出管理系统"/>
            </a>
          </td>
        </tr>
      </table>
    </form>
  </div>
  <div align="center" id="button">版权所有@太原理工大学公寓管理中心</div>
  </body>
</html>