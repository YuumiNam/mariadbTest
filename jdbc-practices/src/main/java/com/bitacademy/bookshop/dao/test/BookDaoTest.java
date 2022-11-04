package com.bitacademy.bookshop.dao.test;


import com.bitacademy.bookshop.dao.BookDao;
import com.bitacademy.bookshop.vo.BookVo;


public class BookDaoTest {
	public static void main(String[] args) {
		testInsert(1L, "트와일라잇");
		testInsert(1L, "뉴문");
		testInsert(1L, "이클립스");
		testInsert(1L, "브레이킹던");
		testInsert(2L, "아리랑");		
		testInsert(3L, "젊은그들");
		testInsert(4L, "아프니깐 청춘이다");
		testInsert(5L, "귀천");
		testInsert(2L, "태백산맥");
		testInsert(6L, "풀하우스");
		
		testUpdate(1L);

	}

	private static void testUpdate(long bookno) {
		BookVo vo = new BookVo();
		
		vo.setStatus("대여중");
		
	}

	private static void testInsert(Long authorno, String title) {
		BookVo vo = new BookVo();
		
		vo.setTitle(title);
		vo.setStatus("재고있음");
		vo.setAuthorNo(authorno);
		
		new BookDao().insert(vo);
	}
}
