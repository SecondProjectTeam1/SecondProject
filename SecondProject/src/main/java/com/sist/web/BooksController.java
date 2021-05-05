
package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class BooksController {
   
   @Autowired
   private BooksDAO dao;
   
   @Autowired
   private BooksReviewDAO rDao;
   
   @GetMapping("junggo/junggo_list.do")
   public String junggo_list(String page, String cno, Model model)
   {
      
      if(page==null)
         page="1";
      if(cno==null)
         cno="1";
      int curpage=Integer.parseInt(page);
      int curcno=Integer.parseInt(cno);
      Map map=new HashMap();
      int rowSize=9;
      int start=(rowSize*curpage)-(rowSize-1);
      int end=(rowSize*curpage);
      map.put("cno", curcno);
      map.put("start", start);
      map.put("end", end);
      
      List<BooksVO> list=dao.booksListData(map);
      
      
      int totalpage=dao.booksTotalPage(curcno);
      int BLOCK=10;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      int allPage=totalpage;
      if(endPage>allPage)
         endPage=allPage;
      
      List<BooksCategoryVO> cList=dao.booksCategory();
      
      
      model.addAttribute("curcno", curcno);
      model.addAttribute("cList", cList);
      model.addAttribute("list", list);
      model.addAttribute("curpage", curpage);
      model.addAttribute("allPage", allPage);
      model.addAttribute("startPage", startPage);
      model.addAttribute("endPage", endPage);
      model.addAttribute("test", "hello");
      model.addAttribute("BLOCK", BLOCK);
      
      model.addAttribute("main_jsp", "../junggo/junggo_list.jsp");
      
      return "main/main";
   }
   
   @GetMapping("junggo/junggo_detail.do")
   public String junggo_detail(String no, Model model)
   {
      int bno=Integer.parseInt(no);
      BooksVO vo=dao.booksDetailData(bno);
      
      List<BooksReviewVO> list=rDao.junggoReviewListData(bno);
      
      Double avg=rDao.booksStarAvgData(bno);
      int revCount=rDao.booksRevCountData(bno);
      
      model.addAttribute("revCount", revCount);
      model.addAttribute("avg", avg);
      model.addAttribute("list", list);
      model.addAttribute("vo", vo);
      model.addAttribute("no", bno);
      
      model.addAttribute("main_jsp", "../junggo/junggo_detail.jsp");
      return "main/main";
   }
   
   @PostMapping("junggo/review_insert_ok.do")
	public String junggo_review_insert(String no, String msg, String star, Model model, RedirectAttributes ra, HttpSession session)
	{
		BooksReviewVO vo=new BooksReviewVO();
		String name=(String)session.getAttribute("name");
		String id=(String)session.getAttribute("id");
		
		vo.setVno(Integer.parseInt(no));
		vo.setId(id);
		vo.setMsg(msg);
		vo.setName(name);
		vo.setStar(Integer.parseInt(star));
		
		rDao.junggoReviewInsert(vo);
		ra.addAttribute("no", Integer.parseInt(no));
		return "redirect:junggo_detail.do";
	}
	@GetMapping("junggo/junggo_review_delete.do")
	public String junggo_review_delete(String no, String vno, Model model, RedirectAttributes ra, HttpSession session)
	{
		int rno=Integer.parseInt(no);
		rDao.junggoReviewDelete(rno);
		
		ra.addAttribute("no", Integer.parseInt(vno));
		return "redirect:video_detail.do";
	}
	@RequestMapping("junggo/junggo_review_update.do")
	public String junggo_review_update(String no, String vno, String msg, Model model, RedirectAttributes ra, HttpSession session)
	{
		int rno=Integer.parseInt(no);
		BooksReviewVO vo=new BooksReviewVO();
		vo.setNo(rno);
		vo.setMsg(msg);
		rDao.junggoReviewUpdate(vo);
		
		ra.addAttribute("no", Integer.parseInt(vno));
		return "redirect:junggo_detail.do";
	}
   
   
   @RequestMapping("junggo/junggo_find.do")
   public String junggo_find(Model model, String userFind, String page, String cno)
   {
	  
	   List<BooksVO> fList=dao.booksFindListData(userFind);
	   System.out.println(cno);
	   System.out.println(page);
	   System.out.println(userFind);
	   
	   model.addAttribute("fList", fList);
	   model.addAttribute("main_jsp", "../junggo/junggo_find.jsp");
	   return "main/main";
   }
}