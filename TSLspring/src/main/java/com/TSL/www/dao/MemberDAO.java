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
}
