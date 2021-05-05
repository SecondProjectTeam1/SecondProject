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
    public void replyToReplyInsert(int root,ReplyVO vo) {
	   	 ReplyVO pvo=getSqlSession().selectOne("replyParentInfoData",root);
	   	 // parent => group_id , group_step , group_tab
	   	 getSqlSession().update("replyGroupStepIncrement",pvo);
	   	 vo.setGroup_id(pvo.getGroup_id());
	   	 vo.setGroup_step(pvo.getGroup_step()+1);
	   	 vo.setGroup_tab(pvo.getGroup_tab()+1);
	   	 vo.setRoot(root);
	   	 getSqlSession().insert("replyToReplyInsert",vo);
	   	 // depthÏ¶ùÍ?
	   	 getSqlSession().update("replyDepthIncrement",root);
    }
    
    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
    public void replyDelete(int no) {
    	ReplyVO vo=getSqlSession().selectOne("replyInfoData", no);
    	if(vo.getDepth()==0) {
    		getSqlSession().delete("replyDelete",no);
    	}
    	else {
    		getSqlSession().update("replyMsgUpdate",no);
    	}
    	getSqlSession().update("depthDecrement",vo.getRoot());
    }
}








