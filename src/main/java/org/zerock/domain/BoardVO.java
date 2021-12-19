package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	
	//목록 게시판 추가
	private String comName;
	private String product;
	private String state;
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList; //첨부파일 정보 수집
		
}
