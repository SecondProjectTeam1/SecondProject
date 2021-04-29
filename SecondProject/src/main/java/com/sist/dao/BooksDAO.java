package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

import javax.annotation.Resource;

import com.sist.vo.*;
@Repository
public class BooksDAO extends SqlSessionDaoSupport{

	@Resource(name="ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	/*
	 * 	<select id="booksListData" resultType="BooksVO" parameterType="hashmap">
		SELECT no, cno, category, title, subtitle, poster, author, pudate, publisher, price, sale_price, stock, num
		FROM (SELECT no, cno, category, title, subtitle, poster, author, pudate, publisher, price, sale_price, stock, rownum as num
		FROM (SELECT no, cno, category, title, subtitle, poster, author, pudate, publisher, price, sale_price, stock
		FROM book_s ORDER BY no ASC))
		WHERE no BETWEEN #{start} AND #{end}
		</select>
		<select id="booksTotalPage" resultType="int">
		SELECT CEIL(COUNT(*)/9.0) FROM book_s
		</select>
	 */
	public List<BooksVO> booksListData(Map map)
	{
		return getSqlSession().selectList("booksListData", map);
	}
	
	public int booksTotalPage(int cno)
	{
		return getSqlSession().selectOne("booksTotalPage", cno);
	}
	public List<BooksCategoryVO> booksCategory()
	{
		return getSqlSession().selectList("booksCategory");
	}
	public BooksVO booksDetailData(int no)
	{
		return getSqlSession().selectOne("booksDetailData", no);
	}
}
