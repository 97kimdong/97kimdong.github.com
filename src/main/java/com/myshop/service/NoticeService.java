package com.myshop.service;

import java.util.List;

import com.myshop.dto.NoticeDTO;

public interface NoticeService {
	// 공지사항 리스트
	public List<NoticeDTO> NoticeList() throws Exception;
	// 공지사항 상세보기
	public NoticeDTO NoticeMore(int seq) throws Exception;
	// 공지사항 등록
	public void NoticeForm(NoticeDTO DTO) throws Exception;
	// 공지사항 수정
	public void NoticeUpdate(NoticeDTO DTO) throws Exception;
	// 공지사항 삭제
	public void NoticeDelete(int seq) throws Exception;
	// 공지사항 조회수
	public void NoticeCnt(int seq) throws Exception;
}
