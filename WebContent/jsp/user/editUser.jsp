<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://" +request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
</head>
<body>
<a href="javaScript:history.go(-1)">回退</a>
<s:form action="UserAction_edit" method="post" namespace="/" theme="simple">
  <s:hidden name="uid" value="%{model.uid}" />
  <s:hidden name="uname" value="%{model.uname}" />
  <s:hidden name="credit" value="%{model.credit}" />
  <s:hidden name="isManager" value="%{model.isManager}" />
  <s:hidden name="isBan" value="%{model.isBan}" />
  <s:hidden name="regTime" value="%{model.regTime}" />
  
   <table>
     <tr>
       <td>用户名：</td>
       <td><s:property value="model.uname"/></td>
     </tr>
     <tr>
       <td>密码：</td>
       <td><s:password name="password"  value="%{model.password}" showPassword="true" ></s:password></td>
     </tr>
     <tr>
       <td>信誉积分：</td>
       <td><s:property value="model.credit"/>分</td>
     </tr>
     <tr>
       <td>手机号码：</td>
       <td><s:textfield name="phone" value="%{model.phone}"></s:textfield></td>
     </tr>
     <tr>
       <td>交易账号：</td>
       <td><s:textfield name="tradeNum" value="%{model.tradeNum}"></s:textfield></td>
     </tr>
      <tr>
       <td>注册时间：</td>
       <td><s:property value="model.regTime"/></td>
     </tr>
     <tr>
       <td><input type="submit" value="保存"></td>
     </tr>
   </table>
   

</s:form >

</body>
</html>