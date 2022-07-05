package com.myshop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dto.CustomerDTO;
import com.myshop.dto.NoticeDTO;
import com.myshop.service.CustomerService;
import com.myshop.service.NoticeService;

@Controller

@RequestMapping("/Notice/*")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService NoticeService;
	
	// Jsp 연결
	
	// 공지사항 상세보기
	@RequestMapping(value="NoticeMore" , method = RequestMethod.GET)
	public String NoticeMore(@RequestParam int seq, Model model) throws Exception{
		NoticeService.NoticeMore(seq);
		NoticeDTO More = NoticeService.NoticeMore(seq);
		model.addAttribute("More", More);
		return "/Notice/NoticeMore";
	}
	//  공지사항 등록
	@RequestMapping(value="NoticeInsert" , method = RequestMethod.POST)
	public String NoticeInsert(NoticeDTO DTO, Model model)  throws Exception{
		NoticeService.NoticeForm(DTO);
		return "redirect:/Admin/NoticeList";
	}
	
	@RequestMapping("NoticeForm")
	public String NoticeForm() {
		return "/Notice/NoticeForm";
	}
	
	
	// 공지사항 수정
	@RequestMapping(value="NoticeUpdate" , method = RequestMethod.POST)
	public String NoticeUpdate(NoticeDTO DTO, Model model) throws Exception{
		NoticeService.NoticeUpdate(DTO);
		return "redirect:/Admin/NoticeList";
	}
	
	// 공지사항 삭제
	@RequestMapping(value="NoticeDelete" , method = RequestMethod.GET)
	public String NoticeDelete(@RequestParam int seq, Model model) throws Exception {
		NoticeService.NoticeDelete(seq);
		return "redirect:/Admin/NoticeList";
	}
		
}
