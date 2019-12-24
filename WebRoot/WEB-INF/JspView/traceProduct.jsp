<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'traceProduct.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <c:import url="./head.jsp"></c:import> 
     <table class="am-table am-table-striped am-table-hover table-main am-scrollable-horizontal am-table-centered" align='center' border='1' cellspacing='0'>
    <tr>
        
        <td>书名</td>
        <td>价格</td>
        <td>简介</td>
        <td>isbn编号</td>
        
    </tr>

    <c:forEach items="${traces}" var="trace" varStatus="st">
        <tr>
            <td> <a href="ProductIntroductionServlet?id=${trace.id}">${trace.name}</a></td>
            <td>${trace.price}</td>
            <td>${trace.bookqutline}</td>
            <td>${trace.isbn}</td>
        </tr>
    </c:forEach>

  </body>
</html>
