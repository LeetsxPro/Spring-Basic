package com.TSL.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.TSL.www.dao.MemberDAO;
import com.TSL.www.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class Member {
	
	@Autowired
	MemberDAO mbDAO;
	
	// 로그인 페이지
	@RequestMapping("loginPage")
	public ModelAndView loginPage(ModelAndView mv) {
		
		mv.setViewName("member/loginPage");
		return mv;
	}
	
	// 로그인 진행
	@RequestMapping("loginProg")
	public ModelAndView loginProg(ModelAndView mv, MemberVO mbVO, RedirectView rv) {
		
		int cnt = mbDAO.loginProg(mbVO);
		if(cnt == 1) {
			rv.setUrl("/www/main/mainPage");
		}else {
			rv.setUrl("loginPage");
		}
		mv.setView(rv);
		return mv;
	}
	
	// 회원가입 페이지
	@RequestMapping("joinPage")
	public ModelAndView joinPage(ModelAndView mv) {
		
		mv.setViewName("member/joinPage");
		return mv;
	}
	
	// 아이디 중복 체크
	@RequestMapping("idCK")
	public @ResponseBody int idCK(MemberVO mbVO) {
		
		int cnt = mbDAO.idCK(mbVO);
		return cnt;
	}
	
	// 회원가입 진행
	@RequestMapping("joinProg")
	public ModelAndView joinProg(ModelAndView mv,  MemberVO mbVO, RedirectView rv) {
		
		int cnt = mbDAO.joinProg(mbVO);
		if(cnt == 1) {
			rv.setUrl("/www/main/mainPage");
		}else {
			rv.setUrl("/www/member/joinPage");
		}
		mv.setView(rv);
		return mv;
	}
}
