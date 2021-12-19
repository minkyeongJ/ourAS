package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardReportVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class BoardReportServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardReportService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testReportRegister() {
		
		BoardReportVO board = new BoardReportVO();
		board.setTitle("모터수리 요청합니다");
		board.setProduct("냉장고");
		board.setComName("한성");
		board.setContent("모터가 작동이 안됩니다");
		board.setWriter("customer1");
		board.setPeriod("5");
		board.setFault("모터");
		
		service.reportRegister(board);
		
		log.info("생성된 게시물의 번호:" + board.getBno());
	}
	
	@Test
	public void testGetReportList() {
		service.getReportList("한성").forEach(board -> log.info(board));
	}
	
	@Test
	public void testReportGet() {
		log.info(service.reportGet(1L));
	}
	
	@Test
	public void tesGetAnaltsis() {
		service.getAnalysis("LG").forEach(board -> log.info(board));
	}
}
