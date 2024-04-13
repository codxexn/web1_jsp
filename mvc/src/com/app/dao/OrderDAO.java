package com.app.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import com.app.dto.OrderDTO;
import com.app.mybatis.config.MyBatisConfig;
import com.app.vo.OrderVO;
import com.app.vo.ProductVO;

public class OrderDAO {
	public SqlSession sqlSession;
	
	public OrderDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
//	주문 완료
	public void insert(OrderVO orderVO) {
		sqlSession.insert("order.insert", orderVO);
	}
	
//	주문 내역
	public List<OrderDTO> select(Long memberId){
		return sqlSession.selectList("order.select", memberId);
	}
	
//	주문 수량 조회
	public int selectById(Long id) {
		return sqlSession.selectOne("order.selectById", id);
	}
	
//	주문 취소
	public void delete(Long id) {
		sqlSession.delete("order.delete", id);
	}
	
}



























