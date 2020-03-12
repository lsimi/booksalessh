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
import com.model.Kcrecord;
import com.model.News;
import com.model.Sysuser;
import com.model.Yqlink;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

/**
 * 图书库存功能
 * @author Administrator
 *
 */
public class KcrecordAction extends ActionSupport
{
	private Integer id;
	private String gid;
	private String happennum;
	private String type;
	private String savetime;
	private String flag;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//入库
	public String kcrecordAdd(){
		Kcrecord kc = new Kcrecord();
		kc.setGid(gid);
		kc.setHappennum(happennum);
		kc.setType("in");
		kc.setSavetime(Info.getDateStr());
		commonDAO.save(kc);
		suc="图书入库成功";
		return "success";
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getHappennum() {
		return happennum;
	}
	public void setHappennum(String happennum) {
		this.happennum = happennum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
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

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	
}
