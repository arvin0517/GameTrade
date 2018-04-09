 function check(){
	 
	if(document.saveform.password.value==document.saveform.password.value){
		
		document.saveform.submit();
		return true;
	}else{
		
		alert("密码不一致");
		return false;
	}
	 
 }
