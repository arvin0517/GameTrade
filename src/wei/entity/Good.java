package wei.entity;

import java.util.Date;

public class Good {

	private int gid; // 商品id
	private String gname;// 商品名称
	private float gprice;// 商品价格
	private int savenum;// 商品数量
	private Date uptime;// 商品上架时间
	private String state;// 商品状态
    private String goodType;//商品类型
    
    private float deposit;  //商品押金
    
    private String backReason; //被退货理由
    
    
    
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
