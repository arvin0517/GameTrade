package wei.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import wei.dao.BuyGoodsDao;
import wei.entity.GameType;
import wei.entity.GoldGood;
import wei.entity.User;
import wei.service.BuyGoodsService;

@Transactional
public class BuyGoodsServiceImpl implements BuyGoodsService{

	  //注入dao
	private BuyGoodsDao buyGoodsDao;

	public BuyGoodsDao getBuyGoodsDao() {
		return buyGoodsDao;
	}

	public void setBuyGoodsDao(BuyGoodsDao buyGoodsDao) {
		this.buyGoodsDao = buyGoodsDao;
	}

	@Override
	public void testBuy() {

		  buyGoodsDao.testBuy();
		  System.out.println("buyService运行了");
		
	}

	@Override
	public GameType findTypeById(int typeId) {
		// TODO Auto-generated method stub
		return buyGoodsDao.findTypeById(typeId);
	}

	@Override
	public List<GoldGood> findGoodsByTid(int typeId) {
		// TODO Auto-generated method stub
		return buyGoodsDao.findGoodsByTid(typeId);
	}

	@Override
	public GoldGood findOneGoodById(int goodId) {
		
		return buyGoodsDao.findOneGoodById(goodId);
	}




//	@Override
//	public GameType findTypeById(int i) {
//		
//		return buyGoodsDao.findTypeById(i);
//	}
	
}
