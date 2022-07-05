package com.myshop.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeDTO {

	private int seq; 		/* 식별번호 */
	private int cus_seq; 	/* 고객 식별번호 */
	private String title;   /* 공지사항 제목 */
	private String content;	/* 공지사항 내용 */
	private int cnt;		/* 조회수 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;	/* 작성일 */			
	private String writer; 	/* 작성자 */
}
