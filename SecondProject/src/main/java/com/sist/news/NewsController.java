package com.sist.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
import com.sist.news.*;
@Controller
public class NewsController {
	@Autowired
	private NewsManager mgr;
	
	@RequestMapping("news/news.do")
	public String news_list(String fd,Model model) {
		if(fd==null)
			fd="IT";
		List<Item> list=mgr.naverNeswData(fd);
		model.addAttribute("fd", fd.toUpperCase());
		model.addAttribute("list", list);
		return "news/news";
	}
}












