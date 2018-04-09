<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理用户</title>
</head>
<body>
	<table>
		<tr>
			<td>用户名</td>
			<td>信用积分</td>
			<td>手机号码</td>
			<td>交易账号</td>
			<td>是否被封号</td>
			<td>注册时间</td>
			<td>管理用户</td>
		</tr>
		<s:iterator value="list" var="u">
			<tr>
				<td><s:property value="#u.uname" /></td>
				<td><s:property value="#u.credit" /></td>
				<td><s:property value="#u.phone" /></td>
				<td><s:property value="#u.tradeNum" /></td>
				<td><s:property value="#u.isBan" /></td>
				<td><s:property value="#u.regTime"/></td>
				<td><a href="UserAction_delete.action?tempId=<s:property value="#u.uid" />">删除</a></td>
			</tr>
		</s:iterator>
	</table>
	<br>
	<span> 当前页： <s:property value="currPage" />/<s:property
			value="totalPage" />&nbsp;&nbsp; 总记录数：<s:property value="totalCount" />&nbsp;&nbsp;
	</span>
	<span> 
	   <s:if test="currPage != 1">
			<a href="UserAction_findAll.action?currPage=1">[首页]</a>&nbsp;&nbsp;
     <a
				href="UserAction_findAll.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>
		</s:if>
		 <s:if test="currPage != totalPage">
			<a
				href="UserAction_findAll.action?currPage=<s:property value="currPage+1" />">[下一页]</a>&nbsp;&nbsp;
     <a href="UserAction_findAll.action?currPage=<s:property value="totalPage" />">[尾页]</a>
		</s:if>
	</span>
</body>
</html>