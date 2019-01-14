<%@ page import="java.util.List" %>
<%@ page import="Bean.PropertyBean" %><%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-13
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询财产信息</title>
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



        function deleteThisProperty(propertyID,button) {

            var index = $(button).parent().parent().prevAll().length;

            $.ajax({
                type: "POST",
                dataType: "text",
                url: "/handleProperty",
                data: "type=1&propertyID="+propertyID,
                success:function (res) {
                    if (res == "0") {
                        console.log("delete success")
                        $("#table_content tr:eq("+index+")").remove();
                    }else {
                        console.log("delete failed")
                    }
                },
                error:function () {
                    console.log("delete failed")
                }
            })
        }

        function clearData(){
            document.getElementById("input_buildNumber").value="";
            document.getElementById("input_goodName").value="";
            document.getElementById("input_price").value="";
        }

        $(document).ready(function () {
            $("#commit_value").click(function () {
                var buildNumber = document.getElementById("input_buildNumber").value;
                var goodName = document.getElementById("input_goodName").value;
                var price = document.getElementById("input_price").value;
                console.log(buildNumber);
                console.log(goodName);
                console.log(price);
                $.ajax({
                    type: "POST",
                    dataType: "text",
                    url: "/handleProperty",
                    data: "type="+0+"&buildNumber=" + buildNumber + "&goodName=" + goodName + "&price=" + price,
                    success: function (responseText) {
                        if (responseText == "0"){
                            alert("信息录入成功！");
                            clearData();
                            $("#table_content").append(
                                " <tr>\n" +
                                "         <td>"+buildNumber+"</td>\n" +
                                "         <td>"+goodName+"</td>\n" +
                                "         <td>"+price+"</td>\n" +
                                "         <td><button>删除</button></td>\n"+
                                "</tr>"
                            );
                        } else {
                            alert("信息录入失败！")
                        }
                    },
                    error: function () {

                    }
                })
            })

        })

    </script>
</head>
<body>
<%
    List<PropertyBean> list = (List<PropertyBean>) request.getAttribute("list");
%>
<div id="div_title">
    <p id="title" align="center">欢迎使用学生公寓管理系统</p>
</div>
<div id="div_search" >
    <table align="center" border="1">
        <tr>
            <td align="right">楼号：</td>
            <td><input id="input_buildNumber" type="number" name="buildNumber"></td>
        </tr>
        <tr>
            <td align="right">财产名称：</td>
            <td><input id="input_goodName" type="text" name="goodName"></td>
        </tr>
        <tr>
            <td align="right">价值：</td>
            <td><input id="input_price" type="text" name="price"></td>
        </tr>
        <tr>
            <td>
                <button id="commit_value">提交</button>
            </td>
            <td align="right">
                <button id="reset_value">重置</button>
            </td>
        </tr>
    </table>
</div>
<br>
<br>
<br>
<div id="div_content">
    <table align="center" border="1" id="table_content">
        <tr>
            <th>楼号</th>
            <th>财产名称</th>
            <th>价值</th>
            <th>操作</th>
        </tr>
        <%
            if (null != list) {
                for (PropertyBean propertyBean : list) {
        %>
                <tr>
                    <td><%=propertyBean.getBuildNumber()%></td>
                    <td><%=propertyBean.getGoodName()%></td>
                    <td><%=propertyBean.getPrice()%></td>
                    <td><button onclick="deleteThisProperty(<%=propertyBean.getId()%>,this)">删除</button></td>
                </tr>

         <%       }
            }
        %>
    </table>
</div>
</body>
</html>
