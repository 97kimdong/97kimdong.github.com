package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.Order_MasterDAO;
import com.myshop.dto.Order_MasterDTO;
@Service
public class Order_MasterServiceImpl implements Order_MasterService {
	
	@Inject
	public Order_MasterDAO dao;
	
	@Override
	public List<Order_MasterDTO> Order_MasterList() throws Exception {
		return dao.Order_MasterList();
	}

	@Override
	public Order_MasterDTO Order_MasterDetail(int order_no) throws Exception {
		return dao.Order_MasterDetail(order_no);
	}
	
	
}
