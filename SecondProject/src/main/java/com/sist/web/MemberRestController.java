package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
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
	
	
	
}
