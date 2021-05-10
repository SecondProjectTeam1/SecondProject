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
	
	@PostMapping("video/video_find.do")
	public String junggo_find(VideoFindVO vo)
	{
		Map map=new HashMap();
		map.put("userFind", vo.getUserFind());
		map.put("FuArr", vo.getFuArr());
		
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
		return arr.toJSONString();
	}
}
