package wei.action;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import wei.entity.GameType;
import wei.entity.GoldGood;
import wei.entity.User;
import wei.service.BuyGoodsService;

public class BuyGoodsAction extends ActionSupport{
  
	//商品的临时id
	private int goodId;	
	
	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}


	//游戏类型的临时id:typeId
	private int typeId;
	
	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}


	//注入service
	private BuyGoodsService buyGoodsService;

	public BuyGoodsService getBuyGoodsService() {
		return buyGoodsService;
	}

	public void setBuyGoodsService(BuyGoodsService buyGoodsService) {
		this.buyGoodsService = buyGoodsService;
	}
	
	
	//测试
	public void testBuy(){
		
		buyGoodsService.testBuy();
		System.out.println("buyAction运行了");
	}
	
	//通过GoldGood的tid获取所有已上架的商品
	public String findGoodsByTid(){
		
//		GameType gameType = buyGoodsService.findTypeById(1);
//		ActionContext.getContext().getValueStack().push(gameType);
		
//		Set<GoldGood> ggSet = gameType.getGgoods();		
//		Iterator<GoldGood> it = ggSet.iterator();
//		while(it.hasNext()){
//			
//			System.out.println("good:"+it.next().getGname());
//			//System.out.println("gameType:"+it.next().getGgtype().getTypename());
//		}

//		List<GoldGood> gg = buyGoodsService.findGoodByTid(1);
//		System.out.println("gg:"+gg.get(0).getGname());
		
		List<GoldGood> list = buyGoodsService.findGoodsByTid(typeId);
		
		if(list==null){
			
			//当没找到与选中的游戏的相关商品时，跳转到提示页面。
			return "findNull";
		}
		
		ActionContext.getContext().getValueStack().set("list", list);
		
		String choseGameType = list.get(0).getGgtype().getTypename();
		ActionContext.getContext().getSession().put("choseGameType",choseGameType );
		
		return "findGoodsSucc";
	}
	
	//通过商品的id 找到该商品
	public String findOneGoodById(){
		
		GoldGood gg = buyGoodsService.findOneGoodById(goodId);
		ActionContext.getContext().getValueStack().push(gg);
		
		System.out.println("gg:"+gg.getGname()+"  gameType: "+gg.getGgtype().getTypename()+" User:"+gg.getGguser().getUname());
		
		return "findOneSucc";
	}
	
}
