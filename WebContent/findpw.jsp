<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://" +request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<style type="text/css">
	#find_pw{
		
		margin: 20px auto;
		width: 350px;
		height: 400px;
		/*border: 1px solid ;*/
		background: #F2F2F2;
		border-radius: 7px;
		/*position: absolute;*/
	}
	
	.find_text{
		
		width: 295px;
		height: 43px;
	    margin: 15px 0 0 20px;
	    border: 0;
	    border-radius: 5px;
	    padding: 0 0 0 15px;
	    outline-color: orangered;
		
	}
	
	#checkcode{
		
		width: 140px;
		height: 43px;
		border: 0;
		outline-color: orangered;
		margin: 25px 0 0 20px;
		border-radius: 5px;
		padding: 0 0 0 15px;
	}
	
	.getcode{
		
		width: 140px;
		height: 43px;
		border: 0;
		border-radius: 5px;
		margin: 0 0 0 10px;
		outline: none;
		cursor: pointer;
		color: white;
		background: orangered;
	}
	
	.getcode:active{
		
		
		background: darkorange;
		color: orangered;
	}
	
	.nogetcode{
		
		width: 140px;
		height: 43px;
		border: 0;
		border-radius: 5px;
		margin: 0 0 0 10px;
		outline: none;
		cursor: pointer;
		color: white;
		background: grey;
		
		
	}
	
	#getpw{
		
		width: 310px;
		height: 43px;
	    margin: 35px 0 0 20px;
	    border: 0;
	    border-radius: 5px;
	    color: white;
		background: orangered;
		outline: none;
		cursor: pointer;
		
	}
	
	#getpw:active{
		
		
		background: darkorange;
		color: orangered;
	}
	
	#showpw{
		
		display: none;
	}
	
	#find_a{
		
	   display: block;
	   float: left;	
	   margin: 15px 0 0 15px;
	}
	
	.find_h6{
		
		float: left;
		position: absolute;
		margin:  0 0 0 20px;
		z-index: 10;
		background: url(img/orange_error.png) no-repeat;
		background-position-y: 2px;
		color: orangered;
		padding: 0 0 0 18px;
		
		/*display: none;*/
	}
	
	#find_h6_uname{
		
 		display: none; 
	}
	
	#find_h6_phone{
		
		display: none;
	}
	
	#find_h6_checkcode{
		
		display: none;
	}
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var time = 15;  //设置秒数
		
        var  code_timer =null;  //设置唯一的定时器
              
        var realCode = null;   //真实验证码
        var tiemoutCode = null  //过期验证码
        
		$("#getcode").click(function(){
			
			       clearInterval(code_timer);  //每次点击时，都先清除原先的定时器
			       time = 15;                  //每次点击时，秒数重新计算
			       
			       $("#find_h6_checkcode")[0].innerHTML="";
				   $("#find_h6_checkcode").hide();
				   $("#checkcode").val("");
				   $("#showpw").hide();
			       
			      $("#getcode").val("（" + time + "s）重新获取");
			
			      code_timer =  setInterval(function(){
			      	
			      	  time = time-1;
			      	  $("#getcode").val("（" + time + "s）重新获取");
			      	  
			      	  if(time==0){
			      	  	
			      	  	clearInterval(code_timer);
			      	  	$("#getcode").val("请重新获取");
			      	  	
			      	    tiemoutCode = realCode;
			      	    realCode = null;  //当秒数为0时，realCode(真的验证码) 清空
			      	    
			      	    //alert(realCode);
			      	  }
			      	
			      },1000);
			
			
			      $.ajax({ 
				        
					   //这里的需要Struts.xml的<action/>的name属性一致。
				       url:'loginAction_getCheckCode.action',
				       
				       //提交类型
				       type:'POST',
				       
				       //提交数据给Action传入数据 
				       data:{'uname':"haha"},   //这里的数据是没有用的，随便瞎传一个 
				       
				       //返回的数据类型
				       dataType:'json', 
				       
				       
				       //成功是调用的方法
				       success:function(data){ 

				    	       realCode = data;   //获取真的验证码，已方便比较对错
				         }
				     });
			      
			      
		});	
        
        
		//判断用户名是否存在
		 $("#text_uname").focus(function(){
		 		
			 $("#find_h6_uname").hide();
			 $("#text_phone").val("");
			 $("#showpw").val("");
			 $("#showpw").hide();
			 
			 $("#getcode").removeClass().addClass("nogetcode");
	   	     $("#getcode").attr("disabled","disabled");
	   	     $("#getcode").val("获取验证码");
	   	     clearInterval(code_timer);
	   	     
	   	     $("#find_h6_checkcode").hide();
	   	     $("#checkcode").val("")  //验证码文本框清空   
	   	    
			 
		 	$(this).blur(function(){
		 		
		 		var text_uname = $("#text_uname").val();
		 		
		 		  //alert("text_uname："+text_uname);
		 		
		 			$.ajax({ 
				        
						   //这里的需要Struts.xml的<action/>的name属性一致。
					       url:'loginAction_findUserByUname.action',
					       
					       //提交类型
					       type:'POST',
					       
					       //提交数据给Action传入数据 
					       data:{'uname':text_uname}, 
					       
					       //返回的数据类型
					       dataType:'json', 
					       
					       
					       //成功是调用的方法
					       success:function(data){ 

					    	   
						          if(data=="false")
						          {
						        	 //alert("false"); 
						        	 $("#find_h6_uname")[0].innerHTML="该用户名不存在！";
						        	 $("#find_h6_uname").show();
						        	
						          }else{
						        	  
						        	 // alert("true");
						        	 //alert(data[0].phone);
						        	 var tempdata = eval(data);  //字符串转数组
						        	 var tempjson = tempdata[0];
						        	// alert(JSON.stringify(data));
						        	//alert(tempjson.phone);
						        	 var tempphone = tempjson.phone;
						        	 var temp1 = tempphone.substring(0,3);
						        	 var temp2 = tempphone.substring(8);
						        	 var tempunit = "绑定的手机号码：  " + temp1 + "*****" + temp2; //在手机号的文本框输出手机号
						        	
						        	 $("#text_phone").val(tempunit);
						        	 $("#showpw").val( "您的密码是：   " + tempjson.password);
						        	 
						        	 $("#getcode").removeClass().addClass("getcode");
							   	     $("#getcode").removeAttr("disabled");
						        	 						        	 
						          }
					         }
					     });
		 		
		 	});
		 		
		 });
		
		
		//点击“找回密码”按钮
        
		 $("#getpw").click(function(){
			   	
			 if($("#checkcode").val() == realCode){
				  
				 $("#showpw").show();
				 
			 }else if($("#checkcode").val() == tiemoutCode ){
				 
				 $("#find_h6_checkcode")[0].innerHTML="该验证码已过期！";
				 $("#find_h6_checkcode").show();
				 
			 }else{
				 
				 $("#find_h6_checkcode")[0].innerHTML="验证码错误！";
				 $("#find_h6_checkcode").show();
			 }
	   	  	
	   });
		
		//当聚焦 “输入验证码”的文本框时，错误提示语隐藏
		$("#checkcode").focus(function(){
			
			 $("#find_h6_checkcode")[0].innerHTML="";
			 $("#find_h6_checkcode").hide();
			
		});
    
	});
	

	
</script>
</head>
<body>
   <div id="find_pw">
			<a id="find_a" href="loginUser.jsp"><img src="img/return.png"/></a>
			<input type="text" class="find_text" name="" id="text_uname" value="" placeholder="请输入用户名"/>
			<h6 id="find_h6_uname" class="find_h6"></h6>
			<input type="text" class="find_text" name="" id="text_phone" value="" style="margin: 25px 0 0 20px;" placeholder="请输入绑定的手机号" disabled="disabled"/>
			<h6 id="find_h6_phone" class="find_h6">该手机号与用户名所绑定的不一致！</h6>
			<input type="text" name="checkcode" id="checkcode" value="" placeholder="请输入验证码"/>
			<input type="button" name="getcode" id="getcode" class="nogetcode" value="获取验证码" disabled="disabled"/>
			<h6 id="find_h6_checkcode" class="find_h6"></h6>
			<input type="button" name="getpw" id="getpw"  value="找回密码" />
			<input type="text" class="find_text" name="" id="showpw" value="" />
   </div>
</body>
</html>