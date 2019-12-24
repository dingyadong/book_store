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
    
    <title>My JSP 'personalCenter.jsp' starting page</title>
    
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
<form  method="post" action="UserInfoUpdateServlet">
  <table align='center' class="am-table am-table-striped am-table-hover table-main " >
    <tr>
      <td colspan="2" align="center"><h3>个人信息中心</h3></td>
    </tr>
    <tr>
      <td align="right">头像</td>
      <td><label for="textfield"></label>
      <input type="text" name="textfield"  /></td>
    </tr>
    <tr>
      <td align="right">昵称</td>
      <td><input type="text" value="${user.name}" name="name" /></td>
    </tr>
    <tr>
      <td width="124" align="right">真实姓名：</td>
      <td width="320"><input type="text" name="realname" value="${user.realname}" /></td>
    </tr>
    <tr>
      <td align="right">性别：</td>
      <td><input type="radio" name="sex" value="男" />
      <label for="radio">男
        <input type="radio" name="sex"  value="女" />
      </label>女</td>
    </tr>
    <tr>
      <td align="right">出生日期：</td>
      <td><label for="select2"></label>
        <select name="bornY">
        <c:forEach var="i" begin="1920" end="2019">
   <option value="${i}">${i}</option>
</c:forEach>
          
        </select>
        <select name="bornM">
                  <c:forEach var="i" begin="1" end="12">
   <option value="${i}">${i}</option>
</c:forEach>
      </select>
        <select name="bornD">
                 <c:forEach var="i" begin="1" end="31">
   <option value="${i}">${i}</option>
</c:forEach>
      </select></td>
    </tr>
    <tr>
      <td align="right">电话：</td>
      <td><input type="text" name="phone" value="${user.phone}"/></td>
    </tr>
        <tr>
      <td align="right">电子邮件：</td>
      <td><input type="text" name="email" value="${user.email}"/></td>
    </tr>
    <tr>
      <td align="right">居住地址：</td>
      <td><input type="text" name="address" value="${user.address}" /></td>
    </tr>
    <tr>
      <td align="right">收获地址：</td>
      <td><input type="text" name="receAddress" value="${user.receaddress}" /></td>
    </tr>

    <tr>
      <td colspan="2" align="center">
      <input type="submit" name="button2" id="button2" value="保存" /></td>
    </tr>
  </table>
</form>
<br/>
<br/>
<br/>

<br/><br/><br/>
    <c:import url="./foot.jsp"></c:import> 
</body>
</html>
