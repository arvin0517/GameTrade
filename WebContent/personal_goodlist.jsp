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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人商品列表</title>
<style type="text/css">
	#per_goodlist{
		
	   /*float: left;*/
			margin: 0 auto;
                  width: 800px;
                  height: 500px;
                  /*background: bisque;	*/	
                 /* border: 1px solid blue;		*/
		
	}
	
	table{
		margin: 20px 0 0 0;			
		border-collapse: collapse;
		width: 795px;
		border: none;
	}
	
	td{
		
		text-align: center;
	}
	
	#tr_head{
		
		border-top: 2px solid #FF8100;
		border-bottom: 2px solid #FF8100;
		
		border-right: 0;
		border-left: 0;
		height: 30px;
		font-family: "微软雅黑" serif;
		color: white;
		font-size: 16px;
		
		background: orange;
	}
	#tr_head th{
		
		font-weight: 500;
		border: 0;
	}
	
	#tr_body{
		
		height: 70px;
		font-size: 13px;
		color: #FF6600;
		border-left-color: white;
		border-right-color: white;
		border-bottom: 1px solid #FE7011;
	
	}
	
	#td_a{
	   display: block;	
	   background: #FF8100;	
	   width: 65px;
	   height: 25px;
	   line-height: 25px;
	   border: 1px solid #FF8100;
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
	
	#per_goodlist_down{
		
		margin: 80px 5px 0 0;
		width: 470px;
		height: 40px;
            	float: right;
            /*	border: 1px solid;*/
            	font-size: 14px;
            	color: orangered;			
	}
	
	.second_a{
		
	    
		display: block;
		float: left;
		text-decoration: none;
		width: 50px;
		height: 20px;
		background: deepskyblue;
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
			
			.buyerreason{
				
				cursor: pointer;
			}
			
</style>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".buyerreason").click(function(){
			
		        var reason = $(this).children("input").val();
		        alert(reason);
			
		});
		
	});

</script>
</head>
<body>
		<div id="per_goodlist">
			<table border="" cellspacing="" cellpadding="">
				<tr id="tr_head">
					<th style="width: 180px;">商品名称</th>
					<th>价格</th>
					<th>数量</th>
					<th>状态</th>
					<th>游戏类型</th>
					<th>商品类型</th>
					<th>上架时间</th>
					<th>操作</th>

				</tr>
				<s:iterator value="list" var="g" status="L">
				<tr id="tr_body">
					<td><s:property value="#g.gname" /></td>
					<td><s:property value="#g.gprice" /></td>
					<td><s:property value="#g.savenum" /></td>
					<td class="buyerreason" >
					        <input type="hidden" name="" id="" value="<s:property value="#g.backReason" />" />
					        <s:property value="#g.state" />					        
					</td>
					<td><s:property value="#g.ggtype.typename" /></td>
					<td><s:property value="#g.goodType" /></td>
					<td><s:date name="#g.uptime"/></td>
					<td>
<!-- 					       <a id="td_a" href="">取消上架</a> -->
					        <s:if test="#g.state == '审核中' "><a id="td_a" href="manageGoodAction_changeGoodState.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">取消上架</a></s:if>
					        <s:elseif test="#g.state == '已上架' "><a id="td_a" href="manageGoodAction_changeGoodState.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">取消上架</a></s:elseif>
					        <s:elseif test="#g.state == '上架失败' "><a id="td_a" href="manageGoodAction_deleteGoodOfUser.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">删除商品</a></s:elseif>
					        <s:elseif test="#g.state == '未上架' "><a id="td_a" href="manageGoodAction_changeGoodStateUp.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">申请上架</a></s:elseif>
					        <s:elseif test="#g.state == '无效' "><a id="td_a" href="manageGoodAction_deleteGoodOfUser.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">删除商品</a></s:elseif>
					        <s:elseif test="#g.state == '已被强制退货' "><a id="td_a" href="manageGoodAction_deleteGoodOfUser.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">删除商品</a></s:elseif>
					        <s:elseif test="#g.state == '卖家拒绝退货' "><a id="td_a" href="manageGoodAction_agreeBackBySeller.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">同意退货</a></s:elseif>
					        <s:elseif test="#g.state == '买家请求退货' ">
					           <a id="td_a2" href="manageGoodAction_agreeBackBySeller.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}" style="margin: 0 0 0 20px;">同意</a>
					           <a id="td_a2" href="manageGoodAction_refuseBackBySeller.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}" style="margin: 0 0 0 10px;">拒绝</a>
					        </s:elseif>
					</td>
				</tr>
				</s:iterator>
<!-- 				<tr id="tr_body"> -->
<!-- 					<td>5000金币=50元</td> -->
<!-- 					<td>50</td> -->
<!-- 					<td>5</td> -->
<!-- 					<td>已上架</td> -->
<!-- 					<td>地下城与勇士</td> -->
<!-- 					<td>金币交易</td> -->
<!-- 					<td>2017-05-29 18:13:33</td> -->
<!-- 					<td><a id="td_a" href="">删除删除</a></td> -->
<!-- 				</tr> -->
<!-- 				<tr id="tr_body"> -->
<!-- 					<td>5000金币=50元</td> -->
<!-- 					<td>50</td> -->
<!-- 					<td>5</td> -->
<!-- 					<td>已上架</td> -->
<!-- 					<td>地下城与勇士</td> -->
<!-- 					<td>金币交易</td> -->
<!-- 					<td>2017-05-29 18:13:33</td> -->
<!-- 					<td><a id="td_a" href="">删除删除</a></td> -->
<!-- 				</tr> -->
<!-- 				<tr id="tr_body"> -->
<!-- 					<td>5000金币=50元</td> -->
<!-- 					<td>50</td> -->
<!-- 					<td>5</td> -->
<!-- 					<td>已上架</td> -->
<!-- 					<td>地下城与勇士</td> -->
<!-- 					<td>金币交易</td> -->
<!-- 					<td>2017-05-29 18:13:33</td> -->
<!-- 					<td><a id="td_a" href="">删除删除</a></td> -->
<!-- 				</tr> -->
<!-- 				<tr id="tr_body"> -->
<!-- 					<td>5000金币=50元</td> -->
<!-- 					<td>50</td> -->
<!-- 					<td>5</td> -->
<!-- 					<td>已上架</td> -->
<!-- 					<td>地下城与勇士</td> -->
<!-- 					<td>金币交易</td> -->
<!-- 					<td>2017-05-29 18:13:33</td> -->
<!-- 					<td><a id="td_a" href="">删除删除</a></td> -->
<!-- 				</tr> -->
				<!--<tr><td>Data</td></tr>-->
			</table>
			<div id="per_goodlist_down">				
				<span id="down_first">当前页：&nbsp;<s:property value="currPage" />/<s:property value="totalPage" />&nbsp;&nbsp;总记录数：&nbsp;<s:property value="totalCount" />&nbsp;&nbsp;&nbsp;</span>
				<div id="down_inner">
					<span id="down_second">
					 <s:if test="currPage != 1">
						<a class="second_a" href="manageGoodAction_findGoodListByUid.action?currPage=1&userId=${existUser.uid}">首页</a>&nbsp;&nbsp;<a class="second_a" href="manageGoodAction_findGoodListByUid.action?currPage=<s:property value="currPage-1"/>&userId=${existUser.uid}">上一页</a>&nbsp;&nbsp;
					 </s:if>
					 <s:if test="currPage != totalPage">
						<a class="second_a" href="manageGoodAction_findGoodListByUid.action?currPage=<s:property value="currPage+1"/>&userId=${existUser.uid}">下一页</a>&nbsp;&nbsp;<a class="second_a" href="manageGoodAction_findGoodListByUid.action?currPage=<s:property value="totalPage" />&userId=${existUser.uid}">尾页</a>
					 </s:if>
					</span>
				</div>				
			</div>
		</div>
</body>
</html>