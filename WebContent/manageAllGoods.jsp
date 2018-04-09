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
<title>管理商品</title>
<style type="text/css">
			
			#manageAllGoods{
				
				width: 970px;
				height: 550px;
				/*background: pink;*/
				margin: 5px auto;
				border-radius: 5px;
				/*border: 1px solid;*/
				background: #E7F1F0;
				position: relative;
			}
			
			ul{
				
				margin: 0;
				padding: 0;
				float: left;
				list-style: none;
				/*background: white;*/
			}
			
			ul li{
				
				text-align: center;
				/*border: 1px solid saddlebrown;*/
				
			}
			
			#ul_header{
				
				
				border: 1px solid salmon;
				border-radius: 4px;
				width: 120px;
				height: 400px;
			}
			
		   #ul_body{
		   	
		   	    /*border: 1px solid salmon;*/
				border-radius: 4px;
				width: 187px;
				height: 420px;
				margin: 20px 0 0 5px;
		   	
		   }
		   
		   #ul_body .ul1_li1{
		   	
		   	   background: #E3536C;
		   	   height: 45px;
		   	   line-height: 45px;
		   	   font-size: 15px;
		   	   border-top-left-radius: 4px;
		   	   border-top-right-radius: 4px;
		   	   color: white;
		   }
		   
		   #ul_body .ul1_li2{
		   	
		   	   background: #EB6379;
		   	   height: 55px;
		   	   line-height: 55px;
		   	   font-size: 30px;
		   	   
		   	   color: white;
		   }
		   
		   #ul_body .ul1_li3{
		   	
		   	   height: 40px;
		   	   line-height: 40px;
		   	   font-size: 14px;
		   	   color: #E3536C;
		   	   background: white;
		   	
		   }
		   
		   #ul_body .ul1_li4{
		   	
		   	  background: #EB6379;
		   	   height: 40px;
		   	   line-height: 40px;
		   	   font-size: 15px;
		   	   
		   	   color: white;
		   }
		   
		   #ul_body .ul1_li5{
		   	
		       background: #E3536C;
		   	   height: 40px;
		   	   line-height: 40px;
		   	   font-size: 15px;
		   	   padding-top: 10px;
		   	
		   }
		   #ul_body .ul1_li6{
		   	
		       background: #E3536C;
		   	   height: 40px;
		   	   line-height: 40px;
		   	   font-size: 15px;
		   	   border-bottom-left-radius: 4px;
		   	   border-bottom-right-radius: 4px;
		   	
		   }
		   #ul_body a{
		   	
		   	  display: block;
		   	  margin: 0 auto;
		   	  font-size: 12px;
		   	  color: white;
		   	  width: 70px;
		   	  height: 30px;
		   	  line-height: 30px;
		   	  background: #EB6379;
		   	  text-decoration: none;
		   	  border-radius: 4px;
		   }
		   #ul_body a:active{
		   	
		   	   background: white;
		   	   color: #EB6379;
		   }
		   
		   
		   #per_goodlist_down{
				
				/*margin: 60px 5px 0 0;*/
				width: 470px;
				height: 40px;
              	float: right;
              /*	border: 1px solid;*/
              	font-size: 14px;
              	color: #E3536C;
              	position: absolute;	
              	bottom: 5px;
              	right: 5px;		
			}
			
			.second_a{
				
			    
				display: block;
				float: left;
				text-decoration: none;
				width: 50px;
				height: 20px;
				background: #E3536C;
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
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td width="120">商品名称</td> -->
<!-- 			<td width="120">商品价格</td> -->
<!-- 			<td width="120">商品数量</td> -->
<!-- 			<td width="120">游戏类型</td> -->
<!-- 			<td width="120">商品类型</td> -->
<!-- 			<td width="120">卖家名称</td> -->
<!-- 			<td width="120">商品状态</td> -->
<!-- 			<td width="120">操作</td> -->
<!-- 			<td width="120">操作2</td> -->
<!-- 		</tr> -->
<%-- 		<s:iterator value="list" var="g"> --%>
<!-- 			<tr> -->
<%-- 				<td><s:property value="#g.gname" /></td> --%>
<%-- 				<td><s:property value="#g.gprice" /></td> --%>
<%-- 				<td><s:property value="#g.savenum" /></td> --%>
<%-- 				<td><s:property value="#g.ggtype.typename" /></td> --%>
<%-- 				<td><s:property value="#g.goodType" /></td> --%>
<%-- 				<td><s:property value="#g.gguser.uname" /></td> --%>
<%-- 				<td><s:property value="#g.state" /></td> --%>
<%--                 <s:if test="#g.state == '审核中' "> --%>
<%-- 				   <td><a href="manageGoodAction_passGood.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />">批准上架</a></td> --%>
<%-- 				   <td><a href="manageGoodAction_refuseGood.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />">拒绝上架</a></td> --%>
<%-- 				</s:if> --%>
<%-- 				<s:elseif test="#g.state == '已上架' "> --%>
<%-- 				   <td><a href="manageGoodAction_refuseGood.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />">下架</a></td> --%>
<%-- 				</s:elseif> --%>
<!-- 			</tr> -->
<%-- 		</s:iterator> --%>
<!-- 	</table> -->
<!-- 	<br> -->
<%-- 	<span> 当前页： <s:property value="currPage" />/<s:property value="totalPage" />&nbsp;&nbsp; 总记录数：<s:property value="totalCount" />&nbsp;&nbsp; --%>
<%-- 	</span> --%>
<%-- 	<span>  --%>
<%-- 	  <s:if test="currPage != 1"> --%>
<!-- 			<a href="manageGoodAction_findAllGoods.action?currPage=1">[首页]</a>&nbsp;&nbsp; -->
<%--             <a href="manageGoodAction_findAllGoods.action?currPage=<s:property value="currPage-1"/>">[上一页]</a> --%>
<%--       </s:if> --%>
<%-- 	  <s:if test="currPage != totalPage"> --%>
<%-- 			<a	href="manageGoodAction_findAllGoods.action?currPage=<s:property value="currPage+1" />">[下一页]</a>&nbsp;&nbsp; --%>
<%--             <a href="manageGoodAction_findAllGoods.action?currPage=<s:property value="totalPage" />">[尾页]</a> --%>
<%-- 	  </s:if> --%>
<%-- 	</span> --%>

<div id="manageAllGoods">
      <s:iterator value="list" var="g">
			<ul id="ul_body">
				<li class="ul1_li1"><s:property value="#g.gname" /></li>
				<li class="ul1_li2"><s:property value="#g.gprice" />￥</li>
				<li class="ul1_li3"><s:property value="#g.savenum" />件</li>
				<li class="ul1_li3"><s:property value="#g.ggtype.typename" /></li>
				<li class="ul1_li3"><s:property value="#g.goodType" /></li>
				<li class="ul1_li3"><s:property value="#g.gguser.uname" /></li>
				<li class="ul1_li4"><s:property value="#g.state" /></li>
				
				<s:if test="#g.state == '审核中' ">
				<li class="ul1_li5">
				           <a href="manageGoodAction_passGood.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />">批准上架</a>
				</li>
				<li class="ul1_li6">
				           <a href="manageGoodAction_refuseGood.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />">拒绝上架</a>
				</li>
				</s:if>
				
				<s:elseif test="#g.state == '已上架' ">
				   <li class="ul1_li5">
				          <a href="manageGoodAction_refuseGood.action?tempId=<s:property value="#g.gid"/>&currPage=<s:property value="currPage" />">下架</a>
				  </li>
				  <li class="ul1_li6">			          
				  </li>				
				</s:elseif>
				<s:else>
				   <li class="ul1_li5">				          
				   </li>
				   <li class="ul1_li6">				         
				   </li>
				</s:else>
			</ul>
	 </s:iterator>
			<div id="per_goodlist_down">				
				<span id="down_first">当前页：&nbsp;<s:property value="currPage" />/<s:property value="totalPage" />&nbsp;&nbsp;总记录数：&nbsp;<s:property value="totalCount" />&nbsp;&nbsp;&nbsp;</span>
				<div id="down_inner">
					<span id="down_second">
					 <s:if test="currPage != 1">
						<a class="second_a" href="manageGoodAction_findAllGoods.action?currPage=1">首页</a>&nbsp;&nbsp;<a class="second_a" href="manageGoodAction_findAllGoods.action?currPage=<s:property value="currPage-1"/>">上一页</a>&nbsp;&nbsp;
					 </s:if>
					  <s:elseif test="currPage != totalPage">	
						<a class="second_a" href="manageGoodAction_findAllGoods.action?currPage=<s:property value="currPage+1" />">下一页</a>&nbsp;&nbsp;<a class="second_a" href="manageGoodAction_findAllGoods.action?currPage=<s:property value="totalPage" />">尾页</a>
					  </s:elseif>
					</span>
				</div>				
			</div>
		</div>


</body>
</html>