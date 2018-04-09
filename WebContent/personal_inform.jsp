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
<title>Insert title here</title>
<style type="text/css">
			#personal_inform{
				
					/*float: left;*/
					margin: 0 auto;
                    width: 800px;
                    height: 530px;
                   /* background: cadetblue;*/
                   border: 1px solid white;
			}
			
			.inform_center{
				
				margin: 60px auto;
				width: 500px;
				height: 400px;
				/*border: 1px solid seagreen;*/
			}
			
			#center_span{
				
			   	display: block;
			   	margin: 0 auto 30px;
			    width: 450px;
			    height: 40px;
			    line-height: 40px;
			    /*border: 1px solid rosybrown;*/
			    font-size: 14px;
			    font-family:  "微软雅黑";
			}
			
			.in1{
				
			    height: 30px;
			    width: 200px;
			    outline: none;
			    padding-left:20px ;
			    font-size: 15px;
			    color: #FF6600;
			    background: white;
			    border: 1px solid;
			    border: 0;
			}
			
			.in2{
				
			    height: 30px;
			    width: 200px;				
				padding-left:20px ;
			    font-size: 15px;
			    color: deepskyblue;
			    border: 1px solid deepskyblue;
			    border-radius: 3px;
			}
			
			#center_button{
				
				float: right;
				width: 200px;
				height: 35px;
				/*border: 1px solid saddlebrown;*/
				margin:  5px 50px 0 10px;
			}
			
			#bt_edit1{
				
				cursor: pointer;
				width: 55px;
				height: 30px;
				background: orange;
				outline: none;
				
				border: 0;
				color: white;
				border-radius: 5px;
				margin-right: 5px;
			}
			#bt_edit1:active{
				
				background: orangered;
			}
			
			.bt_edit2{
				
				cursor: pointer;
				width: 55px;
				height: 30px;
				background: orchid;
				outline: none;
				border: 0;
				color: white;
				border-radius: 5px;
				margin-right: 5px;
			}
			.bt_edit2:active{
				
				background: mediumorchid;
			}
			
			.bt_disabled{
				
				cursor: pointer;
				width: 55px;
				height: 30px;
				background: grey;
				outline: none;
				border: 0;
				color: white;
				border-radius: 5px;
				margin-right: 5px;
				
			}
			
			#bt_edit3{
				
				cursor: pointer;
				display: block;
				float: right;
				width: 55px;
				height: 30px;
				line-height: 30px;
				background: cornflowerblue;
				text-align: center;
				text-decoration: none;
				color: white;
				border-radius: 5px;
				font-size: 13.5px;
				margin-right: 15px;
			}
			#bt_edit3:active{
				
				background: blue;
			}
			
			h5{	  	
			  	 display: block;
			  	 float: right;
			  	 /*border: 1px solid;*/
			  	 background: url(img/hongcha.jpg) no-repeat;
			  	 background-position-y: center;
			  	 height: 20px;
			  	 line-height: 20px;
			  	 font-size: 13px;
			  	 color: crimson;
			  	 padding-left: 20px; 
			  	 margin:10px 20px 0 0;       	  	
	       }
	       
	       .phone_img{
	       	
	       	 display: none;
	       }
	       .h5_phone{
	       	
	       	  display: none;
	       }
	       
	       .trade_img{
	       	
	       	 display: none;
	       }
	       .h5_trade{
	       	
	       	  display: none;
	       }
		</style>
		<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
		<script type="text/javascript">
			$(document).ready(function(){
								
				//alert($("input.in1").attr("disabled"));				
				$("input.in1").attr("disabled","disabled");
				//alert($("input.in1").attr("disabled"));
				//$("input.in1").removeAttr("disabled");
				$("#bt_edit1").click(function(){
					
				   $("input#input_phone").removeClass().addClass("in2")
				   $("input#input_phone").removeAttr("disabled");
				   
				   $("input#input_trade").removeClass().addClass("in2")
				   $("input#input_trade").removeAttr("disabled");
					
				});			
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				var cash = parseFloat($("#existCash").val());
				var newcash = cash.toFixed(2);
				$("#existCash").val(newcash+"¥");
				
				
				var attr3 = /^1[3|4|5|7|8]\d{9}$/;
				var attr4 = /^\d{6,11}$/;
				var checkPhone = true;
				var checkTrade = true;
				
				$("#bt_save").attr("disabled","disabled");
				
//				$("#bt_save").click(function(){
//					
//					alert(" ");
//				});
				
				//验证手机号
				$("#input_phone").focus(function(){
				 				 	
				 	$(".h5_phone").text("");
				 	$(".phone_img").hide();
				 	$(".h5_phone").hide();
				 	
				 	
				 	$(this).keyup(function(){
				 		
				 		if($("#input_phone").val()==null||$("#input_phone").val()==""){
				 			
				 			
				 			$(".h5_phone").text("手机号不能为空！");
				 			$(".h5_phone").show();
				 			$(".phone_img").hide();
				 			$("#bt_save").attr("disabled","disabled");
				 			$("#bt_save").removeClass().addClass("bt_disabled");
				 			
				 		}else if(!attr3.test($("#input_phone").val())){
				 			
				 			$(".h5_phone").text("请输入正确的手机号");
				 			$(".h5_phone").show();
				 			$(".phone_img").hide();
				 			$("#bt_save").attr("disabled","disabled");
				 			$("#bt_save").removeClass().addClass("bt_disabled");

				 		}else{
				 			
				 			checkPhone = true;
				 			$(".phone_img").show();
				 			$(".h5_phone").hide();
				 			if(checkPhone==true&&checkTrade==true){
				 				
				 				//alert("check")
				 				$("#bt_save").removeAttr("disabled")
				 			    $("#bt_save").removeClass().addClass("bt_edit2");
				 			}
				 			
				 		}
				 	});
				 		
				 });
				 
				 //验证交易账号
				    $("#input_trade").focus(function(){
				 				 	
				 	$("#ip5_span").text("");
				 	$(".trade_img").hide();
				 	$(".h5_trade").hide();
				 	
				 	$(this).keyup(function(){
				 		
				 		if($("#input_trade").val()==null||$("#input_trade").val()==""){
				 			
				 			$(".h5_trade").text("交易账户不能为空！");
				 			$(".h5_trade").show();
				 			$(".trade_img").hide();
				 			
				 		}else if(!attr4.test($("#input_trade").val())){
				 			
				 			$(".h5_trade").text("请输正确的交易号码");
				 			$(".h5_trade").show();
				 			$(".trade_img").hide();
				 			$("#bt_save").attr("disabled","disabled");
				 			$("#bt_save").removeClass().addClass("bt_disabled");
				 			
				 			
				 		}else{
				 			
				 			$(".trade_img").show();
				 			$(".h5_trade").hide();
				 			checkTrade = true;
				 			if(checkPhone==true&&checkTrade==true){
				 				
				 				//alert("check")
				 				$("#bt_save").removeAttr("disabled")
				 			    $("#bt_save").removeClass().addClass("bt_edit2");
				 			}
				 			
				 		}
				 	});
				 		
				 });
				
				
			});
			
		</script>
</head>
<body>
<div id="personal_inform">
<s:form action="editUserAction_editForPAT" name="editform" namespace="/" theme="simple">
			<div id="center_button">
					<input type="button" name="bt_edit" id="bt_edit1" value="编辑" />
					<input type="submit" name="bt_edit" class="bt_disabled" id="bt_save" value="保存" />
					<!--<input type="button" name="bt_edit" id="bt_edit3" value="重置" />-->
					<a id="bt_edit3"  href="personal_inform.jsp">重置</a>
		    </div>
			<div class="inform_center">				
				<span id="center_span">用户名称:&nbsp;&nbsp;<input class="in1" type="text" name="uname" value="${existUser.uname}" /></span>
				<span id="center_span">信誉积分:&nbsp;&nbsp;<input class="in1" type="text" name="uname" value="${existUser.credit}" /></span>
				<span id="center_span">账号余额:&nbsp;&nbsp;<input class="in1" type="text" name="uname" value="${existUser.existCash}¥" id="existCash" /></span>
				<span id="center_span">手机号码:&nbsp;&nbsp;<input id="input_phone" class="in1" type="text" name="editPhone" value="${existUser.phone}" /><img class="phone_img" src="img/dagou.png" alt="" /><h5 class="h5_phone">请输入正确的手机号</h5></span>
				<span id="center_span">交易账号:&nbsp;&nbsp;<input id="input_trade" class="in1" type="text" name="editTradeNum" value="${existUser.tradeNum}" /><img class="trade_img" src="img/dagou.png" alt="" /><h5 class="h5_trade">交易账号不能为空</h5></span>
				<span id="center_span">注册时间:&nbsp;&nbsp;<input class="in1" type="text" name="uname" value="${existUser.regTime}" /></span>				
			</div>
</s:form>
</div>
</body>
</html>