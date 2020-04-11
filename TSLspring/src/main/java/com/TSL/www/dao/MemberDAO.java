package com.TSL.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.TSL.www.vo.MemberVO;

public class MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	// 로그인 진행
	public int loginProg(MemberVO mbVO) {
		
		return sqlSession.selectOne("mbSQL.loginProg", mbVO);
	}
	
	// 아이디 중복 체크
	public int idCK(MemberVO mbVO) {
		
		return sqlSession.selectOne("mbSQL.idCK", mbVO);
	}
	
	// 회원가입 진행
	public int joinProg(MemberVO mbVO) {
		
		return sqlSession.insert("mbSQL.joinProg", mbVO);
	}
}
