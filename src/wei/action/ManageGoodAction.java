package wei.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.PageBean;
import wei.entity.User;
import wei.service.ManageGoodService;

public class ManageGoodAction extends ActionSupport {

	
	//��ʱ�û���ID
	private int userId;
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	//��ʱ��Ʒ��ID
	private int tempId;
	
	public int getTempId() {
		return tempId;
	}

	public void setTempId(int tempId) {
		this.tempId = tempId;
	}

	//��ǰҳ��,��ʼ��Ϊ1
    private int currPage = 1;
	 
	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	//ע��service
	private ManageGoodService manageGoodService;

	public ManageGoodService getManageGoodService() {
		return manageGoodService;
	}

	public void setManageGoodService(ManageGoodService manageGoodService) {
		this.manageGoodService = manageGoodService;
	}
	
	
	//����
	public void testManage(){
		
		manageGoodService.testManage();
		
		System.out.println("manageAction������");
		
	}
	
	//��ѯ������Ʒ
	public String findAllGoods(){
		
		PageBean<GoldGood> pageBean = manageGoodService.findAllGoods(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		//GoldGood gg = pageBean.getList().get(0);
		//System.out.println("gg:"+gg.getGguser().getUname());
		
		return "findAllGoods";
	}
	
	//��׼��Ʒ�ϼ�
	public String passGood(){
		
		GoldGood gg = manageGoodService.findGoodById(tempId);
		gg.setState("���ϼ�");
		manageGoodService.updateGood(gg);
		
		
		PageBean<GoldGood> pageBean = manageGoodService.findAllGoods(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		
		
		return "passSucc";
	}
	
	//�ܾ���Ʒ�ϼ�
     public String refuseGood(){
	     
    	GoldGood gg = manageGoodService.findGoodById(tempId);
 		gg.setState("�ϼ�ʧ��");
 		manageGoodService.updateGood(gg);
 		PageBean<GoldGood> pageBean = manageGoodService.findAllGoods(currPage);
 		ActionContext.getContext().getValueStack().push(pageBean);
 		
 	    User user = gg.getGguser();
 	    user.setExistCash(user.getExistCash() + gg.getDeposit());  //��Ѻ�𷵻����û�
 	    manageGoodService.updateUser(user);
 	    
 	    User existUser = (User)ActionContext.getContext().getSession().get("existUser");
 	    
 	  //  System.out.println("existUser.getUid(): " +existUser.getUid() +"  user.getUid(): "+user.getUid());
 	    
 	    if(existUser == null){
 	    	
 	    	System.out.println("existUser: Ϊ��" );
 	    }
 	    
 	    if(existUser!=null&&user.getUid()==existUser.getUid()){
 	    	
 	    	System.out.println("user.getUid()==existUser.getUid()");
 	    	existUser.setExistCash(existUser.getExistCash() + gg.getDeposit());
 	    	ActionContext.getContext().getSession().put("existUser", existUser);
 	    }
 	    
	   
        return "refuseSucc";
   }
     
     //�����û�id���Ҹ��û�������������Ʒ
     public String findGoodListByUid(){
    	 
    	// PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId);
    	 PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
    	 ActionContext.getContext().getValueStack().push(pageBean);
    	 return "findGoodsByUidSucc";
     }
     
     //�û�������Ʒ�ӡ�����С������ϼܡ�תΪ��δ�ϼܡ� �����õ�tempId,userId,currPage
     public String changeGoodState(){
    	 
    	 
    	
    	 
    	 GoldGood gg = manageGoodService.findGoodById(tempId);
    	 gg.setState("δ�ϼ�");
 		 manageGoodService.updateGood(gg);
 		 
 		 User existUser = (User)ActionContext.getContext().getSession().get("existUser");
 		 existUser.setExistCash(existUser.getExistCash()+gg.getDeposit());     //Ѻ�𷵻�������
 		 ActionContext.getContext().getSession().put("existUser", existUser);
 		 
 		 manageGoodService.updateUser(existUser);
 		 
 		  
 		 
 		 PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
   	     ActionContext.getContext().getValueStack().push(pageBean);
 		 
    	 return "changStateSucc";
     }
     
     //�û�������Ʒ�ӡ�δ�ϼܡ�תΪ������С�  ,���õ�tempId,userId,currPage
    public String changeGoodStateUp(){
    	
    	 GoldGood gg = manageGoodService.findGoodById(tempId);
    
    	 gg.setState("�����");
    	 gg.setUptime(new Date());
    	 manageGoodService.updateGood(gg);
    	 
    	 User existUser = (User)ActionContext.getContext().getSession().get("existUser");
 		 existUser.setExistCash(existUser.getExistCash()-gg.getDeposit());
 		 ActionContext.getContext().getSession().put("existUser", existUser);
 		 
 		 manageGoodService.updateUser(existUser);
    	 
    	 
 		 PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
   	     ActionContext.getContext().getValueStack().push(pageBean);
    
    	 return "changStateUpSucc";
    }
    
    
    //ɾ�� "�ϼ�ʧ��" ����Ʒ,    ���õ�tempId,userId,currPage   
    public String deleteGoodOfUser(){
    	
    	//�Ȼ�ȡ
    	 GoldGood gg = manageGoodService.findGoodById(tempId);
    	 
       //��ɾ��
    	 manageGoodService.deleteGoldGood(gg);
    	 
    	 PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
   	     ActionContext.getContext().getValueStack().push(pageBean);
    	
    	 return "deleteGoodSucc";
    }
    
    //����ͬ���˻�   ��Ʒ��"��������˻�"תΪ "��Ч"   ������ "�˻���" תΪ "�˻��ɹ�"   tempId,userId,currPage   
    public String agreeBackBySeller(){
    	
    	Form ff = manageGoodService.findFormByFGid(tempId);
    	ff.setFstate("�˻��ɹ�");
    	manageGoodService.updateForm(ff);
    	
        GoldGood gg = manageGoodService.findGoodById(tempId);
        gg.setState("��Ч");
        manageGoodService.updateGood(gg);
        
        User sellUser = manageGoodService.findUserByUser(ff.getSuid());
        sellUser.setExistCash(sellUser.getExistCash() + gg.getDeposit());   //Ѻ�𷵻ظ�����
        manageGoodService.updateUser(sellUser);
    	
    	User buyUser = manageGoodService.findUserByUser(ff.getBuid());
    	buyUser.setExistCash(buyUser.getExistCash() + (float)ff.getTotalPrice()); //�ֽ𷵻ظ����
    	manageGoodService.updateUser(buyUser);
    	
    	User existUser = (User)ActionContext.getContext().getSession().get("existUser");
    	existUser.setExistCash(existUser.getExistCash() + gg.getDeposit());
    	ActionContext.getContext().getSession().put("existUser", existUser);
    	
    	PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
  	    ActionContext.getContext().getValueStack().push(pageBean);
    	  	
    	return "agreeBackSucc";
    }
    
    
   //���Ҿܾ��˻�   ��Ʒ��"��������˻�"תΪ "���Ҿܾ��˻�"   ������ "�˻���" תΪ "���Ҿܾ��˻�"   tempId,userId,currPage 
    public String refuseBackBySeller(){
    	
    	Form ff = manageGoodService.findFormByFGid(tempId);
    	ff.setFstate("���Ҿܾ��˻�");
    	manageGoodService.updateForm(ff);
    	
    	GoldGood gg = manageGoodService.findGoodById(tempId);
        gg.setState("���Ҿܾ��˻�");
        manageGoodService.updateGood(gg);
        
        PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
  	    ActionContext.getContext().getValueStack().push(pageBean);
    	
    	return "sellerRefuseBackSucc";
    }
    


}
