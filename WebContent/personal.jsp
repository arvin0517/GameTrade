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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人管理</title>
<link rel="stylesheet" type="text/css" href="mycss/personalCss.css"/>
		<script src="myjs/move.js" type="text/javascript" ></script>
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
				 
				  //下拉列表
				  var ptl_adiv1 = document.getElementsByClassName('ptl_div1');
				  var ptl_ul1_ali1 = document.getElementsByClassName('ptl_ul1_li1');
//				  alert(ptl_adiv1.length);
//				  alert(ptl_ul1_ali1.length);
                  for(i=0;i<ptl_ul1_ali1.length;i++){
                  	  
                  	  ptl_ul1_ali1[i].index = i;
                  	  ptl_ul1_ali1[i].onclick = function(){
                  	  	
               	  	    //alert(getStyle(ptl_adiv1[this.index],'height'));
                        //alert(ptl_adiv1[this.index].offsetHeight)
                        var nowHeight = ptl_adiv1[this.index].offsetHeight;
                  	  	 for(j=0;j<ptl_adiv1.length;j++){
                  	  	 	
                  	  	 	startMove(ptl_adiv1[j],{height: 48});
                  	  	 }
                  	  	 
                  	  	if(nowHeight==50){
                  	  		startMove(ptl_adiv1[this.index],{height: 162});
                  	  	}else{
                  	  		startMove(ptl_adiv1[this.index],{height: 48});
                  	  	}                  	  	                   	  	 
                  	  }
                  }
				  
			}
		</script>
</head>
<body>
<div id="personal">
			<div id="first">
	  		 <div id="first_one">
	  		  <div id="first_one_ldiv">
	  			<ul id="first_one_l">
                   <li>您好！</li>
<!--                    <li>请<a href="login.html">登录</a></li> -->
<!--                    <li><a href="register.html">免费注册</a></li> -->
                   <li class="loaded"><a href="login.html">${existUser.uname}</a></li>
                   <li class="loaded"><a href="loginAction_logout.action">退出</a></li>
                   <li><a href="editUserAction_check.action"></a></li>
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
	  		 <div id="per_first_two">
	  		 	<img src="img/logo.png" alt="" />
	  		 	<ul class="pfw_ul1">
	  		 		<li><a href="buyGame.jsp">我要买</a></li>
	  		 		<li><a href="selectGameType.jsp">我要卖</a></li>
	  		 		<li><a href="">求购中心</a></li>
	  		 		<li><a href="">客服中心</a></li>
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
	  	  <div id="per_second">
	  	  	<span>您的位置：&nbsp;<a href="mainFrame.jsp">首页</a>>><a href="">我的JYG</a></span>
	  	  </div>
	  	  <div id="per_third">
	  	  	 <div id="per_third_l">
	  	  	 	 <div class="ptl_up">
	  	  	 	 	<div>
	  	  	 	 		<img src="img/touxiang1.jpg" alt="" />
	  	  	 	 	</div>
	  	  	 	 	<span>${existUser.uname}</span>
	  	  	 	 </div>
	  	  	 	 <div class="ptl_div1">
	  	  	 	 	<ul class="ptl_ul1">
		  	  	 	 	<li class="ptl_ul1_li1"><img class="ptl_ul1_li1_img1" src="img/orderc_icon15.jpg" alt="" />我是买家</li>
		  	  	 	 	<li><a href="buyGame.jsp">我要买</a></li>
		  	  	 	 	<li><a href="buyGame.jsp">我要求购</a></li>
		  	  	 	 	<li><a href="manFormAction_findFormListByUid.action?userId=${existUser.uid}" target="iframe_right" >我购买的商品</a></li>
	  	  	 	   </ul>	  	  	 	 	
	  	  	 	 </div>
	  	  	 	 <div class="ptl_div1">    <!--style="height: 130px;"-->
	  	  	 	 	<ul class="ptl_ul1">
		  	  	 	 	<li class="ptl_ul1_li1"><img class="ptl_ul1_li1_img1" src="img/orderc_icon6.jpg" alt="" />我是卖家</li>
		  	  	 	 	<li><a href="selectGameType.jsp">我要出售</a></li>
		  	  	 	 	<li><a href="manageGoodAction_findGoodListByUid.action?userId=${existUser.uid}" target="iframe_right">我出售的商品</a></li>
	  	  	 	   </ul>	  	  	 	 	
	  	  	 	 </div>
	  	  	 	 <div class="ptl_div1">
	  	  	 	 	<ul class="ptl_ul1">
		  	  	 	 	<li class="ptl_ul1_li1"><img class="ptl_ul1_li1_img1" src="img/orderc_icon2.jpg" alt="" />个人信息</li>
<!-- 		  	  	 	 	<li><a href="personal_inform.jsp" target="iframe_right">基本信息</a></li> -->
                        <li><a href="UserAction_findInformByUid?tempId=${existUser.uid}" target="iframe_right">基本信息</a></li>
		  	  	 	 	<li><a href="personal_pw.jsp" target="iframe_right">重置密码</a></li>
		  	  	 	 	<li><a href="">偏好设置</a></li>
		  	  	 	 	
	  	  	 	   </ul>	  	  	 	 	
	  	  	 	 </div>
	  	  	 	 <div class="ptl_div1">
	  	  	 	 	<ul class="ptl_ul1">
		  	  	 	 	<li class="ptl_ul1_li1"><img class="ptl_ul1_li1_img1" src="img/orderc_icon13.jpg" alt="" />咨询投诉</li>
		  	  	 	 	<li><a href="">我要投诉</a></li>
	  	  	 	   </ul>	  	  	 	 	
	  	  	 	 </div>	
	  	  	 </div>
	  	  	 <div id="per_third_r">
	  	  	 	<span id="per_third_span">您好!&nbsp;&nbsp;${existUser.uname}</span>
	  	  	    <iframe name="iframe_right"  src="personal_index.jsp"></iframe>
	  	  	 </div>
	  	  </div>
		</div>
</body>
</html>