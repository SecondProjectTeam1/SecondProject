package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class VideoController {
	@Autowired
	private VideoDAO dao;
	
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
	     
	    List<VideoVO> list=dao.viedoListData(map);
	    List<VideoCategoryVO> cList=dao.videoCategoryData();
	     
		
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
		VideoVO vo=dao.videoDetailData(vno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../video/video_detail.jsp");
		return "main/main";
	}
}
