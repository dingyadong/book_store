<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'IistOrderItem.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="basic/js/quick_links.js"></script>

		<script type="text/javascript" src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="js/list.js"></script>
  </head>
  
  <body>
 <c:import url="./head.jsp"></c:import> 
<h1 align="center" >购物车</h1>
<table class="am-table am-table-striped am-table-hover table-main am-scrollable-horizontal am-table-centered" align='center' border='1' cellspacing='0'>
    <tr>
        <td>商品名称</td>

        <td>单价</td>
        <td>数量</td>
        <td>小计</td>
        <td>操作</td>
    </tr>
 
    <c:forEach items="${ois}" var="oi" varStatus="st">
        <tr>
        
            <td>${oi.book.name}</td>
      
            <td>${oi.book.price}</td>
            <td>${oi.num}</td>
            <td>${oi.book.price*oi.num}</td>
            <td><a href="./OrderIteamDeleteServlet?id=${st.index}">删除</a></td>
        </tr>
    </c:forEach>
    
        <c:if test="${!empty ois}">
        <tr>
            <td colspan="5" align="right">
                <a href="ReceivingGoodsServlet"  class="am-btn am-btn-danger">立即购买</a>
            </td>
        </tr>
    </c:if>
    
</table>
    <c:import url="./foot.jsp"></c:import> 
  </body>
</html>
