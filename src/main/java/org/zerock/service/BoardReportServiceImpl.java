package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardReportVO;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardReportMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardReportServiceImpl implements BoardReportService {

	@Setter(onMethod_ = @Autowired)
	private BoardReportMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Override
	public void reportRegister(BoardReportVO board) {
		
		log.info("report reister....." + board);
		
		mapper.reportInsertSelectKey(board);
	}

	@Override
	public BoardReportVO reportGet(Long bno) {
		
		log.info("get......" + bno);
		return mapper.reportRead(bno);
	}

	@Override
	public List<BoardReportVO> getReportList(String comName) {
		
		log.info("getReportList.......");
		
		return mapper.getReportList(comName);
	}

	//기존 첨부파일 관련 데이터를 삭제한 후에 다시 첨부파일 데이터 추가하는 방식으로 동작
		@Transactional
		@Override
		public boolean modify(BoardReportVO board) {

			log.info("modify......" + board);

			attachMapper.deleteAll(board.getBno());

			boolean modifyResult = mapper.update(board) == 1;
			
			if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {

				board.getAttachList().forEach(attach -> {

					attach.setBno(board.getBno());
					attachMapper.insert(attach);
				});
			}

			return modifyResult;
		}

		//결과보고서 확인
		@Override
		public List<BoardReportVO> getAnalysis(String comName) {

			log.info("getAnalysis......" + comName);
			return mapper.getAnalysis(comName);
		}
}
