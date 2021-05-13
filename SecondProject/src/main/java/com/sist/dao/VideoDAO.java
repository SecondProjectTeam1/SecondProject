package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.dao.*;
import com.sist.vo.*;
@Repository
public class VideoDAO extends SqlSessionDaoSupport{
	
	
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	
	/*
	 * 	<select id="viedoListData" resultType="com.sist.vo.VideoVO" parameterType="hashmap">
		SELECT no, cno, category, title, teacher, poster, price, content1, content2, content3, content4, content5, num
		FROM (SELECT no, cno, category, title, teacher, poster, price, content1, content2, content3, content4, content5, rownum as num
		FROM (SELECT no, cno, category, title, teacher, poster, price, content1, content2, content3, content4, content5
		FROM video WHERE cno=#{cno} ORDER BY no ASC))
		WHERE num BETWEEN #{start} AND #{end}
		</select>
		<select id="videoTotalPage" resultType="int" parameterType="int">
		SELECT CEIL(COUNT(*)/9.0) FROM video
		WHERE cno=#{cno}
		</select>
		<select id="videoCategoryData" resultType="com.sist.vo.VideoCategoryVO">
		SELECT * FROM video_category
		</select>
		<select id="videoDetailData" resultType="com.sist.vo.VideoVO" parameterType="int">
		SELECT * FROM video
		WHERE no=#{no}
		</select>
	 */
	public List<VideoVO> viedoListData(Map map)
	{
		return getSqlSession().selectList("viedoListData", map);
	}
	
	public int videoTotalPage(int cno)
	{
		return getSqlSession().selectOne("videoTotalPage", cno);
	}
	public List<VideoCategoryVO> videoCategoryData()
	{
		return getSqlSession().selectList("videoCategoryData");
	}
	public VideoVO videoDetailData(int no)
	{
		return getSqlSession().selectOne("videoDetailData", no);
	}
	/*
	 * 	<select id="videoSameCategoryData" resultType="com.sist.vo.VideoVO" parameterType="String">
		SELECT no, poster, title, category, price FROM 
		(SELECT * FROM video 
		WHERE category LIKE '%'||#{category}||'%'
		ORDER BY dbms_random.value)
		WHERE rownum <= 5
		</select>
	 * 
	 */
	public List<VideoVO> videoSameCategoryData(String category)
	{
		return getSqlSession().selectList("videoSameCategoryData", category);
	}
	public List<VideoVO> videoFindData(Map map)
	{
		List<VideoVO> list=null;
		try
		{
			list=getSqlSession().selectList("videoFindData",map);
		}catch(Exception ex){ex.printStackTrace();}
		return list;
	}
	public int videoFindTotalPage(Map map)
	{
		return getSqlSession().selectOne("videoFindTotalPage", map);
	}
	
	// 찜목록
		public List<VideoJjimVO> VideoJjimListData(String id)
		{
			return getSqlSession().selectList("VideoJjimListData", id);
		}
		// 찜개수
		public int VideoJjimCount(String id)
		{
			return getSqlSession().selectOne("VideoJjimCount", id);
		}
		public void VideoJjimInsert(VideoJjimVO vo)
		{
			getSqlSession().selectOne("VideoJjimInsert",vo);
		}
		public int VideoJjimCheck(int cno)
		{
			return getSqlSession().selectOne("VideoJjimCheck", cno);
		}
}





















