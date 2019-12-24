<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'IistOrderItem.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="css/style.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/style1.css">
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />


		<script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="basic/js/quick_links.js"></script>

		<script type="text/javascript" src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="js/list.js"></script>
  </head>
<html><body>
 <c:import url="./head.jsp"></c:import> 
<c:if test="${!empty user}">
  <div align="center">
    当前用户: ${user.name}
  </div>
</c:if>

		<div class="shopping_content">
			<div class="shopping_table">
				<table class="am-table am-table-bordered am-table-radius am-table-striped "  border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center; ">

				
					<tr>
						<th style="text-align:center;vertical-align:middle;">订单编号</th>
						<th style="text-align:center;vertical-align:middle;">商品图片</th>
						<th style="text-align:center;vertical-align:middle;">商品名称</th>
						<th style="text-align:center;vertical-align:middle;">商品简介</th>
						<th style="text-align:center;vertical-align:middle;">商品价格</th>
						<th style="text-align:center;vertical-align:middle;">商品数量</th>
						<th style="text-align:center;vertical-align:middle;">购买日期</th>
					</tr>



					<c:forEach items="${carRecords}" var="carRecord"  varStatus="status1">
					
					<tr>
					<td style="text-align:center;vertical-align:middle;">
					<span>${carRecord.id}</span>
					
						</td>
						<td style="text-align:center;vertical-align:middle;">
							<a href="ProductIntroductionServlet?id=${carRecord.bookid}"><img style="width: 150px;" src="image/${carRecord.img}" /></a>
						</td>
						<td style="text-align:center;vertical-align:middle;"><span>${carRecord.bookname}</span></td>
						<td style="text-align:center;vertical-align:middle;">
							<div class="" style="white-space:normal; word-break:break-all;overflow:hidden;">
								${carRecord.bookqutline}
							</div>
							
						</td>
						
						<td style="text-align:center;vertical-align:middle;">
							<span class="span_momey">¥${carRecord.bookprice}</span>
						</td>
						<td style="text-align:center;vertical-align:middle;">
					
						
						<span class="span_momey">${carRecord.number}</span>
							
						</td>
						<td style="text-align:center;vertical-align:middle;">
							<span class="span_momey">${carRecord.cratedate}</span>
						</td>
					</tr>
				</c:forEach>
				</table>
	
								</div>
							</div>

<c:import url="./foot.jsp"></c:import> 
</body>
</html>