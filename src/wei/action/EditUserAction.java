package wei.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import wei.entity.User;
import wei.service.EditUserService;

public class EditUserAction extends ActionSupport{

	private String editPhone;
	private String editTradeNum;
	private String editPassword;
	
	public String getEditPassword() {
		return editPassword;
	}

	public void setEditPassword(String editPassword) {
		this.editPassword = editPassword;
	}

	public String getEditPhone() {
		return editPhone;
	}

	public void setEditPhone(String editPhone) {
		this.editPhone = editPhone;
	}

	public String getEditTradeNum() {
		return editTradeNum;
	}

	public void setEditTradeNum(String editTradeNum) {
		this.editTradeNum = editTradeNum;
	}


	//注入service
	private EditUserService editUserService;

	public EditUserService getEditUserService() {
		return editUserService;
	}

	public void setEditUserService(EditUserService editUserService) {
		this.editUserService = editUserService;
	}
	
	
	//测试
	public void check(){
		
		System.out.println("Action运行了");
		editUserService.check();
		
	}
	
	//修改手机号和交易账号
	public String editForPAT(){
		
		User user = (User)ActionContext.getContext().getSession().get("existUser");
//		System.out.println("existUser:"+user.getUname());
//		System.out.println("existUser:"+user.getPassword());
//		System.out.println("existUser:"+user.getPhone());
		user.setPhone(editPhone);
		user.setTradeNum(editTradeNum);
		editUserService.editForPAT(user);
		return "editSucc";
	}
	
	//修改密码
	public String editForPass(){
		
		User user= (User)ActionContext.getContext().getSession().get("existUser");
		user.setPassword(editPassword);
		editUserService.editForPAT(user);
		return "editPassSucc";
	}
}
