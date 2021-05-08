package com.sist.dao;

import java.util.*;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.vo.BookVO;

@Repository
public class BookDAO extends SqlSessionDaoSupport{

	@Resource(name="ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<BookVO> bookListData(Map map) {
		return getSqlSession().selectList("bookListData", map);
	}
	
	public List<String> bookCategoryListData() {
		return getSqlSession().selectList("bookCategoryListData");
	}
	
	public int bookTotalPage(int cno) {
		return getSqlSession().selectOne("bookTotalPage", cno);
	}
	
	
}
