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
<title>订单管理</title>
<style type="text/css">
		   
		   #manageAllForms{
		   	
		   	    width: 970px;
				height: 550px;
				/*background: pink;*/
				margin: 5px auto;
				border-radius: 5px;
				/*border: 1px solid;*/
				background: #2B2937;
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
			
			/*#ul_header{
				
				
				border: 1px solid salmon;
				border-radius: 4px;
				width: 120px;
				height: 400px;
			}*/
			
		   #ul_body{
		   	
		   	    /*border: 1px solid salmon;*/
				border-radius: 4px;
				width: 187px;
				height: 420px;
				margin: 20px 0 0 5px;
		   	
		   }
		   
		   #ul_body .ul1_li1{
		   	
		   	   background: #78CFBF;
		   	   height: 45px;
		   	   line-height: 45px;
		   	   font-size: 15px;
		   	   border-top-left-radius: 4px;
		   	   border-top-right-radius: 4px;
		   	   color: white;
		   }
		   
		   #ul_body .ul1_li2{
		   	
		   	   background: #82DACA;
		   	   height: 55px;
		   	   line-height: 55px;
		   	   font-size: 30px;
		   	   
		   	   color: white;
		   }
		   
		   #ul_body .ul1_li3{
		   	
		   	   height: 40px;
		   	   line-height: 40px;
		   	   font-size: 14px;
		   	   color: #78CFBF;
		   	   background: white;
		   	
		   }
		   
		   #ul_body .ul1_li4{
		   	
		   	  background: #82DACA;
		   	   height: 40px;
		   	   line-height: 40px;
		   	   font-size: 15px;
		   	   
		   	   color: white;
		   }
		   
		   #ul_body .ul1_li5{
		   	
		       background: #78CFBF;
		   	   height: 35px;
		   	   line-height: 35px;
		   	   font-size: 15px;
		   	   padding-top: 10px;
		   	
		   }
		   #ul_body .ul1_li6{
		   	
		       background: #78CFBF;
		   	   height: 35px;
		   	   line-height: 35px;
		   	   font-size: 15px;
		   	
		   }
		   
		   #ul_body .ul1_li7{
		   	
		       background: #78CFBF;
		   	   height: 35px;
		   	   line-height: 35px;
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
		   	  background: #82DACA;
		   	  text-decoration: none;
		   	  border-radius: 4px;
		   }
		   #ul_body a:active{
		   	
		   	   background: white;
		   	   color: #82DACA;
		   }
		   
		   #ul_body_span{
		   	
		   	 display: block;
		   	  margin: 0 auto;
		   	  font-size: 12px;
		   	  color: white;
		   	  width: 70px;
		   	  height: 30px;
		   	  line-height: 30px;
		   	  background: #82DACA;
		   	  text-decoration: none;
		   	  border-radius: 4px;
		   	  cursor: pointer;
		   	
		   }
		   
		      #ul_body_span:active{
		   	
		   	   background: white;
		   	   color: #82DACA;
		   }
		   
		   
		   
		   #per_goodlist_down{
				
				/*margin: 60px 5px 0 0;*/
				width: 470px;
				height: 40px;
              	float: right;
              /*	border: 1px solid;*/
              	font-size: 14px;
              	color: #78CFBF;
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
				background: #78CFBF;
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
<style type="text/css">

#backreason{

   cursor: pointer;
}

</style>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#ul_body_span").click(function(){
			
		        var reason = $("#hid_reason").val();
		        alert(reason);
			
		});
		
	});

</script>
</head>
<body>
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td width="140">商品名称</td> -->
<!-- 			<td width="120">商品数量</td> -->
<!-- 			<td width="120">商品价格</td> -->
<!-- 			<td width="120">订单号</td> -->
<!-- 			<td width="120">卖家名称</td> -->
<!-- 			<td width="120">买家名称</td> -->
<!-- 			<td width="120">订单状态</td> -->
<!-- 			<td width="120">操作</td> -->
<!-- 			<td width="120">操作2</td> -->
<!-- 			<td width="120">操作3</td> -->
<!-- 		</tr> -->
<%-- 		<s:iterator value="list" var="f" status="L"> --%>
<!-- 			<tr> -->
<%-- 				<td><s:property value="#f.goodName" /></td> --%>
<%-- 				<td><s:property value="#f.fnumber" /></td> --%>
<%-- 				<td><s:property value="#f.totalPrice" /></td> --%>
<%-- 				<td><s:property value="#f.formId" /></td> --%>
<%-- 				<td><s:property value="#f.sellName" /></td> --%>
<%-- 				<td><s:property value="#f.buyName" /></td> --%>
<%-- 				<td><s:property value="#f.fstate" /></td> --%>

<%--                 <s:if test="#f.fstate == '退货中' "> --%>
<%-- 				<td><a href="manFormAction_passBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />">强制退货</a></td> --%>
<%-- 				<td><a href="manFormAction_refuseBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />">拒绝退货</a></td> --%>
<!--                 <td> -->
<%--                     <span id="backreason">退货理由</span> --%>
<%--                     <input type="hidden" name="" id="hid_reason" value="<s:property value="#f.reason" />" /> --%>
<!--                 </td> -->
<%-- 				</s:if> --%>
<%-- 				<s:elseif test="#f.fstate == '卖家拒绝退货' "> --%>
<%-- 					    <td><a href="manFormAction_passBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />">强制退货</a></td> --%>
<%-- 				<td><a href="manFormAction_refuseBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />">拒绝退货</a></td> --%>
<!--                 <td> -->
<%--                     <span id="backreason">退货理由</span> --%>
<%--                     <input type="hidden" name="" id="hid_reason" value="<s:property value="#f.reason" />" /> --%>
<!--                 </td> -->
<%-- 			    </s:elseif> --%>
<!-- 			</tr> -->
<%-- 		</s:iterator> --%>
<!-- 	</table> -->
<!-- 	<br> -->
<%-- 	<span> 当前页： <s:property value="currPage" />/<s:property value="totalPage" />&nbsp;&nbsp; 总记录数：<s:property value="totalCount" />&nbsp;&nbsp; --%>
<%-- 	</span> --%>
<%-- 	<span>  --%>
<%-- 	  <s:if test="currPage != 1"> --%>
<!-- 			<a href="manFormAction_findAllForm.action?currPage=1">[首页]</a>&nbsp;&nbsp; -->
<%--             <a href="manFormAction_findAllForm.action?currPage=<s:property value="currPage-1"/>">[上一页]</a> --%>
<%--       </s:if> --%>
<%-- 	  <s:if test="currPage != totalPage"> --%>
<%-- 			<a	href="manFormAction_findAllForm.action?currPage=<s:property value="currPage+1" />">[下一页]</a>&nbsp;&nbsp; --%>
<%--             <a href="manFormAction_findAllForm.action?currPage=<s:property value="totalPage" />">[尾页]</a> --%>
<%-- 	  </s:if> --%>
<%-- 	</span> --%>
<div id="manageAllForms">

          <s:iterator value="list" var="f" status="L">
			<ul id="ul_body">
				<li class="ul1_li1"><s:property value="#f.goodName" /></li>
				<li class="ul1_li2"><s:property value="#f.totalPrice" />￥</li>
				<li class="ul1_li3">商品数量：<s:property value="#f.fnumber" />件</li>
				<li class="ul1_li3">订单号：<s:property value="#f.formId" /></li>
				<li class="ul1_li3">卖家:<s:property value="#f.sellName" /></li>
				<li class="ul1_li3">买家:<s:property value="#f.buyName" /></li>
				<li class="ul1_li4"><s:property value="#f.fstate" /></li>
				
				<s:if test="#f.fstate == '退货中' ">
					<li class="ul1_li5">
					       <a href="manFormAction_passBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />">强制退货</a>
					</li>
					<li class="ul1_li6">
					          <a href="manFormAction_refuseBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />">拒绝退货</a>
					</li>
					<li class="ul1_li7">
					        <span id="ul_body_span">退款理由</span>
					        <input type="hidden" name="" id="hid_reason" value="<s:property value="#f.reason" />" /> 
					</li>
				</s:if>
				<s:elseif test="#f.fstate == '卖家拒绝退货' ">
					<li class="ul1_li5">
					       <a href="manFormAction_passBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />">强制退货</a>
					</li>
					<li class="ul1_li6">
					          <a href="manFormAction_refuseBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />">拒绝退货</a>
					</li>
					<li class="ul1_li7">
					        <span id="ul_body_span">退款理由</span>
					        <input type="hidden" name="" id="hid_reason" value="<s:property value="#f.reason" />" /> 
					</li>
				</s:elseif>
				<s:else>
				    <li class="ul1_li5">
					      
					</li>
					<li class="ul1_li6">
					         
					</li>
					<li class="ul1_li7">
					      
					</li>
				
				</s:else>
				
			</ul>
		</s:iterator> 
		
		
			<div id="per_goodlist_down">				
				<span id="down_first">当前页：&nbsp; <s:property value="currPage" />/<s:property value="totalPage" />&nbsp;&nbsp;总记录数：&nbsp;<s:property value="totalCount" />&nbsp;&nbsp;&nbsp;</span>
				<div id="down_inner">
					<span id="down_second">
					<s:if test="currPage != 1">
						<a class="second_a" href="manFormAction_findAllForm.action?currPage=1">首页</a>&nbsp;&nbsp;<a class="second_a" href="manFormAction_findAllForm.action?currPage=<s:property value="currPage-1"/>">上一页</a>&nbsp;&nbsp;
					</s:if>
					  <s:elseif test="currPage != totalPage">	
						<a class="second_a" href="manFormAction_findAllForm.action?currPage=<s:property value="currPage+1" />">下一页</a>&nbsp;&nbsp;<a class="second_a" href="manFormAction_findAllForm.action?currPage=<s:property value="totalPage" />">尾页</a>
					  </s:elseif>
					</span>
				</div>				
			</div>
		</div>
</body>
</html>