package wei.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.SellGoodsDao;
import wei.entity.GameType;
import wei.entity.GoldGood;
import wei.entity.User;

public class SellGoodsDaoImpl extends HibernateDaoSupport implements SellGoodsDao{

	@Override
	public void testSell() {
		
		System.out.println("sellDao‘À––¡À");
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GameType> findAllType() {
		
		return (List<GameType>) this.getHibernateTemplate().find("from GameType");
	}

	@Override
	public void saveGood(GoldGood goldGood) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(goldGood);
	}

	@Override
	public GameType findTypeById(int ggtypeTid) {
		
		GameType gameType = this.getHibernateTemplate().get(GameType.class, ggtypeTid);
		return gameType;
	}

	@Override
	public void updateUser(User user) {
	   
		this.getHibernateTemplate().update(user);
		
	}
   
	
}
