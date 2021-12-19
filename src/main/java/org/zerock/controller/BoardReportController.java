package org.zerock.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardReportVO;
import org.zerock.service.BoardReportService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/report/*")
@AllArgsConstructor
public class BoardReportController {

	private BoardReportService service;
	
	@GetMapping("/reportList")
	public void reportList(Model model, Principal principal) {
		
		String comName = principal.getName();
		
		log.info("reportList");
		model.addAttribute("list", service.getReportList(comName));
	}
	
	@GetMapping("/reportRegister")
	public void getReportRegister() {
		
	}
	
	@PostMapping("/reportRegister")
	public String reportRegister(BoardReportVO board, RedirectAttributes rttr) {
		
		log.info("reportRegister: "+ board);
		
//		if (service.modify(board)) {
//			rttr.addFlashAttribute("result", "정상적으로 기업에 제출되었습니다");
//		}
//		
		service.reportRegister(board);
		
		rttr.addAttribute("result", board.getBno());
		
		return "redirect:/report/reportFinish";
	}
	
	@GetMapping("/reportGet")
	public void getReport(@RequestParam("bno") Long bno, Model model) {
		
		log.info("/reportGet");
		model.addAttribute("board", service.reportGet(bno));
	}
	
	@GetMapping("/reportFinish")
	public void getReportMsg() {
		
	}
}
