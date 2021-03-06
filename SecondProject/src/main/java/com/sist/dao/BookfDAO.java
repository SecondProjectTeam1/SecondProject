package com.sist.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.sist.vo.BookReplyVO;
import com.sist.vo.BookVO;
import com.sist.vo.BookfJjimVO;
import com.sist.vo.BookfReplyVO;
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
	
	public BookfVO bookfDetailData(int fno) {
		return getSqlSession().selectOne("bookfDetailData", fno);
	}
	
	public List<BookfReplyVO> bookfReplyData(Map map) {
		return getSqlSession().selectList("bookfReplyData", map);
	}
	
	public int bookfReplyTotalPage(int no) {
		return getSqlSession().selectOne("bookfReplyTotalPage", no);
	}
	
	public List<BookfReplyVO> bookfReplyScoreData(int no) {
		return getSqlSession().selectList("bookfReplyScoreData", no);
	}
	
	public int bookfReplyAverageData(int no) {
		return getSqlSession().selectOne("bookfReplyAverageData", no);
	}
	
	public void bookfReplyInsert(BookfReplyVO vo) {
		getSqlSession().insert("bookfReplyInsert", vo);
	}
	
	public List<BookfVO> bookfSearchList(Map map) {
		return getSqlSession().selectList("bookfSearchList", map);
	}
	
	public int bookfSearchTotalPage(String sText) {
		return getSqlSession().selectOne("bookfSearchTotalPage", sText);
	}
	// 찜목록
			public List<BookfJjimVO> BookfJjimListData(String id)
			{
				return getSqlSession().selectList("BookfJjimListData", id);
			}
			// 찜개수
			public int BookfJjimCount(String id)
			{
				return getSqlSession().selectOne("BookfJjimCount", id);
			}
			public void BookfJjimInsert(BookfJjimVO vo)
			{
				getSqlSession().selectOne("BookfJjimInsert",vo);
			}
			public int BookfJjimCheck(int cno)
			{
				return getSqlSession().selectOne("BookfJjimCheck", cno);
			}
}
