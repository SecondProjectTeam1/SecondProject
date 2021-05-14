package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.BookDAO;
import com.sist.dao.BookfDAO;
import com.sist.vo.BookReplyVO;
import com.sist.vo.BookVO;
import com.sist.vo.BookfJjimVO;
import com.sist.vo.BookfReplyVO;
import com.sist.vo.BookfVO;

@Controller
public class BookfController {
	@Autowired
	private BookfDAO dao;
	
	@GetMapping("bookf/list.do")
	public String bookf_list(String page, String cno, Model model){
		Map map = new HashMap();
		
		if (page == null)
			page = "1";
		if (cno == null)
			cno = "1";

		int curpage = Integer.parseInt(page);
		int curcno = Integer.parseInt(cno);
		
		int rowSize = 9;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = (rowSize * curpage);
		
		map.put("cno", curcno);
		map.put("start", start);
		map.put("end", end);
		
		List<BookfVO> list = dao.bookfListData(map);
		List<String> cList = dao.bookfCategoryListData();
		
		int totalpage = dao.bookfTotalPage(curcno);
		int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		int allPage = totalpage;
		if (endPage > allPage)
			endPage = allPage;
		
		model.addAttribute("curcno", curcno);
		model.addAttribute("cList", cList);
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("main_jsp", "../bookf/list.jsp");
		return "main/main";
	}
	@GetMapping("bookf/detail.do")
	public String bookf_detail(String page, String no, Model model,String id,HttpSession session) {
		Map map = new HashMap();
		if (page == null)
			page = "1";
		
		int fno = Integer.parseInt(no);
		int curpage = Integer.parseInt(page);
		int rowSize = 5;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = (rowSize * curpage);
		
		map.put("no", no);
		map.put("start", start);
		map.put("end", end);
		
		int totalpage = dao.bookfReplyTotalPage(fno);
		int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		int allPage = totalpage;
		if (endPage > allPage)
			endPage = allPage;
		
		BookfVO vo = dao.bookfDetailData(fno);
		List<BookfReplyVO> rlist = dao.bookfReplyData(map);
		List<BookfReplyVO> slist = dao.bookfReplyScoreData(fno);
		double avg;
		if(rlist != null) {
			avg = dao.bookfReplyAverageData(fno);
		} else {
			avg = 0;
		}
		id=(String)session.getAttribute("id");
	    int count=dao.BookfJjimCheck(Integer.parseInt(no));
	      
	    session.setAttribute("id", id);
	    model.addAttribute("count", count);

		model.addAttribute("fno", fno);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("vo", vo);
		model.addAttribute("avg", avg);
		model.addAttribute("rlist", rlist);
		model.addAttribute("slist", slist);
		model.addAttribute("main_jsp", "../bookf/detail.jsp");
		return "main/main";
	}
	
	@RequestMapping(value = "bookf/bookfReplyInsert.do", method = RequestMethod.POST)
	public String bookf_replyInsert(String no, String name, String content, String score, RedirectAttributes ra){
		BookfReplyVO vo = new BookfReplyVO();
		vo.setNo(Integer.parseInt(no));
		vo.setName(name);
		vo.setContent(content);
		vo.setScore(Integer.parseInt(score));
		vo.setPoster("https://s3.ap-northeast-2.amazonaws.com/elasticbeanstalk-ap-northeast-2-176213403491/media/magazine_img/magazine_327/7ae22985-90e8-44c3-a1d6-ee470ddc9073.jpg");
		dao.bookfReplyInsert(vo);
		ra.addAttribute("no", no);
		return "redirect:/bookf/detail.do";
	}
	
	@PostMapping("bookf/jjim.do")
	   public String bookf_jjim(String no,String cno,Model model,HttpSession session,RedirectAttributes ra)
	   {
		   BookfJjimVO vo=new BookfJjimVO();
		   String id=(String)session.getAttribute("id");
		   
		   vo.setId(id);
		   vo.setCno(Integer.parseInt(no));
		   
		   dao.BookfJjimInsert(vo);
		   ra.addAttribute("no", Integer.parseInt(no));
		   
		   return "redirect:/bookf/detail.do";
	   }
	
	@GetMapping("bookf/listSearch.do")
	public String list_search(String page, String sText, Model model){
		Map map = new HashMap();
		if (page == null)
			page = "1";
		
		int curpage = Integer.parseInt(page);
		
		int rowSize = 9;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = (rowSize * curpage);
		
		map.put("sText", sText);
		map.put("start", start);
		map.put("end", end);
		
		List<BookfVO> list = dao.bookfSearchList(map);
		List<String> cList = dao.bookfCategoryListData();
		
		int totalpage = dao.bookfSearchTotalPage(sText);
		int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		int allPage = totalpage;
		if (endPage > allPage)
			endPage = allPage;
		
		model.addAttribute("cList", cList);
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("main_jsp", "../bookf/list.jsp");
		
		return "main/main";
	}
}
