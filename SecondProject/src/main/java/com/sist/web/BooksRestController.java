package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.BooksFindVO;
import com.sist.vo.BooksVO;
import com.sist.vo.VideoVO;
@RestController
public class BooksRestController {
	@Autowired
	private BooksDAO dao;
	
	@PostMapping("junggo/junggo_find.do")
	public String junggo_find(BooksFindVO vo)
	{
		Map map=new HashMap();
		map.put("userFind", vo.getUserFind());
		map.put("FuArr", vo.getFuArr());
		
		List<BooksVO> fList=dao.booksFindData(map);
		JSONArray arr=new JSONArray();
		for(BooksVO fvo:fList)
		{
			JSONObject obj=new JSONObject();
			obj.put("no", fvo.getNo());
			obj.put("title", fvo.getTitle());
			obj.put("category", fvo.getCategory());
			obj.put("poster", fvo.getPoster());
			obj.put("price", fvo.getPrice());
			obj.put("sale_price", fvo.getSale_price());
			arr.add(obj);
		}
		return arr.toJSONString();
	}
}
