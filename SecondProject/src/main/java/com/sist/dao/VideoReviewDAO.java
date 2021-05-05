package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;

@Repository
public class VideoReviewDAO extends SqlSessionDaoSupport {

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	/*
	 * 		<select id="videoReviewListData" resultType="VideoReviewVO" parameterType="int">
			SELECT no, id, name, msg, star, vno, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') as dbday FROM video_review 
			WHERE vno=#{vno}
			ORDER BY no DESC;
			</select>
			<insert id="videoReviewInsert" parameterType="VideoReviewVO">
			<selectKey keyProperty="no" resultType="int" order="BEFORE">
			SELECT NVL(MAX(no)+1, 1) as no FROM video_review
			</selectKey>
			INSERT INTO video_review(no, vno, id, name, msg, star)
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
	public List<VideoReviewVO> videoReviewListData(int vno)
	{
		return getSqlSession().selectList("videoReviewListData", vno);
	}
	
	public void videoReviewInsert(VideoReviewVO vo)
	{
		getSqlSession().selectOne("videoReviewInsert", vo);
	}
	/*
	 * 	<update id="videoReviewUpdate" parameterType="VideoReviewVO">
		UPDATE video_review SET
		msg=#{msg}
		WHERE no=#{no}
		</update>
		<!-- 댓글 삭제 -->
		<delete id="videoReviewDelete" parameterType="int">
		DELETE FROM video_review
		WHERE no=#{no}
		</delete>
	 * 
	 */
	public void videoReviewUpdate(VideoReviewVO vo)
	{
		getSqlSession().selectOne("videoReviewUpdate",vo);
	}
	public void videoReviewDelete(int no)
	{
		getSqlSession().selectOne("videoReviewDelete", no);
	}
}















