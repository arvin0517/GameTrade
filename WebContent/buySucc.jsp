<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买成功</title>
		<style type="text/css">
			
			#buySucc{
				
			    
				width: 800px;
				height: 347px;
				background-image: url(img/buySucc.jpg);
				margin: 20px auto;
			}
			
			#buyinForm{
				
				width: 500px;
				height: 210px;
				/*border: 1px solid;*/
				float: left;
				margin: 120px 0 0 215px;
			}
			
			span{
				
				display: block;
				color: #277A24;
				font-family: "微软雅黑" sans-serif;
				/*font-weight: 500;*/
				/*border: 1px solid;*/
				margin: 10px 0 0 0;
			}
			
			h3{
				
				display: inline;
				margin: 0 0 0 10px;
				color: orangered;
				font-size: 23px;
				font-weight: 500;
			}
		    h4{
		    	display: inline;
		    	margin: 0 0 0 10px;
		    	color: orangered;
				font-size: 16px;
				font-weight: 500;
		    }
		    
		    #goto{
		    	
		    	margin: 50px 0 0 5px;
		    	color: #277A24;
		    }
		    
		    a{
		    	
		    	color: orangered;
		    	text-decoration: none;
		    }	
		    a:hover{
		    	
		    	text-decoration: underline;
		    }
		    
		    h5{
		    	
		    	display: inline;
		    	font-size: 20px;
		    }
		</style>
		<script type="text/javascript">
			window.onload = function(){
				
//				var haha = document.getElementById("haha");
//				haha.onclick = function(){
//					
//					document.location.href = "findNull.html";
//				}
                 var buy_h5 = document.getElementById("buy_h5");
                 var num = 10;
                 setInterval(function(){
                 	
                 	if(num!=0){
                 		
                 		num = num-1;
                 	}
                 	
                 	buy_h5.innerHTML = num;
                 	
                 	if(num==0){
                 		
                 		document.location.href = "mainFrame.jsp";
                 		
                 	}
                 	
                 	
                 	
                 	                 	
                 },1000);
			}
		</script>
</head>
<body>
<div id="buySucc">
	   	   <div id="buyinForm">
	   	   	   <span class="buyspan1">支付金额:<h3>${buyedForm.totalPrice}¥</h3></span>
	   	   	   <span class="buyspan2">订单号:<h4>${buyedForm.formId}</h4></span>
	   	   	   <span class="buyspan2">商品名称:<h4>${buyedForm.goodName}</h4></span>
	   	   	   <div id="goto">
	   	   	   	  <h5 id="buy_h5">10</h5>&nbsp;秒后跳转到商品主页面，或点此[&nbsp;<a href="mainFrame.jsp">直接跳转</a>&nbsp;]
	   	   	   </div>
	   	   </div>
	   </div>
</body>
</html>