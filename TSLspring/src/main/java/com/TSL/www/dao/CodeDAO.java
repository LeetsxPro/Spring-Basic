package com.TSL.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.TSL.www.vo.CodeVO;

public class CodeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	// 코드리스트 출력
	public List<CodeVO> codeList(CodeVO cVO) {
		
		return sqlSession.selectList("cSQL.codeList", cVO);
	}

	public CodeVO codeInfo(CodeVO cVO) {
		
		return sqlSession.selectOne("cSQL.codeInfo", cVO);
	}
}
