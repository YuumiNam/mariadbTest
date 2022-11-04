package com.bitacademy.bookshop.dao.test;

import com.bitacademy.bookshop.dao.AuthorDao;
import com.bitacademy.bookshop.vo.AuthorVo;

public class AuthorDaoTest {
	public static void main(String[] args) {
		testInsert("스테파니메이어");
		testInsert("조정래");
		testInsert("김동인");
		testInsert("김난도");
		testInsert("천상병");
		testInsert("원수연");
	}

	private static void testInsert(String name) {
		AuthorDao dao = new AuthorDao();
		
		AuthorVo vo = new AuthorVo();
		vo.setName(name);
		dao.insert(vo);
		

	}
}
