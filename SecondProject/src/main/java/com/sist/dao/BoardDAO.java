package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.BoardVO;

import java.util.*;
@Repository
public class BoardDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
     public List<BoardVO> boardListData(Map map) {
    	 return getSqlSession().selectList("boardListData", map);
     }
     public List<BoardVO> boardTopListData(int isFree) {
    	 return getSqlSession().selectList("boardTopListData", isFree);
     }
     public int boardTotalPage(Map map) {
    	 return getSqlSession().selectOne("boardTotalPage",map);
     }
     public void boardInsert(BoardVO vo) {
    	 getSqlSession().insert("boardInsert", vo);
     }
     public BoardVO boardDetailData(int no) {
    	 getSqlSession().update("boardHitIncrement",no);
    	 return getSqlSession().selectOne("boardDetailData", no);
     }
     public BoardVO boardUpdateData(int no) {
    	 return getSqlSession().selectOne("boardDetailData", no);
     }
     /*
      *   <select id="boardFindData" resultType="BoardVO" parameterType="hashmap">
		   SELECT no,subject,name,redate as regdate,hit 
		   FROM spring_freeboard
		   <!-- 
		         fs=="name"
		         ë¬¸ìž?—´ :
		            ==
		            equals
		    -->
		   <if test='fs.equals("name")'>
		     WHERE name LIKE '%'||#{ss}||'%'
		   </if>
		   <if test='fs.equals("subject")'>
		     WHERE subject LIKE '%'||#{ss}||'%'
		   </if>
		   <if test='fs.equals("content")'>
		     WHERE content LIKE '%'||#{ss}||'%'
		   </if>
		  </select>
      */
     public List<BoardVO> boardFindData(Map map) {
    	 List<BoardVO> list=null;
    	 try {
    		list=getSqlSession().selectList("boardFindData",map);
    	 }catch(Exception ex) {
    		 ex.printStackTrace();
    	 }
    	 return list;
     }
     public int boardFindDataCount(Map map) {
    	 return getSqlSession().selectOne("boardFindDataCount",map);
     }
     /*
      *   <!-- ?ˆ˜? • -->
		  <select id="boardGetPassword" resultType="string" parameterType="int">
		   SELECT pwd FROM spring_freeboard
		   <trim prefix="WHERE">
		    no=#{no}
		   </trim>
		  </select>
		  <update id="boardUpdate" parameterType="BoardVO">
		   UPDATE spring_freeboard SET
		   name=#{name},subject=#{subject},content=#{content}
		   WHERE no=#{no}
		  </update>
		  <!-- ?‚­? œ : ?Š¸?žœ?ž­?…˜ ? ?š©-->
		  <delete id="boardDelete" parameterType="int">
		   DELETE FROM spring_freeboard
		   WHERE no=#{no}
		  </delete>
		  <delete id="boardReplyDelete" parameterType="int">
		    DELETE FROM spring_reply
		    WHERE no=#{no}
		  </delete>
      */
     public void boardUpdate(BoardVO vo) {
    	 getSqlSession().update("boardUpdate",vo);
     }
     
     @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
     public void boardDelete(int no) {
		 getSqlSession().delete("boardReplyDelete",no);
		 getSqlSession().delete("boardDelete",no);
     }
     
}











