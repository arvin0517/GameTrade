package wei.entity;


//�����Ʒ

public class GoldGood extends Good{
	
	private int goldNum;  //��Ҫ���۵Ľ�ҵ��������ԡ����ҡ�Ϊ��λ

    private User gguser;//��Ʒ��������
    private GameType ggtype; //��Ʒ��������Ϸ����
    
    
    
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
