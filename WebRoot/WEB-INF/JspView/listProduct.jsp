<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html><body>
 <c:import url="./head.jsp"></c:import> 
<c:if test="${!empty user}">
  <div align="center">
    当前用户: ${user.name}
  </div>
</c:if>
<br/>
<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>id</td>
        <td>名称</td>
        <td>价格</td>
        <td>购买</td>
    </tr>

    <c:forEach items="${books}" var="book" varStatus="st">
        <tr>
            <td>${book.id}</td>
            <td>${book.name}</td>
            <td>${book.price}</td>
            <td>
             
            <form action="<%=path %>/addOrderItem" method="post">
             
            数量<input type="text" value="1" name="num">
            <input type="hidden" name="pid" value="${book.id}">
            <input type="submit" value="购买">
            </form>
            </td>
 
        </tr>
    </c:forEach>
    <c:import url="./foot.jsp"></c:import> 
</table>
</body>
</html>