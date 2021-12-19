package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getList();  //select

	public List<BoardVO> getListWithPaging(Criteria cri);

	public void insert(BoardVO board);

	public Integer insertSelectKey(BoardVO board);  //insert

	public BoardVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardVO board);

	public int getTotalCount(Criteria cri);
	
	//Board 개인, 기업, 엔지니어 별 다르게 나타나게 하기
	public List<BoardVO> getCustomerList(String writer);
	public void insertCustomer(BoardVO board);
	
	public List<BoardVO> getCompanyList(String comName);
	
	public List<BoardVO> getEngineerList(String state);
	
	//state 업데이트
	public int updateState(BoardVO board);

}
