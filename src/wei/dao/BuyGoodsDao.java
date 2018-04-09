package wei.dao;

import java.util.List;

import wei.entity.GameType;
import wei.entity.GoldGood;
import wei.entity.User;

public interface BuyGoodsDao {

	void testBuy();

	GameType findTypeById(int typeId);

	List<GoldGood> findGoodsByTid(int typeId);

	GoldGood findOneGoodById(int goodId);

	//GameType findTypeById(int i);

}
