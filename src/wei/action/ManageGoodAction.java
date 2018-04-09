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

	
	//临时用户的ID
	private int userId;
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	//临时商品的ID
	private int tempId;
	
	public int getTempId() {
		return tempId;
	}

	public void setTempId(int tempId) {
		this.tempId = tempId;
	}

	//当前页数,初始化为1
    private int currPage = 1;
	 
	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	//注入service
	private ManageGoodService manageGoodService;

	public ManageGoodService getManageGoodService() {
		return manageGoodService;
	}

	public void setManageGoodService(ManageGoodService manageGoodService) {
		this.manageGoodService = manageGoodService;
	}
	
	
	//测试
	public void testManage(){
		
		manageGoodService.testManage();
		
		System.out.println("manageAction运行了");
		
	}
	
	//查询所有商品
	public String findAllGoods(){
		
		PageBean<GoldGood> pageBean = manageGoodService.findAllGoods(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		//GoldGood gg = pageBean.getList().get(0);
		//System.out.println("gg:"+gg.getGguser().getUname());
		
		return "findAllGoods";
	}
	
	//批准商品上架
	public String passGood(){
		
		GoldGood gg = manageGoodService.findGoodById(tempId);
		gg.setState("已上架");
		manageGoodService.updateGood(gg);
		
		
		PageBean<GoldGood> pageBean = manageGoodService.findAllGoods(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		
		
		return "passSucc";
	}
	
	//拒绝商品上架
     public String refuseGood(){
	     
    	GoldGood gg = manageGoodService.findGoodById(tempId);
 		gg.setState("上架失败");
 		manageGoodService.updateGood(gg);
 		PageBean<GoldGood> pageBean = manageGoodService.findAllGoods(currPage);
 		ActionContext.getContext().getValueStack().push(pageBean);
 		
 	    User user = gg.getGguser();
 	    user.setExistCash(user.getExistCash() + gg.getDeposit());  //将押金返还给用户
 	    manageGoodService.updateUser(user);
 	    
 	    User existUser = (User)ActionContext.getContext().getSession().get("existUser");
 	    
 	  //  System.out.println("existUser.getUid(): " +existUser.getUid() +"  user.getUid(): "+user.getUid());
 	    
 	    if(existUser == null){
 	    	
 	    	System.out.println("existUser: 为空" );
 	    }
 	    
 	    if(existUser!=null&&user.getUid()==existUser.getUid()){
 	    	
 	    	System.out.println("user.getUid()==existUser.getUid()");
 	    	existUser.setExistCash(existUser.getExistCash() + gg.getDeposit());
 	    	ActionContext.getContext().getSession().put("existUser", existUser);
 	    }
 	    
	   
        return "refuseSucc";
   }
     
     //根据用户id查找该用户的所有销售商品
     public String findGoodListByUid(){
    	 
    	// PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId);
    	 PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
    	 ActionContext.getContext().getValueStack().push(pageBean);
    	 return "findGoodsByUidSucc";
     }
     
     //用户操作商品从“审核中”或“已上架”转为“未上架” ，需用到tempId,userId,currPage
     public String changeGoodState(){
    	 
    	 
    	
    	 
    	 GoldGood gg = manageGoodService.findGoodById(tempId);
    	 gg.setState("未上架");
 		 manageGoodService.updateGood(gg);
 		 
 		 User existUser = (User)ActionContext.getContext().getSession().get("existUser");
 		 existUser.setExistCash(existUser.getExistCash()+gg.getDeposit());     //押金返还给卖家
 		 ActionContext.getContext().getSession().put("existUser", existUser);
 		 
 		 manageGoodService.updateUser(existUser);
 		 
 		  
 		 
 		 PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
   	     ActionContext.getContext().getValueStack().push(pageBean);
 		 
    	 return "changStateSucc";
     }
     
     //用户操作商品从“未上架”转为“审核中”  ,需用到tempId,userId,currPage
    public String changeGoodStateUp(){
    	
    	 GoldGood gg = manageGoodService.findGoodById(tempId);
    
    	 gg.setState("审核中");
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
    
    
    //删除 "上架失败" 的商品,    需用到tempId,userId,currPage   
    public String deleteGoodOfUser(){
    	
    	//先获取
    	 GoldGood gg = manageGoodService.findGoodById(tempId);
    	 
       //再删除
    	 manageGoodService.deleteGoldGood(gg);
    	 
    	 PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
   	     ActionContext.getContext().getValueStack().push(pageBean);
    	
    	 return "deleteGoodSucc";
    }
    
    //卖家同意退货   商品从"买家请求退货"转为 "无效"   订单从 "退货中" 转为 "退货成功"   tempId,userId,currPage   
    public String agreeBackBySeller(){
    	
    	Form ff = manageGoodService.findFormByFGid(tempId);
    	ff.setFstate("退货成功");
    	manageGoodService.updateForm(ff);
    	
        GoldGood gg = manageGoodService.findGoodById(tempId);
        gg.setState("无效");
        manageGoodService.updateGood(gg);
        
        User sellUser = manageGoodService.findUserByUser(ff.getSuid());
        sellUser.setExistCash(sellUser.getExistCash() + gg.getDeposit());   //押金返回给卖家
        manageGoodService.updateUser(sellUser);
    	
    	User buyUser = manageGoodService.findUserByUser(ff.getBuid());
    	buyUser.setExistCash(buyUser.getExistCash() + (float)ff.getTotalPrice()); //现金返回给买家
    	manageGoodService.updateUser(buyUser);
    	
    	User existUser = (User)ActionContext.getContext().getSession().get("existUser");
    	existUser.setExistCash(existUser.getExistCash() + gg.getDeposit());
    	ActionContext.getContext().getSession().put("existUser", existUser);
    	
    	PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
  	    ActionContext.getContext().getValueStack().push(pageBean);
    	  	
    	return "agreeBackSucc";
    }
    
    
   //卖家拒绝退货   商品从"买家请求退货"转为 "卖家拒绝退货"   订单从 "退货中" 转为 "卖家拒绝退货"   tempId,userId,currPage 
    public String refuseBackBySeller(){
    	
    	Form ff = manageGoodService.findFormByFGid(tempId);
    	ff.setFstate("卖家拒绝退货");
    	manageGoodService.updateForm(ff);
    	
    	GoldGood gg = manageGoodService.findGoodById(tempId);
        gg.setState("卖家拒绝退货");
        manageGoodService.updateGood(gg);
        
        PageBean<GoldGood> pageBean = manageGoodService.findGoodListByUid(userId,currPage);
  	    ActionContext.getContext().getValueStack().push(pageBean);
    	
    	return "sellerRefuseBackSucc";
    }
    


}
