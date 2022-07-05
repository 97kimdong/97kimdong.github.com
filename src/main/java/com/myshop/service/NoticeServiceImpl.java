package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

	@Override
	public NoticeDTO NoticeMore(int seq) throws Exception {
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
}
