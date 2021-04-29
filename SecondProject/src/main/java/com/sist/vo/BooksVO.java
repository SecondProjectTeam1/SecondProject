package com.sist.vo;
/*
 * 	NO         NOT NULL NUMBER         
	CNO                 NUMBER         
	CATEGORY            VARCHAR2(200)  
	TITLE               VARCHAR2(400)  
	SUBTITLE            VARCHAR2(400)  
	POSTER              VARCHAR2(1000) 
	AUTHOR              VARCHAR2(400)  
	PUDATE              VARCHAR2(200)  
	PUBLISHER           VARCHAR2(200)  
	PRICE               VARCHAR2(200)  
	SALE_PRICE          VARCHAR2(200)  
	STOCK               VARCHAR2(100)
 */
public class BooksVO {
	private int no;
	private int cno;
	private String category;
	private String title;
	private String subtitle;
	private String poster;
	private String author;
	private String pudate;
	private String publisher;
	private String price;
	private String sale_price;
	private String stock;
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
	public String getSale_price() {
		return sale_price;
	}
	public void setSale_price(String sale_price) {
		this.sale_price = sale_price;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	
	
}
