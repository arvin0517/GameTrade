package wei.entity;

import java.util.HashSet;
import java.util.Set;

public class GameType {

	private int tid;
	private String typename;
	
	//���ڸ���Ϸ���͵Ľ����Ʒ
	private Set<GoldGood> ggoods = new HashSet<GoldGood>();
	
	public Set<GoldGood> getGgoods() {
		return ggoods;
	}

	public void setGgoods(Set<GoldGood> ggoods) {
		this.ggoods = ggoods;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

}
