package com.sist.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.dao.BoardDAO;
import com.sist.dao.ReplyDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.ReplyVO;

/*
 *    double d=10
 *    int i='A'
 *    
 *    class A
 *    
 *    class B extends A
 *    class C extends A
 *    
 *    B b=new B()
 *    @Autowired
 *    @Resource(name="b")
 *    A a=new B()
 *    
 *    C c=new C();
 *    @Resource(name="c")
 *    A a=new C();
 *    
 */
import java.util.*;
@Service
public class BoardService {
   // SqlSessionDaoSupport sdf
   @Resource(name="boardDAO")
   private BoardDAO bDao;
   @Resource(name="replyDAO")
   private ReplyDAO rDao;
   
   public List<BoardVO> boardListData(Map map) {
	   return bDao.boardListData(map);
   }
   public List<BoardVO> boardFreeListData(Map map) {
	   return bDao.boardFreeListData(map);
   }
   public List<BoardVO> boardQAListData(Map map) {
	   return bDao.boardQAListData(map);
   }
   public int boardTotalPage(Map map) {
	   return bDao.boardTotalPage(map);
   }
   public void boardInsert(BoardVO vo) {
	   bDao.boardInsert(vo);
   }
   public BoardVO boardDetailData(int no) {
	   return bDao.boardDetailData(no);
   }
   public List<BoardVO> boardFindData(Map map) {
	   return bDao.boardFindData(map);
   }
   public int boardFindDataCount(Map map) {
	   return bDao.boardFindDataCount(map);
   }
   public BoardVO boardUpdateData(int no)  {
	   return bDao.boardUpdateData(no);
   }
   public void boardUpdate(BoardVO vo) {
	   bDao.boardUpdate(vo);
   }
   public void boardDelete(int no) {
	   bDao.boardDelete(no);
   }
   //reply
   public List<ReplyVO> replyListData(int bno) {
	   return rDao.replyListData(bno);
   }
   public List<ReplyVO> replyReListData(int bno) {
	   return rDao.replyReListData(bno);
   }
   public void replyInsert(ReplyVO vo) {
	   rDao.replyInsert(vo);
   }
   public void replyUpdate(ReplyVO vo)  {
	   rDao.replyUpdate(vo);
   }
   public void replyDelete(int no) {
	   rDao.replyDelete(no);
   }
}























