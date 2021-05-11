package com.sist.aop;
import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

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
*/
	@After("execution(* com.sist.web.MemberController.member_login_ok(..))")
	public void login_test_Log()
	{
		System.out.println("로그인됨");
	}
	@After("execution(* com.sist.web.MemberController.logout(..))")
	public void logout_test_Log()
	{
		System.out.println("로그아웃됨");
	}
	
	/*@Around("execution(* com.sist.web.MemberController.member_login_ok(..))")
	public void member_log(ProceedingJoinPoint pj)
	{
		
		
			HttpSession session = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
			
			String id=(String)session.getAttribute("id");
			if(id!=null)
			{
				System.out.println(id+"로 로그인됨");
			}
			else
			{
				System.out.println("세션아이디 실패");
			}
		
	}*/

}
