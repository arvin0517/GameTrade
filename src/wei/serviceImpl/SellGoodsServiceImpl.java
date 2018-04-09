package wei.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import wei.dao.SellGoodsDao;
import wei.entity.GameType;
import wei.entity.GoldGood;
import wei.entity.User;
import wei.service.SellGoodsService;

@Transactional
public class SellGoodsServiceImpl implements SellGoodsService{

	
	//注入dao
	private SellGoodsDao sellGoodsDao;

	public SellGoodsDao getSellGoodsDao() {
		return sellGoodsDao;
	}

	public void setSellGoodsDao(SellGoodsDao sellGoodsDao) {
		this.sellGoodsDao = sellGoodsDao;
	}

	@Override
	public void testSell() {
		// TODO Auto-generated method stub
	    System.out.println("sellService运行了");
	    sellGoodsDao.testSell();
	}

	@Override
	public List<GameType> findAllType() {
		
		return sellGoodsDao.findAllType();
	}

	@Override
	public void saveGood(GoldGood goldGood) {
	
	    sellGoodsDao.saveGood(goldGood);	
	}

	@Override
	public GameType findTypeById(int ggtypeTid) {
		
		return sellGoodsDao.findTypeById(ggtypeTid);
	}

	@Override
	public void updateUser(User user) {
		
		sellGoodsDao.updateUser(user);
		
	}
	
}
