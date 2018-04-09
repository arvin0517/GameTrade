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
	// ģ������
	private User user = new User();

	@Override
	public User getModel() {

		return user;
	}
	
	//��ǰҳ,Ĭ��Ϊ��ҳ
	private int currPage = 1;
	
	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	//��ʱ���û�ID
	private int tempId;
		

	public int getTempId() {
		return tempId;
	}

	public void setTempId(int tempId) {
		this.tempId = tempId;
	}

	// ȷ������ı���,Ϊȷ���������������Ƿ�һ��
	private String checkPassword;

	public String getCheckPassword() {
		return checkPassword;
	}

	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}

	// ע��userService
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//ɾ���û�
	public String delete(){
		
		System.out.println("��ɾ�����û���ID�� "+tempId);
		//���ҵ����û�
        user =  userService.findUserById(tempId);  
        //��ɾ���û�
        userService.deleteUser(user);

		
		return "deleteSuccess";
	}
	
	//��ѯ�����û�
    public String findAll(){
    	
    	PageBean<User> pageBean = userService.findByPage(currPage);
    	//System.out.println("pageBean.getList().size(): " + pageBean.getList().size());
    	//��pageBean�浽ֵջ��
    	ActionContext.getContext().getValueStack().push(pageBean);
    	return "findAll";
    }
    
    //ִ����ת���༭������Ϣ��ҳ��
    public String editPre(){
    	
    	System.out.println("session.existUser.uid:"+tempId);
    	//�ҵ��û�
    	user = userService.findUserById(tempId);
    	return "editPre";
    	
    }
    
    public String edit(){
    	
    	System.out.println("user.uname"+user.getUname());
    	userService.editUser(user);
    	return "editSuccess";
    }

	// ִ����ת��ע���û���ҳ��
	public String saveUI() {

		return "saveUI";
	}

	// ע�ᣬ����û�ҳ��
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

			ActionContext.getContext().getSession().put("passError", "���벻һ�£�");
			return "saveError";

		}

	}

	// ��¼
	public String login() {

		System.out.println("UserAction: login������ִ��");
		System.out.println("UserAction: " + user.getUname() + ", " + user.getPassword());
		User existUser = userService.findExistUser(user);

		if (existUser == null) {

			// ��¼ʧ��
			this.addActionError("�û������������");
			return INPUT;

		} else {

			// ��¼�ɹ�
			ActionContext.getContext().getSession().put("existUser", existUser);
			return SUCCESS;
		}
	}
	
	//���û����з��
	public String banUesr(){   // tempId  currPage
		
		User banUser = userService.findUserById(tempId);
		banUser.setIsBan("�ѷ��");
		
		
		List<GoldGood> goodList = userService.findGoodListByUser(tempId); //���Ҹøû�������Ʒ
		
		if(goodList != null){
			
			for(int i=0;i<goodList.size();i++){
				
				//goodList.get(i).getState()!="��Ч"&&goodList.get(i).getState()!="�ϼ�ʧ��"&&goodList.get(i).getState()!="δ�ϼ�"&&goodList.get(i).getState()!="������ջ�"
				if(goodList.get(i).getState()!="��Ч"&&goodList.get(i).getState()!="�ϼ�ʧ��"&&goodList.get(i).getState()!="δ�ϼ�"&&goodList.get(i).getState()!="������ջ�"&&goodList.get(i).getState()!="�ѱ�ǿ���˻�"){
					
				       goodList.get(i).setState("��Ч");	
				       banUser.setExistCash(banUser.getExistCash()+goodList.get(i).getDeposit());
				       
				       userService.updateGoldGood(goodList.get(i));
					
				}
				
			}		
		}

		List<Form> sellListForm = userService.findFormBySellerId(tempId);  //���������Ǹ��û������ж���
		if(sellListForm!=null){
			
			for(int i=0;i<sellListForm.size();i++){
				
				Form tempForm = sellListForm.get(i);
				if(tempForm.getFstate()=="�Ѹ���"||tempForm.getFstate()=="�˻���"||tempForm.getFstate()=="���Ҿܾ��˻�"){
					
					tempForm.setFstate("�˻��ɹ�");
					userService.updateForm(tempForm);
					
					GoldGood gg = userService.findGoldGoodByGid(tempForm.getFgid());
					banUser.setExistCash(banUser.getExistCash()+gg.getDeposit());
					
					User buyerUser = userService.findUserById(tempForm.getBuid());
					buyerUser.setExistCash(buyerUser.getExistCash()+gg.getGprice());
					userService.editUser(buyerUser);
					
				}
				
			}
			
		}
		
	    List<Form> buyListForm = userService.findFormByBuyerId(tempId);  //��������Ǹ��û������ж���
	    if(buyListForm!=null){
	    	
	    	for(int i=0;i<buyListForm.size();i++){
	    		
	    		Form tempForm = buyListForm.get(i);
	    		if(tempForm.getFstate()=="�Ѹ���"||tempForm.getFstate()=="�˻���"||tempForm.getFstate()=="���Ҿܾ��˻�"){
	    		
	    			tempForm.setFstate("�˻��ɹ�");
					userService.updateForm(tempForm);
					
					GoldGood gg = userService.findGoldGoodByGid(tempForm.getFgid());
					gg.setState("��Ч");
					userService.updateGoldGood(gg);
					
					User sellerUser = userService.findUserById(tempForm.getBuid());
					sellerUser.setExistCash(sellerUser.getExistCash()+gg.getDeposit());
					
					banUser.setExistCash(banUser.getExistCash()+gg.getGprice());
	    			
	    			
	    		}
	    		
	    	}
	    	
	    }
	    
	    //ע�� ����ŵ��û�
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
    	//��pageBean�浽ֵջ��
    	ActionContext.getContext().getValueStack().push(pageBean);
		
		return "banUserSucc";
	}
	
	//������
	public String cancalBanUser(){  // tempId  currPage
		
		User user = userService.findUserById(tempId);
		user.setIsBan("����");
		userService.editUser(user);
		
		PageBean<User> pageBean = userService.findByPage(currPage);
    	//System.out.println("pageBean.getList().size(): " + pageBean.getList().size());
    	//��pageBean�浽ֵջ��
    	ActionContext.getContext().getValueStack().push(pageBean);
		
		return "cancalBanSucc";
	}
	
	public String findInformByUid(){   //tempId
		
		User user = userService.findUserById(tempId);
		ActionContext.getContext().getSession().put("existUser", user);
		
		return "findInformSucc";
	}

}
