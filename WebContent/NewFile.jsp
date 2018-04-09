<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//  System.out.println("index.jsp path:"+path);
//  System.out.println("index.jsp basePath:"+basePath);
//http://localhost:8080/GameTrade/
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
</head>
<body>
<h2><s:actionerror /></h2>
<s:form action="loginAction_login" method="post" namespace="/" theme="simple">

  <table border="1">
     <tr>
       <td>用户名：</td>
       <td><s:textfield name="uname"/></td>
     </tr> 
     <tr>
       <td>密  码：</td>
       <td><s:password name="password"/></td>
     </tr>
     <tr>
        <td colspan="2"><input type="submit" value="登录"/></td>
     </tr>
     <tr>
       <td colspan="2"><a href="UserAction_saveUI.action">注册 </a></td>
     </tr>
  </table>
   <s:select name="" list="typelist"  listKey="tid" listValue="typename" headerKey="" headerValue="--请选择--" />
</s:form>
</body>
</html>