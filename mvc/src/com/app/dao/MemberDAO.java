package com.app.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import com.app.mybatis.config.MyBatisConfig;
import com.app.vo.MemberVO;
import com.app.vo.ProductVO;

public class MemberDAO {
	public SqlSession sqlSession;
	
	public MemberDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
//	회원가입
	public void insert(MemberVO memberVO) {
		sqlSession.insert("member.insert", memberVO);
	}
	
//	로그인
	public String select(MemberVO memberVO) {
		return sqlSession.selectOne("member.select", memberVO);
	}
	
//	정보 조회
	public MemberVO selectByEmail(String memberEmail) {
		return sqlSession.selectOne("member.selectByEmail", memberEmail);
	}
	
}



























