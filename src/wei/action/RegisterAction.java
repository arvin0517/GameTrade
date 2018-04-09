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

	//��Ҫ������û���
	private String checkName;	
	
	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	//ע��registerService
	private RegisterService registerService;
	
	public RegisterService getRegisterService() {
		return registerService;
	}

	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}
	
	//����
	public void registerGo(){
		
		System.out.println("registerAction������");
		//registerService.registerGo();
		User checkUser = registerService.checkUserByName("a10956543");
		if(checkUser==null){
			System.out.println("checkUser�Ҳ���");
		}
		//System.out.println("checkUser.getPassword():"+checkUser.getPassword());
		//return "registerGo";
	}
	
	//�����û����Ƿ��ѱ�ע��
	@SuppressWarnings("unused")   //����Ӧ���ǹ��˾����
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
	
	//ע������û�
	public String saveUser(){
		
//		System.out.println(user.getUname());
//		System.out.println(user.getPassword());
//		System.out.println(user.getPhone());
//		System.out.println(user.getTradeNum());
		//System.out.println("actionSave");
		user.setCredit(20);
		user.setIsManager("N");
		user.setIsBan("����");
		user.setExistCash(500);
		user.setRegTime(new Date());
		registerService.save(user);
		
		return "saveSucc";
	}

}
