package wei.entity;

import java.util.Date;

//订单类
public class Form {

	private int fid;
	private Date subtime; // 购买时间
	private double totalPrice;
	private String fstate; // 订单状态
	private int fnumber; // 商品数量
	private String reason; // 退单理由

	private int fgid; // 订单上的商品的id
	private int suid; // 卖家id
	private int buid; // 买家id
	private String formId; //订单编号
	private String transfer;  //金币要转入的买家游戏账号

    private String sellName;  //卖家名称
    private String buyName;   //买家名称
    private String goodName;  //商品名称
    
	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public String getSellName() {
		return sellName;
	}

	public void setSellName(String sellName) {
		this.sellName = sellName;
	}

	public String getBuyName() {
		return buyName;
	}

	public void setBuyName(String buyName) {
		this.buyName = buyName;
	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}	
	
	public String getTransfer() {
		return transfer;
	}

	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}

	public int getFgid() {
		return fgid;
	}

	public void setFgid(int fgid) {
		this.fgid = fgid;
	}

	public int getSuid() {
		return suid;
	}

	public void setSuid(int suid) {
		this.suid = suid;
	}

	public int getBuid() {
		return buid;
	}

	public void setBuid(int buid) {
		this.buid = buid;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public Date getSubtime() {
		return subtime;
	}

	public void setSubtime(Date subtime) {
		this.subtime = subtime;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getFstate() {
		return fstate;
	}

	public void setFstate(String fstate) {
		this.fstate = fstate;
	}

	public int getFnumber() {
		return fnumber;
	}

	public void setFnumber(int fnumber) {
		this.fnumber = fnumber;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
