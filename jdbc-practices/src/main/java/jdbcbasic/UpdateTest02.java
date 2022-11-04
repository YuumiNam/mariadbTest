package jdbcbasic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateTest02 {
	public static void main(String[] args) {
		DeptVo vo = new DeptVo();
		vo.setNo(1L);
		vo.setName("경영지원");
		
		boolean result = update(vo);
		System.out.println(result ? "성공" : "실패");
	}
	
	private static boolean update(DeptVo deptVo) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			
			//3. statement 준비
			String sql = 
					"update dept" +
					"   set name = ?" +
				    " where no = ?"; // 쿼리
			
			pstmt = conn.prepareStatement(sql); // row값
	
			//4. Binding
			pstmt.setString(1, deptVo.getName());
			pstmt.setLong(2, deptVo.getNo());
			
			
			//4. SQL 실행
			int count = pstmt.executeUpdate(); // 
			
			//5. 결과처리
			result = count == 1;
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
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
}
