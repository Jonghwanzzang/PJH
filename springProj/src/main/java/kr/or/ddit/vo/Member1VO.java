package kr.or.ddit.vo;

public class Member1VO {
	
	private String memId;
	private String memName;
	private String memSpecialty;
	private String memJob;
	private String memLike;
	
	
	
	public Member1VO() {}
	
	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemSpecialty() {
		return memSpecialty;
	}

	public void setMemSpecialty(String memSpecialty) {
		this.memSpecialty = memSpecialty;
	}

	public String getMemJob() {
		return memJob;
	}


	public void setMemJob(String memJob) {
		this.memJob = memJob;
	}


	public String getMemLike() {
		return memLike;
	}


	public void setMemLike(String memLike) {
		this.memLike = memLike;
	}


	@Override
	public String toString() {
		return "Member1VO [memId=" + memId + ", memName=" + memName + ", memSpecialty=" + memSpecialty + ", memJob="
				+ memJob + ", memLike=" + memLike + "]";
	}
}
