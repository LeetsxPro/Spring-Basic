package com.TSL.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.TSL.www.vo.ProductVO;

public class ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 제조사 리스트 출력
	public List<ProductVO> mfrList(ProductVO prodVO) {
		
		return sqlSession.selectList("prodSQL.mfrList", prodVO);
	}

	// 제품 리스트 출력
	public List<ProductVO> prodList(ProductVO prodVO) {
		
		return sqlSession.selectList("prodSQL.prodList", prodVO);
	}

}
