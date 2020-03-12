package com.model;

/**
 * Backgoods entity. @author MyEclipse Persistence Tools
 */

public class Backgoods implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodid;
	private String sl;
	private String ddid;
	private String ddno;
	private String memberid;
	private String reason;
	private String status;
	private String savetime;

	// Constructors

	/** default constructor */
	public Backgoods() {
	}

	/** full constructor */
	public Backgoods(String goodid, String sl, String ddid, String ddno,
			String memberid, String reason, String status, String savetime) {
		this.goodid = goodid;
		this.sl = sl;
		this.ddid = ddid;
		this.ddno = ddno;
		this.memberid = memberid;
		this.reason = reason;
		this.status = status;
		this.savetime = savetime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodid() {
		return this.goodid;
	}

	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}

	public String getSl() {
		return this.sl;
	}

	public void setSl(String sl) {
		this.sl = sl;
	}

	public String getDdid() {
		return this.ddid;
	}

	public void setDdid(String ddid) {
		this.ddid = ddid;
	}

	public String getDdno() {
		return this.ddno;
	}

	public void setDdno(String ddno) {
		this.ddno = ddno;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}