package jdbcbasic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectTest01 {
	public static void main(String[] args) {
		search("pat");
	}

	private static void search(String keyword) {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			
			//3. statement
			stmt = conn.createStatement(); // row값
	
			
			//4, SQL 실행
			String sql = "select emp_no, first_name" +
							" from employees" +
							" where first_name like '%" + keyword + "%'"; // 쿼리
			
			rs = stmt.executeQuery(sql); // row값에 쿼리를 대입시킨것 (한줄만)
			
			while(rs.next()) {
				Long empNo = rs.getLong(1);
				String firstName = rs.getString(2); // 한줄이 아닌 전체를 뽑음
				
				System.out.println(empNo + ":" + firstName);
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
	}
}
