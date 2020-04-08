package com.TSL.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TSL.www.dao.ProductDAO;
import com.TSL.www.vo.CodeVO;
import com.TSL.www.vo.ProductVO;

@Controller
@RequestMapping("/product/")
public class Product {

	@Autowired
	ProductDAO prodDAO;
	
	// 제품페이지 출력
	@RequestMapping("productList")
	public ModelAndView productList(ModelAndView mv, ProductVO prodVO) {
		
		List<ProductVO> list = prodDAO.mfrList(prodVO);
		mv.addObject("mfrList", list);
		
		mv.setViewName("product/productList");
		return mv;
	}
	
	// 제품 리스트 출력
	@RequestMapping("subList")
	public @ResponseBody List<ProductVO> subList(ProductVO prodVO) {
		
		List<ProductVO> list = prodDAO.subList(prodVO);
		
		return list;
	}
}
