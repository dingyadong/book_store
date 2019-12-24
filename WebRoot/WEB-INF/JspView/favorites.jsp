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
    
    <title>My JSP 'favorites.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="css/style1.css">
		<link rel="stylesheet" type="text/css" href="css/css.css" />
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

<h1 align="center" >收藏夹</h1>
<h1 align="center" > 收藏${favoNews}</h1>


<div class="shopping_content">
			<div class="shopping_table">
				<table class="am-table am-table-bordered am-table-radius am-table-striped "  border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center; ">
					<tr>
						<th style="text-align:center;vertical-align:middle;">商品图片</th>
						<th style="text-align:center;vertical-align:middle;">商品名称</th>
						<th style="text-align:center;vertical-align:middle;">商品简介</th>
						<th style="text-align:center;vertical-align:middle;">商品价格</th>
						<th style="text-align:center;vertical-align:middle;">商品操作</th>
					</tr>



				    <c:forEach items="${favorites}" var="f" varStatus="st">
					
					<tr>
						<td style="text-align:center;vertical-align:middle;">
							<a href="ProductIntroductionServlet?id=${f.book.id}"><img style="width: 150px;" src="image/${f.book.img }" /></a>
						</td>
						<td style="text-align:center;vertical-align:middle;"><span>${f.book.name}</span></td>
						<td style="text-align:center;vertical-align:middle;">
							<div class="" style="white-space:normal; word-break:break-all;overflow:hidden;">
								${f.book.bookqutline}
							</div>
							
						</td>
						
						<td style="text-align:center;vertical-align:middle;">
							¥<span class="span_momey">${f.book.price}</span>
						</td>

						<td style="text-align:center;vertical-align:middle;">
							<a href="FavoritesDeleteServlet?pid=${f.book.id}">删除</a>
						</td>
					</tr>
				</c:forEach>
				</table>

								</div>
</div>



    <c:import url="./foot.jsp"></c:import> 
  </body>
</html>
