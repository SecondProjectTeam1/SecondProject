package com.sist.aop;
import com.sist.dao.*;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
@Aspect
public class MemberAspect{

	@After("execution(* com.sist.dao.MemberDAO.*(..))")
	public void testLog()
	{
		System.out.println("로그성공");
	}
	
/*	@After("execution(* com.sist.dao.MemberDAO.*(..))")
	public String member_log(HttpSession session, Model model)
	{
		String id=(String)session.getAttribute("id");
		
		return "";
	}
*/}
