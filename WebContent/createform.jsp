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
<title>确定订单</title>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<style type="text/css">

*{	
	margin: 0;
	padding: 0;
}

 #first_one{
				
   	  width: 100%;
   	  height: 30px;
   	 /* border: 1px solid red;*/
   	  background: #F7F7F7;
   	  margin:0 0 0 0;
   	  
   }
   
   #first_one_ldiv{
   	
   	   height: 30px;
   	   width: 1000px;
   	   margin: 0 auto;
   }
   #first_one ul{
   	
   	  list-style: none;
   	  font-family: "微软雅黑" simhei sans-serif; 
   	  font-size: 10px;
   	  line-height: 30px;
   }
   #first_one_l li{
   	   
   	   color: #999999;
   	   float: left;
   	   margin-right: 15px;
   }
   
   #first_one a{
   	  text-decoration: none;
   	  color: orangered;
   }
   
   #first_one a:visited{
   	
   	color: orangered;
   }
   
   #first_one a:hover{
   	
   		color: royalblue;
   		text-decoration: underline;
   }
   
   #first_one_r{  /*ul*/
 
 margin-top: 6px;
 /*border: 1px solid darkblue;*/
   	 height: 15px;
   	 float: right;
   }
   #first_one_r li{
   	  
      font-size: 13px;         	  
   	  line-height: 15px;
   	  border-right: 1px solid #D5D5D5;
   	  float: left;
   	  color: #6F6A66;
   	  padding: 0 20px;
   }



	#showForm{
		
		width: 500px;
		height: 600px;
		/*border: 1px solid sandybrown;*/
		margin: 20px auto;	
		background-image: url(img/form_bg2.jpg);	
		border-radius: 4px;		
	}
	
	#form_up{
		
		height: 109px;
		/*border: 1px solid;*/
	}
	
	#form_left{
		
	  /* margin: 110px 0 0 0;	*/
	  margin: 1px 0 0 0;
	   width: 240px;
	   height: 380px;
	   /*border: 1px solid seagreen;  */
	   float: left;				
	}
	#form_ul1{
		
		list-style: none;
						
	}
	
	#form_ul1 li{
					
		text-align: right;
		font-family: simhei;
		/*border: 1px solid;*/
		height: 30px;
		line-height: 30px;
		margin: 20px 0 0 0;
		color: orangered;
	}
	
	#form_right{
		
	  /* margin: 110px 0 0 0;	*/
	   width: 250px;
	   height: 380px;
	 /* border: 1px solid blueviolet;*/
	   float: right;	
		
	}
	
	#form_ul2{
		
		list-style: none;
		padding: 0;
	}
	#form_ul2 li{
		
		/*border: 1px solid;*/
		font-family: simhei;
		width: 240px;
		height: 30px;
		margin: 20px 0 0 0;
		color: orangered;
	}
	
	#form_ul2 li .nochang{
		
		height: 30px;
		width: 240px;
		outline: none;
		border: 0;
		color: orangered;
		font-size: 15px;
		background-color: transparent;
	}
	
	#form_ul2 li .chang{
		
		height: 30px;
		width: 200px;
		outline-color: #00BFFF;
		border: 1px solid skyblue;
		font-size: 15px;
		color: cornflowerblue;
		background-color: transparent;
		border-radius: 3px;
		
	}
	
	#form_down{
		
		width: 200px;
		height: 45px;
		/*border: 1px solid salmon;*/
		/*clear: both;*/
		margin: 30px 0 0 160px;
		float: left;
		
	}
	
	#sm{
		
		width: 70px;
		height: 30px;
		text-align: center;
		background: orchid;
		font-size: 13px;
		color: white;
		
		outline:none;
		border: 1px solid orchid;
		border-radius: 5px;
	   cursor: pointer;
	}
	
	#sm:hover{
		
		background: #E695E3;
		border: 1px solid #E695E3;
	}
	#sm:active{
		
	  	background: #C81BC1;
	  	border: 1px solid #C81BC1;
	}
	
	#bt{
		
		width: 70px;
		height: 30px;
		text-align: center;
		background: #70BA31;
		font-size: 13px;
		color: white;
		
		outline:none;
		border: 1px solid #70BA31;
		border-radius: 5px;
		margin: 0 0 0 30px;
		cursor: pointer;
		
		
	}
	
	#bt:hover{
		
		background: #93D75A;
		border: 1px solid #93D75A;
	}
	#bt:active{
		
	  	background: #65A52E;
	  	border: 1px solid #65A52E;
	}
	
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	//alert();
//		$("#haha").click(function(){
		
//			$(".noload").hide()	
//			alert($("#hid").val());
//		});

  //判断是否有用户登录
    if($("#hid").val()==""){
    	
    	$(".noload").show();
    	$(".loaded").hide();
    	
    }else{
    	$(".noload").hide();
    	$(".loaded").show();

    }
				
});

</script>
<script type="text/javascript">

           //设置文本框不能编辑
			window.onload = function(){
				
				var aText = document.getElementsByClassName("nochang");
//				alert(aText.length);
				for(i=0;i<aText.length;i++){
					
					aText[i].onkeydown = function(ev){
						
						//var oEvent = ev||event;
						return false;
//						if(oEvent.keyCode!=8 && (oEvent.keyCode<48 || oEvent.keyCode>57))
//							{
//								return false;    //用键盘在文本框输入 也是默认行为，可以用return false阻止默认行为
//							}
					}
					
					
				}
				
			}
		</script>
		<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
		<script type="text/javascript">
			
			$(document).ready(function(){
				
				var existCash = parseFloat($("#existCash").val());
				var goodPrice = parseFloat($("#goodPrice").val());
				
				//alert(goodPrice);
				
				if(existCash < goodPrice){
					
					$("#sm").val("余额不足");
					$("#sm").attr("disabled","disabled");
				}
				
				$("#sm").click(function(){
					
					
					//alert("hahah");
				});
				
				
			});
			
		</script>
</head>
<body>

<div id="first_one">
<input type="hidden" name="" id="hid" value="${existUser.uname}" />
	  		  <div id="first_one_ldiv">
	  			<ul id="first_one_l">
                   <li>您好！</li>
                   <li class="noload">请<a href="loginUser.jsp">登录</a></li>
                   <li class="noload"><a href="registerUser.jsp">免费注册</a></li>
                   <li class="loaded"><a href="personal.jsp">${existUser.uname}</a></li>
                   <li class="loaded"><a href="loginAction_logout.action">退出</a></li>
	  			</ul>
	  			<ul id="first_one_r">
	  				<li><a href="mainFrame.jsp">JYG首页</a></li>
	  				<li>我的JYG</li>
	  				<li>客服中心</li>
	  				<li>关注我们 </li>
	  				<li>网站导航</li>
	  			</ul>
	  		  </div>
</div>
<div id="showForm">
	<div id="form_up">				
	</div>
	<div id="form_left">
		<ul id="form_ul1">
			<li>商品名称：</li>
			<li>数量：</li>
			<li>总价格：</li>
			<li>买家名称：</li>
			<li>卖家名称：</li>
			<li>订单号：</li>
			<li style="color: cornflowerblue;">请输入游戏账号：</li>
		</ul>
	</div>
	<s:form action="manFormAction_saveForm.action" name="saveform" namespace="/" theme="simple">
	<div id="form_right">
    	<input type="hidden" name="existCash" id="existCash" value="${existUser.existCash}" />
	    <input type="hidden" name="fnumber" id="" value="${checkGood.savenum}" />
	    <input type="hidden" name="totalPrice" id="goodPrice" value="${checkGood.gprice}" />
	    <input type="hidden" name="fgid" id="" value="${checkGood.gid}" />
	    <input type="hidden" name="suid" id="" value="${checkGood.gguser.uid}" />
	    <input type="hidden" name="buid" id="" value="${existUser.uid}" />
		<ul id="form_ul2">
			<li><input class="nochang" type="text" name="goodName" id="" value="${checkGood.gname}"/></li>
			<li><input class="nochang" type="text" name="" id="" value="${checkGood.savenum}件"  /></li>
			<li><input class="nochang" type="text" name="" id="" value="${checkGood.gprice}元" /></li>
			<li><input class="nochang" type="text" name="buyName" id="" value="${existUser.uname}" /></li>
			<li><input class="nochang" type="text" name="sellName" id="" value="${checkGood.gguser.uname}" /></li>
			<li><input class="nochang" type="text" name="formId" id="" value="${goodFormId}" /></li>
			<li><input class="chang" type="text" name="transfer" id="" value="" /></li>
			<!--<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>-->
		</ul>
	</div>
	<div id="form_down">
		<input type="submit" name="" id="sm" value="确认订单" />
		<input type="button" name="bt" id="bt" value="取消订单" onclick="javaScript:history.go(-1)"/>
	</div>
	</s:form>
	
</div>

</body>
</html>