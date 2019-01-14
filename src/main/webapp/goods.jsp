<%@ page import="java.util.List" %>
<%@ page import="Bean.GoodsBean" %><%--
  Created by IntelliJ IDEA.
  User: binguner
  Date: 2019-01-13
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>货物搬出登记</title>
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
        function deleteThisData(dataId) {

            $.ajax({
                type: "POST",
                dataType: "text",
                data: "type=1&dataId="+dataId,
                url: "",
                success: function () {

                },
                error: function () {

                }
            })
        }

        function clearDatas(){
            document.getElementById("buildNumber").value="";
            document.getElementById("goodsName").value="";
            document.getElementById("goodsDate").value="";
            document.getElementById("goodsDetail").value="";
        }

        $(document).ready(function () {
            $("#goods_commit").click(function () {
                var buildNumber = document.getElementById("buildNumber").value;
                var goodsName = document.getElementById("goodsName").value;
                var goodsDate = document.getElementById("goodsDate").value;
                var goodsDetail = document.getElementById("goodsDetail").value;
                console.log(buildNumber);
                console.log(goodsName);
                console.log(goodsDate);
                console.log(goodsDetail);
                $.ajax({
                    type: "POST",
                    url: "/handleGoods",
                    dadaType: "text",
                    data: "type=0&buildNumber="+buildNumber+"&goodsName="+goodsName+"&goodsDate="+goodsDate+"&goodsDetail="+goodsDetail,
                    success: function () {
                        clearDatas();
                        alert("数据添加成功！")
                    },
                    error: function () {
                        alert("数据添加失败！")
                    }
                })
            })
        })
    </script>
</head>
<body>
<%
    List<GoodsBean> list = (List<GoodsBean>) request.getAttribute("list");
%>
<div id="div_title">
    <p id="title" align="center">欢迎使用学生公寓管理系统</p>
</div>
<div id="div_add_record">
    <table id="table_add_record" align="center">
        <tr>
            <td>楼号：</td>
            <td><input type="text" id="buildNumber"></td>
        </tr>
        <tr>
            <td>物品名称：</td>
            <td><input type="text" id="goodsName"></td>
        </tr>
        <tr>
            <td>借出日期：</td>
            <td><input type="date" id="goodsDate"></td>
        </tr>
        <tr>
            <td>详情：</td>
            <td><input type="text" id="goodsDetail"></td>
        </tr>
        <tr>
            <td><button id="goods_commit">提交</button></td>
            <td><button id="goods_reset">重置</button></td>
        </tr>
    </table>
</div>
<br>
<br>
<br>

<div id="div_content">
    <table align="center" id="table_content" border="1">
        <tr>
            <td>楼号</td>
            <td>物品名称</td>
            <td>借出日期</td>
            <td>详情</td>
            <td>操作</td>
        </tr>
        <%
            if (null != list){
                for (GoodsBean goodsBean:list){
        %>
                    <tr>
                        <td><%=goodsBean.getBuildNumber()%></td>
                        <td><%=goodsBean.getGoodsName()%></td>
                        <td><%=goodsBean.getGoodsDate()%></td>
                        <td><%=goodsBean.getGoodsDetail()%></td>
                        <td><button onclick="onclick="deleteThisData(<%=goodsBean.getId()%>)">删除</button></td>
                    </tr>

        <%        }
            }
        %>
    </table>
</div>

</body>
</html>
