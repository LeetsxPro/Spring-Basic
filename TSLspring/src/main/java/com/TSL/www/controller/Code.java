package com.TSL.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.TSL.www.dao.CodeDAO;
import com.TSL.www.vo.CodeVO;

@Controller
@RequestMapping("/code/")
public class Code {

	@Autowired
	CodeDAO cDAO;
	
	// 코드 리스트 출력
	@RequestMapping("codeList")
	public ModelAndView codeList(ModelAndView mv, CodeVO cVO) {
		
		List<CodeVO> list = cDAO.codeList(cVO);
		mv.addObject("LIST", list);
		
		mv.setViewName("code/codeList");
		return mv;
	}
	
	// 코드 내용 출력
	@RequestMapping("codeInfo")
	public  @ResponseBody CodeVO codeInfo(CodeVO cVO) {
		cVO = cDAO.codeInfo(cVO);

		return cVO;
	}
}
