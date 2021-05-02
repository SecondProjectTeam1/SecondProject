package com.sist.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.vo.BookVO;
import com.sist.vo.BookfVO;

@Repository
public class BookfDAO extends SqlSessionDaoSupport{

	@Resource(name="ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<BookfVO> bookfListData(Map map) {
		return getSqlSession().selectList("bookfListData", map);
	}
	
	public List<String> bookfCategoryListData() {
		return getSqlSession().selectList("bookfCategoryListData");
	}
	
	public int bookfTotalPage(int cno) {
		return getSqlSession().selectOne("bookfTotalPage", cno);
	}
}
