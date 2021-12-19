package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public void join(MemberVO member);
	public void get(String userid);
	public boolean modify(MemberVO member);
	public boolean remove(String member);
	public List<MemberVO> getList();
}
