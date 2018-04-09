<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<% 
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理页面</title>
<style type="text/css">
			
			*{
					margin: 0;
					padding: 0;
	
             }
             
             #manageFrame{
		
						width: 100%;
						height: 1000px;
						/*border: 1px solid;*/
					}

			 #first{
   	  
				   	   height: 213px;
				   	   width: 100%;
				   	   /*border: 1px solid orange ;*/
				   }
   #first_one{
   	
   	  height: 30px;
   	 /* border: 1px solid red;*/
   	  background: #F7F7F7;
   	  
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
   
#per_first_two{
	
	margin: 20px auto 0;
	height: 128px;
	width: 960px;
	/*border: 1px solid;*/
	/*position: relative;*/
	
}

#per_first_two img{
	
	display: block;
	/*height: 128px;
	width: 128px;*/
	float: left;
	/*position: absolute;
	left: -50px;*/
	position: relative;
	left: -60px;
	
}

#per_first_two .pfw_ul1{
	
	margin: 90px 0 0 0;
	list-style: none;
	float: right;
	width: 430px;
	height: 20px;
	/*border: 1px solid;*/
}

#per_first_two .pfw_ul1 li{
	
	float: left;
	margin:  0 30px 0 10px;
	/*border: 1px solid;*/
}

#per_first_two .pfw_ul1 li a{
	
	text-decoration: none;
	color: #313131;
}

#per_first_two .pfw_ul1 li a:hover{
	
	color: #FF6600;
}

#per_first_two .pfw_ul2{
	
	/*margin: 90px 0 0 0;*/
	list-style: none;
	float: right;
	width: 430px;
	height: 18px;
	/*border: 1px solid;	*/
}

#per_first_two .pfw_ul2 li{
	
	margin:  8px 52px 0 38px;
	float: left;
	visibility: hidden;
	/*height: 14px;
	width: 14px;*/
	/*background: red;*/
	border: 7px solid white;
	border-bottom: 7px solid #FF6600;
}

#per_first_three{
	
	margin: 0;
	width: 100%;
	height: 4px;
	border-bottom: 3px solid #FF6600;
}

#div_manage1{
	
    width: 990px;
    height: 600px;
   /* border: 1px solid;*/
    margin: 0 auto;
    position: relative;
    
    overflow: hidden;
    	
}

#iframe1{
	
	width: 980px;
	height: 595px;
	margin: 1px auto;
	border: 0;
	/*position: absolute;*/
	/*left: 1000px;*/
	/*left: -990px;*/
	/*background: burlywood;*/
	/*opacity: 0;*/
	
}

#iframe2{
	
	width: 980px;
	height: 595px;
	margin: 1px auto;
	border: 0;
	/*position: absolute;
	left: 1000px;
	left: -990px;*/
	/*background: burlywood;*/
	/*opacity: 0;*/
}

#iframe3{
	
	width: 980px;
	height: 595px;
	margin: 1px auto;
	border: 0;
	/*position: absolute;
	left: 1000px;*/
	/*left: -990px;*/
	/*background: burlywood;*/
	/*opacity: 0;*/
}

#iframe4{
	
	width: 980px;
	height: 595px;
	margin: 1px auto;
	border: 0;
	/*position: absolute;*/
	/*left: 1000px;
	left: -990px;*/
	/*background: burlywood;*/
	/*opacity: 0;*/
}

#manage_ul{
	
	list-style: none;
	margin: 0;
	width: 3990px;
	height: 598px;
	position: absolute;
	left: 994px;
}

#manage_ul li{
	
	width :995px;
	height: 595px;
	/*border: 1px solid;*/
	float: left;
	opacity: 0;
}
</style>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#manage_a1").click(function(){
			
			$("#manage_ul").animate({left:"0px"});
			$("#manage_li1").animate({opacity:'1'});
			$("#manage_li2").animate({opacity:'0'});
			$("#manage_li3").animate({opacity:'0'});
			$("#manage_li4").animate({opacity:'0'});
		});
		
		$("#manage_a2").click(function(){
			
			$("#manage_ul").animate({left:"-994px"});
			$("#manage_li2").animate({opacity:'1'});
			$("#manage_li1").animate({opacity:'0'});
			$("#manage_li3").animate({opacity:'0'});
			$("#manage_li4").animate({opacity:'0'});
		});
		
		$("#manage_a3").click(function(){
			
			$("#manage_ul").animate({left:"-1988px"});
			$("#manage_li3").animate({opacity:'1'});
			$("#manage_li1").animate({opacity:'0'});
			$("#manage_li2").animate({opacity:'0'});
			$("#manage_li4").animate({opacity:'0'});
		});
		
		$("#manage_a4").click(function(){
			
			$("#manage_ul").animate({left:"-2982px"});
			$("#manage_li4").animate({opacity:'1'});
			$("#manage_li1").animate({opacity:'0'});
			$("#manage_li2").animate({opacity:'0'});
			$("#manage_li3").animate({opacity:'0'});
		});
	});
	
</script>
<script type="text/javascript">
	window.onload = function(){
		
		 var pfw_ul1 = document.getElementsByClassName('pfw_ul1')[0];
		 var pfw_ul1_ali = pfw_ul1.getElementsByTagName('li');
		 var pfw_ul2 = document.getElementsByClassName('pfw_ul2')[0];
		 var pfw_ul2_ali = pfw_ul2.getElementsByTagName('li');
//				 alert(pfw_ul1_ali.length);
//				 alert(pfw_ul2_ali.length);

         //控制小三角形的显示和隐藏
		 for(i=0;i<pfw_ul1_ali.length;i++){
		 	
		 	pfw_ul1_ali[i].index = i;
		 	pfw_ul1_ali[i].onmouseover = function(){
		 		
		 		for(j=0;j<pfw_ul2_ali.length;j++){
		 			
		 			pfw_ul2_ali[j].style.visibility = "hidden";
		 		}
		 		
		 		pfw_ul2_ali[this.index].style.visibility = "visible";
		 	}
		 	
		 	pfw_ul1_ali[i].onmouseout = function(){
		 		
		 		for(j=0;j<pfw_ul2_ali.length;j++){
		 			
		 			pfw_ul2_ali[j].style.visibility = "hidden";
		 		}
		 	}
		 }
		  
	}
</script>
</head>
<body>
<!-- <a href="UserAction_findAll.action">个人信息管理</a> -->
<!-- <a href="UserAction_findAll.action">管理用户</a> -->
<!-- <a href="manageGoodAction_findAllGoods.action">管理商品</a> -->
<!-- <a href="manFormAction_findAllForm.action">订单管理</a> -->

<div id="manageFrame">
		<div id="first">
	  		 <div id="first_one">
	  		  <div id="first_one_ldiv">
	  			<ul id="first_one_l">
                   <li>您好！</li>
                   <li><a href="manageFrame.jsp">${manageUser.uname}</a></li>
                   <li><a href="loginAction_manageLogout.action">退出</a></li>
	  			</ul>
	  			<ul id="first_one_r">
	  				<li><a href="mainFrame.jsp" target="_blank">JYG首页</a></li>
	  				<li>我的JYG</li>
	  				<li>客服中心</li>
	  				<li>关注我们 </li>
	  				<li>网站导航</li>
	  			</ul>
	  		  </div>
	  		 </div>
	  		 <div id="per_first_two">
	  		 	<img src="img/manageFrame_title.png" alt="" />
	  		 	<ul class="pfw_ul1">
	  		 		<li><a id="manage_a1" href="manageAllPerson.jsp" target="iframe_person">个人信息</a></li>
	  		 		<li><a id="manage_a2" href="UserAction_findAll.action" target="iframe_user">用户管理</a></li>
	  		 		<li><a id="manage_a3" href="manageGoodAction_findAllGoods.action" target="iframe_form">商品管理</a></li>
	  		 		<li><a id="manage_a4" href="manFormAction_findAllForm.action" target="iframe_good">订单管理</a></li>
	  		 	</ul>
	  		 	<ul class="pfw_ul2">
	  		 		<li></li>
	  		 		<li></li>
	  		 		<li></li>
	  		 		<li style="margin: 8px 50px 0 40px;"></li>
	  		 	</ul>
	  		 </div>
	  		 <div id="per_first_three"></div>  <!--一条橙色的横线-->
	  	 </div>
	  	 <div id="div_manage1">
	  	  	 <!--<iframe id="iframe1" name="iframe_person"></iframe>
	  	 	 <iframe id="iframe2" name="iframe_user"></iframe>
	  	 	 <iframe id="iframe3" name="iframe_form"></iframe>
	  	 	 <iframe id="iframe4" name="iframe_good"></iframe>-->
	  	 	 <ul id="manage_ul">
	  	 	 	<li id="manage_li1"><iframe id="iframe1" name="iframe_person"></iframe></li>
	  	 	 	<li id="manage_li2"><iframe id="iframe2" name="iframe_user"></iframe></li>
	  	 	 	<li id="manage_li3"><iframe id="iframe3" name="iframe_form"></iframe></li>
	  	 	 	<li id="manage_li4"><iframe id="iframe4" name="iframe_good"></iframe></li>
	  	 	 </ul>
	  	 </div>
	  </div>
</body>
</html>