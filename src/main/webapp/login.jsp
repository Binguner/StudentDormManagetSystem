<%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-10
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公寓管理系统登录界面</title>
    <style type="text/css">
        #div{
            width:1200px;
            height:550px;
            margin:5px auto;
        }
        #header{
            font-size: 55px;
            color:green;
        }
        #button{
            color:white;
            font-size: 30px;
        }
        table{
            align:center;
            border-collapse:separate;
            border-spacing:0px 10px;
        }
        body{
            background-image:url(TYUT3.jpg);
            background-size:cover;
        }
    </style>
</head>

<!--背景图片-->
<body style="background-image:url(TYUT3.jpg)">

<!--标题-->
<br><br><br><br>
<div align="center" id="header"><b>公寓管理系统登录界面</b>
</div>
<!--登陆输入框-->
<div id="div">

    <br><br><br><br><br>
    <form>
        <table align="center";style="border-collapse:separate;border-spacing:0px 10px;">
            <tr align=center><th style="font-family: KaiTi;font-size: 25px">账号: &nbsp </th><td><input type="text"  style="height:30px" name="account number" value="请输入您的学号" size="35"></td></tr>
            <tr align=center></tr>
            <tr align=center><th style="font-family: KaiTi;font-size: 25px">密码: &nbsp </th><td><input type="text" style="height:30px" name="password" value="请输入您的密码" size="35"></td></tr>
        </table>
        <br>
        <center><input type="submit"  style="height:30px;width:60px" name="submit" value="登陆" > &nbsp &nbsp &nbsp
            <input type="reset" style="height:30px;width:60px" name=“reset” value="重写">
    </form>
</div>
</div>
<!--页尾文本-->
<div align="center" id="button">版权所有 &copy; 太原理工大学</div>
</div>
</body>
</html>
