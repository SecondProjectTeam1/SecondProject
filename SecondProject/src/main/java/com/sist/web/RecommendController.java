package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecommendController {
	@GetMapping("recommend/list.do")
	public String recommend_list(Model model)
	{
		String[] category={"추천 받기"};
		model.addAttribute("category", category);
		
		model.addAttribute("main_jsp", "../recommend/list.jsp");
		return "main/main";
	}
}
