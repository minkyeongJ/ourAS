package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);

	public BoardVO get(Long bno);

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);


	public List<BoardVO> getList(Criteria cri);

	//추가
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public void removeAttach(Long bno);
	
	//Board 개인, 기업, 엔지니어 별 다르게 나타나게 하기
	public List<BoardVO> getCustomerList(String writer);
	
	public List<BoardVO> getCompanyList(String comName);
	
	public List<BoardVO> getEngineerList(String state);
	
	//state 업데이트
	public boolean updateState(BoardVO board);
}
