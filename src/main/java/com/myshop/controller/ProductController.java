package com.myshop.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myshop.service.ProductService;

@Controller
@RequestMapping("/Product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	public ProductService ProductService;
	
		
	
		
	
		// 메뉴 디테일 테스트
		@RequestMapping(value = "menuDetail", method = RequestMethod.GET)
		public String menuDetail(Locale locale,Model model) throws Exception{
			return "/Product/menuDetail";
		}
}
