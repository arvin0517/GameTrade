package wei.dao;

import java.util.List;

import wei.entity.GameType;
import wei.entity.GoldGood;
import wei.entity.User;

public interface SellGoodsDao {

	void testSell();

	List<GameType> findAllType();

	void saveGood(GoldGood goldGood);

	GameType findTypeById(int ggtypeTid);

	void updateUser(User user);

}
