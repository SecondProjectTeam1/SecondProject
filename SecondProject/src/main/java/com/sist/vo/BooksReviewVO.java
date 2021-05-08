package com.sist.vo;

import java.util.Date;

/*
 * 	NO      NUMBER       
	ID      VARCHAR2(34) 
	NAME    VARCHAR2(34) 
	MSG     CLOB         
	STAR    NUMBER     
 */
public class BooksReviewVO {
	private int no;
	private String id;
	private String name;
	private String msg;
	private int star;
	private int vno;
	private Date regdate;
	private String dbday;
	private Double avg;
	private int revCount;
	private int star1;
	private int star2;
	private int star3;
	private int star4;
	private int star5;
	
	
	
	public int getStar1() {
		return star1;
	}
	public void setStar1(int star1) {
		this.star1 = star1;
	}
	public int getStar2() {
		return star2;
	}
	public void setStar2(int star2) {
		this.star2 = star2;
	}
	public int getStar3() {
		return star3;
	}
	public void setStar3(int star3) {
		this.star3 = star3;
	}
	public int getStar4() {
		return star4;
	}
	public void setStar4(int star4) {
		this.star4 = star4;
	}
	public int getStar5() {
		return star5;
	}
	public void setStar5(int star5) {
		this.star5 = star5;
	}
	public int getRevCount() {
		return revCount;
	}
	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}
	public Double getAvg() {
		return avg;
	}
	public void setAvg(Double avg) {
		this.avg = avg;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getVno() {
		return vno;
	}
	public void setVno(int vno) {
		this.vno = vno;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	
	
	
}
