package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> getList();
	
	public void insert(MemberVO member);
	public void insertAuth(List<AuthVO> auth);
	
	public void insertSelectKey(MemberVO member);
	
	public MemberVO read(String userid);
	
	public MemberVO readId(String userid);
	
	public int update(MemberVO member);
}
