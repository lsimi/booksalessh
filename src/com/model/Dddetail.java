package com.model;

/**
 * Dddetail entity. @author MyEclipse Persistence Tools
 */

public class Dddetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private String ddno;
	private String goodid;
	private String sl;

	// Constructors

	/** default constructor */
	public Dddetail() {
	}

	/** full constructor */
	public Dddetail(String ddno, String goodid, String sl) {
		this.ddno = ddno;
		this.goodid = goodid;
		this.sl = sl;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDdno() {
		return this.ddno;
	}

	public void setDdno(String ddno) {
		this.ddno = ddno;
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

}