package com.myshop.dao;

import java.util.List;

import com.myshop.dto.ProductDTO;

public interface ProductDAO {
	// 상품 리스트
	public List<ProductDTO> ProductList() throws Exception;
	// 상품 상세보기
	public ProductDTO ProductMore(int seq) throws Exception;
	// 상품 등록
	public void ProductForm(ProductDTO pdto) throws Exception;
	// 상품 이미지등록
	public void ProductImgForm(ProductDTO pdto) throws Exception;
	// 상품 수정
	public void ProductUpdate(ProductDTO pdto) throws Exception;
	// 상품 이미지 수정
	public void ProductImgUpdate(ProductDTO pdto) throws Exception;
	// 상품 삭제
	public void ProductDelete(int seq) throws Exception;
}
