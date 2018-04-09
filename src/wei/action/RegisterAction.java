package wei.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import wei.entity.User;
import wei.service.RegisterService;

public class RegisterAction extends ActionSupport implements ModelDriven<User>{

	
    private User user= new User();
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	//需要检验的用户名
	private String checkName;	
	
	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	//注入registerService
	private RegisterService registerService;
	
	public RegisterService getRegisterService() {
		return registerService;
	}

	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}
	
	//测试
	public void registerGo(){
		
		System.out.println("registerAction运行了");
		//registerService.registerGo();
		User checkUser = registerService.checkUserByName("a10956543");
		if(checkUser==null){
			System.out.println("checkUser找不到");
		}
		//System.out.println("checkUser.getPassword():"+checkUser.getPassword());
		//return "registerGo";
	}
	
	//检验用户名是否已被注册
	@SuppressWarnings("unused")   //这里应该是过滤警告的
	public String checkUserByName(){
		
		System.out.println("checkName:"+checkName);
		User checkUser = registerService.checkUserByName(checkName);
	//	System.out.println("checkUser.getPassword():"+checkUser.getPassword());
		
        if(checkUser != null){
			
        	System.out.println("true");
			result = "true";
			
		}else{
			
			System.out.println("false");
			result = "false";
		}
		
		
		return "success";
	}
	
	//注册添加用户
	public String saveUser(){
		
//		System.out.println(user.getUname());
//		System.out.println(user.getPassword());
//		System.out.println(user.getPhone());
//		System.out.println(user.getTradeNum());
		//System.out.println("actionSave");
		user.setCredit(20);
		user.setIsManager("N");
		user.setIsBan("正常");
		user.setExistCash(500);
		user.setRegTime(new Date());
		registerService.save(user);
		
		return "saveSucc";
	}

}
