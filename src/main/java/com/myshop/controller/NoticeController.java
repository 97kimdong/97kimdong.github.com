package com.myshop.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dto.NoticeDTO;
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
	public String NoticeMore(@RequestParam int seq, Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		

	    Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }
	    
	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + seq + "]")) {
	        	NoticeService.NoticeCnt(seq);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + seq + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	NoticeService.NoticeCnt(seq);
	        Cookie newCookie = new Cookie("postView","[" + seq + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
	    
	    
		
		
		
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
	// 공지사항 쓰기 Jsp 연결
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
