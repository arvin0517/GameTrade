package wei.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {

	private Integer uid;
	private String uname;
	private String password;
	private Integer credit;
	private String phone;
	private String isManager;
	private String tradeNum;
	private String isBan;
	private Date regTime;
	
	private float existCash; //账号余额

	public float getExistCash() {
		return existCash;
	}

	public void setExistCash(float existCash) {
		this.existCash = existCash;
	}

	//属于该卖家的金币商品列表
	private Set<GoldGood> ggoods = new HashSet<GoldGood>();

	public Set<GoldGood> getGgoods() {
		return ggoods;
	}

	public void setGgoods(Set<GoldGood> ggoods) {
		this.ggoods = ggoods;
	}

	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public String getTradeNum() {
		return tradeNum;
	}

	public void setTradeNum(String tradeNum) {
		this.tradeNum = tradeNum;
	}

	public String getIsBan() {
		return isBan;
	}

	public void setIsBan(String isBan) {
		this.isBan = isBan;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIsManager() {
		return isManager;
	}

	public void setIsManager(String isManager) {
		this.isManager = isManager;
	}

}
