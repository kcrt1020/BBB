package com.bbb.member;

import java.sql.Date;

public class MemberBean {

	
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String email;
	private String gender;
	
	private String addr1;
	private String addr2;
	private String addr3;
	private String phone;
	private String mobile;
	private Date reg_date;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", email=" + email
				+ ", gender=" + gender + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", phone=" + phone + ", mobile=" + mobile + ", reg_date="
				+ reg_date + "]";
	}
	
	
	
	
	
	
	
}
