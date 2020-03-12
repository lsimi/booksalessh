package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Member;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

/**
 * 会员信息功能
 * @author Administrator
 *
 */
public class MemberAction extends ActionSupport
{
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
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//会员登陆
	public String memberLogin(){
		Map session= ServletActionContext.getContext().getSession();
		String hql="from Member where uname='"+uname+"' and upass='"+upass+"' and delstatus='0' ";
		List adminList=commonDAO.findByHql(hql);
		if(adminList.size()!=0){
			Member member=(Member)adminList.get(0);
			 session.put("member", member);
			 suc="";
			 
		}else{
			no="用户名密码错误";
		}
		return "success";
	}
	//新增系统用户前检查用户名唯一性 jqery
	 public void usernamecheck() throws IOException
	 {
	    	 ArrayList<Member> list = (ArrayList<Member>)commonDAO.findByHql("from Member where uname='"+uname+"' and delstatus='0' ");
	    	 int responseContext;
	    	 System.out.println(list.size());
	    	 if(list.size()==0){
	    		 responseContext = 0;
	    	 }else{
	    		 responseContext=1;
	    	 }
	 		HttpServletResponse response=ServletActionContext.getResponse();
	 		response.setContentType("text/html");
	 		PrintWriter out = response.getWriter();
	 		out.println(responseContext);
	 		out.flush();
	 		out.close();
	 }
	
	//新用户注册
	public String memberReg(){
		Member mb = new Member();
		mb.setUname(uname);
		mb.setUpass(upass);
		mb.setTname(tname);
		mb.setEmail(email);
		mb.setSex(sex);
		mb.setAddr(addr);
		mb.setTel(tel);
		mb.setQq(qq);
		mb.setDelstatus("0");
		mb.setSavetime(Info.getDateStr());
		commonDAO.save(mb);
		suc="注册成功";
		return "success";
	}
	//会员修改资料
	public String memberEdit(){
		Member mb = (Member)commonDAO.findById(id, "Member");
		mb.setUpass(upass);
		mb.setTname(tname);
		mb.setEmail(email);
		mb.setSex(sex);
		mb.setAddr(addr);
		mb.setTel(tel);
		mb.setQq(qq);
		commonDAO.update(mb);
		suc="修改资料成功";
		return "success";
	}
	
	
	//会员退出
	public String memberExit(){
		Map session= ServletActionContext.getContext().getSession();
		session.remove("member");
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getYbcode() {
		return ybcode;
	}
	public void setYbcode(String ybcode) {
		this.ybcode = ybcode;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
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
	
	
}
