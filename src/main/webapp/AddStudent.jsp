<%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-11
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公寓管理系统主界面</title>
    <style type="text/css">
        body{
            background-image:url(TYUT1.jpg);
            background-size:cover;
        }
        #header{
            height:100px;
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
            height:50px;
            color:	white;
            font-size:20px;
        }
        table{
            align:center;
            border-collapse:separate;
            border-spacing:0px 0px;
            filter:alpha(Opacity=70);-moz-opacity:0.7;opacity: 0.7;
        }
    </style>
    <script type="text/javascript" language="JavaScript">
        function addStudent() {
            
        }
    </script>
</head>

<body style="background-image:url(/pictures/login_bg.jpg)">
<br>
<div align="center" id="header">
    <br>
    <b>欢迎使用学生公寓管理系统</b>
</div>

<div id="div">
    <form method="post">
        <table align="center" border="0" width="600" cellspacing="0" cellpadding="0" height="80%";>
            <tr>
                <td>&nbsp;</td>
                <td height="20%"><font face="华文楷体" size="5" color="#000079">
                    <b>请填写学生信息:</b>&nbsp; </font></td>
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td width="350" height="40%" style="border: 1px inset #C0C0C0" bgcolor="#FFFFCE">
                    <p align="left"><font size="1">&nbsp;<font color="#996633">
                    </font></font><font face="华文楷体"><b><font size="1">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b></font>
                    </p>
                    <p align="center"><font size="4" face="华文楷体" color="#000079">
                        学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</font>
                        <input TYPE="text" name="studentID" size="25" />
                    </p>
                    <p align="center"><font size="4" face="华文楷体" color="#000079">
                        姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</font>
                        <input TYPE="text" name="studentName" size=25 />
                    </p>
                    <p align="center"><font size="4" face="华文楷体" color="#000079">
                        性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</font>
                        <input TYPE="text" name="sex" size=25/>
                    </p>
                    <p align="center"><font size="4" face="华文楷体" color="#000079">
                        系&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</font>
                        <input TYPE="text" name="majorName" size=25 />
                    </p>
                    <p align="center"><font size="4" face="华文楷体" color="#000079">
                        年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</font>
                        <INPUT TYPE="text" name="grade" size=25>
                    </p>
                    <p align="center"><font size="4" face="华文楷体" color="#000079">
                        班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</font>
                        <INPUT TYPE="text" name="classNum" size=25>
                    </p>
                    <p align="center">
                        <INPUT TYPE="submit" VALUE="提交信息" style="height:25px; width:100px;">
                    </p>
                    <p align="center"></p>
                    <p>&nbsp;</p>
                </td>
            </tr>

            <tr>
                <p align="center">&nbsp;</p><p>&nbsp;
                <td>&nbsp;</td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td height="60%">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

        </table>
    </form>
</div>
<br>
<br>
<br>
<div align="center" id="button">版权所有@太原理工大学公寓管理中心</div>
</div>
</body>
</html>
