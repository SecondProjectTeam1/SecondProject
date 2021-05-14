package com.sist.web;

import org.json.simple.JSONArray; 
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.dao.MemberDAO;

@RestController
public class MemberRestController {

	@Autowired
	private MemberDAO mDao;
	
	@GetMapping("member/idcheck.do")
	public String idcheck(String id)
	{
		String json="";
		
		try{
			int idcount=mDao.idCheck(id);
			JSONObject obj=new JSONObject();
			obj.put("idcount", idcount);
			
			json=obj.toString();
		}catch(Exception ex){}
		
		return json;
	}
	
	@GetMapping("member/zipcode.do")
	public String zipcode_result(String dong)
	{
		String json="";
		try
		{
			List<ZipcodeVO> list=mDao.signUpAddress(dong);
			JSONArray arr=new JSONArray();
					
			for(ZipcodeVO vo : list)
			{
				JSONObject obj = new JSONObject();
				obj.put("zipno", vo.getZipcode());
				obj.put("sido", vo.getSido());
				obj.put("gugun", vo.getGugun());
				obj.put("dong", vo.getDong());
				obj.put("bunji", vo.getBunji());
				
				arr.add(obj);
			}
			json=arr.toString();
		}catch(Exception ex){}
		System.out.println(json);
		return json;
	}
	
	@GetMapping(value="member/member_find.do",produces="text/plain;charset=UTF-8")
	public String admin_member(String ss,String[] stype)
	{
//		System.out.println("data:"+data);
//		System.out.println("ss:"+ss);
		//System.out.println("stype ::::"+stype);
		//System.out.println("ss::::"+ss);
		Map map=new HashMap();
		map.put("memberArr", stype);
		map.put("keyword", ss);
		List<MemberVO> list=mDao.memberSearch(map);
		JSONArray arr=new JSONArray();
		for(MemberVO vo: list)
		{
			JSONObject obj=new JSONObject();
			//SELECT id,name,sex,email,addr1,addr2,tel 
			obj.put("id", vo.getId());
			obj.put("name", vo.getName());
			obj.put("sex", vo.getSex());
			obj.put("email", vo.getEmail());
			obj.put("address", vo.getAddr1()+" "+vo.getAddr2());
			obj.put("tel", vo.getTel());
			
		
			
			arr.add(obj);	
		}
		String json=arr.toJSONString();
		return json;		
	}
	
	@GetMapping(value="member/admin_mem.do",produces="text/plain;charset=UTF-8")
	public String memberCheckData(String id)
	{
		System.out.println(" admin mem  "+id);
		String strCate="";
		String json="";
		String category="video";
		Map map = new HashMap();
		map.put("id", id);
		map.put("category", category);
		
		List<MemberVO> mList=mDao.userCheckedData(map);
		JSONArray marr= new JSONArray();
		/*for(MemberVO vo:mList)
		{
			else if(0<vo.getCno() || vo.getCno()<13)
			{
				else if(vo.getCno()==1)
				{
					strCate = "웹개발";
				}
				else else if(vo.getCno()==2)
				{
					strCate="모바일 웹개발";
				}
				
				
				
			}
			JSONObject obj=new JSONObject();
			
		}*/
		for(int i=0;i<mList.size();i++)
		{
			JSONObject obj= new JSONObject();
			MemberVO vo=mList.get(i);
			if(vo.getCno()==1)
			{
				obj.put("웹개발", vo.getCounted());
			}
			else if(vo.getCno()==2)
			{
				obj.put("모바일 앱 개발", vo.getCounted());
			}
			else if(vo.getCno()==3)
			{
				obj.put("게임 개발", vo.getCounted());
			}
			else if(vo.getCno()==4)
			{
				obj.put("프로그래밍 언어", vo.getCounted());
			}
			else if(vo.getCno()==5)
			{
				obj.put("알고리즘", vo.getCounted());
			}
			else if(vo.getCno()==6)
			{
				obj.put("프레임워크 및 라이브러리", vo.getCounted());
			}
			else if(vo.getCno()==7)
			{
				obj.put("데이터사이언스", vo.getCounted());
			}
			else if(vo.getCno()==8)
			{
				obj.put("데이터베이스", vo.getCounted());
			}
			else if(vo.getCno()==9)
			{
				obj.put("서버개발", vo.getCounted());
			}
			else if(vo.getCno()==10)
			{
				obj.put("블록체인 개발", vo.getCounted());
			}
			else if(vo.getCno()==11)
			{
				obj.put("개발 도구", vo.getCounted());
			}
			else if(vo.getCno()==12)
			{
				obj.put("교양 기타", vo.getCounted());
			}
			marr.add(obj);
		}
		json = marr.toJSONString();
		System.out.println(json);
		return json;
		
		
	}
	
	@GetMapping(value="main/mainrecom.do",produces="text/plain;charset=UTF-8")
	public String recom_tomain(HttpSession session)
	{
		String json="";
		String category="video";
		
		
			String id= (String)session.getAttribute("id");
			System.out.println("session CHECK" +id);
			int likecno= mDao.usersLike(id);
			JSONArray arr=new JSONArray();
			List<VideoVO> list=mDao.mainedVideoData(likecno);
			for(VideoVO vo: list)
			{
				JSONObject obj = new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("cno", vo.getCno());
				obj.put("title", vo.getTitle());
				obj.put("poster", vo.getPoster());
				obj.put("teacher", vo.getTeacher());
				
				arr.add(obj);
			
			}
			json= arr.toString();
		
		//
		System.out.println(id);
		System.out.println(likecno);
		System.out.println(json);
		
		return json;
	}
	
	@GetMapping(value="member/delete.do",produces="text/plain;charset=UTF-8")
	public String memberDelete(String id)
	{
	
		System.out.println(id);
		mDao.memberDelete(id);
//		return "redirect: ../member/admin.do";
		return "main/main";
	}
	
	
	











}