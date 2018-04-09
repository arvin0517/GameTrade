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
			#personal_pw{
				
					/*float: left;*/
					margin: 0 auto;
                    width: 800px;
                    height: 530px;
                    /*background: bisque;	*/	
                    border: 1px solid white;		
			}
			
			#div_pw{
				
				width: 500px;
				height: 300px;
				margin: 50px auto;
				border: 1px solid salmon;
				border-radius: 5px;
				
				
			}
			
			#center_span{
				
			   	display: block;
			   	margin: 30px 0 0 70px;
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
				padding-left:20px ;
			    font-size: 15px;
			    color: #FF6600;
			    border: 1px solid #FF8100;
			    outline-color: #FF6600;
			    border-radius: 3px;
			}
			
			h5{	  	
			  	 display: block;
			  	 float: left;
			  	 /*border: 1px solid;*/
			  	 background: url(img/hongcha.jpg) no-repeat;
			  	 background-position-y: center;
			  	 height: 20px;
			  	 line-height: 20px;
			  	 font-size: 13px;
			  	 color: crimson;
			  	 padding-left: 20px; 
			  	 margin: 0 0 0 100px;
			  	     	  	
	       }
	       .old_img{
	       	
	       	display: none;
	       }
	       .h5_old{
	       	
	          display: none;
	       }
	       
	       .new_img{
	       	
	       	 display: none;
	       }
	       .h5_new{
	       	
	         display: none;
	       }
	       
	       #update_div{
	       	
	          	display: none;
	       }
	       
	       #center_button{
				
				clear: both;
				float: left;
				width: 150px;
				height: 35px;
				/*border: 1px solid saddlebrown;*/
				/*margin:  5px 50px 0 10px;*/
				margin: 50px 0 0 180px;
				display: none;
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
				background: orange;
				outline: none;
				border: 0;
				color: white;
				border-radius: 5px;
				margin-right: 5px;
			}
			.bt_edit2:active{
				
				background: orangered;
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
		</style>
		<script src="myjs/jquery-3.2.1.js" type="text/javascript"></script>
		<script type="text/javascript">
			
			$(document).ready(function(){
				
				 var truePass = $("#exist_pw").val();
				 var attr2 = /^.{6,20}$/;
				 //var oldcheck = false;
				 var newcheck = false;
				 var btcheck = false;
				 
				 //检查旧密码
				  $("#input_old").focus(function(){
				 				 	
				 	$(".h5_old").text("");
				 	$(".h5_old").hide();
				 	$(".old_img").hide();
				 	
				 	$(this).keyup(function(){
				 		
				 		if($("#input_old").val()!=truePass){
				 			
				 			//alert("123");
				 			$(".h5_old").text("密码错误！");
				 			$(".h5_old").show();
				 		    $(".old_img").hide();				 		    
                            $("#update_div").hide();
                            $("#center_button").hide();
                            
                            
                            $("#input_new").val("");
                            $(".h5_new").text("");
				 	        $(".h5_new").hide();
				 	        $(".new_img").hide();
				 		    
				 		}else{
				 			
				 			$(".old_img").show();
				 			$(".h5_old").hide();
				 			$("#update_div").show();
				 			
				 		}
				 	});
				 		
				 });
				 
				 //检查新密码
				$("#input_new").focus(function(){
				 				 	
				 	$(".h5_new").text("");
				 	$(".h5_new").hide();
				 	$(".new_img").hide();
				 	
				 	$(this).keyup(function(){
				 		
				 		if($("#input_new").val()==$("#input_old").val()){
				 			
				 			$(".h5_new").text("与旧密码相同！");
				 			$(".h5_new").show();
				 			$(".new_img").hide();
				 			$("#center_button").hide();
				 			
				 		}else if($("#input_new").val()==null||$("#input_new").val()==""){
				 			
				 			$(".h5_new").text("登录密码不能为空！");
				 			$(".h5_new").show();
				 			$(".new_img").hide();
				 			$("#center_button").hide();
				 			
				 		}else if(!attr2.test($("#input_new").val())){
				 			
				 			$(".h5_new").text("密码长度为6-20位，字母请区分大小写");
				 			$(".h5_new").show();
				 			$(".new_img").hide();
				 			$("#center_button").hide();

				 		}else{
				 			
				 			$(".h5_new").hide();
				 			$(".new_img").show();
				 			$("#center_button").show();
				 		}
				 	});
				 		
				 });
				 
				 
				$("#bt_edit").click(function(){
					
					   
					
					
				});
			});
		</script>
</head>
<body>
<div id="personal_pw">
<s:form action="editUserAction_editForPass" method="post" namespace="/" theme="simple">
			<input type="hidden" name="" id="exist_pw" value="${existUser.password}" />
			<div id="pw_up">
				<div id="div_pw">
					<span id="center_span">请输入旧密码:&nbsp;&nbsp;<input id="input_old" class="in1" type="password" name="oldpassword" value="" />
					     <img class="old_img" src="img/dagou.png" alt="" />
					     <h5 class="h5_old"></h5>
					</span>
					<div id="update_div">
						<span id="center_span">请输入新密码:&nbsp;&nbsp;<input id="input_new" class="in1" type="password" name="editPassword" value="" />
					     <img class="new_img" src="img/dagou.png" alt="" />
					     <h5 class="h5_new"></h5>
					    </span>
					</div>
					<div id="center_button">
						<!--<input type="button" name="bt_edit" id="bt_edit1" value="编辑" />-->
						<input type="submit" name="bt_edit" class="bt_edit2" id="bt_save" value="保存" />
						<!--<input type="button" name="bt_edit" id="bt_edit3" value="重置" />-->
						<a id="bt_edit3"  href="personal_pw.jsp">取消</a>
		           </div>
				</div>
			</div>
			
</s:form>			
</div>
</body>
</html>