package com.model;

/**
 * Jfrecord entity. @author MyEclipse Persistence Tools
 */

public class Jfrecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private String jf;
	private String memberid;
	private String type;
	private String status;

	// Constructors

	/** default constructor */
	public Jfrecord() {
	}

	/** full constructor */
	public Jfrecord(String jf, String memberid, String type, String status) {
		this.jf = jf;
		this.memberid = memberid;
		this.type = type;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getJf() {
		return this.jf;
	}

	public void setJf(String jf) {
		this.jf = jf;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}