package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myshop.dao.NoticeDAO;
import com.myshop.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	private NoticeDAO dao;
	
	@Override
	public List<NoticeDTO> NoticeList() throws Exception {
		return dao.NoticeList();
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeDTO NoticeMore(int seq) throws Exception {
		dao.NoticeCnt(seq);
		return dao.NoticeMore(seq);
	}

	@Override
	public void NoticeUpdate(NoticeDTO DTO) throws Exception {
		dao.NoticeUpdate(DTO);
	}

	@Override
	public void NoticeDelete(int seq) throws Exception {
		dao.NoticeDelete(seq);	
	}

	@Override
	public void NoticeForm(NoticeDTO DTO) throws Exception {
		dao.NoticeForm(DTO);
		
	}
	
	
}
