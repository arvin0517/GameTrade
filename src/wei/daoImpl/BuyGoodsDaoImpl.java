package wei.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.BuyGoodsDao;
import wei.entity.GameType;
import wei.entity.GoldGood;
import wei.entity.User;

public class BuyGoodsDaoImpl extends HibernateDaoSupport implements BuyGoodsDao{

	@Override
	public void testBuy() {
		
		System.out.println("buyDao运行了");
//		User user = this.getHibernateTemplate().get(User.class, 1);
		//GoldGood gg = this.getHibernateTemplate().get(GoldGood.class, 1);
//		Set<GoldGood> ggSet = user.getGgoods();
		
//		System.out.println("ggSet.size():"+ggSet.size());
//		Iterator<GoldGood> it = ggSet.iterator();
//		System.out.println("it.next().getGname():"+it.next().getGname()+"  "+"it.next().getGname():"+it.next().getGgtype().getTypename());
//		System.out.println("it.next().getGname():"+it.next().getGname()+"  "+"it.next().getGname():"+it.next().getGgtype().getTypename());
//		System.out.println("it.next().getGname():"+it.next().getGname()+"  "+"it.next().getGname():"+it.next().getGgtype().getTypename());
//		System.out.println("it.next().getGname():"+it.next().getGname()+"  "+"it.next().getGname():"+it.next().getGgtype().getTypename());
//		System.out.println("it.next().getGname():"+it.next().getGname()+"  "+"it.next().getGname():"+it.next().getGgtype().getTypename());
//	    while(it.hasNext()){
//	    	
//	    	System.out.println("it.next().getGname():"+it.next().getGname());	    	
//	    }
		
		String sql = "from GoldGood where tid = ?";
		List<?> list = this.getHibernateTemplate().find(sql, "2");
		Iterator<?> it = list.iterator();
		while(it.hasNext()){
			
			GoldGood gg = (GoldGood)it.next();
			System.out.println("卖家："+gg.getGguser().getUname()+"  "+"游戏类型："+gg.getGgtype().getTypename());
		}
	}

	@Override
	public GameType findTypeById(int typeId) {
		
		GameType gameType =this.getHibernateTemplate().get(GameType.class, typeId);
		return gameType;
	}

	@Override
	public List<GoldGood> findGoodsByTid(int typeId) {
		
		String sql = "from GoldGood where tid = ? and state = ?";
		List<?> list = this.getHibernateTemplate().find(sql,typeId,"已上架");
		
		if(list.size()==0){
			
			return null;
			
		}else{
			
			List<GoldGood> goodList = new ArrayList<GoldGood>();
			Iterator<?> it = list.iterator();
			while(it.hasNext()){
				
				goodList.add((GoldGood)it.next());
				
			}
			return goodList;					
			
		}
		

	}

	@Override
	public GoldGood findOneGoodById(int goodId) {
		GoldGood gg = this.getHibernateTemplate().get(GoldGood.class, goodId);
		return gg;
	}


//	@Override
//	public GameType findTypeById(int i) {
//	
//		GameType gameType = this.getHibernateTemplate().get(GameType.class, i);
////		String hql = "from gameType where tid = ?";
////		List<?>list = this.getHibernateTemplate().find(hql, i);
////		if(list.size()>0){
////			
////			return (GameType)list.get(0);
////		}
//		return gameType;
//	}

}
