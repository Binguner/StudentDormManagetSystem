<%@ page import="Bean.VisitorBean" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-12
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>外来人员登记</title>
    <style type="text/css">
        #div_title{
            height: 150px;
        }
        #title{
            font-size: 30px;
            position: relative;
            top: 50%;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script type="text/javascript" language="JavaScript">

        function clearAllValue(){
            document.getElementById("visitor_buildnumber").value="";
            document.getElementById("visitor_name").value="";
            document.getElementById("visitor_date").value="";
            document.getElementById("visitor_phone").value="";
            document.getElementById("visitor_reason").value="";
        }

        function deleteThisVisitor(visitorID,button){
            //console.log(button.parent);
            var index = $(button).parent().parent().prevAll().length;
            console.log(index);
            $.ajax({
                type: "POST",
                url: "/visitorservlet",
                dataType: "text",
                data: "type=1"+"&visitorId="+visitorID,
                success: function (responseText) {
                    console.log("delete success");
                    $("#table_list tr:eq("+index+")").remove();
                },
                error: function (responseText) {
                    console.log("delete failed")
                }
            })
        }

        $(document).ready(function () {
            $("#visitor_commit").click(function () {
                var visitor_buildNumber = document.getElementById("visitor_buildnumber").value;
                var visitor_name = document.getElementById("visitor_name").value;
                var visitor_date = document.getElementById("visitor_date").value;
                var visitor_phone = document.getElementById("visitor_phone").value;
                var visitor_reason = document.getElementById("visitor_reason").value;
                console.log(visitor_buildNumber + " " + visitor_name + " " + visitor_date + " " + visitor_phone + " " + visitor_reason);
                $.ajax({
                    type: "POST",
                    url: "/visitorservlet",
                    dataType: "text",
                    data: "type=0"+"&buildNumber="+visitor_buildNumber+"&visitorName="+visitor_name+"&visitorDate="+visitor_date+"&phone="+visitor_phone+"&reason="+visitor_reason,
                    success: function (responseText) {
                        if (responseText = "0"){
                            //console.log("ok");
                            alert("增加访客信息成功");
                            clearAllValue();
                            $("#table_list").append("<tr>\n" +
                                "            <td>"+visitor_buildNumber+"</td>\n" +
                                "            <td>"+visitor_name+"</td>\n" +
                                "            <td>"+visitor_date+"</td>\n" +
                                "            <td>"+visitor_phone+"</td>\n" +
                                "            <td>"+visitor_reason+"</td>\n" +"" +
                                "<td><button onclick=\"deleteThisVisitor(<\%=visitorBean.getId()\%>)\" name='btn'>删除</button></td>"+
                                "        </tr>");
                        } else {
                            //console.log("wrong");
                        }
                    },
                    error: function () {
                        alert("增加访客信息失败，请重试！");
                    }

                })
            });
        })
    </script>
</head>
<%
    List<VisitorBean> list = (List<VisitorBean>) request.getAttribute("list");
%>
<body>
<div id="div_title">
    <p id="title" align="center">欢迎使用学生公寓管理系统</p>
</div>
<div id="div_add_visitor">
    <br>
    <br>
    <table align="center" id="table_add_visitor" >
        <tr>
            <td align="right">楼号：</td>
            <td><input id="visitor_buildnumber" type="text" placeholder="请输入宿舍楼号"></td>
        </tr>
        <tr>
            <td align="right">名称：</td>
            <td><input id="visitor_name" type="text" placeholder="请输入访问者姓名"></td>
        </tr>
        <tr>
            <td align="right">访问日期：</td>
            <td><input id="visitor_date" type="date" placeholder="请输入访问日期"></td>
        </tr>
        <tr>
            <td align="right">电话：</td>
            <td><input id="visitor_phone" type="number" placeholder="请输入访问者电话"></td>
        </tr>
        <tr>
            <td align="right">原因：</td>
            <td><input id="visitor_reason" type="text" placeholder="请输入访问原因"></td>
        </tr>
        <tr align="right">
            <td><button id="visitor_commit">提交</button></td>
            <td><button id="visitor_reset" onclick="clearAllValue()" align="center" type="reset" value="重置">重置</button></td>
        </tr>
    </table>
</div>
<br>
<br>
<div id="div_list">
    <table id="table_list" align="center" border="1">
        <tr>
            <td>楼号</td>
            <td>名称</td>
            <td>访问日期</td>
            <td>电话</td>
            <td>原因</td>
            <td>操作</td>
        </tr>

        <%
            if (null!=list){
                for(VisitorBean visitorBean : list){
                 %>
        <tr>
                <td><%=visitorBean.getBuildNumber() %></td>
                <td><%=visitorBean.getVisitorName() %></td>
                <td><%=visitorBean.getVisitorDate() %></td>
                <td><%=visitorBean.getPhone() %></td>
                <td><%=visitorBean.getReason() %></td>
                <td class="mbtn"><button onclick="deleteThisVisitor(<%=visitorBean.getId()%>,this)" name="btn">删除</button></td>
                <%--<td><button onclick="alert(this.rowIndex )">删除</button></td>--%>
        </tr>
             <%}
            }

        %>

    </table>
</div>
</body>
</html>
