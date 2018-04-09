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
<title>欢迎登录</title>
<script src="myjs/jquery-3.2.1.js"></script>
<script src="myjs/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript">
function getStyle(obj, name)
{
	if(obj.currentStyle)
	{
		return obj.currentStyle[name];
	}
	else
	{
		return getComputedStyle(obj, false)[name];
	}
}

function startMove(obj, attr, iTarget)                           
{
	clearInterval(obj.timer);
	obj.timer=setInterval(function (){
		
		var cur=parseInt(getStyle(obj, attr));                   		
//		var speed=(iTarget-cur)/15;
//		speed=speed>0?Math.ceil(speed):Math.floor(speed);
        var speed = 15;
		
		if(Math.abs(iTarget-obj.style[attr])<=15)
		{
			clearInterval(obj.timer);
			bj.style[attr] = iTarget;
		}
		else
		{
			obj.style[attr]=cur+speed+'px';
		}
	}, 30);
}
			window.onload = function(){
				
            var ul_bg = document.getElementById("ul_bg");
            var ali =  ul_bg.getElementsByTagName("li");
            
//          ali[1].style.zIndex = 2;
//          ali[1].style.width = 1325;
//          alert (ali[0].style.zIndex);
//          startMove(ali[1],'width',0);
            var now = 1;
            var nowzIndex = 2;
            setInterval(function(){
            	
               ali[now].style.zIndex = nowzIndex++;	
               ali[now].style.width=0;	
               startMove(ali[now],'width',1325);
               now++;
               if(now==6){
               	  now=0;
               }
  
            },9000);
				
			
	}		
</script>
<style type="text/css">
			
	   body {  } ul { padding: 0; margin: 0; } li { list-style: none; } img { border: 0; }
	   #login{
	   	
	   	width: 1325px;
	   	height:800px;
	/*   	border: 1px solid red;*/
	   	margin: 0 auto;
	   }	
	     
       #up {
        
         width: 1325px;
         height: 128px;
     /*    border: 1px solid orange;*/
           
       }
       #up img{
       	
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
       
       #up a{
       	
       	float: right;
       	font-size: 20px;
       	font-family: "微软雅黑" sans-serif; 
       	margin-top: 50px;
       	margin-right: 200px;
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
	  /*	border: 1px solid blue;*/
	  /*	overflow: hidden;*/
	  /*	background-image: url(img/login_bg1.jpg);*/
	  }
	  
	  #ul_bg{
	  	
	  	height: 675px;
	  	/*width: 7950px;*/
	  	width: 1325px;
	  	position: relative;	  	
	  	background: orange;
	  	overflow: hidden;
	  }
	  #ul_bg li{
	  		  	
	  	float: left;
	    height: 675px;
	  	width: 1325px;
	  	position: absolute;
	  	overflow: hidden;
	  	left:0;
	  	top: 0;
	  }
	  
	  #center .goto{
	  	filter:alpha(opacity:85); opacity:0.85;
	  	z-index: 1000;
	  	width: 360px;
	  	height: 390px;
	  	position: absolute;
	  	top: 220px;
	  	right: 150px;
	  	background: white;
	  }
	  
	  .goto h3{
	  	
	  	 font-weight: 400;
	  	 font-size: 21px;
	  	 margin-top: 0;
	  	 padding-left: 20px;
	  	 padding-top: 12px;
	  	 height: 43px;
	  	 border-bottom:1px solid gainsboro;
	  	 font-family:  "微软雅黑", simhei, sans-serif;
	  	 color: orangered;
	  	 background:#ffffcd;
	  	 
	  }
	  
	  .goto p{
	  	
	  	  color: gray;
	  	  font-family:  "微软雅黑", simhei, sans-serif;
	  	  font-weight: 200;
	  	  font-size: 15px;
	  	  text-align: right;
	  	  margin-right: 34px;
	  }
	  
	  .reg {
	  	 font-weight: 300;
	  	 font-size: 19px;
	  	 text-decoration: none;
	  	 color: orangered;
	  	 
	  }
	  
	 .reg:visited{
	  	color: orangered;
	  }
	 .reg:hover{
	  	color: orange;
	  }
	  
	  .forget{
	  	 font-weight: 300;
	  	 font-size: 15px;
	  	 text-decoration: none;
	  	 color: orangered;
	  }
	  .forget:hover{
	  	color: #e97900;
	  	text-decoration: underline;
	  }
	  
	  #username{
	  	
	  	width: 270px;
	  	height: 40px;
	  	line-height: 40px;
        margin-top: 15px;
        margin-left: 25px;
        padding-left: 40px;
        font-size: 15px;
        font-weight: 500;
        background: url(img/login_user.png) no-repeat;
        border:1px solid orangered;
        border-radius: 3px;
        color: darkgray;
	  }
	  #userpw{	  	
	  	width: 270px;
	  	height: 40px;
	  	line-height: 40px;
        margin-top: 25px;
        margin-left: 25px;
        padding-left: 40px;
        font-size: 15px;
        background: url(img/login_pw.png) no-repeat;
        border:1px solid orangered;
        border-radius: 3px;
        color: darkgray;
	  }
	  

	  #denglu{	  	
	  	width: 314px;
	  	height: 40px;
	  	line-height: 40px;
	    margin-top: 25px;
        margin-left: 25px;
        font-size: 18px;
        font-family:"微软雅黑";
        color: white;
        border: 0;
        outline: none;
        background:  #f58915;
        border-radius: 3px;
        cursor:pointer;
	  }
	  #denglu:hover{
	  	
	  	background:  orangered;
	  }
	  
	  #error{
	  	
/* 	  	 display: block; */
 	  	 display: none; 
	  	 background: url(img/hongcha.jpg) no-repeat;
	  	 background-position-y: 2px;
	  	 font-size: 13px;
	  	 color: crimson;
	  	 padding-left: 20px;
	  	 margin: 0 0 0 20px;
	  	 left: 20px;
	  	 top: 10px;
	  	 z-index: 20;
	  	 position: relative;
	  }
	  
	  #check{
	  	
	  }
	  
	  #check_span{
	   
	    display: block;
	    float: right;
	    margin-top: 1px;
	  }
     
      #check_div{
      		  	 
          margin: 15px 0 0 25px;
         font-size: 12px;	  	
	  	 color: orangered;
	  	 float: left;
      	 /*border: 1px solid;*/
      	 
      }
      
      #p1{
      	
      	display: block;
      	float: right;
      }
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
	
	//从cookie读取数据
	if($.cookie("username")!="null"){
		
		$("#username").val($.cookie("username"));
		$("#userpw").val($.cookie("password"));
		
	}
		
		
		//删除cookie
// 		$.cookie("username",null);
// 		$.cookie("password",null);
		
		  $("#denglu").click(function(){
		       
			  var username = $("#username").val();
			  var userpw = $("#userpw").val();
			 // alert("...");
			  
			  $.ajax({ 
			        
				   //这里的需要Struts.xml的<action/>的name属性一致。
			       url:'loginAction_login.action',
			       
			       //提交类型
			       type:'POST',
			       
			       //提交数据给Action传入数据 
			       data:{'uname':username,'password':userpw}, 
			       
			       //返回的数据类型
			       dataType:'json', 
			       
			       
			       //成功是调用的方法
			       success:function(data){ 
			    	   
			    	 // alert(data);
			    	  //alert(data.result);
			    	   //获取Action返回的数据用  data.Action中的属性名 获取
			          if(data=="false")
			          {
			        	   $("#error").html("用户名或密码错误！"); 
			               $("#error").show();
			               
			          }else if(data=="ban"){
			        	  
			        	   $("#error").html("该用户已被封号！"); 	        	 
			               $("#error").show();
			               
			            //   alert("data:"+data);
			        	  
			          }else if(data=="manage"){
			        	  			               
			               //alert("data manage  :"+data);
			        	    location.href = "manageFrame.jsp";
			        	  
			          }else if(data=="true"){
			        	
			        	  var formerUrl = $("#former").val();
			           //进行页面跳转，因为ajax我们的Action只返回数据，不在进行跳转了...
			            if(formerUrl!=""){
			            	
			            	location.href = formerUrl;
			            }else{
			            	
			            	  location.href = "mainFrame.jsp";
			            }
			           
			            
			             // location.href = "buyGoodsAction_findOneGoodById.action?goodId=12";   
			           
			            // alert("haha");
			             //alert($("#check").is(":checked"));
			        	  if($("#check").is(":checked")){
			        		  
			        		//当复选框为true时，保存cookie  ,保存1天
			        		  //alert("check");
			        		 var un = $("#username").val();
			 				 var upass = $("#userpw").val();
			 				 
			 				 $.cookie("username",un,{expires:1});
			 				 $.cookie("password",upass,{expires:1});
			        	  }
			          }
			          }
			     });

		  });
		  
		  //当再次点击文本框时,隐藏提示语
		  $("#username").focus(function(){
			  $("#error").hide();
			});
		  $("#userpw").focus(function(){
			  $("#error").hide();
			});
		  
		});
	</script>
	<script type="text/javascript">
	
	//给回车键添加登录事件
	$(document).ready(function(){
		
		$(document).keydown(function(event){ 
			
			   if(event.keyCode==13){
				   
			      var username = $("#username").val();
				  var userpw = $("#userpw").val();
				 // alert("...");
				  
				  $.ajax({ 
				        
					   //这里的需要Struts.xml的<action/>的name属性一致。
				       url:'loginAction_login.action',
				       
				       //提交类型
				       type:'POST',
				       
				       //提交数据给Action传入数据 
				       data:{'uname':username,'password':userpw}, 
				       
				       //返回的数据类型
				       dataType:'json', 
				       
				       
				       //成功是调用的方法
				       success:function(data){ 
				    	 // alert(data);
				    	  //alert(data.result);
				    	   //获取Action返回的数据用  data.Action中的属性名 获取
				    	   //alert("data:"+data);
				          if(data=="false")
				          {
				        	 // $("#error").val("用户名或密码错误！");
				        	   $("#error").html("用户名或密码错误！"); 	   
				               $("#error").show();
				               
				          }else if(data=="ban"){
				        	  
				        	   $("#error").html("该用户已被封号！"); 	        	 
				               $("#error").show();
				               
				            //   alert("data:"+data);
				        	  
				          }else if(data=="manage"){
	  			               
				               //alert("data manage  :"+data);
				        	    location.href = "manageFrame.jsp";
				        	  
				          }else if(data=="true"){
				        	
				        	  var formerUrl = $("#former").val();
				           //进行页面跳转，因为ajax我们的Action只返回数据，不在进行跳转了...
				            if(formerUrl!=""){
				            	
				            	location.href = formerUrl;
				            }else{
				            	
				            	  location.href = "mainFrame.jsp";
				            }
				           
				            
				             // location.href = "buyGoodsAction_findOneGoodById.action?goodId=12";   
				           
				            // alert("haha");
				             //alert($("#check").is(":checked"));
				        	  if($("#check").is(":checked")){
				        		  
				        		//当复选框为true时，保存cookie  ,保存1天
				        		  //alert("check");
				        		 var un = $("#username").val();
				 				 var upass = $("#userpw").val();
				 				 
				 				 $.cookie("username",un,{expires:1});
				 				 $.cookie("password",upass,{expires:1});
				        	  }
				           }
				          }
				     });			   
				   
			   }
			
			}); 
		
		
		
	});
	
	
	
	</script>
</head>
<body>
 <div id="login">
 <input type="hidden" name="" id="former" value="${requestScope.formerUrl}" />
	  	 <div id="up">
             <img src="img/logo.png" />
             <img src="img/login_2.png" />
             <h2>欢迎登录</h2>
             <a href="mainFrame.jsp">进入首页</a>
	  	 </div>
	  	 <div id="center" >
	  	 	<ul id="ul_bg">
	  	 		<li style="z-index:1;"><img src="img/login_bg1.jpg" alt="login_bg1" /></li>
	  	 		<li><img src="img/login_bg2.jpg" alt="login_bg2" /></li>
	  	 		<li><img src="img/login_bg3.jpg" alt="login_bg3" /></li>
	  	 		<li><img src="img/login_bg4.jpg" alt="login_bg4" /></li>
	  	 		<li><img src="img/login_bg5.jpg" alt="login_bg5" /></li>
	  	 		<li><img src="img/login_bg6.jpg" alt="login_bg6" /></li>
	  	 	</ul>
	  	 	<div class="goto">
	  	 		<h3>用户登录</h3>
	  	 		<p>还没有注册账号？
	  	 				<a class="reg" href="registerUser.jsp">立即注册</a>	  	 				
	  	 		</p>
	  	 		<span id="error"></span>
<%-- 	  	 		<s:form action="UserAction_login" method="post" namespace="/" theme="simple"> --%>
	  	 		<input id="username" type="text" name="uname" placeholder="请输入用户名"/>
	  	 		<input id="userpw" type="password" name="password" placeholder="请输入密码"/>
	  	 		<input id="denglu" type="submit" value="立即登录" />
	  	 		
	  	 		<div id="check_div"><input id="check"  type="checkbox" name="check" value=""><span id="check_span">保存用户名和密码7天</span></input></div>
	  	 	    <p id="p1">
	  	 		   <a class="forget" href="findpw.jsp">忘记密码？</a>	  	 				
	  	 		</p>
<%-- 	  	 		</s:form> --%>
	  	 	</div>
	  	 </div>
	  </div>
</body>
</html>