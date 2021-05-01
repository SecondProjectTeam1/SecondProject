package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class VideoController {
	@Autowired
	private VideoService service;
	

	
	@GetMapping("video/video_list.do")
	public String video_list(String cno, String page, Model model)
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
	     
	    List<VideoVO> list=service.viedoListData(map);
	    List<VideoCategoryVO> cList=service.videoCategoryData();
	    int totalpage=service.videoTotalPage(curcno);
	
	    int BLOCK=10;
	    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	    
	    if(endPage>totalpage)
	    	endPage=totalpage;
	    
	    model.addAttribute("curcno", curcno);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("totalpage", totalpage);
	    model.addAttribute("endPage", endPage);	
	    model.addAttribute("cList", cList);
	    model.addAttribute("curpage", curpage);
	    model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../video/video_list.jsp");
		return "main/main";
	}
	
	@GetMapping("video/video_detail.do")
	public String video_detail(String no, Model model)
	{
		
		int vno=Integer.parseInt(no);
		VideoVO vo=service.videoDetailData(vno);
		List<VideoReviewVO> list=service.videoReviewListData(vno);
		
		model.addAttribute("list", list);
		model.addAttribute("vno", no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../video/video_detail.jsp");
		return "main/main";
	}
	
	@PostMapping("video/review_insert_ok.do")
	public String video_review_insert(String no, String name, String msg, String star, Model model, RedirectAttributes ra)
	{
		VideoReviewVO vo=new VideoReviewVO();
		vo.setVno(Integer.parseInt(no));
		vo.setMsg(msg);
		vo.setName(name);
		vo.setStar(Integer.parseInt(star));
		
		service.videoReviewInsert(vo);
		ra.addAttribute("no", Integer.parseInt(no));
		return "redirect:video_detail.do";
	}
}
