package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.ProductDAO;
import com.myshop.dto.ProductDTO;
@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	public ProductDAO dao;
	
	@Override
	public List<ProductDTO> ProductList() throws Exception {
		return dao.ProductList();
	}

	@Override
	public ProductDTO ProductMore(int seq) throws Exception {
		return dao.ProductMore(seq);
	}

	@Override
	public void ProductForm(ProductDTO pdto) throws Exception {
		dao.ProductForm(pdto);
	}

	@Override
	public void ProductImgForm(ProductDTO pdto) throws Exception {
		dao.ProductImgForm(pdto);
	}

	@Override
	public void ProductUpdate(ProductDTO pdto) throws Exception {
		dao.ProductUpdate(pdto);
	}

	@Override
	public void ProductImgUpdate(ProductDTO pdto) throws Exception {
		dao.ProductImgUpdate(pdto);
	}

	@Override
	public void ProductDelete(int seq) throws Exception {
		dao.ProductDelete(seq);
	}
	
}
