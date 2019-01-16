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
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <title>公寓管理系统主界面</title>
    <style type="text/css">

        #div_title{
            height: 50px;
        }
        #title{
            font-size: 30px;
            line-height: 35px;
        }
        #div1{
            height:200px;
            width:50px;
            float:left;
        }
        #div2{
            height:100%;
            width:200px;
            float:left;
        }
    </style>
    <script type="text/javascript" language="JavaScript">
        layui.use('form',function () {
            var form = layui.form;
            form.render();
        });
        function addStudent() {
            console.log("Here");
            var studentID = document.getElementById("studentID").value;
            var studentName = document.getElementById("studentName").value;
            var mradio = document.getElementsByName("sex");
            var sex = "";
            for(var i = 0 ; i < mradio.length; i++){
                if (mradio[i].checked){
                    sex = mradio[i].value;
                }
            }
            var majorName = document.getElementById("majorName").value;
            var grade = document.getElementById("grade").value;
            var classNum = document.getElementById("classNum").value;
            // console.log(studentID);
            // console.log(studentName);
            // console.log(sex);
            // console.log(majorName);
            // console.log(grade);
            // console.log(classNum);
            var xmlHTTP;
            if (window.XMLHttpRequest){
                xmlHTTP = new XMLHttpRequest();
            }else {
                xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlHTTP.onreadystatechange=function () {
                if (xmlHTTP.status == 200 && xmlHTTP.readyState == 4){
                    if (xmlHTTP.responseText == "0"){
                        alert("添加学生信息成功！");
                        window.location.href = "/addStudent"
                    }else {
                        alert("添加学生信息失败，请重试！")
                    }
                }
            };
            xmlHTTP.open("POST","/addStudentServlet",true);
            xmlHTTP.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
            xmlHTTP.send("studentID="+studentID+"&studentName="+studentName+"&sex="+sex+"&majorName="+majorName+"&grade="+grade+"&classNum="+classNum);
        }
    </script>
</head>
<%--style="background-image:url(/pictures/login_bg.jpg)"--%>
<body >
<%--<a href="index.jsp">返回</a>--%>
<div id="div_title" class="layui-bg-cyan">
    <div style="width:30%;padding:0;margin:0;float:left;box-sizing:border-box;">
        <a href="#" onclick="javascript:history.back(-1);">
            <button class="layui-btn" style="height: 50px">
                <i class="layui-icon">&#xe65c;</i> 返回
            </button>
        </a>
    </div>

    <div style="width:40%;padding:0;margin-top:8px;float:left;box-sizing:border-box;">
        <p id="title" align="center">欢迎使用学生公寓管理系统</p>
    </div>

    <div align="right" style="width:30%;padding:0;margin:0;float:left;box-sizing:border-box;">
        <a href="login.jsp">
            <button class="layui-btn" style="height: 50px">
                <i class="layui-icon">&#xe66f;</i> 注销
            </button>
        </a>
    </div>
</div>







<div id=div1 class="layui-bg-cyan " style="margin-top: 50px">
    <ul class="layui-nav layui-nav-tree site-demo-nav layui-bg-cyan " lay-filter="test">
        <li class="layui-nav-item layui-bg-cyan "><a href="/AddStudent">录入学生信息</a></li>
        <li class="layui-nav-item layui-bg-cyan "><a href="/dormdis">寝室分配</a></li>
        <li class="layui-nav-item layui-bg-cyan "><a href="/querystudent">查询学生信息</a></li>
        <li class="layui-nav-item layui-bg-cyan "><a href="/querydorm">查询寝室信息</a></li>
        <li class="layui-nav-item layui-bg-green "><a href="/property">查询财产信息</a></li>
        <li class="layui-nav-item layui-bg-cyan "> <a href="">登记信息</a></li>
        <li class="layui-nav-item layui-bg-cyan"><a href="/addvisitor">外来人员登记</a></li>
        <li class="layui-nav-item layui-bg-cyan"><a href="/goods">退出系统</a></li>
    </ul>
    <div id=div2 class="layui-bg-cyan">
    </div>
</div>
<div align="center">

    <form style="width: 300px;" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">学号：</label>
            <div class="layui-input-block">
                <input id="studentID" type="text" name="studentID" required  lay-verify="required|number" placeholder="请输入学号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-block">
                <input id="studentName" type="text" name="studentName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked>
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">系别：</label>
            <div class="layui-input-block">
                <input id="majorName" type="text" name="majorName" required  lay-verify="required" placeholder="请输入专业" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">年级：</label>
            <div class="layui-input-block">
                <select id="grade" name="grade" lay-verify="required">
                    <option value=""></option>
                    <option value="15">15 级</option>
                    <option value="16">16 级</option>
                    <option value="17">17 级</option>
                    <option value="18">18 级</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">班级：</label>
            <div class="layui-input-block">
                <input id="classNum" type="text" name="classNum" required  lay-verify="required" placeholder="请输入班级" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="addStudent()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>

    <%--<form>--%>
        <%--<table align="center" border="0">--%>
            <%--<tr>--%>
                <%--<td>学    号：</td>--%>
                <%--<td>--%>
                    <%--<input type="text" id="studentID" name="studentID" size="25" />--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>姓    名：</td>--%>
                <%--<td>--%>
                    <%--<input type="text" id="studentName" name="studentName" size=25 />--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>性    别：</td>--%>
                <%--<td>--%>
                    <%--<input type="text" id="sex" name="sex" size=25/>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>系    别：</td>--%>
                <%--<td>--%>
                    <%--<input type="text" id="majorName" name="majorName" size=25 />--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>年    级：</td>--%>
                <%--<td>--%>
                    <%--<select id="grade" name="grade">--%>
                        <%--<option value="15">15 级</option>--%>
                        <%--<option value="16">16 级</option>--%>
                        <%--<option value="17">17 级</option>--%>
                        <%--<option value="18">18 级</option>--%>
                    <%--</select>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>班    级：</td>--%>
                <%--<td>--%>
                    <%--<input type="text" id="classNum" name="classNum" size=25>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<button class="layui-btn layui-btn-normal" onclick="addStudent()">提交</button>--%>
                    <%--&lt;%&ndash;<INPUT type="submit" onclick="addStudent()" VALUE="提交信息" style="height:25px; width:100px;">&ndash;%&gt;--%>
                <%--</td>--%>
                <%--<td align="right">--%>
                    <%--<button class="layui-btn layui-btn-normal" onclick="">重置</button>--%>
                <%--</td>--%>
            <%--</tr>--%>



        <%--</table>--%>
    <%--</form>--%>
</div>
<br>
<br>
<br>
<div align="center" id="button">版权所有@太原理工大学公寓管理中心</div>
</div>
</body>
</html>
