package com.sist.vo;
/*
 * 	ODERNO       NOT NULL NUMBER(20)       -- 주문자의 개별 주문 상품을 구분하는 번호
	ODERNO2               NUMBER(20)       -- 주문자들의 주문을 구분하는 번호
	ID                    VARCHAR2(20)   
	DOMBOOKNO             NUMBER          
	FORBOOKNO             NUMBER         
	USEDBOOKNO            NUMBER          
	CLASSNO               NUMBER         
	TITLE                 VARCHAR2(100)  
	QTY                   NUMBER         
	PRICE                 NUMBER         
	POSTER                VARCHAR2(1000) 
	RECIPIENT             VARCHAR2(50)   
	RECIPIENTHP           VARCHAR2(20)    
	ADDR1                 VARCHAR2(500)  
	ADDR2                 VARCHAR2(500)  
	DELIVERYWAY           VARCHAR2(40)   
	MEMO                  VARCHAR2(300)  
	PAYMENT               VARCHAR2(50)   
	CARDCOMPANY           VARCHAR2(50)   
	ORDERERHP             VARCHAR2(20)   
	DSTATUS               VARCHAR2(20)   
	ODATE                 DATE      
 */

public class OrderVO {
	private int orderno; // 주문 상품 일련번호 (주문자의 개별 주문 상품을 구분)
	private int orderno2; // 주문번호 (주문자들의 주문을 구분)
	private String id;
	private int dombookno;
	private int forbookno;
	private int usedbookno;
	private int classno;
	private String title;
	private int price;
	private String poster;
	private String recipient;
	private String recipienthp;
	
	private String addr1;
	private String addr2;
	private String memo;
	private String deliveryway;
	private String payment;
	private String cardcompany;
	private String ordererhp; //휴대폰 결제 전화번호
	private String odate; // 주문 날짜 시간
	private String dstatus;  //현재 주문 상품 배송 상태
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public int getOrderno2() {
		return orderno2;
	}
	public void setOrderno2(int orderno2) {
		this.orderno2 = orderno2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getRecipienthp() {
		return recipienthp;
	}
	public void setRecipienthp(String recipienthp) {
		this.recipienthp = recipienthp;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getDeliveryway() {
		return deliveryway;
	}
	public void setDeliveryway(String deliveryway) {
		this.deliveryway = deliveryway;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getCardcompany() {
		return cardcompany;
	}
	public void setCardcompany(String cardcompany) {
		this.cardcompany = cardcompany;
	}
	public String getOrdererhp() {
		return ordererhp;
	}
	public void setOrdererhp(String ordererhp) {
		this.ordererhp = ordererhp;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getDstatus() {
		return dstatus;
	}
	public void setDstatus(String dstatus) {
		this.dstatus = dstatus;
	}
	
  
	
}
