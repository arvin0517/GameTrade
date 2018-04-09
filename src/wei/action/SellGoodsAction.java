package wei.action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import wei.entity.GameType;
import wei.entity.GoldGood;
import wei.entity.User;
import wei.service.SellGoodsService;

public class SellGoodsAction extends ActionSupport implements ModelDriven<GoldGood>{
 
//	List<GameType> list;
//	
//	public List<GameType> getList() {
//		return list;
//	}
//
//	public void setList(List<GameType> list) {
//		this.list = list;
//	}
 
	//游戏类型的临时Id
	private int ggtypeTid;
	
    public int getGgtypeTid() {
		return ggtypeTid;
	}

	public void setGgtypeTid(int ggtypeTid) {
		this.ggtypeTid = ggtypeTid;
	}

	public GoldGood getGoldGood() {
		return goldGood;
	}

	public void setGoldGood(GoldGood goldGood) {
		this.goldGood = goldGood;
	}



	private GoldGood goldGood = new GoldGood();	
	@Override
	public GoldGood getModel() {
		// TODO Auto-generated method stub
		return goldGood;
	}

	
	
	//注入service
	private SellGoodsService sellGoodsService;

	public SellGoodsService getSellGoodsService() {
		return sellGoodsService;
	}

	public void setSellGoodsService(SellGoodsService sellGoodsService) {
		this.sellGoodsService = sellGoodsService;
	}
	
	//测试
	public void testSell(){
		
		System.out.println("ggtypeTid:"+ggtypeTid);
		System.out.println("sellAction运行了");
		sellGoodsService.testSell();
	}
	
	//查找所有游戏类型
	public String fingAllType(){
		
		List<GameType> list = sellGoodsService.findAllType();
		 ActionContext.getContext().getValueStack().set("list",list); 
		
//		GameType gameType = typeList.get(0);
//		System.out.println("gameType:"+gameType.getTypename());		
		Iterator<GameType> it = list.iterator();
		while(it.hasNext()){
			
			GameType type = it.next();
			System.out.println("gameType:"+type.getTypename());
		}
		return "findAll";
	}
	
	//保存商品
	public String saveGood(){
		
		User user = (User)ActionContext.getContext().getSession().get("existUser");
		user.setExistCash(user.getExistCash()-goldGood.getDeposit());
		ActionContext.getContext().getSession().put("existUser", user);
		
		sellGoodsService.updateUser(user);
		
		GameType gameType = sellGoodsService.findTypeById(ggtypeTid);
		
		goldGood.setGguser(user);
		goldGood.setGgtype(gameType);
		goldGood.setUptime(new Date());
		goldGood.setState("审核中");
		goldGood.setGoodType("金币交易");
		sellGoodsService.saveGood(goldGood);
		System.out.println("saveGood运行了");
		System.out.println("商品押金deposit:  "+ goldGood.getDeposit());
		
		
		
		
		return "saveGSucc";
	}
	
}
