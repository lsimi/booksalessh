<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Member"%>
<%@page import="com.model.Ddinfo"%>
<%@page import="com.model.Dddetail"%>
<%@page import="com.model.Pj"%>
<%@page import="com.model.Backgoods"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>网上书城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Custom Theme files -->
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
	<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
	<!-- js -->
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
	<script src="js/imagezoom.js"></script>
	<!-- //js -->
	<!-- cart -->
	<script src="js/simpleCart.min.js"> </script>
	<!-- cart -->
	<!-- FlexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
  </head>
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
    
						
    <div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  我的订单
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">	
	<!--gallery-->
	
		<%	 CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
		Member member = (Member)session.getAttribute("member");  
     String hql = " from Ddinfo where 1=1 and memberid='"+member.getId()+"' ";
	 String url = "/booksalessh/myorder.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 key1 = Info.getUTFStr(key1);
	 key2 = Info.getUTFStr(key2);
	 }
	 if(!key.equals(""))
	 {
		 hql+=" and (ddno = '"+key+"')";
	 url+="&key="+key;
	 }
	 if(!key1.equals(""))
	 {
		 hql+=" and (fkstatus ='"+key1+"')";
	 url+="&key1="+key1;
	 }
	 if(!key2.equals(""))
	 {
		 hql+=" and (fhstatus ='"+key2+"')";
	 url+="&key2="+key2;
	 }
	 hql+=" order by id desc";
%>
		<div>
    <table class="table">
      <thead>
        <tr>
          <th>订单编号</th>
          <th>订单图书</th>
          <th>订单金额</th>
          <th>付款状态</th>
          <th>发货状态</th>
          <th>收货状态</th>
          <th>物流信息</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <%
      String did = request.getParameter("did");
      if(did!=null)
      {
    	  dao.delete(did,"Ddinfo");
      }
      String shid = request.getParameter("shid");
      if(shid!=null)
      {
    	  Ddinfo di = (Ddinfo)dao.findById(shid,"Ddinfo");
    	  di.setShstatus("已收货");
    	  dao.update(di);
      }
      PageManager pageManager = PageManager.getPage("/booksalessh/myorder.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Ddinfo> list=( ArrayList<Ddinfo>)bean.getCollection(); 
      for(Ddinfo df:list){
	    %>
        <tr>
          <td><%=df.getDdno() %></td>
          <td>
          		<%ArrayList<Dddetail> dddetaillist = (ArrayList<Dddetail>)dao.findByHql(" from Dddetail where ddno='"+df.getDdno()+"'"); 
                for(Dddetail dddetail:dddetaillist){
                	Goods gmap = (Goods)dao.findById(dddetail.getGoodid(),"Goods");
                %>
                <a href="good.jsp?gid=<%=gmap.getId() %>"><%=gmap.getGoodname() %></a>
                
                &nbsp;&nbsp;&nbsp;数量：<%=dddetail.getSl() %>
                <% ArrayList<Pj> pjlist = (ArrayList<Pj>)dao.findByHql(" from Pj where goodid='"+gmap.getId()+"' and memberid='"+member.getId()+"' and ddid='"+df.getId()+"'");
						                if(pjlist.size()==0&&df.getShstatus().equals("已收货")){ %>
						                	<a href="pj.jsp?id=<%=gmap.getId() %>&ddid=<%=df.getId() %>">[评价]</a>
						                <%} %>
						                <%
						                if(df.getShstatus().equals("已收货")){
							                ArrayList<Backgoods> blist = (ArrayList<Backgoods>)dao.findByHql(" from Backgoods where goodid='"+gmap.getId()+"' and memberid='"+member.getId()+"' and ddid='"+df.getId()+"'");
							                if(blist.size()==0){%>
							                	<a href="thapply.jsp?id=<%=gmap.getId() %>&ddid=<%=df.getId() %>">[退货]</a>
							                <%}else{%>
							                	[<%=blist.get(0).getStatus() %>]
							                	
							                <%}
						                }%>
						                	
						                <br/>
				<%} %></a>
          </td>
          <td><%=df.getDdprice() %></td>
          <%ArrayList<Backgoods> blist = (ArrayList<Backgoods>)dao.findByHql(" from Backgoods where ddno='"+df.getDdno()+"' and status='已同意退货'"); %>
          <td>
          <%=df.getFkstatus() %>
          </td>
          <td><%=df.getFhstatus() %></td>
          <td><%=df.getShstatus() %></td>
          <td><%=df.getWlinfo() %></td>
          <td>
          								<%if(df.getFkstatus().equals("待付款")){ %>
						                <a href="orderpay.jsp?ddid=<%=df.getId() %>&ddprice=<%=df.getDdprice() %>" class="add-cart item_add">付款</a>
						                <%} %>
						                <%if(df.getFhstatus().equals("待发货")){ %>
						                <a href="myorder.jsp?did=<%=df.getId() %>" class="add-cart item_add">撤销</a>
						                <%} %>
						                <%if(df.getShstatus().equals("待收货")&&df.getFhstatus().equals("已发货")){ %>
						                <a href="myorder.jsp?shid=<%=df.getId() %>" class="add-cart item_add">确认收货</a>
						                <%}%>
          </td>
        </tr>
        <%} %>
      </tbody>
    </table>
</div>
	<div align="center">${page.info }</div>
	<!--//gallery-->
							</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
