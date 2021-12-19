package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardReportVO;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class BoardReportMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardReportMapper mapper;
	
	@Test
	public void testBoardInsertSelectKey() {

		BoardReportVO board = new BoardReportVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie");
		board.setComName("LG");
		board.setProduct("TV");
		board.setPeriod("7");
		board.setFault("모터");

		mapper.reportInsertSelectKey(board);

		log.info(board);
	}
	
	@Test
	public void testGetList() {

		mapper.getReportList("LG").forEach(board -> log.info(board));

	}
	
	@Test
	public void testGetAnalysis() {
		
		mapper.getAnalysis("LG").forEach(board -> log.info(board));
	}

}
