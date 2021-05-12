package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
import com.sist.vo.BoardVO;
import com.sist.vo.BoardFindVO;
import com.sist.vo.ReplyVO;

import java.util.*;
import javax.servlet.http.HttpSession;

@Controller
public class BoardController {
   @Autowired
   private BoardService service;
   
   @GetMapping("board/board.do")
   public String board_list(String page,String type,Model model) {
	   if(type==null) type="f";
	   if(page==null) page="1";
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   int rowSize=6;
	   int start=(rowSize*curpage)-(rowSize-1);
	   int end=rowSize*curpage;
	   map.put("start", start);
	   map.put("end", end);
	   map.put("type",type);
	   
	   List<BoardVO> list=service.boardListData(map);
	   int totalPage=service.boardTotalPage(map);
	   final int BLOCK = 5;
	   int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
	   int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
	   if (endPage > totalPage) endPage = totalPage;
       
	   model.addAttribute("block", BLOCK);
	   model.addAttribute("startPage", startPage);
	   model.addAttribute("endPage", endPage);
	   model.addAttribute("totalpage", totalPage);
	   model.addAttribute("curpage", curpage);
	   model.addAttribute("list", list);
	   model.addAttribute("type", type);
	   
	   return "board/board";
   }
   @GetMapping("board/rightNav.do")
   public String board_nav(String type,Model model) {
	   if(type==null) type="f";
	   // top viewed post
	   int isFree=0;
	   if(type.equals("f")) isFree=1;
	   List<BoardVO> list=service.boardTopListData(isFree);
	   
	   model.addAttribute("type", type);
	   model.addAttribute("list", list);
	   return "board/rightNav";
   }
   
   @GetMapping("board/insert.do")
   public String board_insert(String type,Model model) {
	   if(type==null) type="f";
	   model.addAttribute("type", type);
	   return "board/boardinsert";
   }
   @PostMapping("board/insert_ok.do")
   public String board_insert_ok(BoardVO vo) {
	   service.boardInsert(vo);
	   return "redirect:board.do";
   }
   @GetMapping("board/detail.do")
   public String board_detail(int no,String type,HttpSession session,Model model) {
	   BoardVO vo=service.boardDetailData(no);
	   
	   model.addAttribute("type", type);
	   model.addAttribute("vo", vo);
	   return "board/boarddetail";
   }
   
   @GetMapping("board/update.do")
   public String board_update(int no,Model model) {
	   BoardVO vo=service.boardUpdateData(no);
	   model.addAttribute("vo", vo);
	   return "board/boardupdate";
   }
   @PostMapping("board/update_ok.do")
   public String board_update_ok(BoardVO vo,RedirectAttributes ra,Model model) {
	   service.boardUpdate(vo);
	   ra.addAttribute("no", vo.getNo());
	   return "redirect:detail.do";
   }
   
   @GetMapping("board/delete.do")
   public String board_delete(int no,Model model) {
	   service.boardDelete(no);
	   model.addAttribute("no", no);
	   return "redirect:board.do";
   }
   
   @PostMapping("board/reply_insert.do")
   public String board_reply_insert(int bno,String msg,RedirectAttributes ra,HttpSession session) {
	   ReplyVO vo=new ReplyVO();
	   vo.setBno(bno);
	   vo.setMsg(msg);
	   String id=(String)session.getAttribute("id");
	   vo.setId(id);
	   
	   service.replyInsert(vo);
	   ra.addAttribute("bno", bno);
	   return "redirect:reply_list.do";
   }
   
   @PostMapping("board/reply_update.do")
   public String board_reply_update(int no,int bno,String msg,RedirectAttributes ra) {
	   ReplyVO vo=new ReplyVO();
	   vo.setNo(no);
	   vo.setMsg(msg);
	   service.replyUpdate(vo);
	   ra.addAttribute("bno",bno);
	   return "redirect:reply_list.do";
   }
   
   @PostMapping("board/reReplyinsert.do")
   public String board_reply_to_reply(int root,int bno,String msg,RedirectAttributes ra,HttpSession session) {
	   ReplyVO vo=new ReplyVO();
	   String id=(String)session.getAttribute("id");
	   vo.setId(id);
	   vo.setBno(bno);
	   vo.setMsg(msg);
	   vo.setRoot(root);
	   service.replyInsert(vo);
	   ra.addAttribute("bno", vo.getBno());
	   return "redirect:reply_list.do";
   }
   
   @GetMapping("board/reply_delete.do")
   public String board_reply_delete(int no,int bno,RedirectAttributes ra) {
	   service.replyDelete(no);
	   ra.addAttribute("bno", bno);
	   return "redirect:reply_list.do";
   }
   
   @GetMapping("board/reply_list.do")
   public String board_reply_list(int bno,Model model) {
	   List<ReplyVO> rList=service.replyListData(bno);
	   List<ReplyVO> aList=service.replyReListData(bno);
	   model.addAttribute("rList", rList);
	   model.addAttribute("aList", aList);
	   model.addAttribute("no", bno);
	   return "board/boardreply";
   }
}














