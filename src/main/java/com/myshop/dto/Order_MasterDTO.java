package com.myshop.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Order_MasterDTO {
	
	private int seq;					// 식별번호
	private int order_no;				// 주문번호
	private int order_step;				// 1:접수중, 3:배송중, 5:배송완료
	private int payment_status;			// 1:입금대기, 3:입금확인
	private int price;					// 상품금액
	private int use_point;				// 사용포인트
	private int save_point;				// 적립포인트
	private int total_price;			// 최종금액
	private int cus_seq;				// 고객식별번호
	private String delivery_cus;		// 받는사람 이름
	private String delivery_addr1;		// 받는 주소
	private String delivery_addr2;		// 받는 상세주소
	private String delivery_zip_code;	// 받는 주소 우편번호
	private String delivery_memo;		// 메모
	private Date regdate;				// 주문일자
	
}