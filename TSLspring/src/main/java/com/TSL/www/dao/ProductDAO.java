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

	// 1차 카테고리 선택시 자동 1차 분류 리스트 출력
	public List<ProductVO> subList(ProductVO prodVO) {
		
		List<ProductVO> list = sqlSession.selectList("prodSQL.subList", prodVO);
		System.out.println(list.size());
		return list;
		
	}

}
