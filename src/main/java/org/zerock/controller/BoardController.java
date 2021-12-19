package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.MemberMapper;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	//전체 목록 가져옴
	@GetMapping("/list")
	public void list(Criteria cri, Model model, Principal principal) {

		String userid = principal.getName();
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("list", service.getCustomerList(userid));

		int total = service.getTotal(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	//post 방식으로 처리되는 register() //등록 화면
	@PostMapping("register")
	public String register(BoardVO board, RedirectAttributes rttr) { //RedirectAttributes 등록 후 다시 목록 화면으로 이동

		log.info("register:" + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	//post 방식으로 처리되는 reportRegister() //등록 화면
	@PostMapping("reportRegister")
	public String reportRegister(BoardVO board, RedirectAttributes rttr) { //RedirectAttributes 등록 후 다시 목록 화면으로 이동

		log.info("reportRegister:" + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list"; //board 수정 필요
	}
	
	
	@GetMapping("/reportRegister")
	public void getReportRegister(){
		
		
	}
	
	//변경 내용 수집해서 BoardRqVO 파라미터로 처리하고, BoardService 호출
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/list";
	}
	

	//model : 화면 쪽으로 해당 번호의 게시물 전달 하기 위한 파라미터 //9.24 companyget추가
	@GetMapping({ "/get", "/modify", "/companyGet" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify or companyGet");
		model.addAttribute("board", service.get(bno));
	}
	
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);

		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink(); //삭제 후 리스트로 이동
	}

	 
	 @GetMapping("register")
	 public void register() {
		 
	 }
	 
	 //게시물 번호 이용해서 첨부파일과 관련된 데이터 JSON 반환
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {

		log.info("getAttachList " + bno);

		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);

	}

	//파일 삭제
	private void deleteFiles(List<BoardAttachVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    attachList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreach
	  }
	
	//엔지니어 테이블 가져오기
	@GetMapping("/engineerList")
	public void engineerList(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("list", service.getEngineerList("매칭중"));

		int total = service.getTotal(cri);
		
		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}	
	
	
	//기업 테이블 가져오기
	@GetMapping("/companyList")
	public void companyList(Criteria cri, Model model, Principal principal) {
		
		String userid = principal.getName(); //기업명으로 바꿔야 함
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("list", service.getCompanyList(userid));
		// model.addAttribute("pageMaker", new PageDTO(cri, 123));

		int total = service.getTotal(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

}
