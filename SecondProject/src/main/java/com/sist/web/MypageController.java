package com.sist.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;

import java.util.*;

@Controller
public class MypageController {
	
	@Autowired
	private JjimService service;
	
	@GetMapping("mypage/mypage.do")
	public String mypage_mypage(Model model,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		
		// 국내도서 찜목록
		Map map=new HashMap();
		
		List<BookJjimVO> jList=service.BookJjimListData(id);
		List<BookVO> List=new ArrayList<BookVO>();
		for(BookJjimVO vo:jList)
		{
			BookVO bvo=service.bookDetailData(vo.getCno());
			List.add(bvo);
		}
		int BookJcount=service.BookJjimCount(id);
		
		// 해외도서 찜목록
		List<BookfJjimVO> fjList=service.BookfJjimListData(id);
		List<BookfVO> fList=new ArrayList<BookfVO>();
		for(BookfJjimVO fvo:fjList)
		{
			BookfVO bfvo=service.bookfDetailData(fvo.getCno());
			fList.add(bfvo);
		}
		int BookfJcount=service.BookfJjimCount(id);
		
		// 중고도서 찜목록
		List<BooksJjimVO> sjList=service.BooksJjimListData(id);
		List<BooksVO> sList=new ArrayList<BooksVO>();
		for(BooksJjimVO svo:sjList)
		{
			BooksVO bsvo=service.booksDetailData(svo.getCno());
			sList.add(bsvo);
		}
		int BooksJcount=service.BooksJjimCount(id);
		
		// 인터넷강의 찜목록
		List<VideoJjimVO> vjList=service.VideoJjimListData(id);
		List<VideoVO> vList=new ArrayList<VideoVO>();
		for(VideoJjimVO vvo:vjList)
		{
			VideoVO vvvo=service.videoDetailData(vvo.getCno());
			vList.add(vvvo);
		}
		int VideoJcount=service.VideoJjimCount(id);
				
		// 구매목록
		/*List<CartVO> cList=service.CartListData(id);
		int CartCount=service.CartCount(id);*/
		
		//model.addAttribute("cList", cList);
		//model.addAttribute("CartCount", CartCount);
		session.setAttribute("id", id);
		model.addAttribute("List", List);
		model.addAttribute("jList", jList);
		model.addAttribute("BookJcount", BookJcount);
		model.addAttribute("fList", fList);
		model.addAttribute("fjList", fjList);
		model.addAttribute("BookfJcount", BookfJcount);
		model.addAttribute("sjList", sjList);
		model.addAttribute("sList", sList);
		model.addAttribute("BooksJcount", BooksJcount);
		model.addAttribute("vjList", vjList);
		model.addAttribute("vList", vList);
		model.addAttribute("VideoJcount", VideoJcount);
		model.addAttribute("main_jsp", "../mypage/mypage.jsp");
		
		return "main/main";
	}
	
}
