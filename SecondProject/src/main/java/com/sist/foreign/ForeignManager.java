package com.sist.foreign;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.foreign.ForeignVO;

public class ForeignManager {
	
	private ForeignDAO dao=new ForeignDAO();
	public void ForeignData()
	{
		try
		{
			for(int n=0;n<=9;n++)
			{
				for(int i=1;i<=8568;i++)
				{
				  String page="http://www.yes24.com/24/Category/Display/00200100800"+n+"?PageNumber="+i;
				  
				  Document doc=Jsoup.connect(page).get();
				  Elements link=doc.select("span.imgBdr a");
					  if(link.size()>0)
					  {
						  for(int j=0;j<link.size();j++)
						  {
							int o=1;
							try
							{
							  ForeignVO vo=new ForeignVO();
							  Document doc2=Jsoup.connect("http://www.yes24.com"+link.get(j).attr("href")).get();
							  
							  Elements category=doc2.select("ul.yesAlertLi a");
							  for(int k=0;k<category.size();k++)
			                  {
			                	 
			                     try
			                     {
			                    	
			                        String str=category.get(k).attr("href");
			                        //System.out.println(str);
			                        
				                        if(str.equals("/24/Category/Display/00200100800"+n))
				                        {
				                           System.out.println("카테고리번호:"+n);
				                           System.out.println("카테고리:"+category.get(k).text());
				                           vo.setCno(n);
				                           vo.setCategory(category.get(k).text());
				                        }
			                        
			                     } catch (Exception ex) {ex.printStackTrace();} 
			                  }
							  
							  Element title=doc2.selectFirst("h2.gd_name"); 
							  Elements subtitle=doc2.select("h3.gd_nameE"); 
							  Element poster=doc2.selectFirst("em.imgBdr img");
							  Elements author=doc2.select("span.gd_auth");
							  Elements pudate=doc2.select("span.gd_date");
							  Elements publisher=doc2.select("span.gd_pub");
							  Element price=doc2.selectFirst("span.nor_price");
							  //Element bookpage=doc2.selectFirst("span.nor_price");
							  //Element book_info=doc2.selectFirst("div.infoWrap_txtInner");
							  Elements score=doc2.select("em.yes_b");
							  
							  Elements info1=doc2.select("tbody.b_size th.txt");
			                  Elements info2=doc2.select("tbody.b_size td.lastCol");
			                  for(int m=0; m<info1.size(); m++)
			                  {
			                     try
			                     {
			                        String str=info1.get(m).text();
			                        if(str.equals("쪽수, 무게, 크기"))
			                        {
			                           System.out.println("쪽수, 무게, 크기:"+info2.get(m).text());
			                           vo.setBookpage(info2.get(m).text());
			                        }
			                     } catch (Exception ex) {}
			                  }
							 
							  	 System.out.println("번호:"+o);
								 //System.out.println("카테고리번호:"+cno.get(l).text()); 
								 System.out.println("제목:"+title.text());
								 System.out.println("부제목:"+subtitle.text());
								 System.out.println("이미지:"+poster.attr("src"));
								 System.out.println("저자:"+author.text());
								 System.out.println("출간일:"+pudate.text());
								 System.out.println("출판사:"+publisher.text());
								 System.out.println("가격:"+price.text());
								 System.out.println("평점:"+score.text());
								 System.out.println("링크:"+link.attr("href"));
								
									 
								  
			                 
			                  vo.setTitle(title.text());
							  vo.setSubtitle(subtitle.text());
							  vo.setPoster(poster.attr("src")); 
							  vo.setAuthor(author.text());
							  vo.setPudate(pudate.text());
							  vo.setPublisher(publisher.text()); 
							  vo.setPrice(price.text());
							  
							  //vo.setBook_info(book_info.text());  
							  
							  vo.setLink(link.attr("href"));
							 
				              dao.ForeignInsert(vo); 
				              o++;
				
							}catch(Exception ex)
						{
						ex.printStackTrace();
						}
				  	}
				  }else break;
				}
			}
		}catch(Exception ex) 
		{
			System.out.println(ex.getMessage());
		}
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ForeignManager hm=new ForeignManager();
		hm.ForeignData();
	}

}