package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.Order_MasterDTO;
@Repository
public class Order_MasterDAOImpl implements Order_MasterDAO {
	private static final String namespace = "com.myshop.Order_MasterMapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<Order_MasterDTO> Order_MasterList() throws Exception {
		return sqlSession.selectList(namespace+".Order_MasterList");
	}

	@Override
	public Order_MasterDTO Order_MasterDetail(int order_no) throws Exception {
		return sqlSession.selectOne(namespace+".Order_MasterDetail",order_no);
	}
	
	
	
}
