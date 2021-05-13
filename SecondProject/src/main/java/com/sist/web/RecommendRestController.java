package com.sist.web;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.RecommendDAO;
import com.sist.naver.NaverManager;
import com.sist.vo.RecommendVO;

@RestController
public class RecommendRestController {
	@Autowired
	private NaverManager mgr;
	
	@Autowired
	private RecommendDAO dao;
	
	/*@PostMapping(value="recommend/category_sub.do",produces="text/plain;charset=UTF-8")*/
	@PostMapping("recommend/category_sub.do")
	public String category_sub(int csno)
	{
		String json="";
		System.out.println("csno="+csno);
		if(csno==1)
		{
			String[] data={"정보처리기사","리눅스마스터","네트워크관리사","정보보안기사","데이터분석기사"};
			JSONArray arr=new JSONArray();
			for(String s:data)
			{
				JSONObject obj=new JSONObject();
				obj.put("subject", s);
				arr.add(obj);
			}
			json=arr.toJSONString();
		}
		System.out.println(json);
		
		return json;
	}
	
	/*@PostMapping(value="recommend/recommend_data.do",produces="text/plain;charset=UTF-8")*/
	@PostMapping("recommend/recommend_data.do")
	public String recommend_data(String fd)
	{
		System.out.println("접속");
		
		String json="";
		
		try
		{
			
			List<String> list=mgr.naverBlogData(fd); // 네이버에서 댓글 데이터 가져오는 곳
			
			String[] titledata={"정보처리기사","데이터분석","MCSE", "네트워크관리사", "CCNA","정보보안", 
					"CISA", "CISSP","LPIC","정보처리산업기사","리눅스"};
			
			List<String> tList=Arrays.asList(titledata); // 가져온데이터 제목만 가져와서 배열 'tList'에 넣음
			
			System.out.println("tList"+tList);
			
			int[] count=new int[tList.size()];  
			Pattern[] p=new Pattern[tList.size()]; 
			
			for(int i=0;i<p.length;i++)
			{
				p[i]=Pattern.compile(tList.get(i)); 
			}
			Matcher[] m=new Matcher[tList.size()];
			for(String desc:list)
			{
				for(int i=0;i<m.length;i++)
				{
					m[i]=p[i].matcher(desc);   // 댓글에서 일치하는 문자 갯수 
					while(m[i].find())
					{
						count[i]++;
					}
					
				}
				
			}
			System.out.println("length"+count.length); // 5
			
			
			List<RecommendVO> rList=new ArrayList<RecommendVO>();
			for(int i=0;i<count.length;i++)
			{
				System.out.println("count->"+count[i]);
				System.out.println("tList->"+tList.get(i));
				if(count[i]>0)  
				{
				
					
					Map map=new HashMap();
					map.put("title", tList.get(i));
					
					List<RecommendVO> temp=dao.recommendData(map);
					//System.out.println(vo.getTitle());
					for(RecommendVO rvo:temp)
					{
						System.out.println("rvo:"+rvo.getTitle());
						rList.add(rvo);
					}
					//rList.add(vo);
				}
			}
			
			/*if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			Map map=new HashMap();
			int rowSize=12;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			List<RecommendVO> plist=dao.recommendData(map);*/
			
			JSONArray arr=new JSONArray();
			for(RecommendVO vo:rList)
			{
				JSONObject obj=new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("title", vo.getTitle());
				obj.put("price", vo.getPrice());
				obj.put("poster", vo.getPoster());
				
				arr.add(obj);
			}
			
			json=arr.toJSONString();
			System.out.println(json);
			
		}catch(Exception ex){}
		return json;
	}
	
	/*@PostMapping("recommend/recommend_total.do")
	  public String movie_total()
	  {
		  int total=dao.recommendTotalPage();
		  return String.valueOf(total);
	  }*/
	
}
