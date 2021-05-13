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
	
	@GetMapping(value="junggo/junggo_find.do", produces="text/plain;charset=UTF-8")
	public String junggo_find(String userFind, String page, String type)
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
			
			List<BooksVO> fList=dao.booksFindData(map);
			JSONArray arr=new JSONArray();
			for(BooksVO fvo:fList)
			{
				JSONObject obj=new JSONObject();
				obj.put("no", fvo.getNo());
				obj.put("title", fvo.getTitle());
				obj.put("poster", fvo.getPoster());
				obj.put("price", fvo.getPrice());
				obj.put("author", fvo.getAuthor());
				obj.put("sale_price", fvo.getSale_price());
				arr.add(obj);
			}
			json=arr.toJSONString();
		}catch(Exception ex){ex.printStackTrace();}
		return json;
	}
	
	@GetMapping("junggo/junggo_find_total.do")
	public String junggo_find_total(String type, String userFind)
	{
		Map map = new HashMap();
		map.put("type", type);
		map.put("userFind", userFind);
		int totalpage=dao.booksFindTotalPage(map);
		return String.valueOf(totalpage);
	}
}
