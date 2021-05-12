package com.sist.vo;

public class BookReplyVO {
	private int no;
	private int cs;
	private double score;
	private String name, content, poster;
	
	public int getCs() {
		return cs;
	}
	public void setCs(int cs) {
		this.cs = cs;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
}
