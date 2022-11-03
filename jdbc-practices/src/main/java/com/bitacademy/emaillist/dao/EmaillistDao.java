package com.bitacademy.emaillist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bitacademy.emaillist.vo.EmaillistVo;

public class EmaillistDao {
	public Boolean insert(EmaillistVo vo) {
		return false;
	}
	
	public Boolean deleteByEmail(String email) {
		return false;
	}
	
	public List<EmaillistVo> findAll() {
		List<EmaillistVo> result = new ArrayList<>();
		
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			
			//3. statement
			stmt = conn.createStatement(); // row값
	
			
			//4, SQL 실행
			String sql = "select first_name, last_name, email" 
						  + " from emaillist" +
						    " order by no desc"; // 쿼리
			
			rs = stmt.executeQuery(sql); // row값에 쿼리를 대입시킨것 (한줄만)
			
			while(rs.next()) {
				String firstName = rs.getString(1);
				String lasttName = rs.getString(2); // 한줄이 아닌 전체를 뽑음
				String email = rs.getString(3);
				
				EmaillistVo vo = new EmaillistVo();
				vo.setFirstName(firstName);
				vo.setLastName(lasttName);
				vo.setEmail(email);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
