package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.MemberDAO;


@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDao;
	
	@GetMapping("main/login.do")
	public String member_login(Model model)
	{
		model.addAttribute("main_jsp","../main/login.jsp");
		return "main/main";
	}
	
	@PostMapping("main/login_ok.do")
	public String member_login_ok(String id, String pwd, HttpSession session, Model model)
	{
		String result=mDao.isLogin(id, pwd);
		if(!(result.equals("NOID")||result.equals("NOPWD")))
		{
			session.setAttribute("id", id);
			session.setAttribute("name", result);
			
			
		}
		model.addAttribute("main_jsp","../main/login_ok.jsp");
		model.addAttribute("result", result);
		return "main/main";
	}
	
	@RequestMapping("member/logout.do")
	public String logout(Model model,HttpSession session)
	{
		session.invalidate();
		return "redirect:../main/main";
	}
	
	@GetMapping("member/join")
	public String member_join(Model model)
	{
		
		model.addAttribute("main_jsp","../member/join.jsp");
		return "main/main";
	}
}
