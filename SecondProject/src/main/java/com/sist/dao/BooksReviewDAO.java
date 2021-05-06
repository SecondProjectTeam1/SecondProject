package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;

@Repository
public class BooksReviewDAO extends SqlSessionDaoSupport {

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	/*
	 * 		<select id="junggoReviewListData" resultType="BooksReviewVO" parameterType="int">
			SELECT no, id, name, msg, star, vno, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') as dbday FROM junggo_review 
			WHERE vno=#{vno}
			ORDER BY no DESC;
			</select>
			<insert id="junggoReviewInsert" parameterType="BooksReviewVO">
			<selectKey keyProperty="no" resultType="int" order="BEFORE">
			SELECT NVL(MAX(no)+1, 1) as no FROM junggo_review
			</selectKey>
			INSERT INTO junggo_review(no, vno, id, name, msg, star)
			VALUES(
				#{no},
				#{vno},
				#{id},
				#{name},
				#{msg},
				#{star}
			)
			</insert>
	 */
	public List<BooksReviewVO> junggoReviewListData(int vno)
	{
		return getSqlSession().selectList("junggoReviewListData", vno);
	}
	
	public void junggoReviewInsert(BooksReviewVO vo)
	{
		getSqlSession().selectOne("junggoReviewInsert", vo);
	}
	public void junggoReviewUpdate(BooksReviewVO vo)
	{
		getSqlSession().selectOne("junggoReviewUpdate",vo);
	}
	public void junggoReviewDelete(int no)
	{
		getSqlSession().selectOne("junggoReviewDelete", no);
	}
	public double booksStarAvgData(int vno)
	{
		return getSqlSession().selectOne("booksStarAvgData", vno);
	}
	public int booksRevCountData(int vno)
	{
		return getSqlSession().selectOne("booksRevCountData", vno);
	}
}

