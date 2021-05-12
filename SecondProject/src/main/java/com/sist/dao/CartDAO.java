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
	public void dInCart(CartVO vo)
	{
		getSqlSession().insert("dInCart", vo);
	}
	
	public void fInCart(CartVO vo)
	{
		getSqlSession().insert("fInCart", vo);
	}
	
	public void uInCart(CartVO vo)
	{
		getSqlSession().insert("uInCart", vo);
	}
	
	public void vInCart(CartVO vo)
	{
		getSqlSession().insert("vInCart", vo);
	}
	
	
	// 기존 확인
	public int dBeforeInCart(int type, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("type", type);
		map.put("id", id);
		return getSqlSession().selectOne("dBeforeInCart", map);
	}
	
	public int fBeforeInCart(int type, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("type", type);
		map.put("id", id);
		return getSqlSession().selectOne("fBeforeInCart", map);
	}
	
	public int uBeforeInCart(int type, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("type", type);
		map.put("id", id);
		return getSqlSession().selectOne("uBeforeInCart", map);
	}
	
	public int vBeforeInCart(int type, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("type", type);
		map.put("id", id);
		return getSqlSession().selectOne("vBeforeInCart", map);
	}
	
	
	// 수량 변경
	public void updateCartD(CartVO vo)
	{
		getSqlSession().update("updateCartD",vo);
	}
	public void updateCartF(CartVO vo)
	{
		getSqlSession().update("updateCartF",vo);
	}
	public void updateCartU(CartVO vo)
	{
		getSqlSession().update("updateCartU",vo);
	}
	public void updateCartV(CartVO vo)
	{
		getSqlSession().update("updateCartV",vo);
	}
	
	
	// 카트리스트
	public List<CartVO> dCartList(String id)
	{
		return getSqlSession().selectList("dCartList",id);
	}
	
	public List<CartVO> uCartList(String id)
	{
		return getSqlSession().selectList("uCartList",id);
	}
	
	public List<CartVO> fCartList(String id)
	{
		return getSqlSession().selectList("fCartList",id);
	}
	
	public List<CartVO> vCartList(String id)
	{
		return getSqlSession().selectList("vCartList",id);
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
