package wei.action;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.PageBean;
import wei.entity.User;
import wei.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	/**
	 * 
	 */
	// private static final long serialVersionUID = 1L;
	// 模型驱动
	private User user = new User();

	@Override
	public User getModel() {

		return user;
	}
	
	//当前页,默认为首页
	private int currPage = 1;
	
	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	//临时的用户ID
	private int tempId;
		

	public int getTempId() {
		return tempId;
	}

	public void setTempId(int tempId) {
		this.tempId = tempId;
	}

	// 确认密码的变量,为确认两次输入密码是否一致
	private String checkPassword;

	public String getCheckPassword() {
		return checkPassword;
	}

	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}

	// 注入userService
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//删除用户
	public String delete(){
		
		System.out.println("被删除的用户的ID： "+tempId);
		//先找到该用户
        user =  userService.findUserById(tempId);  
        //再删除用户
        userService.deleteUser(user);

		
		return "deleteSuccess";
	}
	
	//查询所有用户
    public String findAll(){
    	
    	PageBean<User> pageBean = userService.findByPage(currPage);
    	//System.out.println("pageBean.getList().size(): " + pageBean.getList().size());
    	//将pageBean存到值栈中
    	ActionContext.getContext().getValueStack().push(pageBean);
    	return "findAll";
    }
    
    //执行跳转到编辑个人信息的页面
    public String editPre(){
    	
    	System.out.println("session.existUser.uid:"+tempId);
    	//找到用户
    	user = userService.findUserById(tempId);
    	return "editPre";
    	
    }
    
    public String edit(){
    	
    	System.out.println("user.uname"+user.getUname());
    	userService.editUser(user);
    	return "editSuccess";
    }

	// 执行跳转到注册用户的页面
	public String saveUI() {

		return "saveUI";
	}

	// 注册，添加用户页面
	public String save() {

		System.out.println("checkPassword:" + checkPassword);
		System.out.println("usePassword:" + user.getPassword());

		if (user.getPassword().equals(checkPassword)) {

			user.setCredit(0);
			user.setIsManager("N");
			user.setIsBan("N");
			user.setRegTime(new Date());
			userService.save(user);

			return "saveSuccess";

		} else {

			ActionContext.getContext().getSession().put("passError", "密码不一致！");
			return "saveError";

		}

	}

	// 登录
	public String login() {

		System.out.println("UserAction: login方法被执行");
		System.out.println("UserAction: " + user.getUname() + ", " + user.getPassword());
		User existUser = userService.findExistUser(user);

		if (existUser == null) {

			// 登录失败
			this.addActionError("用户名或密码错误！");
			return INPUT;

		} else {

			// 登录成功
			ActionContext.getContext().getSession().put("existUser", existUser);
			return SUCCESS;
		}
	}
	
	//对用户进行封号
	public String banUesr(){   // tempId  currPage
		
		User banUser = userService.findUserById(tempId);
		banUser.setIsBan("已封号");
		
		
		List<GoldGood> goodList = userService.findGoodListByUser(tempId); //查找该该户所有商品
		
		if(goodList != null){
			
			for(int i=0;i<goodList.size();i++){
				
				//goodList.get(i).getState()!="无效"&&goodList.get(i).getState()!="上架失败"&&goodList.get(i).getState()!="未上架"&&goodList.get(i).getState()!="买家已收货"
				if(goodList.get(i).getState()!="无效"&&goodList.get(i).getState()!="上架失败"&&goodList.get(i).getState()!="未上架"&&goodList.get(i).getState()!="买家已收货"&&goodList.get(i).getState()!="已被强制退货"){
					
				       goodList.get(i).setState("无效");	
				       banUser.setExistCash(banUser.getExistCash()+goodList.get(i).getDeposit());
				       
				       userService.updateGoldGood(goodList.get(i));
					
				}
				
			}		
		}

		List<Form> sellListForm = userService.findFormBySellerId(tempId);  //查找卖家是该用户的所有订单
		if(sellListForm!=null){
			
			for(int i=0;i<sellListForm.size();i++){
				
				Form tempForm = sellListForm.get(i);
				if(tempForm.getFstate()=="已付款"||tempForm.getFstate()=="退货中"||tempForm.getFstate()=="卖家拒绝退货"){
					
					tempForm.setFstate("退货成功");
					userService.updateForm(tempForm);
					
					GoldGood gg = userService.findGoldGoodByGid(tempForm.getFgid());
					banUser.setExistCash(banUser.getExistCash()+gg.getDeposit());
					
					User buyerUser = userService.findUserById(tempForm.getBuid());
					buyerUser.setExistCash(buyerUser.getExistCash()+gg.getGprice());
					userService.editUser(buyerUser);
					
				}
				
			}
			
		}
		
	    List<Form> buyListForm = userService.findFormByBuyerId(tempId);  //查找买家是该用户的所有订单
	    if(buyListForm!=null){
	    	
	    	for(int i=0;i<buyListForm.size();i++){
	    		
	    		Form tempForm = buyListForm.get(i);
	    		if(tempForm.getFstate()=="已付款"||tempForm.getFstate()=="退货中"||tempForm.getFstate()=="卖家拒绝退货"){
	    		
	    			tempForm.setFstate("退货成功");
					userService.updateForm(tempForm);
					
					GoldGood gg = userService.findGoldGoodByGid(tempForm.getFgid());
					gg.setState("无效");
					userService.updateGoldGood(gg);
					
					User sellerUser = userService.findUserById(tempForm.getBuid());
					sellerUser.setExistCash(sellerUser.getExistCash()+gg.getDeposit());
					
					banUser.setExistCash(banUser.getExistCash()+gg.getGprice());
	    			
	    			
	    		}
	    		
	    	}
	    	
	    }
	    
	    //注销 被封号的用户
	    User existUser = (User)ActionContext.getContext().getSession().get("existUser");
	    if(existUser != null  ){
	    	
	    	if(existUser.getUid()==banUser.getUid()){
	    		
	    	//	ActionContext.getContext().getSession().put("existUser", "");
	    		ActionContext.getContext().getSession().remove("existUser");
	    		
	    	}
	    
	    }
		
		userService.editUser(banUser);
		
		PageBean<User> pageBean = userService.findByPage(currPage);
    	//System.out.println("pageBean.getList().size(): " + pageBean.getList().size());
    	//将pageBean存到值栈中
    	ActionContext.getContext().getValueStack().push(pageBean);
		
		return "banUserSucc";
	}
	
	//解除封号
	public String cancalBanUser(){  // tempId  currPage
		
		User user = userService.findUserById(tempId);
		user.setIsBan("正常");
		userService.editUser(user);
		
		PageBean<User> pageBean = userService.findByPage(currPage);
    	//System.out.println("pageBean.getList().size(): " + pageBean.getList().size());
    	//将pageBean存到值栈中
    	ActionContext.getContext().getValueStack().push(pageBean);
		
		return "cancalBanSucc";
	}
	
	public String findInformByUid(){   //tempId
		
		User user = userService.findUserById(tempId);
		ActionContext.getContext().getSession().put("existUser", user);
		
		return "findInformSucc";
	}

}
