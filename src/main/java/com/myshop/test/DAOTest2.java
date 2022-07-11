package com.myshop.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CustomerDTO;

@Repository
public class DAOTest2 {

	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void test() {
		System.out.println("DAO Test~!");
	}

	public List<CustomerDTO> sampleList(){
		return sqlSession.selectList("sample.sampleList");
	}
	
	public int sampleCount(){
		return sqlSession.selectOne("sample.sampleCount");
	}
}
