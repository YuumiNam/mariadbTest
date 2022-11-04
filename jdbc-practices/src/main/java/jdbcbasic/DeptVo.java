package jdbcbasic;

public class DeptVo { // Vo = DB의 하나의테이블을 담는 객체
	// 필드
	private Long no;
	private String name;
	
	// getter setter
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	  
	// toString
	@Override
	public String toString() {
		return "DeptVo [no=" + no + ", name=" + name + "]";
	}
}
