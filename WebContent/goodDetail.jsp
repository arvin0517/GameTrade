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
<title>Insert title here</title>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<link rel="stylesheet" type="text/css" href="mycss/goodDetailCss.css"/>
<script src="myjs/move.js" type="text/javascript"></script>
<script type="text/javascript">
			
            window.onload = function(){
            	
            	 var tenth_ul1 = document.getElementsByClassName('tenth_ul1')[0];
            	 var ul1_ali = tenth_ul1.getElementsByTagName('li');
            	 
            	 var tenth_ul2 = document.getElementsByClassName('tenth_ul2')[0];
            	 var ul2_ali = tenth_ul2.getElementsByTagName('li');
            	 
//          	 alert(ul1_ali.length);
//          	 alert(ul2_ali.length);

                for(i=0;i<ul1_ali.length;i++){
                	
                	ul1_ali[i].index = i;
                	ul1_ali[i].onclick = function(){
                		
                		for(j=0;j<ul1_ali.length;j++){
                			
                			ul1_ali[j].className = "";
                			ul2_ali[j].style.display = "none";
                		}
                		
                		this.className = "tenth_check_li";
                		ul2_ali[this.index].style.display = "block";
                	}
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
<div id="goodDetail">
 <input type="hidden" name="" id="hid" value="${existUser.uname}" />
			<div id="first">
	  		<div id="first_one">
	  		  <div id="first_one_ldiv">
	  			<ul id="first_one_l">
                   <li>您好！</li>
                   <li>请<a href="login.html">登录</a></li>
                   <li><a href="register.html">免费注册</a></li>
                   <li class="loaded"><a href="personal.jsp">${existUser.uname}</a></li>
                   <li class="loaded"><a href="loginAction_logout.action">退出</a></li>
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
	  			<!--<img src="img/login_2.png" alt="logo" />-->
	  			<img id="dog" src="img/first_two_gou1.jpg"   />
	  			<h3 id="two_h2">商品详情</h3>
	  			<div id="two_search">
	  			   <ul id="two_search_up">
	  			   	<li id="li_easy" class="checked_Color"><a href="#">简单搜索</a></li>
	  			   <!--	<li id="li_high" class="unchecked_Color"><a href="#">高级搜索</a></li>-->
	  			   </ul>
	  			   <div id="search_bar">
	  			   	 <!--<ul id="search_bar_ul">
	  			   	 	<li>游戏名称</li>
	  			   	 	<li>游戏区</li>
	  			   	 	<li>游戏服务器</li>
	  			   	 	<li>全部分区</li>
	  			   	 </ul>-->
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
	  				<li style="margin-left: 28px;"><a href="#">返回首页</a></li>
	  				<li><a href="#">我要导购</a> </li>
	  				<li><a href="#">金币</a></li>
	  				<li><a href="#">账号</a></li>
	  				<li><a href="#">代练</a></li>
	  				<li><a href="#">首充号</a></li>
	  				<!--<li><a href="#">热门游戏</a></li>
	  				<li><a href="#">手游交易</a></li>
	  				<li><a href="#">客服中心</a></li>-->
	  			</ul>
	  		</div>
	  	  </div>
	  	  <div id="sh_second">
	  	  	 <span>您的位置：<a href="">首页</a>><a href="">全部游戏</a>><a href="">王者荣耀</a>>商品详情</span>
	  	  </div>
	  	  <div id="gd_third"></div>
	  	  <div id="gd_fourth">
	  	  	 <h5>商品详情</h5>
	  	  	 <span><a href="">我要投诉</a>>><a href="">我要咨询</a></span>
	  	  </div>
	  	  <div id="gd_fifth">
	  	  	 <span>商品名称:&nbsp;【五星卖家】凤求凰韩信不知火舞娜可露露26英雄6皮肤黄金1</span>
	  	  </div>
	  	  <div id="gd_sixth">
	  	  	 <img src="img/goods/one1.jpg" alt="" />
	  	  	 <div class="">
	  	  	 	<ul class="sixth_ul1">
	  	  	 		<li>商品售价：</li>
	  	  	 		<li>商品库存：</li>
	  	  	 		<li>游戏类型：</li>
	  	  	 		<li>商品类型：</li>
	  	  	 		<li>安全系数：</li>
	  	  	 	</ul>
	  	  	 	<ul class="sixth_ul2">
	  	  	 		<li><h2>160.00</h2>元</li>
	  	  	 		<li>1件</li>
	  	  	 		<li>王者荣耀</li>
	  	  	 		<li>账号交易</li>
	  	  	 		<li><div></div></li>      <!--这里面的‘div’是为了控制星星的个数-->
	  	  	 	</ul>
	  	  	 	<a href="">立即购买</a>
	  	  	 </div>
	  	  </div>
	  	  <div id="gd_seventh">
	  	  	 <span>账号描叙</span>
	  	  </div>
	  	  <div id="gd_eighth">
	  	  	 <ul class="eighth_ul1">
	  	  	 	<li>身份证选择</li>
	  	  	 	<li>账号亮点描述</li>
	  	  	 </ul>
	  	  	 <ul class="eighth_ul2">
	  	  	 	<li>身份证未设置</li>
	  	  	 	<li><p>1.秒升30级(只限IOS系统) 2.此账号为完美开局号，0排位，0匹配，0战绩，成号过程没浪费1个金币一个钻石 
	  	  	 		3.上图效果图为我们稍微操作了一下所得到的，不是实际现有账号里的，要和效果图一样，自己去打去领（
	  	  	 		领取方式拍下后告知） 4.现有的游戏金币34000左右钻石1400左右（PS.冒险过一下大约可以领取600钻石加
	  	  	 		10000左右的金币，活动礼包均未领取，见下栏礼包领取方式，） 5.用户需要提供帐号以及密码，我们将已练好的帐号，
	  	  	 		导入到用户帐号上去用户好友均在 6.英雄3-5个 7.区服，例如用户现在是1区的，那我们只能转到1区以外的区服上去，
	  	  	 		也就是说空降一个30级的号到其他区服上去 8.用户原所在区服帐号资料均不受影响 9.工作室批量号，金币钻石都差不多，
	  	  	 		用户自己清理下 礼包领取有 1.QQ手游里/微信手游里 2.企鹅电竞里 3.王者荣耀助手 4.CDK自己去TB或者5173自行购买
	  	  	 		 5.成就如果自己不会打，花10几块钱找个代练给你打打，钻石大大的多</p>
	  	  	 	</li>
	  	  	 </ul>
	  	  </div>
	  	  <div id="gd_seventh">
	  	  	 <span>账号截图</span>
	  	  </div>
	  	  <div id="gd_tenth">
	  	  	 <ul class="tenth_ul1">
	  	  	 	<li class="tenth_check_li"><img src="img/goods/one1.jpg" alt="" /></li>
	  	  	 	<li><img src="img/goods/one2.jpg" alt="" /></li>
	  	  	 	<li><img src="img/goods/one3.jpg" alt="" /></li>
	  	  	 </ul>
	  	  	 <ul class="tenth_ul2">
	  	  	 	<li><img src="img/goods/one1.jpg" alt="" /></li>
	  	  	 	<li><img src="img/goods/one2.jpg" alt="" /></li>
	  	  	 	<li><img src="img/goods/one3.jpg" alt="" /></li>
	  	  	 </ul>
	  	  </div>
	  	  <div id="gd_seventh">
	  	  	 <span>交易流程</span>
	  	  </div>
	  	  <img id="gd_eleventh" src="img/jylch.jpg"  alt="" />
		</div>
</body>
</html>