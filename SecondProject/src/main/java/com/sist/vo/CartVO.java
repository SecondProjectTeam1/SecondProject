package com.sist.vo;

/*
 *  CARTNO      NOT NULL NUMBER        
	ID                   VARCHAR2(20)  
	TYPE                 NUMBER        
	PRODUCTNO            NUMBER        
	QTY                  NUMBER        
	REGDATE              DATE          
	TOTAL_PRICE          NUMBER        
	ADDRESS     NOT NULL VARCHAR2(700) 
	TEL         NOT NULL VARCHAR2(20)  
	EMAIL       NOT NULL VARCHAR2(100) 
	STATE                VARCHAR2(1)    
 */
import java.util.*;
public class CartVO {
	private int cartno;
	private String id;
	private int type;
	private int productno;
	private int qty;
	private Date regdate;
	private String address;
	private String tel;
	private String email;
	private String state;
	private int total_price;
	
	private int price;
	
	// 임시 변수
	private BookVO dvo=new BookVO();
	private BookfVO fvo=new BookfVO();
	private BooksVO uvo=new BooksVO();
	private VideoVO cvo=new VideoVO();
	
	
	
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public BookVO getDvo() {
		return dvo;
	}
	public void setDvo(BookVO dvo) {
		this.dvo = dvo;
	}
	public BookfVO getFvo() {
		return fvo;
	}
	public void setFvo(BookfVO fvo) {
		this.fvo = fvo;
	}
	public BooksVO getUvo() {
		return uvo;
	}
	public void setUvo(BooksVO uvo) {
		this.uvo = uvo;
	}
	public VideoVO getCvo() {
		return cvo;
	}
	public void setCvo(VideoVO cvo) {
		this.cvo = cvo;
	}
	
}
