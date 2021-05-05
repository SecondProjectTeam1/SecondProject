package com.sist.dao;
import java.util.*;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.CartVO;
@Repository 
public class CartDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	// 담기
	public void productsInCart(CartVO vo)
	{
		getSqlSession().insert("productsInCart", vo);
	}
	
	
	// 기존 확인
	public int dBeforeInCart(int dombookno, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("dombookno", dombookno);
		map.put("id", id);
		return getSqlSession().selectOne("dBeforeInCart", map);
	}
	
	public int fBeforeInCart(int forbookno, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("forbookno", forbookno);
		map.put("id", id);
		return getSqlSession().selectOne("fBeforeInCart", map);
	}
	
	public int uBeforeInCart(int usedbookno, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("usedbookno", usedbookno);
		map.put("id", id);
		return getSqlSession().selectOne("uBeforeInCart", map);
	}
	
	public int cBeforeInCart(int classno, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("classno", classno);
		map.put("id", id);
		return getSqlSession().selectOne("cBeforeInCart", map);
	}
	
	
	// 수량 변경
	public void updateCartD(CartVO vo)
	{
		getSqlSession().update("dsumCart",vo);
	}
	public void updateCartF(CartVO vo)
	{
		getSqlSession().update("fsumCart",vo);
	}
	public void updateCartU(CartVO vo)
	{
		getSqlSession().update("usumCart",vo);
	}
	public void updateCartC(CartVO vo)
	{
		getSqlSession().update("vsumCart",vo);
	}
	
	
	// 카트리스트
	public List<CartVO> CartList(String id)
	{
		return getSqlSession().selectList("CartList",id);
	}
	
	
	// 삭제
	public void DeleteCart(int cartno)
	{
		getSqlSession().delete("DeleteCart",cartno);
	}
	
	
	// 수정 (장바구니화면에서 수량변경)
	public void dModifyCart(CartVO vo)
	{
		getSqlSession().update("dModifyCart",vo);
	}
	public void fModifyCart(CartVO vo)
	{
		getSqlSession().update("fModifyCart",vo);
	}
	public void uModifyCart(CartVO vo)
	{
		getSqlSession().update("uModifyCart",vo);
	}
	public void cModifyCart(CartVO vo)
	{
		getSqlSession().update("cModifyCart",vo);
	}
	
	
}
