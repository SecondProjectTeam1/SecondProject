package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.BookDAO;
import com.sist.vo.BookReplyVO;
import com.sist.vo.BookVO;
import com.sist.vo.BookfVO;

@Controller
public class BookController {
	
	@Autowired
	private BookDAO dao;
	
	@GetMapping("book/list.do")
	public String book_list(String page, String cno, Model model){
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
		
		List<BookVO> list = dao.bookListData(map);
		List<String> cList = dao.bookCategoryListData();
		
		int totalpage = dao.bookTotalPage(curcno);
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
		model.addAttribute("main_jsp", "../book/list.jsp");
		return "main/main";
	}
	
	@GetMapping("book/detail.do")
	public String book_detail(String page, String no, Model model) {
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
		
		int totalpage = dao.bookReplyTotalPage(fno);
		int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		int allPage = totalpage;
		if (endPage > allPage)
			endPage = allPage;
		
		
		BookVO vo = dao.bookDetailData(fno);
		List<BookReplyVO> rlist = dao.bookReplyData(map);
		List<BookReplyVO> slist = dao.bookReplyScoreData(fno);
		double avg;
		if(rlist != null) {
			avg = dao.bookReplyAverageData(fno);
		} else {
			avg = 0;
		}
		
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
		model.addAttribute("main_jsp", "../book/detail.jsp");
		return "main/main";
	}
	
	@RequestMapping(value = "book/bookReplyInsert.do", method = RequestMethod.POST)
	public String book_replyInsert(String no, String name, String content, String score, RedirectAttributes ra){
		BookReplyVO vo = new BookReplyVO();
		vo.setNo(Integer.parseInt(no));
		vo.setName(name);
		vo.setContent(content);
		vo.setScore(Integer.parseInt(score));
		vo.setPoster("https://s3.ap-northeast-2.amazonaws.com/elasticbeanstalk-ap-northeast-2-176213403491/media/magazine_img/magazine_327/7ae22985-90e8-44c3-a1d6-ee470ddc9073.jpg");
		dao.bookReplyInsert(vo);
		ra.addAttribute("no", no);
		return "redirect:/book/detail.do";
	}
}
