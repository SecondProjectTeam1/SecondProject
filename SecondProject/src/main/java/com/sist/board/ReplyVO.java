package com.sist.board;
/*
 *  NO         NOT NULL NUMBER       
	BNO                 NUMBER       
	ID         NOT NULL VARCHAR2(20) 
	NAME       NOT NULL VARCHAR2(34) 
	MSG        NOT NULL CLOB         
	REDATE              DATE         
	GROUP_ID            NUMBER       
	GROUP_STEP          NUMBER       
	GROUP_TAB           NUMBER       
	ROOT                NUMBER       
	DEPTH               NUMBER  
 */
import java.util.*;
public class ReplyVO {
    private int no,bno,root;
    private String id,msg;
    private Date redate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
