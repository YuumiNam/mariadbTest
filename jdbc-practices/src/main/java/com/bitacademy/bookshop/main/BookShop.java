package com.bitacademy.bookshop.main;

import java.util.List;
import java.util.Scanner;

import com.bitacademy.bookshop.dao.BookDao;
import com.bitacademy.bookshop.vo.BookVo;

public class BookShop {
	public static void main(String[] args) {
		// Book 객체의 정보를 출력
		System.out.println("*****도서 정보 출력하기******");
		displayBookInfo();
		
		Scanner sc = new Scanner(System.in);
		System.out.print("대여 하고 싶은 책의 번호를 입력하세요 : ");
		int bookNo = sc.nextInt();
		sc.close();
		
		// (1) 입력된 번호에 맞는 책을 찾아 대여 되었음(status = "대여중")을 체크 합니다.
		rentBook(bookNo);

		
		// (2) Book 객체의 정보를 출력
		System.out.println();
		System.out.println("*****도서 정보 출력하기******");
		displayBookInfo();
		
	}

	// 정적 메소드
	public static void displayBookInfo() {
		List<BookVo> list = new BookDao().findAll();
		
		for(BookVo vo : list) {
			System.out.println("[" + vo.getNo() + "]" + "책 제목: " + vo.getTitle() + ", " + "작가: " + vo.getAuthorName() + " 대여유무: " + vo.getStatus());
		}
	}
	
	private static void rentBook(long no) {
		// BookDao dao = new BookDao();
		// dao.updateStatus(no, "대여중");
		
		new BookDao().updateStatus(no, "대여중");
	}
}

