package com.bitacademy.bookshop.example;

public class Book {
	// 필드
	private int bookNo;
	private String title;
	private String author;
	private int stateCode; // 0: 재고있음 1: 재고없음
	
	
	// 생성자
	public Book() {
	}
	
	public Book(int bookNo, String title, String author) {
		this.bookNo = bookNo;
		this.title = title;
		this.author = author;
		stateCode = 1;
	}

	
	//getter setter
	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	
	public int getStateCode() {
		return stateCode;
	}

	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}

	
	// 메소드
	public void rent() {
		if(stateCode == 1) {
			stateCode = 0;
			System.out.println(title + " 이(가) 대여되었습니다.");
		}
	}
	
	public void print() {
		System.out.println("[" + bookNo + "]" + "책 제목: " + title + ", " + "작가: " + author + " 대여유무: " + (stateCode == 1 ? "재고있음" : "대여중"));
	}
}
