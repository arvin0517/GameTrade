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
<title>填写商品信息</title>
<style type="text/css">
			
			#sellGood{
				
				background: #F2F2F2;
				margin: 85px auto;
				width: 550px;
				height: 500px;
				/*border: 1px solid;*/
				border-radius: 5px;
				position: relative;
				
				
			}
			
			#status{
				
				color: white;
				width: 280px;
				height: 30px;
				
				border: 1px solid deepskyblue;
				border-radius: 5px;
				background: deepskyblue;
				outline-color: #0BB6BD;
				cursor: pointer;
				
				
			}
			
			#sell_title{
				
				position: absolute;
				top:-10px;
				left: 70px;
			}
			
			#sell_ul1{
				
				list-style: none;
                width: 200px;
                height: 350px;
               /* border: 1px solid;*/
                margin: 40px 0 0 0;
                float: left;
				padding: 0;
			}
			
			#sell_ul1 li{
				
				border: 1px solid #0BB6BD;
				margin: 20px 0 0 20px;
				height: 40px;
				line-height: 40px;
				font-size: 14px;
				text-align: center;
				border-radius: 4px;
				background: #0BB6BD;
				color: white;
				
			}
			
			#sell_ul2{
				
				list-style: none;
                width: 320px;
                height: 350px;
               /* border: 1px solid;*/
                margin: 40px 20px 0 0;
                float: right;
				padding: 0;
				
			}
			
			#sell_ul2 li{
				
			    border: 1px solid #0BB6BD;
				margin: 20px 0 0 5px;
				height: 40px;
				line-height: 40px;
				font-size: 14px;
				text-align: center;
				border-radius: 4px;
				background: #0BB6BD;
				color: white;
				
		
			}
			
			#sell_ul2 li .sell_text{
				
				width: 280px;
				height: 30px;
				border: 0;
				border-radius: 4px;
				padding: 0 0 0 10px;
				color: #0BB6BD;
				margin: 2px 0 0 0;
				
			}
			
			#sell_submit{
				
				display: block;
				float: right;
				width: 315px;
				height: 40px;
				border: 0;
				border-radius: 4px;
				color: white;
				font-size: 15px;
				margin: 0 20px 0 0;
				background: #FF4500;
				outline: none;
				cursor: pointer;
					
			}
			
			#sell_submit:active{
				
				background: orange;
			}
								
			#sell_fanhui_img{
				
				position: absolute;
				top: 10px;
				left: 15px;
			}
			
			#sell_h6{
				
				display: block;
				float: right;
				clear: both;
				font-weight: 400;
				color: orangered;
				margin: 5px 20px 0 0;
			}
			
		</style>
		<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
		<script type="text/javascript">
			
			$(document).ready(function(){
				
				var money = 0;
				var usercash = parseFloat($("#usercash").val());
				
				$("#sell_h6").click(function(){
					
					alert($("#gprice").val() * 0.05+ "  :  money: "+money + "  usercash: " +usercash);
					alert("押金#tempcash:  " + $("#tempcash").val());
					alert(money>usercash);
				});
				
				$("#gprice").focus(function(){
					
					$("#sell_submit").val("请求上架");
					$("#sell_submit").removeAttr("disabled");
					
					$("#gprice").blur(function(){
						
						 money =   parseFloat(($("#gprice").val() * 0.05).toFixed(2)) ;
						if(money>usercash){
							
							$("#sell_submit").val("余额不足，无法上架");
							
							$("#sell_submit").attr("disabled","disabled");
						}
						
						$("#tempcash").val(money);
					});
					
					
				});
				
				
				$("#gprice").keydown(function(ev){
					
					var oEvent = ev||event;
					
					if(oEvent.keyCode!=8 && (oEvent.keyCode<48 || oEvent.keyCode>57)){
						
						return false;
					}
					
				});
				
				$("#savenum").keydown(function(ev){
					
					var oEvent = ev||event;
					
					if(oEvent.keyCode!=8 && (oEvent.keyCode<48 || oEvent.keyCode>57)){
						
						return false;
					}
					
				});
				
				$("#goldNum").keydown(function(ev){
					
					var oEvent = ev||event;
					
					if(oEvent.keyCode!=8 && (oEvent.keyCode<48 || oEvent.keyCode>57)){
						
						return false;
					}
					
				});
				
			});
			
		</script>
</head>
<body>
<!-- <a href="sellGoodsAction_saveGood.action">haha</a> -->
 <s:form action="sellGoodsAction_saveGood.action" namespace="/" theme="simple">
<!--   <table border="1"> -->
<!--      <tr> -->
<!--        <td>商品名称：</td> -->
<!--        <td><input  type="text" name="gname"/></td> -->
<!--      </tr>  -->
<!--      <tr> -->
<!--        <td>商品价格：</td> -->
<!--        <td><input  type="text" name="gprice"/></td> -->
<!--      </tr> -->
<!--      <tr> -->
<!--        <td>商品数量：</td> -->
<!--        <td><input  type="text" name="savenum"/></td> -->
<!--      </tr> -->
<!--      <tr> -->
<!--        <td>销售的金币数量：</td> -->
<!--        <td><input  type="text" name="goldNum"/></td> -->
<!--      </tr> -->
<!--      <tr> -->
<!--        <td>游戏类型：</td> -->
<%--        <td> <s:select name="ggtypeTid" list="list"  listKey="tid" listValue="typename" headerKey="" headerValue="--请选择--" /></td> --%>
<!--      </tr> -->
<!--      <tr> -->
<!--         <td colspan="2"><input type="submit" value="上架"/></td> -->
<!--      </tr> -->
<!--   </table> -->
<%--    <s:select name="" list="list"  listKey="tid" listValue="typename" headerKey="" headerValue="--请选择--" /> --%>


<a href="mainFrame.jsp"><img id="sell_title" src="img/sellGood_title.png"/></a>
		<div id="sellGood">
		  <input type="hidden" name="usercash" id="usercash" value="${existUser.existCash}" />
		  <input type="hidden" name="deposit" id="tempcash" value="" />
		    <a href="javaScript:history.go(-1)"><img id="sell_fanhui_img" src="img/sellGood_fanhui.png"/></a>
		    <ul id="sell_ul1">
		    	<li>商品名称：</li>
		    	<li>商品价格：</li>
		    	<li>商品数量：</li>
		    	<li>销售的金币数量：</li>
		    	<li>游戏类型：</li>
		    </ul>
		    <ul id="sell_ul2">
		    	<li><input class="sell_text" type="text" name="gname"  /></li>
		    	<li><input class="sell_text"  type="text" name="gprice" id="gprice" /></li>
		    	<li><input class="sell_text"  type="text" name="savenum" id="savenum" /></li>
		    	<li><input class="sell_text"  type="text" name="goldNum" id="goldNum" /></li>
		    	<li>
<%-- 		    		<select id="status" class="form-control valid" onchange="" name="status"> --%>
<!-- 					    <option value=""></option> -->
<!-- 					    <option value="0">未审核</option> -->
<!-- 					    <option value="1">初审通过</option> -->
<!-- 					    <option value="2">复审通过</option> -->
<!-- 					    <option value="3">审核不通过</option> -->
<%-- 				    </select> --%>
                  <s:select id="status" name="ggtypeTid" list="list"  listKey="tid" listValue="typename" headerKey="" headerValue="-----请选择-----" />
		    	</li>
		    </ul>
		    <input id="sell_submit" type="submit" value="请求上架"/>
		    <h6 id="sell_h6">每一件上架的商品收取该商品价格5%的押金</h6>
		</div>

</s:form>
</body>
</html>