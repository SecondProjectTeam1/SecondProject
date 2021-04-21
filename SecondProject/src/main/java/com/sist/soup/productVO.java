package com.sist.soup;
import java.util.*;
/*
NO           NOT NULL NUMBER         
CNO          NOT NULL NUMBER         
TITLE        NOT NULL VARCHAR2(400)  
SUBTITLE              VARCHAR2(400)  
POSTER                VARCHAR2(1000) 
AUTHOR                VARCHAR2(400)  
PUDATE                VARCHAR2(200)  
PUBLISHER             VARCHAR2(200)  
PRICE                 VARCHAR2(200)  
BOOKPAGE              VARCHAR2(200)  
BOOK_INFO             CLOB           
CONTENT_LIST          CLOB           
DETAIL_IMAGE          VARCHAR2(1000) 
AUTHOR_INFO           CLOB           
SCORE                 VARCHAR2(200)  
STOCK                 NUMBER       
 */
public class productVO {
	private int no,cno,stock;
	private String title,subtitle,poster,author,pubdate,publisher,price,
		bookpage,bookinfo,contentlist,detailimg,authinfo,score,link;
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBookpage() {
		return bookpage;
	}
	public void setBookpage(String bookpage) {
		this.bookpage = bookpage;
	}
	public String getBookinfo() {
		return bookinfo;
	}
	public void setBookinfo(String bookinfo) {
		this.bookinfo = bookinfo;
	}
	public String getContentlist() {
		return contentlist;
	}
	public void setContentlist(String contentlist) {
		this.contentlist = contentlist;
	}
	public String getDetailimg() {
		return detailimg;
	}
	public void setDetailimg(String detailimg) {
		this.detailimg = detailimg;
	}
	public String getAuthinfo() {
		return authinfo;
	}
	public void setAuthinfo(String authinfo) {
		this.authinfo = authinfo;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	
}
