package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.VideoService;
import com.sist.vo.VideoFindVO;
import com.sist.vo.VideoVO;

import java.util.*;
import com.sist.dao.*;
@RestController
public class VideoRestController {
	@Autowired
	private VideoService service;
	
	@GetMapping(value="video/video_find.do", produces="text/plain;charset=UTF-8")
	public String video_find(String userFind, String page, String type)
	{
		String json="";
		try
		{
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=9;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=(rowSize*curpage);
			Map map=new HashMap();
			map.put("userFind", userFind);
			map.put("start", start);
			map.put("end", end);
			map.put("type", type);
			
			List<VideoVO> fList=service.videoFindData(map);
			JSONArray arr=new JSONArray();
			for(VideoVO fvo:fList)
			{
				JSONObject obj=new JSONObject();
				obj.put("no", fvo.getNo());
				obj.put("title", fvo.getTitle());
				obj.put("poster", fvo.getPoster());
				obj.put("price", fvo.getPrice());
				obj.put("teacher", fvo.getTeacher());
				arr.add(obj);
			}
			json=arr.toJSONString();
		}catch(Exception ex){ex.printStackTrace();}
		return json;
	}
	
	@GetMapping("video/video_find_total.do")
	public String video_find_total(String type, String userFind)
	{
		Map map = new HashMap();
		map.put("type", type);
		map.put("userFind", userFind);
		int totalpage=service.videoFindTotalPage(map);
		return String.valueOf(totalpage);
	}
}
