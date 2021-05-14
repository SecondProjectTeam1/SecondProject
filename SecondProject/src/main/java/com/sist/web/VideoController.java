package com.sist.web;
import java.net.Inet4Address;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String video_detail(String no, Model model, String page, String cno,HttpSession session,String id)
	{
		
		int vno=Integer.parseInt(no);
		
		VideoVO vo=service.videoDetailData(vno);
		List<VideoReviewVO> list=service.videoReviewListData(vno);
		List<VideoVO> sList=service.videoSameCategoryData(vo.getCategory());
		
		Double avg=service.starAvgData(vno);
		int revCount=service.revCountData(vno);
		List<VideoStarVO> tList=service.starCount(vno);
		
		id=(String)session.getAttribute("id");
	    int count=service.VideoJjimCheck(Integer.parseInt(no));
	      
	    session.setAttribute("id", id);
	    model.addAttribute("count", count);
		
		model.addAttribute("page", page);
		model.addAttribute("cno", cno);
		model.addAttribute("revCount", revCount);
		model.addAttribute("avg", avg);
		model.addAttribute("sList", sList);
		model.addAttribute("tList", tList);
		model.addAttribute("list", list);
		model.addAttribute("vno", no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../video/video_detail.jsp");
		return "main/main";
	}
	
	@PostMapping("video/review_insert_ok.do")
	public String video_review_insert(String no, String msg, String star, Model model, RedirectAttributes ra, HttpSession session)
	{
		VideoReviewVO vo=new VideoReviewVO();
		String name=(String)session.getAttribute("name");
		String id=(String)session.getAttribute("id");
		
		vo.setVno(Integer.parseInt(no));
		vo.setId(id);
		vo.setMsg(msg);
		vo.setName(name);
		vo.setStar(Integer.parseInt(star));
		
		service.videoReviewInsert(vo);
		ra.addAttribute("no", Integer.parseInt(no));
		return "redirect:video_detail.do";
	}
	@GetMapping("video/video_review_delete.do")
	public String video_review_delete(String no, String vno, Model model, RedirectAttributes ra, HttpSession session)
	{
		int rno=Integer.parseInt(no);
		service.videoReviewDelete(rno);
		
		ra.addAttribute("no", Integer.parseInt(vno));
		return "redirect:video_detail.do";
	}
	@RequestMapping("video/video_review_update.do")
	public String video_review_update(String no, String vno, String msg, Model model, RedirectAttributes ra, HttpSession session)
	{
		int rno=Integer.parseInt(no);
		VideoReviewVO vo=new VideoReviewVO();
		vo.setNo(rno);
		vo.setMsg(msg);
		service.videoReviewUpdate(vo);
		
		ra.addAttribute("no", Integer.parseInt(vno));
		return "redirect:video_detail.do";
	}
	
	@GetMapping("video/find.do")
	public String find_show(Model model)
	{
		List<VideoCategoryVO> cList=service.videoCategoryData();
		
		model.addAttribute("cList", cList);
		model.addAttribute("main_jsp", "../video/video_find.jsp");
		return "main/main";
	}
	
	@PostMapping("video/jjim.do")
	   public String _jjim(String no,String cno,Model model,HttpSession session,RedirectAttributes ra)
	   {
		   VideoJjimVO vo=new VideoJjimVO();
		   String id=(String)session.getAttribute("id");
		   System.out.println(session);
		   vo.setId(id);
		   vo.setCno(Integer.parseInt(no));
		   
		   service.VideoJjimInsert(vo);
		   session.setAttribute("id", id);
		   ra.addAttribute("no", Integer.parseInt(no));
		   
		   return "redirect:video_detail.do";
	   }
}
