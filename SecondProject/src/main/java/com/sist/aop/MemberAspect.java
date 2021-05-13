package com.sist.aop;
import com.sist.dao.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.WebUtils;

import java.util.*;
@Component
@Aspect
public class MemberAspect{

	@Autowired
	private MemberDAO mDao;
	/*@After("execution(* com.sist.dao.MemberDAO.*(..))")
	public void testLog()
	{
		System.out.println("로그성공");
	}
	*/
	
	
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
	
	@After("execution(* com.sist.web.MemberController.member_login_ok(..))")
	public void session_test(JoinPoint jp)
	{
		HttpSession session=null;
		Object[] sess_data = jp.getArgs();
		session=(HttpSession)sess_data[2];
		String id=(String)sess_data[0];
		String pwd=(String)sess_data[1];
		/*System.out.println(id);
		System.out.println(pwd);
		System.out.println();*/
		
	}
	
	
	
	/*@Before("execution(* com.sist.web.VideoController.video_detail(..))")
	public void videro_check(JoinPoint jp)
	{
		HttpSession session=null;
		Object[] sess_data = jp.getArgs();
		
	}
	*/
	
	//public String video_detail(String no, Model model, String page, String cno,HttpSession session)
	@After("execution(* com.sist.web.VideoController.video_detail(..))")
	public void session_detail_test(JoinPoint jp)
	{
		HttpSession session=null;
		Object[] obj=jp.getArgs();
		session=(HttpSession)obj[4];
		String id=(String)session.getAttribute("id");
		String ccno=(String)obj[3];
		int cno=Integer.parseInt(ccno);
		
		Map map = new HashMap();
		String category="video";
		map.put("id", id);
		map.put("category", category);
		map.put("cno", cno);
		System.out.println(id);
		System.out.println(category);
		System.out.println(cno);
		mDao.MemberContentsCheck(map);
		
				
	}
	
 

	
	
	
	
	
}







