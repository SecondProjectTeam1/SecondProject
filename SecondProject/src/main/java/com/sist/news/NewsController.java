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
	@RequestMapping("news/main.do")
	public String news_list(String fd,String word,String page,Model model) {
		if (page == null) page = "1";
		int curpage = Integer.parseInt(page);
		if(fd==null) fd="IT";
		List<Item> list=mgr.naverNeswData(fd);
		List<Item> res = new ArrayList<Item>();
		
		int count;
		if(word!=null){
			List<Item> temp = new ArrayList<Item>();
			for(Item i:list){
				if(i.getTitle().contains(word)) temp.add(i);
				else if(i.getAuthor().contains(word)) temp.add(i);
			}
			count = temp.size();
			int i=0;
			if(curpage!=1) i=8*(curpage-1);
			try{
				for(;i<8*curpage;i++){
					res.add(temp.get(i));
				}
			}catch (Exception e) {}
			
		}
		else{
			count = list.size();
			int i=0;
			if(curpage!=1) i=8*(curpage-1);
			try{
				for(;i<8*curpage;i++){
					res.add(list.get(i));
				}
			}catch (Exception e) {}
			
		}
		final int BLOCK = 5;
		int totalPage = (int) (Math.ceil(count / 8.0));
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalPage) endPage = totalPage;
		
		model.addAttribute("block", BLOCK);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalpage", totalPage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("list", res);
		model.addAttribute("fd", fd.toUpperCase());
		model.addAttribute("main_jsp", "../news/main.jsp");
		return "main/main";
	}
}












