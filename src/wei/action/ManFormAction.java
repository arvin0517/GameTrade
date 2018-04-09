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
	
	//临时的退货理由
	private String tempReason;
		
	public String getTempReason() {
		return tempReason;
	}

	public void setTempReason(String tempReason) {
		this.tempReason = tempReason;
	}

	//临时的订单id
	private int tempformId;
	
	public int getTempformId() {
		return tempformId;
	}

	public void setTempformId(int tempformId) {
		this.tempformId = tempformId;
	}

	//当前页
	private int currPage=1;
	
	
	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	//临时的商品id
	private int goodId;	
	
	//临时的用户id 
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

	//注入service
	public ManFormService manFormService;

	public ManFormService getManFormService() {
		return manFormService;
	}

	public void setManFormService(ManFormService manFormService) {
		this.manFormService = manFormService;
	}
	
	//测试
	public void manFormTest(){
		
		manFormService.manFormTest();
		System.out.println("formAction运行了");
		
	}
	
	//根据商品的id找商品
	public String getGoodByGid(){
		
		GoldGood good = manFormService.getGoodByGid(goodId);
		ActionContext.getContext().getSession().put("checkGood", good);
		
		String formId = "";
		//生成订单号
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
	
	//保存订单
	public String saveForm(){
		
		goodForm.setSubtime(new Date());
		goodForm.setFstate("已付款");
		
		
		System.out.println("saveForm():goodForm.getFgid(): " +goodForm.getFgid());
		
	    GoldGood good = manFormService.getGoodByGid(goodForm.getFgid());
	    good.setState("已购买");
	    
	    
	    
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
	
	//根据用户id来查到该用户的所有购买的商品
	public String findFormListByUid(){
		
		PageBean<Form> pageBean = manFormService.findFormListByUid(userId,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "findFormListSucc";
	}

    //查找所有订单
	public String findAllForm(){
		
		PageBean<Form> pageBean = manFormService.findAllForm(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		//System.out.println("pageBean.getList().get(0).getGoodName():"+pageBean.getList().get(0).getGoodName());
		
		return "findAllFormSucc";
	}
	
	
	//用户申请退货商品    订单从  "已付款" 转为  "退款中"，商品从"已购买"转为"买家请求退货"   需要tempReason,tempformId,userId,currPage,result
	public String backFormByFid(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		
		ff.setFstate("退货中");
		ff.setReason(tempReason);
		
		manFormService.updateForm(ff);
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid());
		gg.setState("买家请求退货");
		gg.setBackReason(tempReason); 
		manFormService.updateGood(gg);
		
		System.out.println("tempReason:"+tempReason);
		System.out.println("tempformId:"+tempformId);
		
		this.result = "true";
		
		return "success";
	}
	
	
	//用户取消退货，订单从   "退款中" 转为   "已付款" 商品从   "买家请求退货" 转为 "已购买"   需要tempformId,userId,currPage
	public String cancelBackForm(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		
		ff.setFstate("已付款");
		ff.setReason("");
		
		manFormService.updateForm(ff);
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid());
		gg.setState("已购买");
		gg.setBackReason(""); 
		manFormService.updateGood(gg);
		
		PageBean<Form> pageBean = manFormService.findFormListByUid(userId,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "cancelBackSucc";
	}
	
	//用户确认收货， 订单从   "已付款" 或"退货失败" 转为  "完成交易"  商品从"已购买"或"拒绝退货成功"  转为  "买家已收货"   需要tempformId,userId,currPage
	public String finishForm(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		ff.setFstate("完成交易");
		manFormService.updateForm(ff);
		
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid()); //获得被购买的商品
		User user = manFormService.getUserByUid(ff.getSuid());  //获得卖家
		
		user.setExistCash(user.getExistCash()+gg.getDeposit()+gg.getGprice()); //卖家收钱并且收回押金
		user.setCredit(user.getCredit()+5);               //卖家信誉积分加5
		manFormService.updateUser(user); 
		
		gg.setState("买家已收货");
		manFormService.updateGood(gg); 
		
		User user2 = manFormService.getUserByUid(userId);   //获得买家
		user2.setCredit(user2.getCredit()+2);               //买家信誉积分加2
		manFormService.updateUser(user2); 
		
		PageBean<Form> pageBean = manFormService.findFormListByUid(userId,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		User user3 = (User)ActionContext.getContext().getSession().get("existUser");
		user3.setCredit(user3.getCredit()+2);
		ActionContext.getContext().getSession().put("existUser", user3);
		
		
		return "finishFormSucc";
	}
		
	//管理员强制退货    订单从   "退货中" 转为  "强制退货成功" 或 从"卖家拒绝退货" 转为  "退货成功" 商品从"卖家拒绝退货" 转为  "已被强制退货"     需要tempformId,currPage
	public String passBackForm(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		ff.setFstate("强制退货成功");
		manFormService.updateForm(ff);
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid());
		gg.setState("已被强制退货");
		manFormService.updateGood(gg);
		
		
		
		User user = manFormService.getUserByUid(ff.getSuid());  //获得卖家
		
		//user.setCredit(user.getCredit()+5);               //卖家信誉积分扣10
		int sellnum = user.getCredit()-10;
		if(sellnum<=0){                                        //当卖家信誉积分小于0时，则等于0
			
			user.setCredit(0);
		}else{
			
			user.setCredit(sellnum);
		}
		
		
		
	
		User buyUser = manFormService.getUserByUid(ff.getBuid());  //获得买家		
		float floatCash = (float)(ff.getTotalPrice()) - gg.getDeposit()*4;
	    buyUser.setExistCash(buyUser.getExistCash() + floatCash );
	    
	    int buynum = buyUser.getCredit()-2;                   //买家信誉积分扣2
		if(buynum<=0){                                        //当买家信誉积分小于0时，则等于0
			
			buyUser.setCredit(0);
		}else{
			
			buyUser.setCredit(buynum);
		}	    
	    
	   
		
		
	    User existUser = (User)ActionContext.getContext().getSession().get("existUser");
	    if(existUser !=null ){     //判断此时登录的是哪个用户
	    	
	    	System.out.println(" passBackForm()中 有用户在线");
	    	
	    	if(existUser.getUid()==user.getUid()){
	    		
	    		existUser = user;
	    		System.out.println("卖家在线");
	    		
	    		
	    	}else if(existUser.getUid()==buyUser.getUid()){
	    		
	    		existUser = buyUser;
	    		System.out.println("买家在线");
	    	}
	    	
	    }
	    
	    manFormService.updateUser(user); 
	    manFormService.updateUser(buyUser);
	    ActionContext.getContext().getSession().put("existUser", existUser);
		
		PageBean<Form> pageBean = manFormService.findAllForm(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "passBackSucc";
	}
	
	//管理员拒绝退货     订单从   "退货中"或"卖家拒绝退货"    转为  "退货失败"  需要tempformId,currPage
	public String refuseBackForm(){
		
		Form ff = manFormService.getFormByFid(tempformId);
		ff.setFstate("退货失败");
		manFormService.updateForm(ff);
		
		GoldGood gg = manFormService.getGoodByGid(ff.getFgid());
		gg.setState("拒绝退货成功");
		manFormService.updateGood(gg);
		
		PageBean<Form> pageBean = manFormService.findAllForm(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "refuseBackSucc";
	}
	
	//用户退货成功，可以删除订单                 需要tempformId,userId,currPage
	public String deleteForm(){
		
		//先获取
		Form ff = manFormService.getFormByFid(tempformId);
		//再删除
		manFormService.deleteForm(ff);
		
		PageBean<Form> pageBean = manFormService.findFormListByUid(userId,currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "deleteFormSucc";
	}
	
}
