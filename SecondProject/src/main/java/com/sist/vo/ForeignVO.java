package com.sist.vo;
/*
 * 	NO           NOT NULL NUMBER         
	CNO          NOT NULL NUMBER         
	CATEGORY              VARCHAR2(200)  
	TITLE        NOT NULL VARCHAR2(400)  
	SUBTITLE              VARCHAR2(400)  
	POSTER                VARCHAR2(1000) 
	AUTHOR                VARCHAR2(400)  
	PUDATE                VARCHAR2(200)  
	PUBLISHER             VARCHAR2(200)  
	PRICE                 VARCHAR2(200)  
	BOOKCHAR              VARCHAR2(200)  
	BOOKPAGE              VARCHAR2(200)  
	BOOK_INFO             CLOB           
	CONTENT_LIST          CLOB           
	SCORE                 VARCHAR2(200)  
	STOCK                 NUMBER
 * 
 */
public class ForeignVO {
	private int no,cno;
	private String category,title,poster,author,pudate,publisher,
	price,bookpage,score,link,subtitle;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getPudate() {
		return pudate;
	}
	public void setPudate(String pudate) {
		this.pudate = pudate;
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
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	
	
	
}
