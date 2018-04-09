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
<title>欢迎注册</title>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<script type="text/javascript">
window.onload = function(){
	
	var cBox = document.getElementById("cb");
	var sub = document.getElementById("reg_sub");
	//alert(cBox.checked);
	var ch = 1;
	cBox.onclick = function(){
		
		if(ch%2==0){
			
                   //  alert(this.checked);
			this.checked = false;
			sub.style.background="gray";
			sub.disabled=true;
			ch++;
			
		}else{
			
		//	alert(this.checked);
			this.checked = true;
			sub.style.background="#f58915";
		//	sub.onmspointerhover
			sub.disabled=false;
			ch++
		}
		
	}
	
	sub.onmouseover = function(){
		
		if(ch%2==0){
			
			sub.style.background = "orangered";
			
		}else{
			
			sub.style.background = "gray";
		}
		
	}
	
	sub.onmouseout = function(){
		
		if(ch%2==0){
			
			sub.style.background = "#f58915";
			
		}else{
			
			sub.style.background = "gray";
		}
		
	}
}
</script>
<style type="text/css">
#register{
	
   	width: 1325px;
   	height:800px;
       /*border: 1px solid red;*/
   	margin: 0 auto;				
}

#up{
 	
 width: 1325px;
    height: 128px;
    /*border: 1px solid orange;*/
}
     #up img{
     	
     	margin-left: 128px;
     	float: left;
     }			
     #up h2{
     	  float: left;
     	  color: orangered;
     	  font-family: "微软雅黑" sans-serif;
     	  border-left:1px solid orangered ;
     	  margin-top: 50px;
     	  margin-left: 30px;
     	  padding-left: 30px;
     }
     
     #up p{
     	
     	font-weight: 350;
     	float: right;
     	font-size: 20px;
     	font-family: "微软雅黑" sans-serif;        	
      margin-top: 50px;
     	margin-right: 200px;      	
     }
     #up a{
     	

     	text-decoration: none;
     	color: orangered;
     }
     
     #up a:visited{
     	color:orangered
     }
     #up a:hover{
     	color: orange;
     }
     
     #center{
 	height: 675px;
 	width: 1325;       	
      background-image: url(img/reg_bg3.jpg);
     }
     
     #center_reg{
     	
     	width: 570px;
     	height: 630px;
     /*	border: 1px solid blue;*/
     	background: white;
     	margin: 60px auto;
     	border-radius: 3px;
     	opacity: 0.85;
     	/*position: absolute;*/
     	
     }
     #center_reg h3{
     	
     	/*border: 1px solid red;*/
     	height: 75px;
     	width: 200px;
     	float: left;
     	font-family: simhei sans-serif;
     	font-weight: 400;
     	margin: 0;
     	padding-left: 50px;
     	padding-top: 20px;
     	color: orangered;
     	
     }
     
     .ip1{
     	
     	 height: 40px;
     	 width: 400px;
     	 padding: 0 0 0 40px;
     	 margin: 2px 0 0 65px;
     	 font-size: 15px;
       border:1px solid orangered;
       border-radius: 3px;
       color: darkgray;
       background: url(img/login_user.png) no-repeat;
     }
     
      .ip2{
     	
     	 height: 40px;
     	 width: 400px;
     	 padding: 0 0 0 40px;
     	 margin: 25px 0 0 65px;
     	 font-size: 15px;
       border:1px solid orangered;
       border-radius: 3px;
       color: darkgray;
       background: url(img/login_pw.png) no-repeat;
     }
     
     .ip5{
     	
     	 height: 40px;
     	 width: 400px;
     	 padding: 0 0 0 40px;
     	 margin: 25px 0 0 65px;
     	 font-size: 15px;
       border:1px solid orangered;
       border-radius: 3px;
       color: darkgray;
       background: url(img/login_pw.png) no-repeat;
     }
      .ip3{
     	
     	 height: 40px;
     	 width: 400px;
     	 padding: 0 0 0 40px;
     	 margin: 25px 0 0 65px;
     	 font-size: 15px;
       border:1px solid orangered;
       border-radius: 3px;
       color: darkgray;
       background: url(img/login_ph.png) no-repeat;
     }
      .ip4{
     	
     	 height: 40px;
     	 width: 400px;
     	 padding: 0 0 0 40px;
     	 margin: 25px 0 0 65px;
     	 font-size: 15px;
       border:1px solid orangered;
       border-radius: 3px;
       color: darkgray;
       background: url(img/login_num.png) no-repeat;
     }
     
     #center_reg p{
     	
     	  text-align: center;
     	  font-size: 15px;
     	  font-family: "微软雅黑" sans-serif;
     	  margin-top: 40px;
     }
     
     #center_reg a{
     	
     	font-size: 17px;
      text-decoration: none;
     	color: orangered;      	
     	
     }
     
     #center_reg a:visited{
     	  color: orangered;
     }
     #center_reg a:hover{
     	  color: orange;
     	  text-decoration: underline;
     }
     
   #reg_sub{	  	
     	height: 40px;
     	width: 440px;
 	line-height: 40px;
   margin-top: 20px;
      margin-left: 66px;
      font-size: 18px;
      font-family:"微软雅黑";
      color: white;
      border: 0;
      outline: none;
      /*background:  #f58915;*/
      background: gray;
      border-radius: 3px;
      cursor:pointer;
      display: none;
 }
 
 /*#reg_sub:hover{
 	background: orangered;
 }*/
 span{
 	
 	 display: block;
 	 float: left;
 	/* border: 1px solid;*/
 	 background: url(img/hongcha.jpg) no-repeat;
 	 background-position-y: 2px;
 	 font-size: 13px;
 	 color: crimson;
 	 margin:  0 0 0 70px;
 	 padding-left: 20px;
        	  	
 }
 /*#ip1_span{
 	
 	display: none;
 }*/
 /*#ip2_span{
 	
 	display: none;
 }*/
 /*#ip3_span{
 	display: none;
 }*/
 /*#ip4_span{
 	display: none;
 }*/
 /*#ip5_span{
 	display: none;
 }*/
 
 #ip1_img{
 	
 	display: none;
 }
 #ip2_img{
 	
 	display: none;
 }
 #ip3_img{
 	display: none;
 }
 #ip4_img{
 	display: none;
 }
 #ip5_img{
 	display: none;
 }
</style>
<script type="text/javascript">
		
//请输入5-20个字符：包括字母、数字、下划线，且首字符为字母		
		$(document).ready(function(){
			
			  var attr1 = /^[a-z]\w{4,19}$/;
			  var attr2 = /^.{6,20}$/;
			  var attr3 = /^1[3|4|5|7|8]\d{9}$/;
			// alert(attr1.test("aaa123"));
			
			//检验用户名
			 $(".ip1").focus(function(){
				 
				$("#reg_sub").hide();
			 		
			 	$("#ip1_span").text("");
			 	$("#ip1_img").hide();
			 	$(this).blur(function(){
			 		
			 		if($(".ip1").val()==null||$(".ip1").val()==""){
			 			
			 			$("#ip1_span").text("用户名不能为空！");
			 			
			 		}else if(!attr1.test($(".ip1").val())){
			 			
			 			$("#ip1_span").text("用户名不符规范！请输入5-20个字符（字母、数字、下划线，且首字符为字母）");

			 		}else{
			 			
			 		//	$("#ip1_img").show();
			 		  
			 		  var cn = $(".ip1").val();
			 		  //alert(cn);
			 			$.ajax({ 
					        
							   //这里的需要Struts.xml的<action/>的name属性一致。
						       url:'registerAction_checkUserByName.action',
						       
						       //提交类型
						       type:'POST',
						       
						       //提交数据给Action传入数据 
						       data:{'checkName':cn}, 
						       
						       //返回的数据类型
						       dataType:'json', 
						       
						       
						       //成功是调用的方法
						       success:function(data){ 
						    	 // alert(data);
						    	  //alert(data.result);
						    	   //获取Action返回的数据用  data.Action中的属性名 获取
						    	  // alert("data:"+data);
						    	   
						          if(data=="false")
						          {
						        	  $("#ip1_img").show();
						        	  
						        	  if($("#ip1_img").css("display")=="inline"&&$("#ip2_img").css("display")=="inline"&&$("#ip5_img").css("display")=="inline"&&$("#ip3_img").css("display")=="inline"&&$("#ip4_img").css("display")=="inline"){
							 				
							 				$("#reg_sub").show();
							 			}
						        	  
						          }else if(data=="true"){
						        	  
						        	  $("#ip1_span").text("该用户名已被注册！"); 
						          }
						          }
						     });
			 		}
			 	});
			 		
			 });
			 
			 //检验密码
			   $(".ip2").focus(function(){
				   
				$("#reg_sub").hide();
			 				 	
			 	$("#ip2_span").text("");
			 	$("#ip2_img").hide();
			 	
			 	
			 	$(".ip5").val("");  //“再次输入密码的文本框”清空
			 	$("#ip3_span").text("");
			 	$("#ip5_img").hide();
			 	
			 	$(this).blur(function(){
			 		
			 		if($(".ip2").val()==null||$(".ip2").val()==""){
			 			
			 			$("#ip2_span").text("登录密码不能为空！");
			 			
			 		}else if(!attr2.test($(".ip2").val())){
			 			
			 			$("#ip2_span").text("密码长度为6-20位，字母请区分大小写");

			 		}else{
			 			
			 			$("#ip2_img").show();
			 			
			 			if($("#ip1_img").css("display")=="inline"&&$("#ip2_img").css("display")=="inline"&&$("#ip5_img").css("display")=="inline"&&$("#ip3_img").css("display")=="inline"&&$("#ip4_img").css("display")=="inline"){
			 				
			 				$("#reg_sub").show();
			 			}
			 		}
			 	});
			 		
			 });
			 
			 //再次检验密码
			 $(".ip5").focus(function(){
				 
				$("#reg_sub").hide();
			 				 	
			 	$("#ip3_span").text("");
			 	$("#ip5_img").hide();
			 	
			 	$(this).blur(function(){
			 		
			 		if($(".ip5").val()==null||$(".ip5").val()==""){
			 			
			 			$("#ip3_span").text("再次输入密码不能为空！");
			 			
			 		}else if($(".ip2").val()!=$(".ip5").val()){
			 			
			 			$("#ip3_span").text("两次输入密码不一致！");

			 		}else{
			 			
			 			$("#ip5_img").show();
			 			
			 			if($("#ip1_img").css("display")=="inline"&&$("#ip2_img").css("display")=="inline"&&$("#ip5_img").css("display")=="inline"&&$("#ip3_img").css("display")=="inline"&&$("#ip4_img").css("display")=="inline"){
			 				
			 				$("#reg_sub").show();
			 			}
			 		}
			 	});
			 		
			 });
			 
			 //检验手机号
			 $(".ip3").focus(function(){
				 
			    $("#reg_sub").hide();
			 				 	
			 	$("#ip4_span").text("");
			 	$("#ip3_img").hide();
			 	
			 	$(this).blur(function(){
			 		
			 		if($(".ip3").val()==null||$(".ip3").val()==""){
			 			
			 			$("#ip4_span").text("手机号不能为空！");
			 			
			 		}else if(!attr3.test($(".ip3").val())){
			 			
			 			$("#ip4_span").text("请输入正确的手机号码");

			 		}else{
			 			
			 			$("#ip3_img").show();
			 			
			 			if($("#ip1_img").css("display")=="inline"&&$("#ip2_img").css("display")=="inline"&&$("#ip5_img").css("display")=="inline"&&$("#ip3_img").css("display")=="inline"&&$("#ip4_img").css("display")=="inline"){
			 				
			 				$("#reg_sub").show();
			 			}
			 		}
			 	});
			 		
			 });
			 
			 //检验交易账号
			$(".ip4").focus(function(){
				
				$("#reg_sub").hide();
			 				 	
			 	$("#ip5_span").text("");
			 	$("#ip4_img").hide();
			 	
			 	$(this).blur(function(){
			 		
			 		if($(".ip4").val()==null||$(".ip4").val()==""){
			 			
			 			$("#ip5_span").text("交易账户不能为空！");
			 			
			 		}else{
			 			
			 			$("#ip4_img").show();
			 			
			 			if($("#ip1_img").css("display")=="inline"&&$("#ip2_img").css("display")=="inline"&&$("#ip5_img").css("display")=="inline"&&$("#ip3_img").css("display")=="inline"&&$("#ip4_img").css("display")=="inline"){
			 				
			 				$("#reg_sub").show();
			 			}
			 		}
			 	});
			 		
			 });
			
		});
		
	</script>
</head>
<body>
	  <div id="register">
	  	<div id="up">
             <img src="img/login_2.png" />
             <h2>欢迎注册<a href="registerAction_registerGo.action"></a></h2>
             <p>已有账号，<a href="loginUser.jsp">请登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="mainFrame.jsp">JYG首页</a></p>
	  	</div>
	  	<div id="center">
	  	     <s:form action="registerAction_saveUser" name="saveform" namespace="/" theme="simple">
	  		<div id="center_reg">
	  		  <h3>用户注册<br/>USER&nbsp;REGISTRATION</h3>
	  		  <img src="img/logo2.png" style="float: right;" />
	  		  <input class="ip1" type="text" name="uname" placeholder="请输入用户名"/><img id="ip1_img" src="img/dagou.png" alt="" />
	  		  <span id="ip1_span"></span>
	  		  <input class="ip2" type="password" name="password" placeholder="请设置登录密码"/><img id="ip2_img" src="img/dagou.png" alt="" />
	  		  <span id="ip2_span"></span>
              <input class="ip5" type="password" name="checkPassword" placeholder="请再次设置登录密码"/><img id="ip5_img" src="img/dagou.png" alt="" />
              <span id="ip3_span"></span>
              <input class="ip3" type="text" name="phone" placeholder="请输入手机号"/><img id="ip3_img" src="img/dagou.png" alt="" />
              <span id="ip4_span"></span>
              <input class="ip4" type="text" name="tradeNum" placeholder="请输入交易账户"/><img id="ip4_img" src="img/dagou.png" alt="" />
              <span id="ip5_span"></span>
              <p><input id="cb" type="checkbox" style="float: none;" />我已阅读并同意<a onclick="alert('haha')" href="">《JYG用户服务协议》</a></p>
	  		  <input id="reg_sub" type="submit" value="注册" disabled="true" />
	  		</div>
	  		</s:form>
	  	</div>
	  </div>
</body>
</html>