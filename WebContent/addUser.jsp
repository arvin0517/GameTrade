<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//  System.out.println("index.jsp path:"+path);
//  System.out.println("index.jsp basePath:"+basePath);
//http://localhost:8080/GameTrade/        user    uid, uname,password,credit,phone,isManager
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
</head>
<body>
<s:form action="UserAction_save" name="saveform" namespace="/" theme="simple">
  <table>
     <tr>
       <td>用户名：</td>
       <td><s:textfield name="uname" /></td>
     </tr>
     <tr>
       <td>密码：</td>
       <td><s:password name="password"  /></td>
       <td></td>
     </tr>
     <tr>
       <td>确认密码：</td>
       <td><s:password name="checkPassword" /></td>
       <td><font color="#FF0000">${passError}</font></td>
     </tr>
     <tr>
       <td>手机号码：</td>
       <td><s:textfield name="phone" /></td>
     </tr>
     <tr>
       <td>交易账号：</td>
       <td><s:textfield name="tradeNum" /></td>
     </tr>
     <tr>
       <td align="center"><input type="submit" value="提交"/></td>
       <td align="center"><input type="reset"  value="重置" /></td>
     </tr>
  </table>
</s:form>
</body>
</html>