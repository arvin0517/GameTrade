package wei.entity;

import java.util.Date;

//������
public class Form {

	private int fid;
	private Date subtime; // ����ʱ��
	private double totalPrice;
	private String fstate; // ����״̬
	private int fnumber; // ��Ʒ����
	private String reason; // �˵�����

	private int fgid; // �����ϵ���Ʒ��id
	private int suid; // ����id
	private int buid; // ���id
	private String formId; //�������
	private String transfer;  //���Ҫת��������Ϸ�˺�

    private String sellName;  //��������
    private String buyName;   //�������
    private String goodName;  //��Ʒ����
    
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
