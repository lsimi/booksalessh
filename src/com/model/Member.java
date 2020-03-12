package com.model;

/**
 * Member entity. @author MyEclipse Persistence Tools
 */

public class Member implements java.io.Serializable {

	// Fields

	private Integer id;
	private String uname;
	private String upass;
	private String email;
	private String tname;
	private String sex;
	private String addr;
	private String ybcode;
	private String qq;
	private String tel;
	private String delstatus;
	private String savetime;

	// Constructors

	/** default constructor */
	public Member() {
	}

	/** full constructor */
	public Member(String uname, String upass, String email, String tname,
			String sex, String addr, String ybcode, String qq, String tel,
			String delstatus, String savetime) {
		this.uname = uname;
		this.upass = upass;
		this.email = email;
		this.tname = tname;
		this.sex = sex;
		this.addr = addr;
		this.ybcode = ybcode;
		this.qq = qq;
		this.tel = tel;
		this.delstatus = delstatus;
		this.savetime = savetime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return this.upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getYbcode() {
		return this.ybcode;
	}

	public void setYbcode(String ybcode) {
		this.ybcode = ybcode;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}