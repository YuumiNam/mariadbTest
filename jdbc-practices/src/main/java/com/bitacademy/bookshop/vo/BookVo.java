package com.bitacademy.bookshop.vo;
	
public class BookVo {
		//필드
		private Long no;
		private String title;
		private String status;
		private Long authorNo;
		
		
		//getter setter
		public Long getNo() {
			return no;
		}
		public void setNo(Long no) {
			this.no = no;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public Long getAuthorNo() {
			return authorNo;
		}
		public void setAuthorNo(Long authorNo) {
			this.authorNo = authorNo;
		}
		
		
		//toString
		@Override
		public String toString() {
			return "bookVo [no=" + no + ", title=" + title + ", status=" + status + ", authorNo=" + authorNo + "]";
		}
}