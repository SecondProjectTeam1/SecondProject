package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.news.Item;
import com.sist.news.NewsManager;

@Controller
public class MainController {
	@Autowired
	private NewsManager mgr;
	
	@RequestMapping("main/main.do")
	public String main_main(String fd,Model model)
	{
		if(fd==null)
			fd="it구직";
		List<Item> list=mgr.naverNeswData(fd);
		
		
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../main/home.jsp");
		return "main/main";
	}
}
