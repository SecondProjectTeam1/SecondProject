package com.sist.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class MemberVO {

	//private String id,pwd,name,sex,birthday,email,post,addr1,addr2,tel,content,admin;
	@NotBlank
	private String id;
	@NotBlank
	private String pwd;
	@NotBlank
	private String name;
	@NotBlank
	private String sex;
	@NotBlank
	private String birthday;
	@Email
	private String email;
	@NotBlank
	private String post;
	private String addr1;
	private String addr2;
	@NotBlank
	private String tel;
	@NotBlank
	private String content;
	private String admin;
	private String msg;
	private int cno;
	private int counted;
	
	

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getCounted() {
		return counted;
	}

	public void setCounted(int counted) {
		this.counted = counted;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getId() {
		
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	
}
