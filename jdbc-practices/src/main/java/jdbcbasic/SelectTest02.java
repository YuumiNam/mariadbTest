package jdbcbasic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectTest02 {
	public static void main(String[] args) {
		search("pat");
	}

	private static void search(String keyword) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			
			//3. statement 준비
			String sql = "select emp_no, first_name" +
							" from employees" +
							" where first_name like ?"; // 쿼리
			
			pstmt = conn.prepareStatement(sql);
			
			//4, Binding
			pstmt.setString(1, '%' + keyword + '%'); // 쿼리에있는 ?를 바인딩해준것
			
			
			//5. SQL 실행
			rs = pstmt.executeQuery(); // row값에 쿼리를 대입시킨것 (한줄만)
									   // 파라미터 값에 sql을 넣어주면 안됨
			
			//6. 결과(ResultSet) 처리
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
	}
}

