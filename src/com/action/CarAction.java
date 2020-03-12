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
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Car;
import com.model.Chat;
import com.model.Goods;
import com.model.Member;
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
 * 购物车功能
 * @author Administrator
 *
 */
public class CarAction extends ActionSupport
{
	private Integer id;
	private String gid;
	private String mid;
	private Integer sl;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//添加购物车
	public void cartAdd(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		HttpServletResponse response=ServletActionContext.getResponse();
 		response.setContentType("text/html");
 		PrintWriter out;
		try {
			out = response.getWriter();
		
 		int responseContext;
		if(member!=null){
			//检查该人的购物车是否有该物品
			ArrayList<Car>  cklist = (ArrayList<Car>)commonDAO.findByHql(" from Car where mid='"+member.getId()+"' and gid='"+gid+"'");
			if(cklist.size()>0){
				Car car = cklist.get(0);
				car.setSl(car.getSl()+sl);
				commonDAO.update(car);
			}else{
				Car car = new Car();
				car.setGid(gid);
				car.setSl(sl);
				car.setMid(member.getId().toString());
				commonDAO.save(car);
			}
			responseContext = 0;
		}else{
			responseContext = 1;
		}
 		out.println(responseContext);
 		out.flush();
 		out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//从购物车移出图书
	public String cartDel(){
		commonDAO.delete(id, "Car");
		suc="移出图书成功!";
		return "success";
	}
	//修改购物车中图书数量
	public void updatecart(){
		Car car = (Car)commonDAO.findById(id, "Car");
		car.setSl(sl);
		commonDAO.update(car);
		HttpServletResponse response=ServletActionContext.getResponse();
 		response.setContentType("text/html");
 		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(1);
	 		out.flush();
	 		out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//回调中更新购物车总金额
	public void updatetprice(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		ArrayList<Car> carlist = (ArrayList<Car>)commonDAO.findByHql("from Car where mid='"+member.getId()+"'");
		double totalprice = 0.0;
		for(Car car:carlist){
			Goods gd = (Goods)commonDAO.findById(car.getGid(), "Goods");
			if(gd.getTprice()!=null&&!gd.getTprice().equals("")){ 
				totalprice += Double.valueOf(gd.getTprice())*Integer.valueOf(car.getSl());
			}else{
				totalprice += Double.valueOf(gd.getPrice())*Integer.valueOf(car.getSl());
			}
		}
		HttpServletResponse response=ServletActionContext.getResponse();
 		response.setContentType("text/html");
 		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(totalprice);
	 		out.flush();
	 		out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Integer getSl() {
		return sl;
	}
	public void setSl(Integer sl) {
		this.sl = sl;
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
