package com.bitacademy.bookshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bitacademy.bookshop.vo.BookVo;

public class BookDao {
	
	// insert
	public boolean insert(BookVo vo) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			
			conn = getConnection();
			
			
			//3. statement 준비
			String sql = "insert into book values(null, ?, ?, ?)"; // 쿼리
			
			pstmt = conn.prepareStatement(sql); // row값
	
			//4. Binding
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getStatus());
			pstmt.setLong(3, vo.getAuthorNo());
			
						
			//5. SQL 실행
			int count = pstmt.executeUpdate(); // executeUpdate()는 insert등은 반영된 건수를 반환, create&drop은 -1을 반환
			
			//6. 결과처리
			result = count == 1; // count == 1 << true
			
			
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
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

	// find
	public List<BookVo> findAll() {
		List<BookVo> result = new ArrayList<>();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			conn = getConnection();
			
			
			//3. statement 준비
			String sql = "select a.no, a.title, b.name, a.status" + 
							" from book a, author b" +
							" where a.author_no = b.no" +
							" order by a.no asc"; // 쿼리
			
			pstmt = conn.prepareStatement(sql);
			
			
			//5. SQL 실행
			rs = pstmt.executeQuery(); // row값에 쿼리를 대입시킨것 (한줄만)
									   // 파라미터 값에 sql을 넣어주면 안됨
			
			//6. 결과(ResultSet) 처리
			while(rs.next()) {
				Long no = rs.getLong(1);
				String title = rs.getString(2);
				String authorName = rs.getString(3); // 한줄이 아닌 전체를 뽑음
				String status = rs.getString(4);
				
				BookVo vo = new BookVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setAuthorName(authorName);
				vo.setStatus(status);
				
				result.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
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
	
	// update
	public boolean updateStatus(Long no, String string) {
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			conn = getConnection();
			
			
			//3. statement 준비
			String sql = 
					"update book" + 
					" set status = ?" +
					" where no = ?"; // 쿼리
			
			pstmt = conn.prepareStatement(sql); // row값
	
			//4. Binding
			pstmt.setString(1, string);
			pstmt.setLong(2, no);
			
			
			//4. SQL 실행
			int count = pstmt.executeUpdate(); // 
			
			//5. 결과처리
			result = count == 1;
			
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
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
	
	// 예외처리
	private Connection getConnection() throws SQLException{
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
		} catch (ClassNotFoundException e) {
			System.out.println("Class Not Found:" +e);
		}  
		
		return conn;
	}
}
