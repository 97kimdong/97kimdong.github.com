package com.myshop.service;

import java.util.List;

import com.myshop.dto.Order_MasterDTO;

public interface Order_MasterService {
	// 주문내역 리스트
	public List<Order_MasterDTO> Order_MasterList() throws Exception;
	// 주문내역 상세보기
	public Order_MasterDTO Order_MasterDetail(int order_no) throws Exception;
}
