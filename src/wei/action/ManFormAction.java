package wei.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.PageBean;
import wei.entity.User;
import wei.service.ManFormService;

public class ManFormAction extends ActionSupport implements ModelDriven<Form>{

	
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private Form goodForm = new Form();
	
	@Override
	public Form getModel() {
		// TODO Auto-generated method stub
		return goodForm;
	}
	
	//��ʱ���˻�����
	private String tempReason;
		
	public String getTempReason() {
		return tempReason;
	}

	public void setTempReason(String tempReason) {
		this.tempReason = tempReason;
	}

	//��ʱ�Ķ���id
	private int tempformId;
	
	public int getTempformId() {
		return tempformId;
	}

	public void setTempformId(int tempformId) {
		this.tempformId = tempformId;
	}

	//��ǰҳ
	private int currPage=1;
	
	
	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	//��ʱ����Ʒid
	private int goodId;	
	
	//��ʱ���û�id 
	private int userId;
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}

	//ע��service
	public ManFormService manFormService;

	public ManFormService getManFormService() {
		return manFormService;
	}

	public void setManFormService(ManFormService manFormService) {
		this.manFormService = manFormService;
	}
	
	//����
	public void manFormTest(){
		
		manFormService.manFormTest();
		System.out.println("formAction������");
		
	}
	
	//������Ʒ��id����Ʒ
	public String getGoodByGid(){
		
		GoldGood good = manFormService.getGoodByGid(goodId);
		ActionContext.getContext().getSession().put("checkGood", good);
		
		String formId = "";
		//���ɶ�����
        int tempId = manFormService.findFormCount()+1;
		if(tempId<10){
			
			for(int i=0;i<4;i++){
				           
				            
				 formId += (int)(Math.random()*10);  
			}			
			formId = formId + "000" + tempId;
			
		}else if(tempId<100){
			
			for(int i=0;i<3;i++){
				formId += (int)(Math.random()*10);
			}
			formId = formId + "00" + tempId;
		}
		
		ActionContext.getContext().getSession().put("goodFormId", formId);
		
		System.out.println("tempID:"+tempId);
		System.out.println("formID:"+formId);
		
		System.out.println("goodName:"+good.getGname());
		System.out.println("sellName:"+good.getGguser().getUname());
		
		return "goodToForm";
	}
	
	//���涩��
	public String saveForm(){
		
		goodForm.setSubtime(new Date());
		goodForm.setFstate("�Ѹ���");
		
		
		System.out.println("saveForm():goodForm.getFgid(): " +goodForm.getFgid());
		
	    GoldGood good = manFormService.getGoodByGid(goodForm.getFgid());
	    good.setState("�ѹ���");
	    
	    
	    
	    User buyUser = manFormService.getUserByUid(goodForm.getBuid());
	    buyUser.setExistCash(buyUser.getExistCash()-(float)(goodForm.getTotalPrice()));
	    manFormService.updateUser(buyUser);
	    
	    User existUser = (User)ActionContext.getContext().getSession().get("existUser");
	    existUser.setExistCash(existUser.getExistCash()-(float)(goodForm.getTotalPrice()));
	    ActionContext.getContext().getSession().put("existUser", existUser);
	    
	    
	    manFormService.updateGood(good);
	    manFormService.saveForm(goodForm);
		
		
		System.out.println("Form:goodName:"+goodForm.getGoodName());
		System.out.println("Form:buyName:"+goodForm.getBuyName());
		System.out.println("Form:transfer:"+goodForm.getTransfer());
		System.out.println("Form:formId:"+goodForm.getFormId());
		
		//ActionContext.getContext().getValueStack().push("buyedForm");
		ActionContext.getContext().getSession().put("buyedForm", goodForm);
		return "saveFormSucc";
	}
	
	//�����û�id���鵽���û������й������Ʒ
	public String findFormListByUid(){
		
		PageBean<Form> pageBean = manFormService.findFormListByUid(userId,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "findFormListSucc";
	}

    //�������ж���
	public String findAllForm(){
		
		PageBean<Form> pageBean = manFormService.findAllForm(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		//System.out.println("pageBean.getList().get(0).getGoodName():"+pageBean.getList().get(0).getGoodName());
		
		return "findAllFormSucc";
	}
	
	
	//�û������˻���Ʒ    ������  "�Ѹ���" תΪ  "�˿���"����Ʒ��"�ѹ���"תΪ"��������˻�"   ��ҪtempReason,tempformId,userId,currPage,result
	public String backFormByFid(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		
		ff.setFstate("�˻���");
		ff.setReason(tempReason);
		
		manFormService.updateForm(ff);
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid());
		gg.setState("��������˻�");
		gg.setBackReason(tempReason); 
		manFormService.updateGood(gg);
		
		System.out.println("tempReason:"+tempReason);
		System.out.println("tempformId:"+tempformId);
		
		this.result = "true";
		
		return "success";
	}
	
	
	//�û�ȡ���˻���������   "�˿���" תΪ   "�Ѹ���" ��Ʒ��   "��������˻�" תΪ "�ѹ���"   ��ҪtempformId,userId,currPage
	public String cancelBackForm(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		
		ff.setFstate("�Ѹ���");
		ff.setReason("");
		
		manFormService.updateForm(ff);
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid());
		gg.setState("�ѹ���");
		gg.setBackReason(""); 
		manFormService.updateGood(gg);
		
		PageBean<Form> pageBean = manFormService.findFormListByUid(userId,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "cancelBackSucc";
	}
	
	//�û�ȷ���ջ��� ������   "�Ѹ���" ��"�˻�ʧ��" תΪ  "��ɽ���"  ��Ʒ��"�ѹ���"��"�ܾ��˻��ɹ�"  תΪ  "������ջ�"   ��ҪtempformId,userId,currPage
	public String finishForm(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		ff.setFstate("��ɽ���");
		manFormService.updateForm(ff);
		
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid()); //��ñ��������Ʒ
		User user = manFormService.getUserByUid(ff.getSuid());  //�������
		
		user.setExistCash(user.getExistCash()+gg.getDeposit()+gg.getGprice()); //������Ǯ�����ջ�Ѻ��
		user.setCredit(user.getCredit()+5);               //�����������ּ�5
		manFormService.updateUser(user); 
		
		gg.setState("������ջ�");
		manFormService.updateGood(gg); 
		
		User user2 = manFormService.getUserByUid(userId);   //������
		user2.setCredit(user2.getCredit()+2);               //����������ּ�2
		manFormService.updateUser(user2); 
		
		PageBean<Form> pageBean = manFormService.findFormListByUid(userId,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		User user3 = (User)ActionContext.getContext().getSession().get("existUser");
		user3.setCredit(user3.getCredit()+2);
		ActionContext.getContext().getSession().put("existUser", user3);
		
		
		return "finishFormSucc";
	}
		
	//����Աǿ���˻�    ������   "�˻���" תΪ  "ǿ���˻��ɹ�" �� ��"���Ҿܾ��˻�" תΪ  "�˻��ɹ�" ��Ʒ��"���Ҿܾ��˻�" תΪ  "�ѱ�ǿ���˻�"     ��ҪtempformId,currPage
	public String passBackForm(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		ff.setFstate("ǿ���˻��ɹ�");
		manFormService.updateForm(ff);
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid());
		gg.setState("�ѱ�ǿ���˻�");
		manFormService.updateGood(gg);
		
		
		
		User user = manFormService.getUserByUid(ff.getSuid());  //�������
		
		//user.setCredit(user.getCredit()+5);               //�����������ֿ�10
		int sellnum = user.getCredit()-10;
		if(sellnum<=0){                                        //��������������С��0ʱ�������0
			
			user.setCredit(0);
		}else{
			
			user.setCredit(sellnum);
		}
		
		
		
	
		User buyUser = manFormService.getUserByUid(ff.getBuid());  //������		
		float floatCash = (float)(ff.getTotalPrice()) - gg.getDeposit()*4;
	    buyUser.setExistCash(buyUser.getExistCash() + floatCash );
	    
	    int buynum = buyUser.getCredit()-2;                   //����������ֿ�2
		if(buynum<=0){                                        //�������������С��0ʱ�������0
			
			buyUser.setCredit(0);
		}else{
			
			buyUser.setCredit(buynum);
		}	    
	    
	   
		
		
	    User existUser = (User)ActionContext.getContext().getSession().get("existUser");
	    if(existUser !=null ){     //�жϴ�ʱ��¼�����ĸ��û�
	    	
	    	System.out.println(" passBackForm()�� ���û�����");
	    	
	    	if(existUser.getUid()==user.getUid()){
	    		
	    		existUser = user;
	    		System.out.println("��������");
	    		
	    		
	    	}else if(existUser.getUid()==buyUser.getUid()){
	    		
	    		existUser = buyUser;
	    		System.out.println("�������");
	    	}
	    	
	    }
	    
	    manFormService.updateUser(user); 
	    manFormService.updateUser(buyUser);
	    ActionContext.getContext().getSession().put("existUser", existUser);
		
		PageBean<Form> pageBean = manFormService.findAllForm(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "passBackSucc";
	}
	
	//����Ա�ܾ��˻�     ������   "�˻���"��"���Ҿܾ��˻�"    תΪ  "�˻�ʧ��"  ��ҪtempformId,currPage
	public String refuseBackForm(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		ff.setFstate("�˻�ʧ��");
		manFormService.updateForm(ff);
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid());
		gg.setState("�ܾ��˻��ɹ�");
		manFormService.updateGood(gg);
		
		PageBean<Form> pageBean = manFormService.findAllForm(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "refuseBackSucc";
	}
	
	//�û��˻��ɹ�������ɾ������                 ��ҪtempformId,userId,currPage
	public String deleteForm(){
		
		//�Ȼ�ȡ
		Form ff = manFormService.getFormByFid(tempformId);
		//��ɾ��
		manFormService.deleteForm(ff);
		
		PageBean<Form> pageBean = manFormService.findFormListByUid(userId,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "deleteFormSucc";
	}
	
}
