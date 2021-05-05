package com.sist.vo;
/*
 *  CARTNO     NOT NULL NUMBER         
	ID         NOT NULL VARCHAR2(20)   
	DOMBOOKNO           NUMBER         
	FORBOOKNO           NUMBER         
	USEDBOOKNO          NUMBER         
	CLASSNO             NUMBER         
	QTY                 NUMBER         
	PRICE               VARCHAR2(200)  
	TITLE               VARCHAR2(400)  
	POSTER              VARCHAR2(1000) 
 */
public class CartVO {
	private int cartno;
	private int dombookno;
	private int forbookno;
	private int usedbookno;
	private int classno;
	private int qty;
	private String id;
	
	private String price;
	private String title;
	private String poster;


	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
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
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	public int getDombookno() {
		return dombookno;
	}
	public void setDombookno(int dombookno) {
		this.dombookno = dombookno;
	}
	public int getForbookno() {
		return forbookno;
	}
	public void setForbookno(int forbookno) {
		this.forbookno = forbookno;
	}
	public int getUsedbookno() {
		return usedbookno;
	}
	public void setUsedbookno(int usedbookno) {
		this.usedbookno = usedbookno;
	}
	public int getClassno() {
		return classno;
	}
	public void setClassno(int classno) {
		this.classno = classno;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

	
}
