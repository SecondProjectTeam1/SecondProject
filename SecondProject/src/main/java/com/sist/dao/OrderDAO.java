package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.sist.vo.CartVO;
import com.sist.vo.OrderVO;
@Repository
public class OrderDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<OrderVO> OrderList(OrderVO vo) throws DataAccessException
	{
		List<OrderVO> orderProductsList=new ArrayList<OrderVO>();
		orderProductsList=(ArrayList)getSqlSession().selectList("OrderList",vo);
		return getSqlSession().selectList("OrderList");
	}
	
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException
	{
		int orderno2=selectOrderno2();
		for(int i=0;i<myOrderList.size();i++)
		{
			OrderVO vo=myOrderList.get(i);
			vo.setOrderno2(orderno2);
			getSqlSession().insert("insertNewOrder",vo);
		}
	}
	
	public int deleteProductsFromCart(Map map)
	{
		return getSqlSession().delete("deleteProductsFromCart",map);
	}
	
	public void deleteProductsFromCart(List<OrderVO> myOrderList)throws DataAccessException{
		for(int i=0; i<myOrderList.size();i++){
			OrderVO vo =(OrderVO)myOrderList.get(i);
			getSqlSession().delete("deleteProductsFromCart",vo);		
		}
	}
	
	public int selectOrderno2() throws DataAccessException
	{
		return getSqlSession().selectOne("selectOrderno2");
	}
}
