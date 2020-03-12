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
import com.model.Car;
import com.model.Dddetail;
import com.model.Ddinfo;
import com.model.Goods;
import com.model.Jfrecord;
import com.model.Kcrecord;
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
 * 功能功能
 * @author Administrator
 *
 */
public class DdinfoAction extends ActionSupport
{
	private Integer id;
	private String ddno;
	private String memberid;
	private String ddprice;
	private String fhstatus;
	private String savetime;
	private String shstatus;
	private String wlinfo;
	private String fkstatus;
	private String shrname;
	private String shrtel;
	private String shraddr;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	private String wlcompany;
	private String wlno;
	private String goodid;
	private String sl;
	private String isjfdk;
	
	//创建订单
	public String createdd(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		String ddno = Info.getAutoId();
		fhstatus = "待发货";
		shstatus = "待收货";
		fkstatus = "待付款";
		wlinfo = "暂无物流信息";
		
		Ddinfo ddinfo = new Ddinfo();
		ddinfo.setDdno(ddno);
		ddinfo.setMemberid(member.getId().toString());
		ddinfo.setShrname(shrname);
		ddinfo.setShrtel(shrtel);
		ddinfo.setShraddr(shraddr);
		ddinfo.setFhstatus(fhstatus);
		ddinfo.setShstatus(shstatus);
		ddinfo.setFkstatus(fkstatus);
		ddinfo.setWlinfo(wlinfo);
		ddinfo.setSavetime(Info.getDateStr());
		
		
		//查询该会员的购物车所有图书并插入订单明细表
		ArrayList<Car> carlist = (ArrayList<Car>)commonDAO.findByHql(" from Car where mid="+member.getId());
		double orderprice = 0;
		for(Car car:carlist){
			Goods goodmap = (Goods)commonDAO.findById(car.getGid(), "Goods");
			if(goodmap.getTprice()!=null&&!goodmap.getTprice().equals("")){ 
				orderprice += Double.valueOf(goodmap.getTprice())*car.getSl();
			}else{
				orderprice += Double.valueOf(goodmap.getPrice())*car.getSl();
			}
			Dddetail dddetail = new Dddetail();
			dddetail.setDdno(ddno);
			dddetail.setGoodid(car.getGid());
			dddetail.setSl(car.getSl().toString());
			commonDAO.save(dddetail);
		}
		ddinfo.setDdprice(String.valueOf(orderprice));
		commonDAO.save(ddinfo);//写订单表
		//删除购物车下本会员的图书
		for(Car car:carlist){
			commonDAO.delete(car.getId(), "Car");
		}
		suc="订单创建成功!";
		return "success";
	}
	
	//直接购买
	public void tobuy()throws IOException{
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		String ddno = Info.getAutoId();
		String shrname = member.getTname();
		String shrtel = member.getTel();
		String shraddr = member.getAddr();
		double ddprice = 0.0;
		String fhstatus = "待发货";
		String shstatus = "待收货";
		String fkstatus = "待付款";
		String wlinfo = "暂无物流信息";
		String savetime = Info.getDateStr();
		
		HttpServletResponse response=ServletActionContext.getResponse();
 		response.setContentType("text/html");
 		PrintWriter out = response.getWriter();
		
		if(member!=null){
				Goods gmap = (Goods)commonDAO.findById(goodid, "Goods");
				String price = gmap.getPrice();
				if(gmap.getTprice()!=null&&!gmap.getTprice().equals("")){
					price = gmap.getTprice();
				}
				ddprice = Double.valueOf(price)*Double.valueOf(sl);
				//直接生成订单
				Ddinfo ddinfo = new Ddinfo();
				ddinfo.setDdno(ddno);
				ddinfo.setMemberid(member.getId().toString());
				ddinfo.setDdprice(String.valueOf(ddprice));
				ddinfo.setFhstatus(fhstatus);
				ddinfo.setSavetime(Info.getDateStr());
				ddinfo.setShstatus(shstatus);
				ddinfo.setWlinfo(wlinfo);
				ddinfo.setFkstatus(fkstatus);
				ddinfo.setShrname(shrname);
				ddinfo.setShrtel(shrtel);
				ddinfo.setShraddr(shraddr);
				commonDAO.save(ddinfo);
				Dddetail dddetail = new Dddetail();
				dddetail.setDdno(ddno);
				dddetail.setGoodid(goodid);
				dddetail.setSl(sl);
				commonDAO.save(dddetail);
				out.println(0);
		}else{
			out.println(1);
		}
		out.flush();
 		out.close();
	}
	
	//订单付款
	public String orderPay(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		Ddinfo di = (Ddinfo)commonDAO.findById(id, "Ddinfo");
		di.setFkstatus("已付款");
		commonDAO.update(di);
		System.out.println("isjfdk=="+isjfdk);
		if(isjfdk!=null){
			Jfrecord jfrecord1 = new Jfrecord();
			jfrecord1.setJf(String.valueOf(commonDAO.getjf(member.getId().toString())));
			jfrecord1.setMemberid(member.getId().toString());
			jfrecord1.setType("out");
			jfrecord1.setStatus("通过");
			commonDAO.save(jfrecord1);
		}
		Jfrecord jfrecord = new Jfrecord();
		jfrecord.setJf(di.getDdprice());
		jfrecord.setMemberid(member.getId().toString());
		jfrecord.setType("in");
		jfrecord.setStatus("通过");
		commonDAO.save(jfrecord);
		suc="订单支付成功!";
		return "success";
	}
	
	//订单发货
	public String ddfh(){
		
		//查询订单及订单详情表
		Ddinfo ddinfo = (Ddinfo)commonDAO.findById(id, "Ddinfo");
		ArrayList<Dddetail> dddetaillist = (ArrayList<Dddetail>)commonDAO.findByHql(" from Dddetail where ddno='"+ddinfo.getDdno()+"'");
		boolean flag = true;//用作订单图书库存校验结果
		for(Dddetail dddetailmap:dddetaillist){
			//如果其中某个图书的数量大于其库存量 则置 FLASE标识
			if(Integer.valueOf(dddetailmap.getSl())>commonDAO.getkc(Integer.valueOf(dddetailmap.getGoodid()))){
				flag = false;
			}
		}
		if(flag){
			ddinfo.setFhstatus("已发货");
			ddinfo.setWlinfo(wlcompany+"<br/>"+wlno);
			commonDAO.update(ddinfo);
			//发货后减库存 
			for(Dddetail dddetailmap:dddetaillist){
				Kcrecord kcrecord = new Kcrecord();
				kcrecord.setGid(dddetailmap.getGoodid());
				kcrecord.setHappennum(dddetailmap.getSl());
				kcrecord.setType("out");
				kcrecord.setSavetime(Info.getDateStr());
				commonDAO.save(kcrecord);
			}
			suc = "订单发货成功";
		}else{
			suc = "订单发货失败：有图书库存不足!";
		}
		return "success";
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDdno() {
		return ddno;
	}
	public void setDdno(String ddno) {
		this.ddno = ddno;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getDdprice() {
		return ddprice;
	}
	public void setDdprice(String ddprice) {
		this.ddprice = ddprice;
	}
	public String getFhstatus() {
		return fhstatus;
	}
	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getShstatus() {
		return shstatus;
	}
	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}
	public String getWlinfo() {
		return wlinfo;
	}
	public void setWlinfo(String wlinfo) {
		this.wlinfo = wlinfo;
	}
	public String getFkstatus() {
		return fkstatus;
	}
	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
	}
	public String getShrname() {
		return shrname;
	}
	public void setShrname(String shrname) {
		this.shrname = shrname;
	}
	public String getShrtel() {
		return shrtel;
	}
	public void setShrtel(String shrtel) {
		this.shrtel = shrtel;
	}
	public String getShraddr() {
		return shraddr;
	}
	public void setShraddr(String shraddr) {
		this.shraddr = shraddr;
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


	public String getWlcompany() {
		return wlcompany;
	}


	public void setWlcompany(String wlcompany) {
		this.wlcompany = wlcompany;
	}


	public String getWlno() {
		return wlno;
	}


	public void setWlno(String wlno) {
		this.wlno = wlno;
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

	public String getIsjfdk() {
		return isjfdk;
	}

	public void setIsjfdk(String isjfdk) {
		this.isjfdk = isjfdk;
	}

	
	
}
