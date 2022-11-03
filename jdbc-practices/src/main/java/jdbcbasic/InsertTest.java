package jdbcbasic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertTest {
	public static void main(String[] args) {
		insert("시스템");
		insert("마케팅");
		insert("운영");
	}
	
	public static Boolean insert(String name) {
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
	
			
			//4, SQL 실행
			String sql = "insert" +
							" into dept" +
							" values(null, '" + name + "')"; // 쿼리
			
			int count = stmt.executeUpdate(sql); // executeUpdate()는 insert등은 반영된 건수를 반환, create&drop은 -1을 반환
			
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
}
