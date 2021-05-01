package com.sist.vo;

import java.util.Date;

/*
 * 	NO      NUMBER       
	ID      VARCHAR2(34) 
	NAME    VARCHAR2(34) 
	MSG     CLOB         
	STAR    NUMBER     
 */
public class VideoReviewVO {
	private int no;
	private String id;
	private String name;
	private String msg;
	private int star;
	private int vno;
	private Date regdate;
	private String dbday;
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
