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
<title>个人管理订单</title>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<style type="text/css">
	#per_goodlist{
		
	   /*float: left;*/
	   margin: 0 auto;
       width: 800px;
       height: 500px;
       /*background: bisque;	*/	
       /* border: 1px solid blue;		*/
       position: absolute;
       overflow: hidden;
	}
	
	table{
		margin: 20px 0 0 0;			
		border-collapse: collapse;
		width: 795px;
		border: none;
	}
	
	td{
		
		text-align: center;
	}
	
	#tr_head{
		
		border-top: 2px solid #099ACB;
		border-bottom: 2px solid #099ACB;
		border-right: 0;
		border-left: 0;
		height: 30px;
		font-family: "微软雅黑" serif;
		color: white;
		font-size: 16px;
		
		background: #26ADDB;
	}
	#tr_head th{
		text-align: center;
		font-weight: 500;
		border: 0;
	}
	
	#tr_body{
		
		height: 70px;
		font-size: 13px;
		color: #0F9CCC;
		border-left-color: white;
		border-right-color: white;
		border-bottom: 1px solid #26ADDB;
	
	}
	
	.td_a{
	   display: block;	
	   background: #099ACB;	
	   width: 65px;
	   height: 25px;
	   line-height: 25px;
	   border: 1px solid #099ACB;
	   border-radius: 4px;
	   color: white;
	   margin: 0 auto;	
	   text-decoration: none;
	   cursor: pointer;
	}
	
	.td_a:active{
		
		background: #FF8100;
		border: 1px solid #FF8100;
		
	}
	.td_a:hover{
		
		background: #FF6600;
		border: 1px solid #FF6600;	
	}
	
	#per_goodlist_down{
		
		margin: 50px 5px 0 0;
		width: 470px;
		height: 40px;
            	float: right;
            /*	border: 1px solid;*/
            	font-size: 14px;
            	color: orangered;			
	}
	
	.second_a{
		
	    
		display: block;
		float: left;
		text-decoration: none;
		width: 50px;
		height: 20px;
		background: deepskyblue;
		color: white;
		margin:  0 10px 0 0;
		border-radius: 4px;
		text-align: center;
		
	}
	
	.second_a:hover{
		
		background: #0EA9DD;
		
	}
	
	.second_a:active{
		
		background: #0B789D;
	}
	
	#down_inner{
		
		margin: 10px 0 0 0;
		width: 270px;
		height: 25px;
		float: right;
             /* border: 1px solid saddlebrown;			*/	
	}
	
	#down_first{
		
		color: #0F9CCC;
		display: block;
		float: left;
		margin: 10px 0 0 0;
	}
	
	#form_state{
		
		width: 550px;
		height: 150px;
		border: 1px solid wheat;
		border-radius: 9px;
		position: relative;
		left: 80px;
		top: -350px;
		/*top: -210px; */  /*70px一个单位*/
		background: wheat;
		display: none;
		
	}
	#form_state h4{
		
		margin: 15px 0 0 15px;
		font-size: 15px;
		font-weight: 500;
		color: grey;
	}
	
	/*#form_text{
		
	   background-color: transparent; 设置文本框透明
		margin: 0 0 0 0;
		width: 550px;
		height: 50px;
		border-top: 1px solid #E5E5E5;
		border-bottom: 1px solid #E5E5E5;
		border-left: 0;
		border-right: 0;
		outline: none;
		font-size: 15px;
		padding: 0 0 0 15px;
		color: grey;
	}*/
	
	#form_text{
		
		/*width: 550px;*/
		width: 550px;
		height: 50px;
		position: absolute;
		border-top: 1px solid #E5E5E5;
		border-bottom: 1px solid #E5E5E5;
		border-left: 0;
		border-right: 0;
		outline: none;
		font-size: 15px;
		padding: 0 0 0 15px;
		color: grey;
		background-color: transparent;/* 设置文本框透明*/
		margin: 10px 0 0 0;
	}
	
	#form_defind{
		
		float: right;
		height: 30px;
		margin: 20px 20px 0 0;
		background: #337AB7;
		color: white;
		border-radius: 4px;
		border: 0;
		outline: none;
		position: absolute;
		right: 0;
		bottom: 10px;
		cursor: pointer;
	}
	#form_defind:active{
		
		background: #215F94;
	}
	
	#form_close{
		
		float: right;
		height: 30px;
		margin: 10px 10px 0 0;
		background: wheat;
		color: grey;
		border-radius: 4px;
		border: 1px solid gray;
		outline: none;
		position: absolute;
		right: 100px;
		bottom: 10px;
		cursor: pointer;
	}
	
	#form_close:active{
		
		background: #215F94;
		border: 0;
		color: white;
	}
	
	#check_a{
			   display: block;	
			   background: #099ACB;	
			   width: 65px;
			   height: 25px;
			   line-height: 25px;
			   border: 1px solid #099ACB;
			   border-radius: 4px;
			   color: white;
			   margin: 0 auto;	
			   text-decoration: none;
			   cursor: pointer;
			}
			
	#check_a:active{
		
		background: #FF8100;
		border: 1px solid #FF8100;
		
	}
	#check_a:hover{
		
		background: #FF6600;
		border: 1px solid #FF6600;	
	}
</style>
<script src="myjs/jquery-3.2.1.js" type="text/javascript" ></script>
<script type="text/javascript">
			$(document).ready(function(){
				
				var chiocformId = 0;  //需要退货的订单的id,在点击“确认退款的事件中需要用到”
				
				
				//点击每个“申请退款”按钮，发生的事件
				$(".td_a").click(function(event){
					
					
					
					var text_pre = $(this).prev().val()  //获取知道点击的是哪个订单，方便计算"填写退货理由"文本框的位置
					chiocformId = $(this).next().val();  //获取需要退货的商品的id
					
				//	alert("text_pre:"+text_pre+"  chiocgoodId"+chiocgoodId);
				   var listSize = $("#listSize").val();
				 //  alert("listSize:"+listSize);
					
					var topIndex = -350+(($(this).prev().val()-1)*70)+(5-listSize)*70;
					
					
					//$("#form_text").val(text_pre+text_next);
					$("#form_state").fadeToggle();
					$("#form_state").css("top",topIndex);
					event.stopPropagation();  //取消冒泡事件
									
				});
				
				
//				$("#form_text").keydown(function(event){
//					
//					 var text = $("#form_text").val();
//					 if(text.length>=30&&event.keyCode!=8){
//					 	
//					 	  return false;
//					 }
//					
//					
//				})
				
				
				//点击整个页面时，文本框消失
				$(document).click(function(){
					
					$("#form_text").val("");
					$("#form_state").fadeOut();
				});
				
				
				//点击关闭按钮时，文本框消失
				$("#form_close").click(function(){
					
					$("#form_text").val("");
					$("#form_state").fadeOut();
					
				});
				
				//当点击文本框时,使其取消冒泡事件
				$("#form_state").click(function(event){
					
					event.stopPropagation(); //取消冒泡事件
					
				});
				
				//点击“确认退款”按钮
				$("#form_defind").click(function(){
					
					var form_text = $("#form_text").val();  //文本框的内容(退货理由)
					$("#form_text").val("");               //文本框的内容清空
					$("#form_state").fadeOut();            //文本框消失
					var curruserId = $("#curruserId").val();   //当前登录用户id
					var currpage = $("#currpage").val();       //当前页数
					//alert("chiocformId:"+chiocformId+"   form_text:"+form_text+" curruserId:"+curruserId +" currpage:"+currpage);
					
					 $.ajax({ 
					        
						   //这里的需要Struts.xml的<action/>的name属性一致。
					       url:'manFormAction_backFormByFid.action',
					       
					       //提交类型
					       type:'POST',
					       
					       //提交数据给Action传入数据 
					       data:{'tempformId':chiocformId,'tempReason':form_text}, 
					       
					       //返回的数据类型
					       dataType:'json', 
					       
					       
					       //成功是调用的方法
					       success:function(data){ 
					    	 // alert(data);
					    	  //alert(data.result);
					    	   //获取Action返回的数据用  data.Action中的属性名 获取
					          if(data=="false")
					          {
					              // $("#error").show();
					          }else if(data=="true"){
					        	
					        	 // alert("curruserId:"+curruserId+"   currpage:"+currpage)
					            location.href = "manFormAction_findFormListByUid.action?currPage="+currpage+"&userId="+curruserId;   
					           
					          
					          }
					          }
					     });
					
				});
				
			})
			
		</script>
</head>
<body>
  <div id="per_goodlist">
  <input type="hidden" name="" id="curruserId" value="${existUser.uid}" />
  <input type="hidden" name="" id="currpage" value="<s:property value="currPage" />" />
			<table border="" cellspacing="" cellpadding="">
				<tr id="tr_head">
					<th style="width: 160px;">商品名称</th>
					<th>数量</th>
					<th>价格</th>
					<th>卖家</th>
					<th>交易账号</th>
					<th>状态</th>
					<th>下单时间</th>
					<th>操作</th>
					<th>操作</th>
				</tr>
				<s:iterator value="list" var="f" status="L">
				<input type="hidden" name="" id="listSize" value="<s:property value="list.size()"/>" />
				<tr id="tr_body">
					<td><s:property value="#f.goodName" /></td>
					<td><s:property value="#f.fnumber" /></td>
					<td><s:property value="#f.totalPrice" />￥</td>
					<td><s:property value="#f.sellName" /></td>
					<td><s:property value="#f.transfer" /></td>
					<td><s:property value="#f.fstate" /></td>
					<td><s:date name="#f.subtime"/></td>
					
					<s:if test="#f.fstate == '已付款' ">
					 <td>
						<!--<a id="td_a" href="">申请退款</a>-->
						<input type="hidden" name="" id="" value="<s:property value="#L.index+1"/>" />
						<span class="td_a">
							申请退款
						</span>
						<input type="hidden" name="" id="" value="<s:property value="#f.fid" />" />
					 </td>
					 <td><a id="check_a" href="manFormAction_finishForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">确认收货</a></td>
					</s:if>
					<s:elseif test="#f.fstate == '退货中' ">
					     <td><a id="check_a" href="manFormAction_cancelBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">取消退货</a></td>
					</s:elseif>
					<s:elseif test="#f.fstate == '卖家拒绝退货' ">
					     <td><a id="check_a" href="manFormAction_cancelBackForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">取消退货</a></td>
					</s:elseif>
					<s:elseif test="#f.fstate == '退货成功' ">
					     <td><a id="check_a" href="manFormAction_deleteForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">删除订单</a></td>
					</s:elseif>
					<s:elseif test="#f.fstate == '强制退货成功' ">
					     <td><a id="check_a" href="manFormAction_deleteForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">删除订单</a></td>
					</s:elseif>
					<s:elseif test="#f.fstate == '退货失败' ">
					     <td><a id="check_a" href="manFormAction_finishForm.action?tempformId=<s:property value="#f.fid"/>&currPage=<s:property value="currPage" />&userId=${existUser.uid}">确认收货</a></td>
					</s:elseif>
				</tr>
				</s:iterator>
<!-- 				<tr id="tr_body"> -->
<!-- 					<td>5000金币=50元</td> -->
<!-- 					<td>5</td> -->
<!-- 					<td>50￥</td> -->
<!-- 					<td>a111111</td> -->
<!-- 					<td>13631292105</td> -->
<!-- 					<td>已付款</td> -->
<!-- 					<td>2017-05-29 18:13:33</td> -->
<!-- 					<td><a id="td_a" href="">申请退款</a> -->
<!-- 						<input type="hidden" name="" id="" value="2" /> -->
<!-- 						<span class="td_a"> -->
<!-- 							申请退款 -->
<!-- 						</span> -->
<!-- 						<input type="hidden" name="" id="" value="7" /> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr id="tr_body"> -->
<!-- 					<td>5000金币=50元</td> -->
<!-- 					<td>5</td> -->
<!-- 					<td>50￥</td> -->
<!-- 					<td>a111111</td> -->
<!-- 					<td>13631292105</td> -->
<!-- 					<td>已付款</td> -->
<!-- 					<td>2017-05-29 18:13:33</td> -->
<!-- 					<td><a id="td_a" href="">申请退款</a> -->
<!-- 						<input type="hidden" name="" id="" value="3" /> -->
<!-- 						<span class="td_a"> -->
<!-- 							申请退款 -->
<!-- 						</span> -->
<!-- 						<input type="hidden" name="" id="" value="8" /> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr id="tr_body"> -->
<!-- 					<td>5000金币=50元</td> -->
<!-- 					<td>5</td> -->
<!-- 					<td>50￥</td> -->
<!-- 					<td>a111111</td> -->
<!-- 					<td>13631292105</td> -->
<!-- 					<td>已付款</td> -->
<!-- 					<td>2017-05-29 18:13:33</td> -->
<!-- 					<td><a id="td_a" href="">申请退款</a> -->
<!-- 						<input type="hidden" name="" id="" value="4" /> -->
<!-- 						<span class="td_a"> -->
<!-- 							申请退款 -->
<!-- 						</span> -->
<!-- 						<input type="hidden" name="" id="" value="9" /> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr id="tr_body"> -->
<!-- 					<td>5000金币=50元</td> -->
<!-- 					<td>5</td> -->
<!-- 					<td>50￥</td> -->
<!-- 					<td>a111111</td> -->
<!-- 					<td>13631292105</td> -->
<!-- 					<td>已付款</td> -->
<!-- 					<td>2017-05-29 18:13:33</td> -->
<!-- 					<td><a id="td_a" href="">申请退款</a> -->
<!-- 						<input type="hidden" name="" id="" value="5" /> -->
<!-- 						<span class="td_a"> -->
<!-- 							申请退款 -->
<!-- 						</span> -->
<!-- 						<input type="hidden" name="" id="" value="10" /> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<!--<tr><td>Data</td></tr>-->
			</table>
			<div id="per_goodlist_down">				
				<span id="down_first">当前页：&nbsp;<s:property value="currPage" />/<s:property value="totalPage" />&nbsp;&nbsp;总记录数：&nbsp;<s:property value="totalCount" />&nbsp;&nbsp;&nbsp;</span>
				<div id="down_inner">
					<span id="down_second">
	                 <s:if test="currPage != 1">
						<a class="second_a" href="manFormAction_findFormListByUid.action?currPage=1&userId=${existUser.uid}">首页</a>&nbsp;&nbsp;<a class="second_a" href="manFormAction_findFormListByUid.action?currPage=<s:property value="currPage-1"/>&userId=${existUser.uid}">上一页</a>&nbsp;&nbsp;
					 </s:if>
					 <s:if test="currPage != totalPage">
						<a class="second_a" href="manFormAction_findFormListByUid.action?currPage=<s:property value="currPage+1"/>&userId=${existUser.uid}">下一页</a>&nbsp;&nbsp;<a class="second_a" href="manFormAction_findFormListByUid.action?currPage=<s:property value="totalPage" />&userId=${existUser.uid}">尾页</a>
					 </s:if>
					</span>
				</div>	
				
			</div>
			<div id="form_state">
					<h4>请输入退款理由：</h4>
					<input type="text" name="" id="form_text" value="" placeholder="不超过30字符!"/>
					<button id="form_defind" >确认退款</button>
					<button id="form_close" >关闭</button>
		    </div>
		</div>
</body>
</html>