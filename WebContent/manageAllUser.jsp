<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<% 
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理用户</title>
<style type="text/css">
			
			#manageAllUser{
				
				width: 970px;
				height: 550px;
				/*background: blueviolet;*/
				margin: 5px auto;
				border-radius: 5px;
				border: 1px solid darkgoldenrod;
				
			}
			
			table{
				margin: 10px 0 0 30px;			
				border-collapse: collapse;
				width: 900px;
				border: none;
			}
			
			td{
				
				text-align: center;
			}
			
			#tr_head{
				
				border-top: 2px solid goldenrod;
				border-bottom: 2px solid goldenrod;
				
				border-right: 0;
				border-left: 0;
				height: 30px;
				font-family: "微软雅黑" serif;
				color: white;
				font-size: 16px;
				
				background: goldenrod;
			}
			#tr_head th{
				
				font-weight: 500;
				border: 0;
			}
			
			#tr_body{
				
				height: 70px;
				font-size: 13px;
				color: goldenrod;
				border-left-color: white;
				border-right-color: white;
				border-bottom: 1px solid goldenrod;
			
			}
			
			#td_a{
			   display: block;	
			   background: goldenrod;	
			   width: 65px;
			   height: 25px;
			   line-height: 25px;
			   border: 1px solid goldenrod;
			   border-radius: 4px;
			   color: white;
			   margin: 0 auto;	
			   text-decoration: none;
			   
			}
			
			#td_a:active{
				
				background: #099ACB;
				border: 1px solid #099ACB;
				
			}
			#td_a:hover{
				
				background: #099ACB;
				border: 1px solid #099ACB;	
			}
			
			#td_a2{
				
			   display: block;	
			   float: left;
			   background: #FF8100;	
			   width: 30px;
			   height: 25px;
			   line-height: 25px;
			   border: 1px solid #FF8100;
			   border-radius: 4px;
			   color: white;
			   margin: 0 0 0 0;	
			   text-decoration: none;
			}
			
			#td_a2:active{
				
				background: #099ACB;
				border: 1px solid #099ACB;
				
			}
			#td_a2:hover{
				
				background: #099ACB;
				border: 1px solid #099ACB;	
			}
			
			
			
			#per_goodlist_down{
				
				margin: 40px 5px 0 0;
				width: 480px;
				height: 40px;
              	float: right;
              /*	border: 1px solid;*/
              	font-size: 14px;
              	color: goldenrod;			
			}
			
			.second_a{
				
			    
				display: block;
				float: left;
				text-decoration: none;
				width: 50px;
				height: 20px;
				background: goldenrod;
				color: white;
				margin:  0 10px 0 0;
				border-radius: 4px;
				text-align: center;
				
			}
			
			.second_a:hover{
				
				background: #0EA9DD;
				
			}
			
			.second_a:active{
				
				background: #0B789D;
			}
			
			#down_inner{
				
				margin: 10px 0 0 0;
				width: 270px;
				height: 25px;
				float: right;
               /* border: 1px solid saddlebrown;			*/	
			}
			
			#down_first{
				
				display: block;
				float: left;
				margin: 10px 0 0 0;
			}
			.buyerreason{
				
				cursor: pointer;
			}
			
		</style>
</head>
<body>
  <div id="manageAllUser">
			<table border="" cellspacing="" cellpadding="">
				<tr id="tr_head">
					<th style="width: 80px;">用户编号</th>
					<th>用户名称</th>
					<th>信誉积分</th>
					<th>手机号码</th>
					<th>交易账号</th>
					<th>用户状态</th>
					<th>注册时间</th>
					<th>账户余额</th>
                    <th>操作</th>
				</tr>
				<s:iterator value="list" var="u">
				<tr id="tr_body">
					<td><s:property value="#u.uid" /></td>
					<td><s:property value="#u.uname" /></td>
					<td><s:property value="#u.credit" />积分</td>
					<td><s:property value="#u.phone" /></td>
					<td><s:property value="#u.tradeNum" /></td>
					<td><s:property value="#u.isBan" /></td>
					<td><s:property value="#u.regTime"/></td>
					<td><s:property value="#u.existCash" />￥</td>
					<td>
					  <s:if test="#u.isBan == '正常' ">
					    <a id="td_a" href="UserAction_banUesr.action?currPage=<s:property value="currPage"/>&tempId=<s:property value="#u.uid" />">进行封号</a>
					  </s:if>
					  
					  <s:elseif test="#u.isBan == '已封号' ">
					     <a id="td_a" href="UserAction_cancalBanUser.action?currPage=<s:property value="currPage"/>&tempId=<s:property value="#u.uid" />">解除封号</a>
					  </s:elseif>
					  
					</td>
				</tr>
				</s:iterator>
				
				<!--<tr><td>Data</td></tr>-->
			</table>
			<div id="per_goodlist_down">				
				<span id="down_first">当前页：&nbsp; <s:property value="currPage" />/<s:property
			value="totalPage" />&nbsp;&nbsp;总记录数：&nbsp;<s:property value="totalCount" />&nbsp;&nbsp;</span>
				<div id="down_inner">
					<span id="down_second">
					   <s:if test="currPage != 1">
						<a class="second_a" href="UserAction_findAll.action?currPage=1">首页</a>&nbsp;&nbsp;
						<a class="second_a" href="UserAction_findAll.action?currPage=<s:property value="currPage-1"/>">上一页</a>&nbsp;&nbsp;
					   </s:if>
					    <s:if test="currPage != totalPage">
						<a class="second_a" href="UserAction_findAll.action?currPage=<s:property value="currPage+1" />">下一页</a>&nbsp;
						<a class="second_a" href="UserAction_findAll.action?currPage=<s:property value="totalPage" />">尾页</a>
						</s:if>
					</span>
				</div>				
			</div>
		</div>
</body>
</html>