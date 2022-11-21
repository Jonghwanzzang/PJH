package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MemberAuthVO {
	
	private String memId;		//** username(security)
	private String auth;		//** auth(security)
	
	

}
