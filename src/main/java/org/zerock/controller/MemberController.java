package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping({"/join", "/customerJoin", "/companyJoin", "/engineerJoin"})
	public String join(MemberVO member, RedirectAttributes rttr) {
		
		log.info("join: " + member);
		
		service.join(member);
		
		rttr.addFlashAttribute("result", member.getUserid());
		
		return "redirect:/member/list";
	}
	
	@GetMapping({"/join", "/customerJoin", "/companyJoin", "/engineerJoin"})
	public void register() {
		
	}
	
//	@GetMapping("/get")
//	public void get(@RequestParam("userid") String userid, Model model) {
//		
//		log.info("/get");
//		model.addAttribute("member", service.get(userid));
//	}
}
