package com.sist.web;

import java.util.List;
import java.util.*;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;


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
		return "redirect:main.do";
	}
	
	@RequestMapping("member/logout.do")
	public String logout(Model model,HttpSession session)
	{
		session.invalidate();
		
		return "redirect: ../main/main.do";
	}
	
	@GetMapping("member/join.do")
	public String member_join(Model model)
	{
		
		model.addAttribute("main_jsp","../member/join.jsp");
		return "main/main";
	}
	@PostMapping("member/join_ok.do")
	public String join_ok(@ModelAttribute @Valid MemberVO vo,Errors errors)
	{
		if(errors.hasErrors())
			return "member/join.do";
		mDao.memberJoin(vo);
		
		return "redirect: ../main/main.do";
	}
//	@GetMapping("member/idcheck2.do")
//	public String id_check(String id, Model model)
//	{
//		int idCount=mDao.idCheck(id);
//		model.addAttribute("idCount",idCount);
//		return "/member/idcheck";
//	}
	
//	@GetMapping("member/post_result.do")
//	public String post_result(Model model)
//	{
//		String dong="";
//		List<ZipcodeVO> list=mDao.signUpAddress(dong);
//		
//		model.addAttribute("list",list);
//		model.addAttribute("main_jsp","../member/postfind.jsp");
//		return "main/main";
//				
//	}
	@GetMapping("member/admin.do")
	public String admin_main(Model model)
	{
		
		model.addAttribute("main_jsp","../member/admin.jsp");
		return "main/main";
	}
	
	@PostMapping("member/member_find.do")
	public String admin_member(Model model,String ss,String data)
	{
		System.out.println("data:"+data);
		System.out.println("ss:"+ss);
		
		Map map=new HashMap();
		map.put("memberArr", data);
		
		map.put("keyword", ss);
		List<MemberVO> list=mDao.memberSearch(map);
		model.addAttribute("mList",list);
		return "redirect: ..member/admin.do";
	}
	
	@GetMapping("member/delete.do")
	public String memberDelete(Model model, String id)
	{
		
		mDao.memberDelete(id);
		return "redirect: ../member/admin.do";
	}
	
}
