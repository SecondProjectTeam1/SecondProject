package com.sist.soup;

import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Manager {
	private productDAO dao=new productDAO();
	public void productData() {
		try {
			int k=1;
			int cno=1;
			for(int i=19;i<=31;i++) {
				for(int j=1;j<312;j++) {
					Document doc = Jsoup.connect("http://www.yes24.com/24/Category/Display/0010010030"+i+"?PageNumber="+j).get();
					Elements links = doc.select("li span.imgBdr a");
					if(links.size()>0) {
						for(int in=0;in<links.size();in++) {
							System.out.println("http://www.yes24.com"+links.get(in).attr("href"));
							Document target = Jsoup.connect("http://www.yes24.com"+links.get(in).attr("href")).get();
							
							String link = "http://www.yes24.com"+links.get(in).attr("href");
							Elements title = target.select("div.gd_titArea h2.gd_name");
							Elements subtitle = target.select("div.gd_titArea h3.gd_nameE");
							Elements poster = target.select("div.gd_imgArea img");
							Elements author = target.select("span.gd_pubArea span.gd_auth a");
							Elements pub = target.select("span.gd_pubArea span.gd_pub a");
							Elements price = target.select("span.nor_price em.yes_m");
							
							//발매일
							String pubdate="";
							String bookpage="";
							try {
								pubdate = target.select("table.tb_nor tbody td.lastCol").get(0).text();
								bookpage = target.select("table.tb_nor tbody td.lastCol").get(1).text();
							}catch (Exception e) {
							}

							//목차
							Elements content_list = target.select("div#infoset_toc div.infoWrap_txt");
							//책소개
							Elements book_info = target.select("div#infoset_introduce div.infoWrap_txtInner");
							
							//저자소개
							Elements auth_info = target.select("div#infoset_authorGrp ");
							//상세사진
							Elements detail_img = target.select("div#infoset_chYes img");
							//평점
							Elements score = target.select("span#spanGdRating em.yes_b");
							//재고
							int stock=(int)(Math.random()*100)+1;
				
							for(int a=0;a<title.size();a++) {
								productVO vo = new productVO();
								vo.setLink(link);
//								System.out.println("title: "+title.get(a).text());
								vo.setTitle(title.get(a).text());
								try {
//									System.out.println("subtitle: "+subtitle.get(a).text());
									vo.setSubtitle(subtitle.get(a).text());
								}catch (Exception e) {
									System.out.println("no sub");
								}
								try {
//									System.out.println("poster: "+poster.get(a).attr("src"));
									vo.setPoster(poster.get(a).attr("src"));
								}catch (Exception e) {
									System.out.println("no poster");
								}
								try {
//									System.out.println("author: "+author.get(a).text());
									vo.setAuthor(author.get(a).text());
								}catch (Exception e) {
									System.out.println("no author");
								}
								try {
//									System.out.println("pub: "+pub.get(a).text());
									vo.setPublisher(pub.get(a).text());
								}catch (Exception e) {
									System.out.println("no pub");
								}
								try {
//									System.out.println("price: "+price.get(a).text());
									vo.setPrice(price.get(a).text());
								}catch (Exception e) {
//									System.out.println("no price");
								}
								
								try {
//									System.out.println("cont list: "+content_list.get(a).text().replace("<br>","^").replace("<br/>","^"));
									vo.setContentlist(content_list.get(a).text().replace("<br>","^").replace("<br/>","^"));
								}catch (Exception e) {
									System.out.println("no list");
								}
								
								try {
//									System.out.println("book info: "+book_info.get(a).text().replace("<br>","^").replace("<br/>","^"));
									vo.setBookinfo(book_info.get(a).text().replace("<br>","^").replace("<br/>","^"));
								}catch (Exception e) {
									System.out.println("no info");
								}
								try {
//									System.out.println("pubdate: "+pubdate);
//									System.out.println("bookpage: "+bookpage.substring(0,bookpage.indexOf("|")));
									vo.setPubdate(pubdate);
									vo.setBookpage(bookpage.substring(0,bookpage.indexOf("|")));
								}catch (Exception e) {
									System.out.println("no pubdate/bookpage");
								}
								
								
								try {	
//									System.out.println("detail img: "+detail_img.get(a).attr("src"));
									vo.setDetailimg(detail_img.get(a).attr("src"));
								}catch (Exception e) {
								System.out.println("no detail img");
								}
								try {	
//									System.out.println("score: "+score.get(a).text());
									vo.setScore(score.get(a).text());
								}catch (Exception e) {
									System.out.println("no score");
								}
								vo.setStock(stock);
								vo.setCno(cno);
								k++;
								dao.productInsert(vo);
								System.out.println("===============================");
							}
						}
						
					}else break;
				}
				cno++;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		Manager m = new Manager();
		m.productData();
	}
}
