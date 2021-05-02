package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.BookDAO;
import com.sist.dao.BookfDAO;
import com.sist.vo.BookVO;
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
}
