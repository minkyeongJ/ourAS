package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardReportVO;
import org.zerock.domain.BoardVO;

public interface BoardReportService {

	public void reportRegister(BoardReportVO board);
	
	public BoardReportVO reportGet(Long bno);
	
	public List<BoardReportVO> getReportList(String comName);
	
	public boolean modify(BoardReportVO board);
	
	//결과보고서
	public List<BoardReportVO> getAnalysis(String comName);
}
