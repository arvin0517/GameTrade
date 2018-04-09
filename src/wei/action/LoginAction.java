package wei.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import wei.entity.User;
import wei.service.LoginService;

public class LoginAction extends ActionSupport {

	private String uname;
	private String password;
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	//ע��loginService
	private LoginService loginService;

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	
	//�û���¼
	public String login(){
		
		System.out.println("loginAction:"+uname+","+password);
		
		User existUser = loginService.findUserByNameAndPw(uname,password);
		//System.out.println("existUser:"+existUser.getUname()+","+existUser.getPassword());
		
		if(existUser!=null){
			
				System.out.println("�û�״̬�� "+ existUser.getIsBan());
				
			 if(existUser.getIsBan().equals("�ѷ��")){
				 
				 this.result = "ban";
				 
				 System.out.println("LoginAction: ���û��ѱ���ţ�");
				 
			 }else{
				 
					 if(existUser.getIsManager().equals("Y")){
						 
						 System.out.println("existUser.getIsManager()");
						 
						 this.result = "manage";
						 ActionContext.getContext().getSession().put("manageUser", existUser);
						 
					 }else{
						 
						 this.result = "true";				 
						 ActionContext.getContext().getSession().put("existUser", existUser);					 
						 
				     }

			 }	
			
		
			
		}else{
			
			this.result = "false";
		}
		
		return "success";
		
	}
	
	//ע���û�
	public String logout(){
		
		ActionContext.getContext().getSession().remove("existUser");
		
		return "logout";
		
	}
	
    public String manageLogout(){
    	
    	ActionContext.getContext().getSession().remove("manageUser");
    	
    	return "logoutManaSucc";
    }
	
	//ͨ���û��������û�
	public String findUserByUname(){
		
		//User user = loginService.findUserByUname(uname);
		
//		if(user!=null){
//			
//			//this.result = "true";
//			JSONObject json = JSONObject.fromObject(user);
//			String str = json.toString();
//			
//			//System.out.println("json:" + str);
//			
//			this.result = "true";
//			
//		}else{
//			
//			this.result = "false";
//		}
		
		List<User> userList = loginService.findUserListByUname(uname);
		
		if(userList != null){
			
		    JsonConfig jsonConfig = new JsonConfig();  //���������ļ�
			jsonConfig.setIgnoreDefaultExcludes(false);  //����Ĭ�Ϻ���
			jsonConfig.setExcludes(new String[]{"ggoods"});  //���˱��еļ�������
			JSONArray jsonArray = JSONArray.fromObject(userList,jsonConfig);
			
			String str = jsonArray.toString();    //��json תΪ�ַ���
			//System.out.println("str:"+str);
			this.result = str;
			
			
		}else{
			
			this.result = "false";
			
		}
		
		
		return "success";
	}
	
	public String getCheckCode(){
		
		String checkCode = "";
		
		for(int i =0; i<5;i++){
			
			checkCode += (int)(Math.random()*10);
		}
		
		this.result = checkCode;
		
		System.out.println("������֤���ǣ�    " + checkCode);
		
	   // ActionContext.getContext().getSession().put("checkCode", checkCode);
		
		return "success";
	}

}
