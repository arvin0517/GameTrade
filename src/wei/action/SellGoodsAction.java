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
 
	//��Ϸ���͵���ʱId
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

	
	
	//ע��service
	private SellGoodsService sellGoodsService;

	public SellGoodsService getSellGoodsService() {
		return sellGoodsService;
	}

	public void setSellGoodsService(SellGoodsService sellGoodsService) {
		this.sellGoodsService = sellGoodsService;
	}
	
	//����
	public void testSell(){
		
		System.out.println("ggtypeTid:"+ggtypeTid);
		System.out.println("sellAction������");
		sellGoodsService.testSell();
	}
	
	//����������Ϸ����
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
	
	//������Ʒ
	public String saveGood(){
		
		User user = (User)ActionContext.getContext().getSession().get("existUser");
		user.setExistCash(user.getExistCash()-goldGood.getDeposit());
		ActionContext.getContext().getSession().put("existUser", user);
		
		sellGoodsService.updateUser(user);
		
		GameType gameType = sellGoodsService.findTypeById(ggtypeTid);
		
		goldGood.setGguser(user);
		goldGood.setGgtype(gameType);
		goldGood.setUptime(new Date());
		goldGood.setState("�����");
		goldGood.setGoodType("��ҽ���");
		sellGoodsService.saveGood(goldGood);
		System.out.println("saveGood������");
		System.out.println("��ƷѺ��deposit:  "+ goldGood.getDeposit());
		
		
		
		
		return "saveGSucc";
	}
	
}
