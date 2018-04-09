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
  
	//��Ʒ����ʱid
	private int goodId;	
	
	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}


	//��Ϸ���͵���ʱid:typeId
	private int typeId;
	
	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}


	//ע��service
	private BuyGoodsService buyGoodsService;

	public BuyGoodsService getBuyGoodsService() {
		return buyGoodsService;
	}

	public void setBuyGoodsService(BuyGoodsService buyGoodsService) {
		this.buyGoodsService = buyGoodsService;
	}
	
	
	//����
	public void testBuy(){
		
		buyGoodsService.testBuy();
		System.out.println("buyAction������");
	}
	
	//ͨ��GoldGood��tid��ȡ�������ϼܵ���Ʒ
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
			
			//��û�ҵ���ѡ�е���Ϸ�������Ʒʱ����ת����ʾҳ�档
			return "findNull";
		}
		
		ActionContext.getContext().getValueStack().set("list", list);
		
		String choseGameType = list.get(0).getGgtype().getTypename();
		ActionContext.getContext().getSession().put("choseGameType",choseGameType );
		
		return "findGoodsSucc";
	}
	
	//ͨ����Ʒ��id �ҵ�����Ʒ
	public String findOneGoodById(){
		
		GoldGood gg = buyGoodsService.findOneGoodById(goodId);
		ActionContext.getContext().getValueStack().push(gg);
		
		System.out.println("gg:"+gg.getGname()+"  gameType: "+gg.getGgtype().getTypename()+" User:"+gg.getGguser().getUname());
		
		return "findOneSucc";
	}
	
}
