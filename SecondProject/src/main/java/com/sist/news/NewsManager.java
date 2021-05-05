package com.sist.news;

import org.springframework.stereotype.Component;
import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import java.net.*;
@Component
public class NewsManager {
   public List<Item> naverNeswData(String fd) {
	   List<Item> list=new ArrayList<Item>();
	   try {
		   String strUrl="http://newssearch.naver.com/search.naver?where=rss&query="
				         +URLEncoder.encode(fd, "UTF-8");
		   URL url=new URL(strUrl);
		   JAXBContext jb=JAXBContext.newInstance(Rss.class);
		   Unmarshaller un=jb.createUnmarshaller();
		   Rss rss=(Rss)un.unmarshal(url);
		   list=rss.getChannel().getItem();
		   System.out.println(list.size());
	   }catch(Exception ex){}
	   return list;
   }
}











