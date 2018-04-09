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
<title>选择商品类型</title>
<style type="text/css">
			
	#selectType{
		
	    width: 620px;
	    height: 150px;
	   /* border: 1px solid;*/
	    margin: 130px auto;
		/*position: absolute;*/
	}
	
	#div_img1{
		
		width: 150px;
		height: 150px;
		float: left;
		margin: 0 5px 0 0;
		border-radius: 10px;
		position: relative;
		overflow: hidden;
		
	}
	#div_img2{
		
		width: 150px;
		height: 150px;
		float: left;
		margin: 0 5px 0 0;
		border-radius: 10px;
		position: relative;
		overflow: hidden;
	}
	#div_img3{
		
		width: 150px;
		height: 150px;
		float: left;
		margin: 0 5px 0 0;
		border-radius: 10px;
		position: relative;
		overflow: hidden;
		/*border: 1px solid;*/
	}
	#div_img4{
		
		width: 150px;
		height: 150px;
		float: left;
		margin: 0 5px 0 0;
		border-radius: 10px;
		position: relative;
		overflow: hidden;
	}
	
	.img_select{
		
		border-radius: 5px;
		position: absolute;
		right: 0;
		bottom: 0;
	}
	
	#duihua_jinbi{
		
		position: absolute;
		bottom:  138px;
		
		display: none;
	}
	
	#duihua_zhanghao{
		
		position: absolute;
		top: 80px;
		left: 530px;
		
		display: none;
	}
	
	#duihua_dailian{
		
		position: absolute;
		bottom:  138px;
		left: 680px;
		
		display: none;
	}
	
	#duihua_zhuangbei{
		
		position: absolute;
		top: 80px;
		left: 840px;
		
		display: none;
	}
	
	</style>
	<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
	<script type="text/javascript">
				
				$(document).ready(function(){
					
	//				$(".img_select").mouseover(function(){
	//					
	//					$(this).animate({
	//					  
	//					  right:'-25px',
	//					  bottom:'-25px',
	//					  height:'200px',
	//                    width:'200px'
	//					
	//				  },300);
	//					
	//				});
	//				
	//				$(".img_select").mouseout(function(){
	//					
	//					$(this).animate({
	//						
	//						right:'0px',
	//					    bottom:'0px',
	//					    height:'150px',
	//                      width:'150px'
	//						
	//					},400);
	//							
	//				});
					
					$("#img_1").mouseover(function(){
						
						$(this).animate({
						  
						  right:'-25px',
						  bottom:'-25px',
						  height:'200px',
	                      width:'200px'
						
					  },300);
						
						$("#duihua_jinbi").fadeIn();
					});
					
					$("#img_1").mouseout(function(){
						
						$(this).animate({
							
							right:'0px',
						    bottom:'0px',
						    height:'150px',
	                        width:'150px'
							
						},400);
						
						$("#duihua_jinbi").fadeOut();
								
					});
					
					$("#img_2").mouseover(function(){
						
						$(this).animate({
						  
						  right:'-25px',
						  bottom:'-25px',
						  height:'200px',
	                      width:'200px'
						
					  },300);
						
						$("#duihua_zhanghao").fadeIn();
					});
					
					$("#img_2").mouseout(function(){
						
						$(this).animate({
							
							right:'0px',
						    bottom:'0px',
						    height:'150px',
	                        width:'150px'
							
						},400);
							
						$("#duihua_zhanghao").fadeOut();	
					});
					
					$("#img_3").mouseover(function(){
						
						$(this).animate({
						  
						  right:'-25px',
						  bottom:'-25px',
						  height:'200px',
	                      width:'200px'
						
					  },300);
						
						$("#duihua_dailian").fadeIn();
					});
					
					$("#img_3").mouseout(function(){
						
						$(this).animate({
							
							right:'0px',
						    bottom:'0px',
						    height:'150px',
	                        width:'150px'
							
						},400);
						
						$("#duihua_dailian").fadeOut();
					});
					
					$("#img_4").mouseover(function(){
						
						$(this).animate({
						  
						  right:'-25px',
						  bottom:'-25px',
						  height:'200px',
	                      width:'200px'
						
					  },300);
					  
					  $("#duihua_zhuangbei").fadeIn();
						
					});
					
					$("#img_4").mouseout(function(){
						
						$(this).animate({
							
							right:'0px',
						    bottom:'0px',
						    height:'150px',
	                        width:'150px'
							
						},400);
						
						 $("#duihua_zhuangbei").fadeOut();
								
					});
				});
				
			</script>
</head>
<body>

<!--   <a href="sellGoodsAction_fingAllType.action">金币(点券)交易</a>&nbsp;&nbsp; -->
<!--   <a href="sellGoodsAction_fingAllType.action">账号交易</a>&nbsp;&nbsp; -->
<!--   <a href="sellGoodsAction_fingAllType.action">代练交易</a>&nbsp;&nbsp; -->
<!--   <a href="sellGoodsAction_fingAllType.action">装备交易</a>&nbsp;&nbsp; -->
<a href="mainFrame.jsp"><img src="img/xuanzeshangping.png" id="img_title"/></a>
<div id="selectType">
	<!--<img src="img/jinbi.png"/>
	<img src="img/zhanghao.jpg"/>
	<img src="img/dailian.png"/>
	<img src="img/zhuangbei.jpg"/>-->
	<img id="duihua_jinbi"    src="img/duihua_jinbi.jpg"/>
	<img id="duihua_zhanghao"    src="img/select_zhanghao.jpg"/>
	<img id="duihua_dailian"  src="img/duihua_dailian.jpg"/>
	<img id="duihua_zhuangbei" src="img/duihua_zhuangbei.jpg"/>
	<div id="div_img1">
		<a href="sellGoodsAction_fingAllType.action">
			<img id="img_1" class="img_select" src="img/jinbi.png"/>
		</a>
	</div>
	
	<div id="div_img2">
		<a href="sellGoodsAction_fingAllType.action"><img id="img_2" class="img_select" src="img/zhanghao.jpg"/></a>
	</div>
	
	<div id="div_img3">
		<a href="sellGoodsAction_fingAllType.action"><img id="img_3" class="img_select" src="img/dailian.png"/></a>
	</div>
	
	<div id="div_img4">
		<a href="sellGoodsAction_fingAllType.action"><img id="img_4" class="img_select" src="img/zhuangbei.jpg"/></a>
	</div>
	
</div>
</body>
</html>