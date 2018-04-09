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
<title>${choseGameType}商品</title>
<link rel="stylesheet" type="text/css" href="mycss/goodListCss.css"/>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
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
<div id="showOneGame">
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
	  			<!--<img src="img/login_2.png" alt="logo" />-->
	  			<img id="dog" src="img/first_two_gou1.jpg"   />
	  			<h3 id="two_h2">游戏商品</h3>
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
	  				<li style="margin-left: 28px;"><a href="mainFrame.jsp">返回首页</a></li>
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
	  	  	 <span>您的位置：<a href="mainFrame.jsp">首页</a>><a href="buyGame.jsp">全部游戏</a>>${choseGameType}</span>
	  	  </div>
	  	  <div id="sh_third">
	  	  	 <ul>
	  	  	 	<li>物品分类</li>
	  	  	 	<li><a class="third_check" href="">全部</a></li>
	  	  	 	<li><a class="third_uncheck" href="">账号</a></li>
	  	  	 	<li><a class="third_uncheck" href="">点券</a></li>
	  	  	 	<li><a class="third_uncheck" href="">代练</a></li>
	  	  	 </ul>
	  	  	 <ul>
	  	  	 	<li>游戏平台</li>
	  	  	 	<li><a class="third_check" href="">全部</a></li>
	  	  	 	<li><a class="third_uncheck" href="">苹果</a></li>
	  	  	 	<li><a class="third_uncheck" href="">安卓</a></li>
	  	  	 </ul>
	  	  	 <ul>
	  	  	 	<li>价格</li>
	  	  	 	<li><a class="third_check" href="">全部</a></li>
	  	  	 	<li><a class="third_uncheck" href="">30以下</a></li>
	  	  	 	<li><a class="third_uncheck" href="">31-100元</a></li>
	  	  	 	<li><a class="third_uncheck" href="">101-300元</a></li>
	  	  	 	<li><a class="third_uncheck" href="">301-500元</a></li>
	  	  	 	<li><a class="third_uncheck" href="">500元以上</a></li>
	  	  	 </ul>
	  	  </div>
	  	  <div id="sh_fourth">
	  	  	 <span>商品信息</span>
	  	  	 <ul>
	  	  	 	<li id="fourth_li1"><a href="">价格</a></li>
	  	  	 	<li>库存</li>
	  	  	 	<li>操作</li>
	  	  	 </ul>
	  	  </div>
	  	  
	  	  <s:iterator value="list" var="g" status="L">
	  	  <div id="sh_fifth">  <!--每一个“sh_fifth”为一件商品-->
	  	  	 <div class="sh_fifth_l">
	  	  	 	 <h6><s:property value="#g.gname" /></h6>
	  	  	 	<span class="fifth_span1">卖家信用：
	  	  	 	          <s:if test="#g.gguser.credit <= 10 "><div style="width: 16px;"></div></s:if>
	  	  	 	          <s:elseif test="#g.gguser.credit <= 20"><div style="width: 32px;"></div></s:elseif>
	  	  	 	          <s:elseif test="#g.gguser.credit <= 30"><div style="width: 48px;"></div></s:elseif>
	  	  	 	          <s:elseif test="#g.gguser.credit <= 40"><div style="width: 64px;"></div></s:elseif>
	  	  	 	          <s:elseif test="#g.gguser.credit < 50"><div style="width: 64px;"></div></s:elseif>
	  	  	 	          <s:elseif test="#g.gguser.credit >= 50"><div style="width: 80px;"></div></s:elseif>
<%-- 	  	  	 	          <s:elseif test="#g.gguser.credit > 50"><div style="width: 80px;"></div></s:elseif> --%>
	  	  	    </span>   <!--这里面的‘div’是为了控制钻石的个数-->
	  	  	 	<span>商品类型：&nbsp;&nbsp;&nbsp;<s:property value="#g.goodType" /></span>
	  	  	 	<span>游戏类型：&nbsp;&nbsp;&nbsp;<s:property value="#g.ggtype.typename" /></span>
	  	  	 </div>
	  	  	 <div class="sh_fifth_r">
	  	  	 	<h2>¥<s:property value="#g.gprice" /></h2>
	  	  	 	<span><s:property value="#g.savenum" />件</span>
	  	  	 	<a href="buyGoodsAction_findOneGoodById.action?goodId=<s:property value="#g.gid" />">立即购买</a>
	  	  	 </div>
	  	  </div>
          </s:iterator>

         <!--  复制商品-->
	  	  <div id="sh_fifth">
	  	  	 <div class="sh_fifth_l">
	  	  	 	 <h6>凤求凰韩信不知火舞娜可露露26英雄6皮肤黄金1</h6>
	  	  	 	<span class="fifth_span1">卖家信用：<div></div></span>
	  	  	 	<span>商品类型：&nbsp;&nbsp;&nbsp;账号</span>
	  	  	 	<span>游戏类型：&nbsp;&nbsp;&nbsp;王者荣耀</span>
	  	  	 </div>
	  	  	 <div class="sh_fifth_r">
	  	  	 	<h2>¥48.00</h2>
	  	  	 	<span>1件</span>
	  	  	 	<a href="">立即购买</a>
	  	  	 </div>
	  	  </div>
	  	  <div id="sh_fifth">
	  	  	 <div class="sh_fifth_l">
	  	  	 	 <h6>凤求凰韩信不知火舞娜可露露26英雄6皮肤黄金1</h6>
	  	  	 	<span class="fifth_span1">卖家信用：<div></div></span>
	  	  	 	<span>商品类型：&nbsp;&nbsp;&nbsp;账号</span>
	  	  	 	<span>游戏类型：&nbsp;&nbsp;&nbsp;王者荣耀</span>
	  	  	 </div>
	  	  	 <div class="sh_fifth_r">
	  	  	 	<h2>¥48.00</h2>
	  	  	 	<span>1件</span>
	  	  	 	<a href="">立即购买</a>
	  	  	 </div>
	  	  </div>
	  	  <div id="sh_fifth">
	  	  	 <div class="sh_fifth_l">
	  	  	 	 <h6>凤求凰韩信不知火舞娜可露露26英雄6皮肤黄金1</h6>
	  	  	 	<span class="fifth_span1">卖家信用：<div></div></span>
	  	  	 	<span>商品类型：&nbsp;&nbsp;&nbsp;账号</span>
	  	  	 	<span>游戏类型：&nbsp;&nbsp;&nbsp;王者荣耀</span>
	  	  	 </div>
	  	  	 <div class="sh_fifth_r">
	  	  	 	<h2>¥48.00</h2>
	  	  	 	<span>1件</span>
	  	  	 	<a href="">立即购买</a>
	  	  	 </div>
	  	  </div>
	  	  <div id="sh_fifth">
	  	  	 <div class="sh_fifth_l">
	  	  	 	 <h6>凤求凰韩信不知火舞娜可露露26英雄6皮肤黄金1</h6>
	  	  	 	<span class="fifth_span1">卖家信用：<div></div></span>
	  	  	 	<span>商品类型：&nbsp;&nbsp;&nbsp;账号</span>
	  	  	 	<span>游戏类型：&nbsp;&nbsp;&nbsp;王者荣耀</span>
	  	  	 </div>
	  	  	 <div class="sh_fifth_r">
	  	  	 	<h2>¥48.00</h2>
	  	  	 	<span>1件</span>
	  	  	 	<a href="">立即购买</a>
	  	  	 </div>
	  	  </div>
	  	  <div id="sh_fifth">
	  	  	 <div class="sh_fifth_l">
	  	  	 	 <h6>凤求凰韩信不知火舞娜可露露26英雄6皮肤黄金1</h6>
	  	  	 	<span class="fifth_span1">卖家信用：<div></div></span>
	  	  	 	<span>商品类型：&nbsp;&nbsp;&nbsp;账号</span>
	  	  	 	<span>游戏类型：&nbsp;&nbsp;&nbsp;王者荣耀</span>
	  	  	 </div>
	  	  	 <div class="sh_fifth_r">
	  	  	 	<h2>¥48.00</h2>
	  	  	 	<span>1件</span>
	  	  	 	<a href="">立即购买</a>
	  	  	 </div>
	  	  </div>
	  	  
		</div>
</body>
</html>