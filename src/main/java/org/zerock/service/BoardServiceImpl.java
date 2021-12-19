package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {

		log.info("register......" + board);

		mapper.insertSelectKey(board);

		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}

		board.getAttachList().forEach(attach -> {

			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardVO get(Long bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}
	
	//기존 첨부파일 관련 데이터를 삭제한 후에 다시 첨부파일 데이터 추가하는 방식으로 동작
	@Transactional
	@Override
	public boolean modify(BoardVO board) {

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


	@Transactional
	@Override
	public boolean remove(Long bno) {

		log.info("remove...." + bno);

		attachMapper.deleteAll(bno);

		return mapper.delete(bno) == 1;
	}


	@Override
	public List<BoardVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {

		log.info("get Attach list by bno" + bno);

		return attachMapper.findByBno(bno);
	}

	@Override
	public void removeAttach(Long bno) {

		log.info("remove all attach files");

		attachMapper.deleteAll(bno);
	}

	//Board 개인, 기업, 엔지니어 별 다르게 나타나게 하기
	@Override
	public List<BoardVO> getCustomerList(String writer) {
		log.info("get......" + writer);

		return (List<BoardVO>) mapper.getCustomerList(writer);
	}

	@Override
	public List<BoardVO> getCompanyList(String comName) {
		log.info("get......" + comName);

		return mapper.getCompanyList(comName);
	}

	@Override
	public List<BoardVO> getEngineerList(String state) {
		log.info("get......" + state);

		return mapper.getEngineerList(state);
	}

	//state 업데이트
	@Transactional
	@Override
	public boolean updateState(BoardVO board) {
		log.info("Update State......" + board);

		attachMapper.deleteAll(board.getBno());

		boolean updateResult = mapper.updateState(board) == 1;
		
		if (updateResult && board.getAttachList() != null && board.getAttachList().size() > 0) {

			board.getAttachList().forEach(attach -> {

				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}

		return updateResult;
	}
}
