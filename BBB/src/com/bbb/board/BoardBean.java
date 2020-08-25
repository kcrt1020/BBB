package com.bbb.board;

import java.sql.Date;

public class BoardBean {
		
		private int bno;
		private String name;
		private String pw;
		private String subject;
		private String content;
		private int readcount;
		private int re_ref;
		private int re_seq;
		private int re_lev;
		private Date date;
		private String ip;
		private String file;
		
		
		public int getBno() {
			return bno;
		}
		public void setBno(int bno) {
			this.bno = bno;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPw() {
			return pw;
		}
		public void setPw(String pw) {
			this.pw = pw;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		public int getRe_ref() {
			return re_ref;
		}
		public void setRe_ref(int re_ref) {
			this.re_ref = re_ref;
		}
		public int getRe_seq() {
			return re_seq;
		}
		public void setRe_seq(int re_seq) {
			this.re_seq = re_seq;
		}
		public int getRe_lev() {
			return re_lev;
		}
		public void setRe_lev(int re_lev) {
			this.re_lev = re_lev;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public String getIp() {
			return ip;
		}
		public void setIp(String ip) {
			this.ip = ip;
		}
		public String getFile() {
			return file;
		}
		public void setFile(String file) {
			this.file = file;
		}
		
		@Override
		public String toString() {
			return "BoardBean [bno=" + bno + ", name=" + name + ", pw=" + pw + ", subject=" + subject + ", content="
					+ content + ", readcount=" + readcount + ", re_ref=" + re_ref + ", re_seq=" + re_seq + ", re_lev="
					+ re_lev + ", date=" + date + ", ip=" + ip + ", file=" + file + "]";
		}
		
		

	}


