package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Test
	public void testGetList() {

		mapper.getList().forEach(board -> log.info(board));

	}

	@Test
	public void testInsert() {

		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");

		mapper.insert(board);

		log.info(board);
	}

	@Test
	public void testInsertSelectKey() {

		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie");
		board.setComName("SAMSUNG");
		board.setProduct("TV");

		mapper.insertSelectKey(board);

		log.info(board);
	}

	@Test
	public void testRead() {

		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);

		log.info(board);

	}

	@Test
	public void testDelete() {

		log.info("DELETE COUNT: " + mapper.delete(3L));
	}

	@Test
	public void testUpdate() {

		BoardVO board = new BoardVO();
		// 실행전 존재하는 번호인지 확인할 것
		board.setBno(103L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");

		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);

	}

	@Test
	public void testPaging() {

		Criteria cri = new Criteria();
		
	    //10개씩 3페이지 
	    cri.setPageNum(3);
	    cri.setAmount(10);


		List<BoardVO> list = mapper.getListWithPaging(cri);

		list.forEach(board -> log.info(board));

	}
		
		//Criteria 객체의 type과 keyword를 넣어서 원하는 SQL 생성되는 확인함
	  @Test
	  public void testSearch() {

	    Criteria cri = new Criteria();
	    cri.setKeyword("키워드");
	    cri.setType("TCP");

	    List<BoardVO> list = mapper.getListWithPaging(cri);

	    list.forEach(board -> log.info(board));
	  }
	  
	  @Test
	  public void testGetCustomerList() {
		  
		  mapper.getCustomerList("customer3").forEach(board -> log.info(board));
		  
		  log.info("==========================================");
	  }
	  
	  @Test
	  public void testUpdateState() {
		  BoardVO board = new BoardVO();
			// 실행전 존재하는 번호인지 확인할 것
			board.setBno(103L);

			board.setState("매칭중");

			int count = mapper.updateState(board);
			log.info("UPDATE COUNT: " + count);
	  }
	  
	  @Test
	  public void testGetEngineerList() {
		  
		  mapper.getEngineerList("매칭중").forEach(board -> log.info(board));
		  
		  log.info("==========================================");
	  }
}
