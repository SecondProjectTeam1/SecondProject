package com.sist.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
import java.util.*;

import javax.servlet.http.HttpSession;
@Controller
public class BoardController {
   @Autowired
   private BoardService service;
   
   @GetMapping("board/board.do")
   public String board_list(String page,String type,Model model) {
	   if(type==null) type="all";
	   if(page==null) page="1";
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   int rowSize=10;
	   int start=(rowSize*curpage)-(rowSize-1);
	   int end=rowSize*curpage;
	   map.put("start", start);
	   map.put("end", end);
	   List<BoardVO> list=service.boardListData(map);
	   if(type.equals("f")){
		   list=service.boardFreeListData(map);
	   }else if(type.equals("q")){
		   list=service.boardQAListData(map);
	   }
	   
	   int totalPage=service.boardTotalPage();
	   
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
   @GetMapping("board/insert.do")
   public String board_insert() {
	   return "board/insert";
   }
   @PostMapping("board/insert_ok.do")
   public String board_insert_ok(BoardVO vo) {
	   service.boardInsert(vo);
	   return "redirect:list.do";
   }
   @GetMapping("board/detail.do")
   public String board_detail(int no,Model model) {
	   BoardVO vo=service.boardDetailData(no);
	   //List<ReplyVO> rList=service.replyListData(no);
	   model.addAttribute("vo", vo);
	   //model.addAttribute("rList", rList);
	   return "board/boarddetail";
   }
   @PostMapping("board/find.do")
   public String board_find(String fs,String ss,Model model) {
	   FindVO vo=new FindVO();
	   vo.setFs(fs);
	   vo.setSs(ss);
	   Map map=new HashMap();
	   map.put("fs",fs);
	   map.put("ss", ss);
	   map.put("fsArr", vo.getFsArr());
	   List<BoardVO> list=service.boardFindData(map);
	   int count=service.boardFindDataCount(map);
	   model.addAttribute("list", list);
	   model.addAttribute("count", count);
	   return "board/find";
   }
   
   @GetMapping("board/update.do")
   public String board_update(int no,int page,Model model) {
	   BoardVO vo=service.boardUpdateData(no);
	   model.addAttribute("vo", vo);
	   model.addAttribute("page", page);
	   return "board/update";
   }
   @PostMapping("board/update_ok.do")
   public String board_update_ok(BoardVO vo,int page,Model model) {
	   service.boardUpdate(vo);
	   
	   model.addAttribute("no", vo.getNo());
	   model.addAttribute("page", page);
	   return "board/update_ok";
   }
   
   @GetMapping("board/delete.do")
   public String board_delete(int no,int page,Model model) {
	   model.addAttribute("no", no);
	   model.addAttribute("page", page);
	   return "board/delete";
   }
   
   @PostMapping("board/delete_ok.do")
   public String board_delete_ok(int no,int page,Model model) {
	   // κ²°κ³Όκ°? ?½κΈ? 
	   service.boardDelete(no);
	   
	   model.addAttribute("page", page); // list.jsp => no(X) , page(O)
	   return "board/delete_ok";
   }
   
   @PostMapping("board/reply_insert.do")
   public String board_reply_insert(int bno,String msg,int page,RedirectAttributes ra,HttpSession session) {
	   ReplyVO vo=new ReplyVO();
	   vo.setBno(bno);
	   vo.setMsg(msg);
	   String name=(String)session.getAttribute("name");
	   String id=(String)session.getAttribute("id");
	   vo.setName(name);
	   vo.setId(id);
	   
	   // ReplyDAOλ‘? ? ?‘ 
	   service.replyInsert(vo);
	   // .do?bno=10&page=1
	   ra.addAttribute("bno", bno);
	   ra.addAttribute("page", page);
	   return "redirect:reply_list.do";
   }
   
   @PostMapping("board/reply_update.do")
   public String board_reply_update(int no,int bno,int page,String msg,RedirectAttributes ra) {
	   // ??  => DAO
	   ReplyVO vo=new ReplyVO();
	   vo.setNo(no);
	   vo.setMsg(msg);
	   service.replyUpdate(vo);
	   // ??  ?? ?°?΄?°λ₯? λ³΄λ΄μ€??€ 
	   ra.addAttribute("bno",bno);
	   ra.addAttribute("page",page);
	   return "redirect:reply_list.do";
   }
   
   @PostMapping("board/reply_to_reply_insert.do")
   public String board_reply_to_reply(int pno,int bno,String msg,int page,RedirectAttributes ra,HttpSession session) {
	   // ?κΈ? μΆκ? ?? ==> DAO
	   ReplyVO vo=new ReplyVO();
	   String name=(String)session.getAttribute("name");
	   String id=(String)session.getAttribute("id");
	   vo.setName(name);
	   vo.setId(id);
	   vo.setBno(bno);
	   vo.setMsg(msg);
	   service.replyToReplyInsert(pno, vo);
	   ra.addAttribute("bno", vo.getBno());
	   ra.addAttribute("page", page);
	   return "redirect:reply_list.do";
   }
   
   @GetMapping("board/reply_delete.do")
   public String board_reply_delete(int no,int bno,int page,RedirectAttributes ra) {
	   // ?­?  μ²λ¦¬ ==> DAO(service)
	   service.replyDelete(no);
	   ra.addAttribute("bno", bno);
	   ra.addAttribute("page", page);
	   return "redirect:reply_list.do";
   }
   
   @GetMapping("board/reply_list.do")
   // board/reply_list.do?bno=1&page=2
   public String board_reply_list(int bno,int page,Model model) {
	   List<ReplyVO> rList=service.replyListData(bno);
	   model.addAttribute("page", page);
	   model.addAttribute("rList", rList);
	   model.addAttribute("no", bno);
	   return "board/reply_list";
   }
   
  
}














