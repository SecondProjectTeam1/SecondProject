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
	public int dBeforeInCart(int productno, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("productno", productno);
		map.put("id", id);
		return getSqlSession().selectOne("dBeforeInCart", map);
	}
	
	public int fBeforeInCart(int productno, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("productno", productno);
		map.put("id", id);
		return getSqlSession().selectOne("fBeforeInCart", map);
	}
	
	//uBeforeInCart 수정전
	/*
	public int uBeforeInCart(int type, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("type", type);
		map.put("id", id);
		return getSqlSession().selectOne("uBeforeInCart", map);
	}
	*/
	
	public int uBeforeInCart(int productno, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("productno", productno);
		map.put("id", id);
		return getSqlSession().selectOne("uBeforeInCart", map);
	}
	
	public int vBeforeInCart(int productno, String id)
	{
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("productno", productno);
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
	/*
	 <select id="CartListData" resultMap="CartMap" parameterType="string">
	
	public List<CartVO> CartListData(String id)
	{
		return getSqlSession().selectList("CartListData",id);
	}
	 */
	
	
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
	public int DeleteCart(int cartno)
	{
		return getSqlSession().delete("DeleteCart",cartno);
	}
	
	
	
	// 주문
	public void orderOkUpdate(int cartno)
	{
		getSqlSession().update("orderOkUpdate",cartno);
	}
	
	
	
	
	// 관리자페이지
	public List<CartVO> adminPageListDataD()
	{
		return getSqlSession().selectList("adminPageListDataD");
	}
	public List<CartVO> adminPageListDataF()
	{
		return getSqlSession().selectList("adminPageListDataF");
	}
	public List<CartVO> adminPageListDataU()
	{
		return getSqlSession().selectList("adminPageListDataU");
	}
	public List<CartVO> adminPageListDataV()
	{
		return getSqlSession().selectList("adminPageListDataV");
	}
	
	public void adminOkUpdate(int cartno)
	{
		getSqlSession().update("adminOkUpdate",cartno);
	}
	
}
