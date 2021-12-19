package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardReportVO;
import org.zerock.domain.BoardVO;

public interface BoardReportMapper {

	//보고서 목록 불러오기
	public List<BoardReportVO> getReportList(String comName);
	
	//보고서 등록하기
	public void reportInsertSelectKey(BoardReportVO board);
	
	//보고서 세부내용 확인
	public BoardReportVO reportRead(Long bno);
	
	public int update(BoardReportVO board);
	
	//결함보고서 결과 처리
	public List<BoardReportVO> getAnalysis(String comName);
}
