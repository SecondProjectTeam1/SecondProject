package com.sist.dao;

import java.util.*;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.vo.BookJjimVO;
import com.sist.vo.BookReplyVO;
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
	
	public BookVO bookDetailData(int fno) {
		return getSqlSession().selectOne("bookDetailData", fno);
	}
	
	public List<BookReplyVO> bookReplyData(Map map) {
		return getSqlSession().selectList("bookReplyData", map);
	}
	
	public int bookReplyTotalPage(int no) {
		return getSqlSession().selectOne("bookReplyTotalPage", no);
	}
	
	public List<BookReplyVO> bookReplyScoreData(int no) {
		return getSqlSession().selectList("bookReplyScoreData", no);
	}
	
	public double bookReplyAverageData(int no) {
		return getSqlSession().selectOne("bookReplyAverageData", no);
	}
	
	public void bookReplyInsert(BookReplyVO vo) {
		getSqlSession().insert("bookReplyInsert", vo);
	}
	
	public List<BookVO> bookSearchList(Map map) {
		return getSqlSession().selectList("bookSearchList", map);
	}
	
	public int bookSearchTotalPage(String sText) {
		return getSqlSession().selectOne("bookSearchTotalPage", sText);
	}
	
	// 찜목록
			public List<BookJjimVO> BookJjimListData(String id)
			{
				return getSqlSession().selectList("BookJjimListData", id);
			}
			// 찜개수
			public int BookJjimCount(String id)
			{
				return getSqlSession().selectOne("BookJjimCount", id);
			}
			public void BookJjimInsert(BookJjimVO vo)
			{
				getSqlSession().selectOne("BookJjimInsert",vo);
			}
			public int BookJjimCheck(int cno)
			{
				return getSqlSession().selectOne("BookJjimCheck", cno);
			}
	
}
