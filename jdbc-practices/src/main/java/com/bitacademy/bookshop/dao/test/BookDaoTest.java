package com.bitacademy.bookshop.dao.test;


import com.bitacademy.bookshop.dao.BookDao;
import com.bitacademy.bookshop.vo.BookVo;


public class BookDaoTest {
	public static void main(String[] args) {
		testInsert(3L, "트와일라잇");
		testInsert(3L, "뉴문");
		testInsert(3L, "이클립스");
		testInsert(3L, "브레이킹던");
		testInsert(4L, "아리랑");		
		testInsert(5L, "젊은그들");
		testInsert(6L, "아프니깐 청춘이다");
		testInsert(7L, "귀천");
		testInsert(8L, "태백산맥");
		testInsert(9L, "풀하우스");

	}

	private static void testInsert(Long authorno, String title) {
		BookVo vo = new BookVo();
		
		vo.setTitle(title);
		vo.setStatus("재고있음");
		vo.setAuthorNo(authorno);
		
		new BookDao().insert(vo);
	}
}
