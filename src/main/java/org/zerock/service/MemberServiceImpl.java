package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	//spring 4.3 이상에서 자동 처리
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public void join(MemberVO member) {
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		
		log.info("join..." + member);
		
		System.out.println(member.toString());
        //암호화 하기전
        String password = scpwd.encode(member.getUserpw());
          
        //암호화 하여 password에 저장
        member.setUserpw(password);
        System.out.println(member.toString());
        
		mapper.insert(member);
		member.getAuthList().get(0).setUserid(member.getUserid());
		mapper.insertAuth(member.getAuthList());
		
	}
	
	@Override
	public void get(String userid) {
		
	}
	
	@Override
	public boolean modify(MemberVO member) {
		return true;
	}
	
	@Override
	public boolean remove(String member) {
		return true;
	}

	@Override
	public List<MemberVO> getList() {

		log.info("getList....");
		
		return mapper.getList();
	}
	
}
