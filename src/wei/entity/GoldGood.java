package wei.entity;


//金币商品

public class GoldGood extends Good{
	
	private int goldNum;  //所要销售的金币的数量，以“万金币”为单位

    private User gguser;//商品所属卖家
    private GameType ggtype; //商品所属的游戏类型
    
    
    
	public User getGguser() {
		return gguser;
	}

	public void setGguser(User gguser) {
		this.gguser = gguser;
	}

	public GameType getGgtype() {
		return ggtype;
	}

	public void setGgtype(GameType ggtype) {
		this.ggtype = ggtype;
	}

	public int getGoldNum() {
		return goldNum;
	}

	public void setGoldNum(int goldNum) {
		this.goldNum = goldNum;
	}
	
	
}
