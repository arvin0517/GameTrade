package wei.entity;

import java.util.Date;

public class Good {

	private int gid; // ��Ʒid
	private String gname;// ��Ʒ����
	private float gprice;// ��Ʒ�۸�
	private int savenum;// ��Ʒ����
	private Date uptime;// ��Ʒ�ϼ�ʱ��
	private String state;// ��Ʒ״̬
    private String goodType;//��Ʒ����
    
    private float deposit;  //��ƷѺ��
    
    private String backReason; //���˻�����
    
    
    
	public String getBackReason() {
		return backReason;
	}

	public void setBackReason(String backReason) {
		this.backReason = backReason;
	}

	public float getDeposit() {
		return deposit;
	}

	public void setDeposit(float deposit) {
		this.deposit = deposit;
	}

	public String getGoodType() {
		return goodType;
	}

	public void setGoodType(String goodType) {
		this.goodType = goodType;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public float getGprice() {
		return gprice;
	}

	public void setGprice(float gprice) {
		this.gprice = gprice;
	}

	public int getSavenum() {
		return savenum;
	}

	public void setSavenum(int savenum) {
		this.savenum = savenum;
	}

	public Date getUptime() {
		return uptime;
	}

	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
