package com.sist.vo;

public class BooksFindVO {
	private String findTitle;
	private String userFind;
	public String getFindTitle() {
		return findTitle;
	}
	public void setFindTitle(String findTitle) {
		this.findTitle = findTitle;
	}
	public String getUserFind() {
		return userFind;
	}
	public void setUserFind(String userFind) {
		this.userFind = userFind;
	}
	
	public String[] getFuArr()
	{
		return findTitle==null?new String[]{}:findTitle.split("");
	}
	
}
