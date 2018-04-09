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
<title>选择游戏</title>
<link rel="stylesheet" type="text/css" href="mycss/buyGameCss.css"/>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<script type="text/javascript">
	window.onload = function(){
		
  	  var two_search_up = document.getElementById("two_search_up") ;
  	  var lli = two_search_up.getElementsByTagName("li");
  	  
  	  var search_bar = document.getElementById("search_bar");
  	  var search_bar_ul = document.getElementById("search_bar_ul");
  	  var search_text = document.getElementById("search_text");
  	  var search_bt = document.getElementById("search_bt");
  	  var dogImg = document.getElementById("dog");
  	  
  	  //点击‘高级搜索’
  	   lli[1].onclick = function(){
  	   	
  	   	  lli[0].className="unchecked_Color";
  	   	  this.className="checked_Color";
  	   	  search_bar.getElementsByTagName("ul")[0].style.display = "block";
  	   	  search_text.style.width = "200px";
  	   	  
  	   }

            //点击‘普通搜索’
  	   lli[0].onclick = function(){
  	   	
  	   	  lli[1].className="unchecked_Color";
  	   	  search_bar.getElementsByTagName("ul")[0].style.display = "none";
  	   	  search_text.style.width = "500px";		  	   	  
  	   	  this.className="checked_Color";  	   	  
  	   }				
		
		
                  //seventh ABC...切换div
                  var seventh_up = document.getElementById('seventh_up');
                  var seventh_up_adiv = seventh_up.getElementsByTagName('div');
                  var seventh_up_ul = seventh_up.getElementsByTagName('ul')[0];
                  var s_up_ul_ali = seventh_up_ul.getElementsByTagName('li');
                  
                  var seventh_up_timer = null;
                  //alert(s_up_ul_ali.length);  //27
                  //alert(seventh_up_adiv.length);//27
                  
                  for(i=0;i<s_up_ul_ali.length;i++){
                  	
                  	s_up_ul_ali[i].index = i;
                  	s_up_ul_ali[i].onmouseover = function(){
                  		
                  		for(j=0;j<s_up_ul_ali.length;j++){
                  			
                  			s_up_ul_ali[j].className = "sev_uncheck_li";
                  			seventh_up_adiv[j].style.display = "none";
                  		}
                  		
                  		clearTimeout(seventh_up_timer);
                  		this.className = "sev_check_li"
                  		seventh_up_adiv[this.index].style.display = "block";                  		
                  	}
                  	
                  	s_up_ul_ali[i].onmouseout = function(){
                  		
                 	    	seventh_up_timer = setTimeout(function(){
                	     	
                     	for(i=0;i<seventh_up_adiv.length;i++){
                    		
                    		seventh_up_adiv[i].style.display = "none";
                    		s_up_ul_ali[i].className = "sev_uncheck_li"
                    	}                 	     	    
                	     	
                	     },500);                   		
                  		
                  	}
                  }
                  
                
                for(i=0;i<seventh_up_adiv.length;i++){
                	
                	    seventh_up_adiv[i].onmouseover = function(){
                	    	
                	    	clearTimeout(seventh_up_timer);
                	        	
                	    }
                	    
                	    seventh_up_adiv[i].onmouseout = function(){
                	    	
                	    	seventh_up_timer = setTimeout(function(){
                	     	
                     	for(i=0;i<seventh_up_adiv.length;i++){
                    		
                    		seventh_up_adiv[i].style.display = "none";
                    		s_up_ul_ali[i].className = "sev_uncheck_li"
                    	}                 	     	    
                	     	
                	     },500);
                	    }
                }
	}
</script>
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
</head>
<body>
<div id="selectGame">
<input type="hidden" name="" id="hid" value="${existUser.uname}" />
			<div id="first">
	  		<div id="first_one">
	  		  <div id="first_one_ldiv">
	  			<ul id="first_one_l">
                   <li>您好！</li>
                   <li class="noload">请<a href="loginUser.jsp">登录</a></li>
                   <li class="noload"><a href="registerUser.jsp">免费注册</a></li>
                   <li class="loaded"><a href="personal.jsp">${existUser.uname}</a></li>
                   <li class="loaded"><a href="loginAction_logout.action">退出</a></li>
                   <li><a href="buyGoodsAction_testBuy.action"></a></li>
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
	  		<div id="first_two">
	  			<img src="img/login_2.png" alt="logo" />
	  			<img id="dog" src="img/first_two_gou3.jpg"   />
	  			<div id="two_search">
	  			   <ul id="two_search_up">
	  			   	<li id="li_easy" class="checked_Color"><a href="#">简单搜索</a></li>
	  			   	<li id="li_high" class="unchecked_Color"><a href="#">高级搜索</a></li>
	  			   </ul>
	  			   <div id="search_bar">
	  			   	 <ul id="search_bar_ul">
	  			   	 	<li>游戏名称</li>
	  			   	 	<li>游戏区</li>
	  			   	 	<li>游戏服务器</li>
	  			   	 	<li>全部分区</li>
	  			   	 </ul>
	  			   	 <input id="search_text" type="text" placeholder="关键字找游戏、搜区服、寻商品"/>
	  			   	 <input id="search_bt" type="button" value="搜索" />
	  			   </div>
	  			   <ul id="two_search_down">
	  			   	<li style="padding-left: 30px;">王者荣耀</li>
	  			   	<li>英雄联盟</li>
	  			   	<li>地下城与勇士</li>
	  			   	<li>QQ飞车</li>
	  			   	<li>魔兽世界</li>
	  			   	<li>笑傲江湖OL</li>
	  			   	<li>御龙在天</li>
	  			   </ul>
	  			</div>
	  			<div id="two_three"><a href="mainFrame.jsp">首页</a>>>选择游戏</div>
	  		</div>
	  	</div>
	  	<div id="seventh">
	  		<div id="seventh_up">
	  			<span>热门游戏</span>
	  			<ul>
	  				<li class="sev_uncheck_li">选择游戏</li>
	  				<li class="sev_uncheck_li">A</li>
	  				<li class="sev_uncheck_li">B</li>
	  				<li class="sev_uncheck_li">C</li>
	  				<li class="sev_uncheck_li">D</li>
	  				<li class="sev_uncheck_li">E</li>
	  				<li class="sev_uncheck_li">F</li>
	  				<li class="sev_uncheck_li">G</li>
	  				<li class="sev_uncheck_li">H</li>
	  				<li class="sev_uncheck_li">I</li>
	  				<li class="sev_uncheck_li">J</li>
	  				<li class="sev_uncheck_li">K</li>
	  				<li class="sev_uncheck_li">L</li>
	  				<li class="sev_uncheck_li">M</li>
	  				<li class="sev_uncheck_li">N</li>
	  				<li class="sev_uncheck_li">O</li>
	  				<li class="sev_uncheck_li">P</li>
	  				<li class="sev_uncheck_li">Q</li>
	  				<li class="sev_uncheck_li">R</li>
	  				<li class="sev_uncheck_li">S</li>
	  				<li class="sev_uncheck_li">T</li>
	  				<li class="sev_uncheck_li">U</li>
	  				<li class="sev_uncheck_li">V</li>
	  				<li class="sev_uncheck_li">W</li>
	  				<li class="sev_uncheck_li">X</li>
	  				<li class="sev_uncheck_li">Y</li>
	  				<li class="sev_uncheck_li">Z</li>
	  			</ul>
	  			<div>
	  				<a href=""> <img src="img/seventh/seven_youxi1.jpg" alt="" /></a>
	  				<a href=""> <img src="img/seventh/seven_youxi2.jpg" alt="" /></a>
	  				<a href=""> <img src="img/seventh/seven_youxi3.jpg" alt="" /></a>
	  				<a href=""> <img src="img/seventh/seven_youxi4.jpg" alt="" /></a>
	  				<a href=""> <img src="img/seventh/seven_youxi5.jpg" alt="" /></a>
	  				<a href=""> <img src="img/seventh/seven_youxi6.jpg" alt="" /></a>
	  			</div>
	  			<div>
	  				<a href=""><img src="img/seventh/sev_game_a.gif" alt=""/></a>
	  				<a href=""></a>
	  			</div>
	  			<div ><a href=""></a></div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_c.gif"/></a>
	  			</div>
	  			<div>
	  				<a href="buyGoodsAction_findGoodsByTid.action?typeId=1"> <img src="img/seventh/sev_game_d.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_d2.jpg"/></a>
	  			</div>
	  			<div><a href=""></a></div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_f.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_f2.jpg"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_g.jpg"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_h.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h2.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h3.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h6.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h10.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h2.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h3.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h6.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_h10.png"/></a>
	  			</div>
	  			<div><a href=""> <img src="img/seventh/sev_game_g.jpg"/></a></div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_j1.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_j2.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_j3.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_j4.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_j5.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_j7.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_j8.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_j9.png"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_k1.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_k2.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_k3.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_k4.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_k5.png"/></a>
	  				<a href=""> <img src="img/seventh/seven_youxi5.jpg" alt="" /></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_l1.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_l2.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_l3.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_l4.png"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_m1.gif"/></a>
	  				<a href="buyGoodsAction_findGoodsByTid.action?typeId=4"> <img src="img/seventh/sev_game_m2.gif"/></a>
	  				<a href="buyGoodsAction_findGoodsByTid.action?typeId=9"> <img src="img/seventh/sev_game_m3.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_m4.png"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_n1.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_n2.png"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_o.jpg"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_p.jpg"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_q1.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_q2.gif"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_r1.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_r2.png"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_s1.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_s2.png"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_t1.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_t2.jpg"/></a>
	  			</div>
	  			<div><a href=""></a></div>
	  			<div><a href=""></a></div>
	  			<div>
	  				<a href="buyGoodsAction_findGoodsByTid.action?typeId=2"> <img src="img/seventh/sev_game_w1.jpg"/></a>
	  				<a href="buyGoodsAction_findGoodsByTid.action?typeId=3"> <img src="img/seventh/sev_game_w2.gif"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_x1.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_x2.png"/></a>
	  			</div>
	  			<div>
	  				<a href="buyGoodsAction_findGoodsByTid.action?typeId=12"> <img src="img/seventh/sev_game_y1.gif"/></a>
	  				<a href="buyGoodsAction_findGoodsByTid.action?typeId=12"> <img src="img/seventh/sev_game_y2.png"/></a>
	  			</div>
	  			<div>
	  				<a href="buyGoodsAction_findGoodsByTid.action?typeId=8"> <img src="img/seventh/sev_game_z1.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_z2.png"/></a>
	  			</div>  			
	  		</div>
	  	</div>
	  	<div id="se_third">
	  		<div class="se_third_div1">
	  			<a class="se_third_a1" href="buyGoodsAction_findGoodsByTid.action?typeId=2">王者荣耀</a>
	  			<a class="se_third_a2" href="">我要求购</a>
	  		</div>
	  		<div class="se_third_div2">
	  			<a class="se_third_a3" href="buyGoodsAction_findGoodsByTid.action?typeId=12">英雄联盟</a>
	  			<a class="se_third_a4" href="buyGoodsAction_findGoodsByTid.action?typeId=1">地下城与勇士</a>
	  			<a class="se_third_a5" href="buyGoodsAction_findGoodsByTid.action?typeId=9">冒险岛</a>
	  		</div>
	  		<div  class="se_third_div3">
	  			<a class="se_third_a6" href="buyGoodsAction_findGoodsByTid.action?typeId=8">自由幻想</a>
	  			<a class="se_third_a7" href="buyGoodsAction_findGoodsByTid.action?typeId=11">炉石传说</a>
	  			<a class="se_third_a8" href="buyGoodsAction_findGoodsByTid.action?typeId=5">天涯明月刀</a>
	  		</div>
	  		<div class="se_third_div4">
	  			<a class="se_third_a9" href="buyGoodsAction_findGoodsByTid.action?typeId=3">问道</a>
	  			<a class="se_third_a10" href="buyGoodsAction_findGoodsByTid.action?typeId=4">魔兽世界</a>
	  		</div>
	  		<div class="se_third_div5">
	  			<a class="se_third_a11" href="buyGoodsAction_findGoodsByTid.action?typeId=7">皇室战争</a>
	  			<a class="se_third_a12" href="buyGoodsAction_findGoodsByTid.action?typeId=6">部落冲突</a>
	  			<a class="se_third_a13" href="buyGoodsAction_findGoodsByTid.action?typeId=10">诛仙</a>
	  		</div>
	  	</div>
	  	<img id="se_fourth" src="img/end_guanggao2.jpg" alt="" />
	</div>
</body>
</html>