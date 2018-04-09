<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JYG游戏交易平台</title>
<link rel="stylesheet" type="text/css" href="mycss/mainFrameCss.css"/>
<style type="text/css">
	
</style>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<script src="myjs/move.js"  type="text/javascript">	
</script>
<script type="text/javascript">
	window.onscroll = function(){
		
		var tenth = document.getElementById('tenth');
		var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
		
		  //  判断 "返回顶部"的div 是否要显示或隐藏
		if(scrollTop==0){
			
			startMove(tenth,{height:223});
			
		}else{
			
			startMove(tenth,{height:280});
		}
	}
</script>
<script  type="text/javascript">
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
		  	   	  this.style.backgroundColor="#079EED";
		  	   	  search_bar.style.borderColor = "#079EED";
		  	   	  search_bt.style.backgroundColor = "#079EED";
		  	   	  search_bar.getElementsByTagName("ul")[0].style.display = "block";
		  	   	  search_text.style.width = "200px";
		  	   	  dogImg.src = "img/first_two_gou2.jpg";
		  	   	  
		  	   }

              //点击‘普通搜索’
		  	   lli[0].onclick = function(){
		  	   	
		  	   	  lli[1].className="unchecked_Color";
		  	   	  lli[1].style.backgroundColor="";
		  	   	  search_bar.style.borderColor = "#FF6600";
		  	   	  search_bt.style.backgroundColor = "#FF6600";
		  	   	  search_bar.getElementsByTagName("ul")[0].style.display = "none";
		  	   	  search_text.style.width = "500px";
		  	   	  dogImg.src = "img/first_two_gou1.jpg";
		  	   	  
		  	   	  this.className="checked_Color";  	   	  
		  	   }
		  	  
		  	  //控制图片切
		        
		        var second_image  = document.getElementById("second_image");
		        var second_oul = second_image.getElementsByTagName("ul")[0];
		        var oul_ali = second_oul.getElementsByTagName("li");
		        
		        var second_ool = second_image.getElementsByTagName('ol')[0];
		        var ool_ali = second_ool.getElementsByTagName("li");
		        var now = 0;
		        
		        for(i=0;i<ool_ali.length;i++){    //点击小圆圈时，切换图片
		        	
		        	ool_ali[i].index = i;
		        	
		        	ool_ali[i].onclick = function(){
		        		
		        		  now = this.index;
		        		  oc();
//		        	      for(j=0;j<ool_ali.length;j++){
//		        	      	
//		        	      	    ool_ali[j].className = "";
//		        	      }
//		        	      
//		        	      oul_ali[this.index].style.opacity = 0;
//		        	      this.className = "small_checked";
//		        	      startMove(second_oul, {top: -300*this.index},startMove(oul_ali[this.index],{opacity:100}));
		        	      
		        	}
		        	
		        }
		        
	function oc(){

        	      for(j=0;j<ool_ali.length;j++){
        	      	
        	      	    ool_ali[j].className = "";
        	      }
                    	      
        	      oul_ali[now].style.opacity = 0;
        	      ool_ali[now].className = "small_checked";
        	      startMove(second_oul, {top: -300*now},startMove(oul_ali[now],{opacity:100}));		
	}
	
	function next(){
		
		now++;
		
		if(now==oul_ali.length){
			
			  now=0;
		}
		
		oc();
	}
	
	var next_timer = setInterval(next,4000);    //自动切换图片
	
	second_image.onmouseover = function(){  //鼠标移入，暂停自动切换图片
		
		clearInterval(next_timer);
	}
	
	second_image.onmouseout = function(){  //鼠标移出，开始自动切换图片
		
		next_timer = setInterval(next,4000);
	}
		  
		  
          	 // 数字时钟
          	 
          	 var third_time = document.getElementById("third_time");
          	 var time_img = third_time.getElementsByTagName('img');
          	 var imgArr = [];
          	 var weekName = ['zero','one','two','three','four','five','six'];
          	 
          	 function toDouble(n){
          	 	
          	 	  if(n>9){
          	 	  	
          	 	  	   return ""+n;
          	 	  	   
          	 	  }else{
          	 	  	
          	 	  	   return '0'+n;
          	 	  }
          	 	
          	 }
          	 
          	 for(i=0;i<time_img.length;i++){
          	 	
          	 	if(time_img[i].alt=='0'){
          	 		
          	 		 imgArr.push(time_img[i]);
          	 	}         	 	     
          	 }
          	 
//        	  alert(imgArr.length);
          	 function clock(){
          	 	
          	 	var oda = new Date();          	 	
          	 	var arrNow = toDouble(oda.getFullYear())+toDouble(oda.getMonth()+1)+toDouble(oda.getDate())+toDouble(oda.getHours())+toDouble(oda.getMinutes())+toDouble(oda.getSeconds())+oda.getDay();
//        	 	alert(arrNow);
          	 	
          	 	for(i=0;i<arrNow.length;i++){
          	 		
          	 		if(i==arrNow.length-1){
          	 			
          	 			 var d = parseInt(arrNow.charAt(i));
          	 			imgArr[i].src = "img/time_images/"+weekName[d]+".png";
          	 			  
          	 		}else{
          	 			
          	 			imgArr[i].src = "img/time_images/"+arrNow.charAt(i)+".png";
          	 		}
          	 		
          	 	}
          	 }
          	 clock();
          	 setInterval(clock,1000);
          	 
          	 
                   //热门手游

                    var fourth_l_down = document.getElementById("fourth_l_down");
                    var l_down_odiv = fourth_l_down.getElementsByTagName("div");
                    
                    for(i=0;i<l_down_odiv.length;i++){
                    	
                    	l_down_odiv[i].onmouseover = function(){
                    		
                    		var sp = this.getElementsByTagName("span")[0];
                    		startMove(sp,{left:0,opacity: 90});
                    	}
                    	
                    	l_down_odiv[i].onmouseout = function(){
                    		
                    		var sp = this.getElementsByTagName("span")[0];
                    		startMove(sp,{left:-220,opacity: 30});
                    	}
                    }
                    
                    //div_fourth_r_img广告图片的大小变化
                    var  div_fourth_r_img = document.getElementById("fourth_r_img");
                    var  ad_img = div_fourth_r_img.getElementsByTagName('img')[0];
//                  alert(ad_img.style.width);
                    ad_img.onmouseover = function(){
                    	
                    	 startMove(ad_img,{width:340,height:154,right:-17,bottom:-8});
                    }
                    
                    ad_img.onmouseout = function(){
                    	
                    	 startMove(ad_img,{width:305,height:138,right:0,bottom:0});
                    }
                    
                    //fifth广告图片的大小变化
                    var  fifth_img = document.getElementById("fifth");
                    var  lad_img = fifth_img.getElementsByTagName('img')[0];
//                  alert(ad_img.style.width);
                    lad_img.onmouseover = function(){
                    	
                    	 startMove(lad_img,{width:1200,height:108,right:-100,bottom:-6});
                    }
                    
                    lad_img.onmouseout = function(){
                    	
                    	 startMove(lad_img,{width:1000,height:95,right:0,bottom:0});
                    }
                    
                    //sixth 中左边部分    4个div自由切换部分
                    
                    var sixth_l_center = document.getElementsByClassName("sixth_l_center")[0];
                    var l_center_ol = sixth_l_center.getElementsByTagName("ol")[0];
                    var l_center_ol_ali = l_center_ol.getElementsByTagName("li");
                    var ol_bg = document.getElementsByClassName("ol_bg")[0];
                    
                    var sixth_l_down = document.getElementsByClassName('sixth_l_down')[0];
                    var sixth_l_down_adiv = sixth_l_down.getElementsByClassName('l_down_1');
                    var sixth_nowZindex = 97;
                    for(i=0;i<l_center_ol_ali.length;i++){
                    	
                    	l_center_ol_ali[i].index = i;
                    	
                    	l_center_ol_ali[i].onmouseover = function(){
                    		
                    	  sixth_l_down_adiv[this.index].style.zIndex = sixth_nowZindex++;  //修复div重叠bug
//                  	  alert(sixth_l_down_adiv[this.index].style.zIndex);
//               		  alert(sixth_l_down_adiv.length);
                    		 for(j=0;j<l_center_ol_ali.length;j++){
                    		 	
                    		 	   l_center_ol_ali[j].className = "six_uncheck_li";
                    		 	   
//               		 	       startMove(sixth_l_down_adiv[j],{opacity:0});
                               			sixth_l_down_adiv[j].style.filter='alpha(opacity:'+0+')';
			                            sixth_l_down_adiv[j].style.opacity=0;
                    		 }
                    		 
                    		 this.className = "six_check_li";
                    		 startMove(ol_bg,{left:this.index*98});
                  		     startMove(sixth_l_down_adiv[this.index],{opacity:100});
                    	}                   	
                    }
                    
                    //sixth 中右边部分  广告扩大缩小
                    var sixth_r = document.getElementById('sixth_r');
                    var sixth_r_adiv = sixth_r.getElementsByTagName('div');
//                  alert(sixth_r_adiv.length);
                    for(i=0;i<sixth_r_adiv.length;i++){
                    	
                    	var sixth_r_adiv_img = sixth_r_adiv[i].getElementsByTagName('img')[0];
//                  	alert(sixth_r_adiv[i].getElementsByTagName('img').length);
                    	sixth_r_adiv_img.onmouseover = function(){
                    		
                    		 startMove(this,{width:340,height:184,right:-17,bottom:-9});
                    	}
                    	
                    	sixth_r_adiv_img.onmouseout = function(){
                    		
                    		 startMove(this,{width:305,height:165,right:0,bottom:0});
                    	}
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
                  
              //eighth中  广告图  放大缩小     
              var eighth = document.getElementById('eighth');
              var eighth_img = eighth.getElementsByTagName('img')[0];
              
              eighth_img.onmouseover = function(){
              
                    startMove(eighth_img,{width:1200,height:89,right:-100,bottom:-7});
              }
              
              eighth_img.onmouseout = function(){
              	
              	   startMove(eighth_img,{width:1000,height:74,right:0,bottom:0});
              }
              
              
              //点击返回顶部
                 var tenth_a5 = document.getElementsByClassName('a5')[0];
                 tenth_a5.onclick = function(){
                 	
						if(document.documentElement.scrollTop){
							
							document.documentElement.scrollTop=0;
						}else{
							
							document.body.scrollTop=0;
						}                 	
                 }
                 
                //  判断 "返回顶部"的div 是否要显示或隐藏
				var tenth = document.getElementById('tenth');
				var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
				
				if(scrollTop==0){
					
					startMove(tenth,{height:223});
					
				}else{
					
					startMove(tenth,{height:280});
				}
                    
		  }
		</script>
		<script type="text/javascript">
		
		
		
		$(document).ready(function(){
			
			//alert();
// 			$("#haha").click(function(){
				
// 				$(".noload").hide()	
// 				alert($("#hid").val());
// 			});

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
	  <div id="mainFrame">
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
<%--                    <li><button id="haha">${existUser.uname}</button></li> --%>
	  			</ul>
	  			<ul id="first_one_r">
	  				<li><a href="#">JYG首页</a></li>
	  				<li>我的JYG</li>
	  				<li>客服中心</li>
	  				<li>关注我们 </li>
	  				<li>网站导航</li>
	  			</ul>
	  		  </div>
	  		</div>
	  		<div id="first_two">
	  			<img src="img/login_2.png" alt="logo" />
	  			<img id="dog" src="img/first_two_gou1.jpg"   />
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
	  		</div>
	  		<div id="first_three">
	  			<ul>
	  				<li style="margin-left: 28px;"><a href="#">首页</a></li>
	  				<li><a href="#">我要导购</a> </li>
	  				<li><a href="#">金币交易</a><img src="img/new_hot.png" alt="" /> </li>
	  				<li><a href="#">账号交易</a><img src="img/new_new.png" alt="" /></li>
	  				<li><a href="#">游戏代练</a></li>
	  				<li><a href="#">装备交易</a></li>
	  				<li><a href="#">热门游戏</a></li>
	  				<li><a href="#">手游交易</a></li>
	  				<li><a href="#">客服中心</a></li>
	  			</ul>
	  		</div>
	  	</div>
	  	<div id="second">
	  		<div id="second_image">
	  			<ol>
	  				<li class="small_checked"></li>
	  				<li></li>
	  				<li></li>
	  				<li></li>
	  				<li></li>
	  				<li></li>
	  			</ol>
	  			<ul>
	  				<li><img src="img/second_image1.jpg" alt="" /></li>
	  				<li><img src="img/second_image7.jpg" alt="" /></li>
	  				<li><img src="img/second_image3.jpg" alt="" /></li>
	  				<li><img src="img/second_image4.jpg" alt="" /></li>
	  				<li><img src="img/second_image5.jpg" alt="" /></li>
	  				<li><img src="img/second_image6.jpg" alt="" /></li>
	  			</ul>
	  		</div>
	  	</div>
	  	<div id="third">
	  		<!--<img src="img/button_bg.jpg" alt="" />-->
	  		<div id="third_one">
	  			<div class="tone_div" style="background-position: 5px -968px;"><a href="buyGame.jsp">我要买</a></div>
	  			<div class="tone_div" style="background-position: 8px -1165px;"><a href="selectGameType.jsp">我要卖</a></div>
	  			<div class="tone_div" style="background-position: 7px -580px;"><a href="personal.jsp">我的交易</a></div>
	  			<div class="tone_div" style="background-position: 7px -1073px;"><a href="loginUser.jsp">登录</a></div>
	  		    <div class="tone_div" style="background-position: 7px -870px;"><a href="mainFrame.jsp">首页</a></div>
	  			<div class="tone_div" style="background-position: 5px -245px;"><a href="registerUser.jsp">注册</a></div>
	  			<div class="tone_div" style="background-position: 5px -136px;"><a href="">网页验证</a></div>
	  			<div class="tone_div" style="background-position: 5px -30px;"><a href="">投诉</a></div>
	  			<div class="tone_div" style="background-position: 5px -680px;"><a href="">客服验证</a></div>
	  		</div>
	  		<div id="third_two">
	  		  <div id="third_time">
	  			<div class="year">
	  				<img src="img/time_images/0.png" alt="0" style="margin-left: 13px;" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/year.png" alt="year" style="margin-left: 3px;" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/month.png" alt="month" style="margin-left: 3px;" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/zero.png" alt="day" style="margin-left: 3px;"/>
	  			</div>
	  			<div class="time">
	  				<img src="img/time_images/0.png" alt="0"  style="margin-left: 13px;"/>
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/sign.png" alt="" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/sign.png" alt="" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/0.png" alt="0" />
	  				<img src="img/time_images/week.png" alt="week" style="margin-left: 12px;"/>
	  				<img src="img/time_images/zero.png" alt="0" />
	  			</div>
	  		  </div>
	  		  <div id="third_two_down">
	  		  	<a href=""><div class="bg_div" style="background-position: -14px -34px;"></div>新手指南</a>
	  		  	<a href=""><div class="bg_div" style="background-position: -55px -34px;"></div>常见问题</a>
	  		  	<a href=""><div class="bg_div" style="background-position: -35px -34px;"></div>客服中心</a>
	  		  	<a href=""><div class="bg_div" style="background-position: -76px -34px;"></div>帮助中心</a>
	  		  	<div id="third_two_down_img"><img src="img/fpzn.jpg" alt="" /></div>
	  		  </div>
	  		</div>
	  		<div id="third_three">
	  			<div id="third_three_up">
	  				<div class="three_up_up">
	  					<h5>JYG公告</h5>
	  					<span><a href="">更多&nbsp;>></a></span>
	  				</div>
	  				<div class="three_up_down">
	  					<ul>
	  						<li><a class="import" href="" title="最新防骗通知">最新防骗通知</a><span>[04/25]</span></li>
	  						<li><a href="" title="截图认证升级使用教程">截图认证升级使用教程</a><span>[04/15]</span></li>
	  						<li><a class="import" href="" title="巨人网络帐号过户服务免费公告">巨人网络帐号过户服务免费公告</a><span>[03/29]</span></li>
	  						<li><a class="import" href="" title="关闭自动转账服务说明">关闭自动转账服务说明</a><span>[03/10]</span></li>
	  						<li><a href="" title="《疾风之刃》免费公告">《疾风之刃》免费公告</a><span>[02/09]</span></li>
	  						<li><a href="" title="《传奇永恒》免费来袭">《传奇永恒》免费来袭</a><span>[01/16]</span></li>
	  					</ul>
	  				</div>
	  			</div>
	  			<div id="third_three_down">
	  				<img src="img/advertisement.png" alt="广告" />
	  			</div>
	  		</div>	  		
	  	</div>
	  	<div id="fourth">
	  	  <div id="fourth_l">
	  	  	<div class="fourth_l_up">
	  	  		<span>热门手游</span>
	  	  		<a href="">更多>></a>
	  	  	</div>
	  	  	<div id="fourth_l_down">
	  	  		<div>
	  	  			<img src="img/fourth/shouyou1.jpg" alt="" />
	  	  			<h4>王者荣耀</h4>
	  	  			<h5>MOBA竞技</h5>
	  	  			<h6></h6>
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">游戏账号</a></li>
	  	  				  <li><a class="span_a1" href="">游戏代练</a></li>
	  	  				  <li><a class="span_a1" href="">皮肤赠送</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部王者荣耀商品&nbsp;>></a>
	  	  			</span>
	  	  		</div>
	  	  		<div>
	  	  			<img src="img/fourth/shouyou2.jpg" alt="" />
	  	  			<h4>诛仙手游</h4>
	  	  			<h5>角色扮演</h5>
	  	  			<h6></h6>	  	  			
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">游戏账号</a></li>
	  	  				  <li><a class="span_a1" href="">金币</a></li>
	  	  				  <li><a class="span_a1" href="">首充号</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部诛仙手游商品&nbsp;>></a>	  	  				
	  	  			</span>
	  	  		</div>
	  	  		<div>
	  	  			<img src="img/fourth/shouyou3.jpg" alt="" />
	  	  			<h4>征途手游</h4>
	  	  			<h5>角色扮演</h5>
	  	  			<h6></h6>
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">游戏账号</a></li>
	  	  				  <li><a class="span_a1" href="">银子</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部征途手游商品&nbsp;>></a>
	  	  			</span>
	  	  		</div>
	  	  		<div>
	  	  			<img src="img/fourth/shouyou4.jpg" alt="" />
	  	  			<h4>皇室战争</h4>
	  	  			<h5>塔防游戏</h5>
	  	  			<h6></h6>
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">游戏账号</a></li>
	  	  				  <li><a class="span_a1" href="">点卷</a></li>
	  	  				  <li><a class="span_a1" href="">首充号</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部皇室战争商品&nbsp;>></a>
	  	  			</span>
	  	  		</div>
	  	  		<div>
	  	  			<img src="img/fourth/shouyou5.jpg" alt="" />
	  	  			<h4>梦幻诛仙</h4>
	  	  			<h5>回合制游戏</h5>
	  	  			<h6 style="width: 67px;"></h6>	  	  			
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">金币</a></li>
	  	  				  <li><a class="span_a1" href="">游戏账号</a></li>
	  	  				  <li><a class="span_a1" href="">礼包</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部梦幻诛仙商品&nbsp;>></a>
	  	  			</span>
	  	  		</div>
	  	  		<div>
	  	  			<img src="img/fourth/shouyou6.jpg" alt="" />
	  	  			<h4>部落冲突</h4>
	  	  			<h5>塔防游戏</h5>
	  	  			<h6 style="width: 67px;"></h6>	
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">首充号</a></li>
	  	  				  <li><a class="span_a1" href="">游戏账号</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部部落冲突商品&nbsp;>></a>
	  	  			</span>
	  	  		</div>
	  	  		<div>
	  	  			<img src="img/fourth/shouyou7.jpg" alt="" />
	  	  			<h4>球球大作战</h4>
	  	  			<h5>休闲益智</h5>
	  	  			<h6 style="width: 59px;"></h6>		  	  			
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">游戏币</a></li>
	  	  				  <li><a class="span_a1" href="">游戏账号</a></li>
	  	  				  <li><a class="span_a1" href="">装备道具</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部球球大作战商品&nbsp;>></a>
	  	  			</span>
	  	  		</div>
	  	  		<div>
	  	  			<img src="img/fourth/shouyou8.jpg" alt="" />
	  	  			<h4>六龙争霸3D</h4>
	  	  			<h5>角色扮演</h5>
	  	  			<h6 style="width: 67px;"></h6>	
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">游戏币</a></li>
	  	  				  <li><a class="span_a1" href="">装备道具</a></li>
	  	  				  <li><a class="span_a1" href="">礼包</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部六龙争霸3D商品&nbsp;>></a>
	  	  			</span>
	  	  		</div>
	  	  		<div>
	  	  			<img src="img/fourth/shouyou9.jpg" alt="" />
	  	  			<h4>炉石传说</h4>
	  	  			<h5>卡牌游戏</h5>
	  	  			<h6></h6>	
	  	  			<span>
	  	  				<h1>———&nbsp;&nbsp;可选商品&nbsp; &nbsp;———</h1>
	  	  				<ul>
	  	  				  <li><a class="span_a1" href="">首充号</a></li>
	  	  				  <li><a class="span_a1" href="">游戏代练</a></li>
	  	  				  <li><a class="span_a1" href="">游戏币</a></li>
	  	  				</ul>
	  	  				<a class="span_a2" href="">查看全部炉石传说商品&nbsp;>></a>
	  	  			</span>
	  	  		</div>
	  	  	</div>
	  	  </div>
	  	  <div id="fourth_r">
	  	  	 <div id="fourth_r_rank">
	  	  	 	<div id="fourth_r_rank_up"><h4>热门排行交易</h4></div>
	  	  	 	<ul class="rank_l">
	  	  	 		<li id="head_li">排名</li>
	  	  	 		<li>1</li>
	  	  	 		<li>2</li>
	  	  	 		<li>3</li>
	  	  	 		<li>4</li>
	  	  	 		<li>5</li>
	  	  	 		<li>6</li>
	  	  	 		<li>7</li>
	  	  	 		<li>8</li>
	  	  	 	</ul>
	  	  	 	<ul class="rank_r">
                    <li id="head_li">游戏名称</li>
                    <li><a href="">英雄联盟 </a><div class="toup_bg"></div></li>
                    <li><a href="">王者荣耀</a><div class="toup_bg"></div></li>
                    <li><a href="">地下城与勇士</a></li>
                    <li><a href="">魔兽世界</a></li>
                    <li><a href="">疾风之刃</a></li>
                    <li><a href="">剑灵</a><div class="todown_bg"></div></li>
                    <li><a href="">炉石传说</a></li>
                    <li><a href="">诛仙</a></li>
	  	  	 	</ul>
	  	  	 </div>
	  	  	 <div id="fourth_r_img">
	  	  	 	<img src="img/fourth/ad2.jpg" alt="广告" />
	  	  	 </div>
	  	  </div>
	  	</div>
	  	<div id="fifth">
	  		<img src="img/fourth/long_ad1.png" alt="长广告" />
	  	</div>
	  	<div id="sixth">
	  		<div id="sixth_l">
	  	  	  <div class="sixth_l_up">
	  	  		<span>热门交易</span>
	  	  	  </div>
	  	  	  <div class="sixth_l_center">
	  	  	    <div class="ol_bg"></div>
	  	  	  	<ol>
		  	  	  	<li class="six_check_li">账号交易</li>
		  	  	  	<li class="six_uncheck_li">点卷交易</li>
		  	  	  	<li class="six_uncheck_li">游戏代练</li>
		  	  	  	<li class="six_uncheck_li">金币交易</li>
	  	  	    </ol>
	  	  	    <a href="">更多>></a>
	  	  	  </div>
	  	  	  <div class="sixth_l_down">
	  	  	  	 <div class="l_down_1" style="opacity: 1;">
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi1.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥300.0</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong"></div></span>
	  	  	  	 		<span>商品种类：&nbsp;&nbsp;游戏账号</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi1.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥440.0</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 80px;"></div></span>
	  	  	  	 		<span>商品种类：&nbsp;&nbsp;游戏账号</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi7.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥299.0</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 48px;"></div></span>
	  	  	  	 		<span>商品种类：&nbsp;&nbsp;游戏账号</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi3.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥99.00</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong"></div></span>
	  	  	  	 		<span>商品种类：&nbsp;&nbsp;游戏账号</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi9.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥20.00</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 32px;"></div></span>
	  	  	  	 		<span>商品种类：&nbsp;&nbsp;游戏账号</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi6.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥29.00</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 32px;"></div></span>
	  	  	  	 		<span>商品种类：&nbsp;&nbsp;游戏账号</span>
	  	  	  	 	</a>
	  	  	  	 </div>
	  	  	  	 <div class="l_down_1">
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi1.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥48.00</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" ></div></span>
	  	  	  	 		<span>点券面额：&nbsp;&nbsp;500点券</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi4.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥96.96</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 80px;"></div></span>
	  	  	  	 		<span>点券面额：&nbsp;&nbsp;100点券</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi5.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥29.07</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 64px;"></div></span>
	  	  	  	 		<span>点券面额：&nbsp;&nbsp;300点券</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi3.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥14.41</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 48px;"></div></span>
	  	  	  	 		<span>点券面额：&nbsp;&nbsp;150点券</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi4.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥48.25</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 32px;"></div></span>
	  	  	  	 		<span>点券面额：&nbsp;&nbsp;500点券</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi8.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥9.75</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 80px;"></div></span>
	  	  	  	 		<span>点券面额：&nbsp;&nbsp;10Q币</span>
	  	  	  	 	</a>
	  	  	  	 </div>
	  	  	  	 
	  	  	  	 <div class="l_down_1">
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi9.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥10.00</h4> </span>
	  	  	  	 		<span>代练需求：白五上白四</span>
	  	  	  	 		<span>代练时间：&nbsp;&nbsp;12小时</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi9.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥24.00</h4> </span>
	  	  	  	 		<span>代练需求：白1上钻五</span>
	  	  	  	 		<span>代练时间：&nbsp;&nbsp;1天</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi1.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥50.00</h4> </span>
	  	  	  	 		<span>代练需求：黄金1星到铂金满星</span>
	  	  	  	 		<span>代练时间：&nbsp;&nbsp;1天</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi1.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥15.00</h4> </span>
	  	  	  	 		<span>代练需求：铂金4上铂金3</span>
	  	  	  	 		<span>代练时间：&nbsp;&nbsp;12小时</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi4.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥60.00</h4> </span>
	  	  	  	 		<span>代练需求：武极52级到90级</span>
	  	  	  	 		<span>代练时间：&nbsp;&nbsp;10天</span>
	  	  	  	 	</a>
	  	  	  	 </div>
	  	  	  	 
	  	  	  	 <div class="l_down_1">
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi12.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥100.0</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" ></div></span>
	  	  	  	 		<span>金币面额：&nbsp;&nbsp;4亿文</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi10.jpg);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥120.0</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 48px;"></div></span>
	  	  	  	 		<span>金币面额：&nbsp;&nbsp;4000000</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi2.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥61.00</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 32px;"></div></span>
	  	  	  	 		<span>金币面额：&nbsp;&nbsp;199金</span>
	  	  	  	 	</a>
	  	  	  	 	<a href="" style="background: url(img/sixth/jiaoyi11.gif);">
	  	  	  	 		<span style="margin-top: 90px;">商品价格：<h4>¥264.0</h4> </span>
	  	  	  	 		<span>卖家信用：<div class="xinyong" style="width: 16px;"></div></span>
	  	  	  	 		<span>金币面额：&nbsp;&nbsp;10金元宝</span>
	  	  	  	 	</a>
	  	  	  	 </div>
	  	  	  </div>
	  		</div>
	  		<div id="sixth_r">
	  			<img src="img/sixth/sixth_ad.jpg" alt="" />
	  			<div>
	  				<img src="img/sixth/ad1.jpg" alt="" />
	  			</div>
	  			<div>
	  				<img src="img/sixth/ad3.jpg" alt="" />
	  			</div>
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
	  				<a href=""> <img src="img/seventh/sev_game_d.jpg"/></a>
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
	  				<a href=""> <img src="img/seventh/sev_game_m2.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_m3.png"/></a>
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
	  				<a href=""> <img src="img/seventh/sev_game_w1.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_w2.gif"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_x1.png"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_x2.png"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_y1.gif"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_y2.png"/></a>
	  			</div>
	  			<div>
	  				<a href=""> <img src="img/seventh/sev_game_z1.jpg"/></a>
	  				<a href=""> <img src="img/seventh/sev_game_z2.png"/></a>
	  			</div>
	  			
	  		</div>
	  		<div id="seventh_down">
                <ul>
                	<li>
                		<a class="seventh_a1" href=""><img src="img/seventh/seven_youxi1.jpg" alt="" /></a>
                		<span>
                			<a class="seventh_a2" href="">游戏账号</a>
                			<a class="seventh_a2" href="">游戏币</a>
                			<a class="seventh_a2" href="">点券</a>
                		</span>
                	</li>
                	<li>
                		<a class="seventh_a1" href=""><img src="img/seventh/seven_youxi2.jpg" alt="" /></a>
                		<span>
                			<a class="seventh_a2" href="">游戏账号</a>
                			<a class="seventh_a2" href="">游戏币</a>
                			<a class="seventh_a2" href="">深渊票</a>
                		</span>
                	</li>
                	<li>
                		<a class="seventh_a1" href=""><img src="img/seventh/seven_youxi3.jpg" alt="" /></a>
                		<span>
                			<a class="seventh_a2" href="">游戏账号</a>
                			<a class="seventh_a2" href="">游戏币</a>
                			<a class="seventh_a2" href="">装备</a>
                		</span>
                	</li>
                	<li>
                		<a class="seventh_a1" href=""><img src="img/seventh/seven_youxi4.jpg" alt="" /></a>
                		<span>
                			<a class="seventh_a2" href="">游戏账号</a>
                			<a class="seventh_a2" href="">游戏币</a>
                			<a class="seventh_a2" href="">真言</a>
                		</span>
                	</li>
                	<li>
                		<a class="seventh_a1" href=""><img src="img/seventh/seven_youxi5.jpg" alt="" /></a>
                		<span>
                			<a class="seventh_a2" href="">游戏账号</a>
                			<a class="seventh_a2" href="">游戏币</a>
                			<a class="seventh_a2" href="">装备</a>
                		</span>
                	</li>
                	<li>
                		<a class="seventh_a1" href=""><img src="img/seventh/seven_youxi6.jpg" alt="" /></a>
                		<span>
                			<a class="seventh_a2" href="">游戏账号</a>
                			<a class="seventh_a2" href="">游戏币</a>
                			<a class="seventh_a2" href="">装备</a>
                		</span>
                	</li>
                </ul>
	  		</div>
	  	</div>
	  	<div id="eighth">
	  		<img src="img/long_ad2.jpg" alt="" />
	  	</div>
	  	<div id="ninth">
	  		<img src="img/end_guanggao.jpg" alt="" />
	  	</div>
	  	<div id="tenth">   <!--右边悬浮框-->
	  		<ul>
	  			<li><a class="a1" href=""></a></li>
	  			<li><a class="a2" href=""></a></li>
	  			<li><a class="a3" href=""></a></li>
	  			<li><a class="a4" href=""></a></li>
	  			<li><a class="a5" href=""></a></li>
	  		</ul>
	  	</div>
	  </div>
</body>
</html>