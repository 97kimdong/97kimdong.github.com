/*
 * package com.myshop.dao;
 * 
 * import java.util.List;
 * 
 * import javax.inject.Inject;
 * 
 * import org.apache.ibatis.session.SqlSession;
 * 
 * import com.myshop.dto.ProductDTO;
 * 
 * public class ProductDAOImpl implements ProductDAO { private static final
 * String namespace = "com.myshop.ProductMapper";
 * 
 * @Inject SqlSession sqlSession;
 * 
 * @Override public List<ProductDTO> ProductList() throws Exception { return
 * sqlSession.selectList(namespace+".ProductList"); }
 * 
 * @Override public ProductDTO ProductMore(int seq) throws Exception { return
 * sqlSession.selectOne(namespace+".ProductMore",seq); }
 * 
 * @Override public void ProductForm(ProductDTO pdto) throws Exception {
 * sqlSession.insert(namespace+".ProductForm",pdto); }
 * 
 * @Override public void ProductImgForm(ProductDTO pdto) throws Exception {
 * sqlSession.insert(namespace+".ProductImgForm",pdto); }
 * 
 * @Override public void ProductUpdate(ProductDTO pdto) throws Exception {
 * sqlSession.update(namespace+".ProductUpdate",pdto); }
 * 
 * @Override public void ProductImgUpdate(ProductDTO pdto) throws Exception {
 * sqlSession.update(namespace+".ProductImgUpdate",pdto); }
 * 
 * @Override public void ProductDelete(int seq) throws Exception {
 * sqlSession.delete(namespace+".ProductDelete",seq); }
 * 
 * }
 */