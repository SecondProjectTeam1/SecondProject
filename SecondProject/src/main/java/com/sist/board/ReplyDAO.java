package com.sist.board;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
@Repository
public class ReplyDAO extends SqlSessionDaoSupport{

	@Resource(name="ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<ReplyVO> replyListData(int bno) {
		return getSqlSession().selectList("replyListData", bno);
	}
	public void replyInsert(ReplyVO vo) {
		getSqlSession().insert("replyInsert",vo);
	}
	public void replyUpdate(ReplyVO vo) {
		getSqlSession().update("replyUpdate",vo);
	}

    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
    public void replyDelete(int no) {
    	getSqlSession().delete("replyDelete",no);
    }
}








