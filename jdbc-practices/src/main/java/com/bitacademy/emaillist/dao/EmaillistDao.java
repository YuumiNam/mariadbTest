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
	
	// doAdd()
	public Boolean insert(EmaillistVo vo) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			
			//3. statement 생성
			stmt = conn.createStatement(); // row값
	
			
			//4. SQL 실행
			String sql = "insert" +
							" into emaillist" +
							" values(null, '" + vo.getFirstName() + "' , '" + vo.getLastName() + "', '" + vo.getEmail() + "')"; // 쿼리
			
			
			int count = stmt.executeUpdate(sql); // executeUpdate()는 insert등은 반영된 건수를 반환, create&drop은 -1을 반환
			
			//5. 결과처리
			result = count == 1; // count == 1 << true
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
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
	
	
	
	//doDelete
	public Boolean deleteByEmail(String email) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			
			//3. statement
			stmt = conn.createStatement(); // row값
	
			
			//4. SQL 실행
			String sql = "delete " +
						 	" from emaillist" +
						 	" where email = '" + email + "'";
			int count = stmt.executeUpdate(sql); // 
			
			//5. 결과처리
			result = count == 1;
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
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
	
	
	
	//doList
	public List<EmaillistVo> findAll() {
		List<EmaillistVo> result = new ArrayList<>();
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			//3. statement
			stmt = conn.createStatement(); // row값
			
			//4. SQL 실행
			String sql = 
				"select first_name, last_name, email" + 
			    " from emaillist" + 
				" order by no desc"; // 쿼리
			
			rs = stmt.executeQuery(sql); // row값에 쿼리를 대입시킨것 (한줄만)
			
			//5. 결과처리
			while(rs.next()) { // 한줄이 아닌 전체를 뽑음
				String firstName = rs.getString(1);
				String lastName = rs.getString(2);
				String email = rs.getString(3);
				
				EmaillistVo vo = new EmaillistVo();
				vo.setFirstName(firstName);
				vo.setLastName(lastName);
				vo.setEmail(email);
				
				result.add(vo);
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
