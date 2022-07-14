package com.myshop.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dto.Order_MasterDTO;
import com.myshop.service.Order_MasterService;

@Controller
@RequestMapping("/Order/*")
public class OrderMasterController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	Order_MasterService OrderService;
	
	//주문내역 상세보기
	@RequestMapping(value="OrderDetail", method = RequestMethod.GET)
	public String OrderDetail(@RequestParam int order_no, Model model) throws Exception {
		Order_MasterDTO More = OrderService.Order_MasterDetail(order_no);
		model.addAttribute("More",More);
		return "/Order/OrderDetail";
	}
	
}
