package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.RecommendVO;

@Repository
public class RecommendDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	/*<select id="recommendData" resultType="RecommendVO" parameterType="hashmap">
		SELECT no,title,price,poster 
		FROM book 
		WHERE REGEXP_LIKE(title,#{title}) AND cno=12
	</select>
	
	<select id="recommendGetTitleData" resultType="string" >
		SELECT title FROM book WHERE title LIKE '%'||#{title}||'%' AND cno=12 ORDER BY no ASC
	</select>*/
	public List<RecommendVO> recommendData(Map map)
	{
		return getSqlSession().selectList("recommendData",map);
	}
	/*public int recommendTotalPage()
	{
		return getSqlSession().selectOne("recommendTotalPage");
	}*/

	public List<String> recommendGetTitleData()
	{
		return getSqlSession().selectList("recommendGetTitleData");
	}
	
	/*@Autowired
	private RecommendMapper mapper;
	
	public List<RecommendVO> recommendData(Map map)
	{
		System.out.println("recommendData");
		List<RecommendVO> vo=null;
		try{
		vo=mapper.recommendData(map);
		System.out.println("recommendData:"+vo.get(0).getTitle());
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<String> recommendGetTitleData()
	{
		return mapper.recommendGetTitleData();
	}*/
}
