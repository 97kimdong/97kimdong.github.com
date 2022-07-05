package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	private static final String namespace = "com.myshop.NoticeMapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> NoticeList() throws Exception {
		return sqlSession.selectList(namespace+".NoticeList");
	}

	@Override
	public NoticeDTO NoticeMore(int seq) throws Exception {
		return sqlSession.selectOne(namespace+".NoticeMore",seq);
	}

	@Override
	public void NoticeUpdate(NoticeDTO DTO) throws Exception {
		sqlSession.update(namespace+".NoticeUpdate",DTO);
	}

	@Override
	public void NoticeDelete(int seq) throws Exception {
		sqlSession.delete(namespace+".NoticeDelete",seq);	
	}
	
	
	
	
}
