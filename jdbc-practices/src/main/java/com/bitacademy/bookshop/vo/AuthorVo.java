package com.bitacademy.bookshop.vo;

public class AuthorVo {
	// 필드
	private Long no;
	private String name;
	
	// getter setter
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// toString
	@Override
	public String toString() {
		return "AuthorVo [no=" + no + ", name=" + name + "]";
	}

}
