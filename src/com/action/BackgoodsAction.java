package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.google.gson.Gson;
import com.model.Backgoods;
import com.model.Dddetail;
import com.model.Ddinfo;
import com.model.Goods;
import com.model.Jfrecord;
import com.model.Kcrecord;
import com.model.Member;
import com.model.News;
import com.model.Pj;
import com.model.Protype;
import com.model.Sysuser;
import com.model.Yqlink;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

/**
 * 图书退货功能
 * @author Administrator
 *
 */
public class BackgoodsAction extends ActionSupport
{
	private Integer id;
	private String goodid;
	private String sl;
	private String ddid;
	private String ddno;
	private String memberid;
	private String reason;
	private String status;
	private String savetime;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//退货申请
	public String thAdd(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		Backgoods bg = new Backgoods();
		Ddinfo ddinfo = (Ddinfo)commonDAO.findById(ddid, "Ddinfo");
		Dddetail dddetail = (Dddetail)commonDAO.findByHql("from Dddetail where goodid='"+goodid+"' and ddno='"+ddinfo.getDdno()+"'").get(0);
		bg.setSl(dddetail.getSl());
		bg.setDdno(ddinfo.getDdno());
		bg.setDdid(ddid);
		bg.setReason(reason);
		bg.setMemberid(member.getId().toString());
		bg.setGoodid(goodid);
		bg.setSavetime(Info.getDateStr());
		bg.setStatus("退货申请中");
		commonDAO.save(bg);
		suc="已申请退货";
		return "success";
	}
	//退货申请审核通过
	public String thpass(){
		Backgoods backgoods = (Backgoods)commonDAO.findById(id, "Backgoods");
		Kcrecord kcrecord = new Kcrecord();
		kcrecord.setGid(backgoods.getGoodid());
		kcrecord.setHappennum(backgoods.getSl());
		kcrecord.setType("in");
		kcrecord.setSavetime(Info.getDateStr());
		kcrecord.setFlag("th");
		commonDAO.save(kcrecord);
		backgoods.setStatus("已同意退货");
		commonDAO.update(backgoods);
		
		Goods gds = (Goods)commonDAO.findById(backgoods.getGoodid(), "Goods");
		//要返还的积分
		double jf = 0;
		if(gds.getTprice()!=null&&!gds.getTprice().equals("")){ 
			jf = Double.valueOf(gds.getTprice())*Double.valueOf(backgoods.getSl());
		}else{
			jf = Double.valueOf(gds.getPrice())*Double.valueOf(backgoods.getSl());
		}
		Jfrecord jfrecord = new Jfrecord();
		jfrecord.setJf(String.valueOf(jf));
		jfrecord.setMemberid(backgoods.getMemberid());
		jfrecord.setType("out");
		jfrecord.setStatus("通过");
		commonDAO.save(jfrecord);
		suc="退货申请审核通过";
		return "success";
	}
	//拒绝退货申请
	public String thno(){
		Backgoods backgoods = (Backgoods)commonDAO.findById(id, "Backgoods");
		backgoods.setStatus("拒绝退货");
		commonDAO.update(backgoods);
		suc="退货申请已拒绝";
		return "success";
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getGoodid() {
		return goodid;
	}
	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}
	public String getSl() {
		return sl;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	public String getDdid() {
		return ddid;
	}
	public void setDdid(String ddid) {
		this.ddid = ddid;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSuc() {
		return suc;
	}
	public void setSuc(String suc) {
		this.suc = suc;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public CommonDAO getCommonDAO() {
		return commonDAO;
	}
	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getDdno() {
		return ddno;
	}
	public void setDdno(String ddno) {
		this.ddno = ddno;
	}
	
}
