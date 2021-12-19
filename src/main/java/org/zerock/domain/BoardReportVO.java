package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardReportVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	
	private String comName;
	private String product;
	private String period;
	
	private String fault;
	
	private String writerPN1;
	private String writerPN2;
	private String writerPN3;
	
	private int cnt;
	
	
	private List<BoardAttachVO> attachList; //첨부파일 정보 수집
}
