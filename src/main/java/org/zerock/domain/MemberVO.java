package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String userid;
	private String userpw;
	private String userName;
	private boolean enabled;

	private Date regDate;
	private Date updateDate;
	
	private String email;
	private String address;
	
	private String phone1;
	private String phone2;
	private String phone3;
	
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String bizno;
	private String crimsPaper;
	private String mType;
	private String comName;
	
	
	private List<AuthVO> authList;
}

