<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Ppinfo"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Pj"%>
<%@page import="com.model.Member"%>
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
	
	<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
	  $('.flexslider').flexslider({
		animation: "slide",
		controlNav: "thumbnails"
	  });
	});
</script>
	
	<!-- //Custom Theme files -->
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<!-- //js -->	
<!-- cart -->
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
<!-- the mousewheel plugin -->
  </head>
    <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");  
    String gid = request.getParameter("gid");
    Goods goods = (Goods)dao.findById(gid,"Goods");
    %>
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
  						<div align="right" style="background-color:#02b2b5;height: 40px">
						<form class="navbar-form" action="index.jsp?f=f" method="post">
							<input type="text" placeholder="图书名称或编号 :" id="key" name="key" class="form-control">
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								查询
							</button>
						</form>
					</div>		
   
							<div class="alert alert-info" id="tsinfo" style="display: none;">
						        <button type="button" class="close" data-dismiss="alert">×</button>
					    	</div>
					    	
					    	<!-- 眉 开始 -->
					    	    <div class="collpse tabs">
									<div class="container">
										<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
											<div class="panel panel-default">
					    	<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									  图书详情
									</a>
								</h4>
							</div>
							</div>
							</div>
							</div>
							</div>
							<!-- 眉 结束  -->
							
							
<div class="single">
		<div class="container">
			<div class="single-grids">				
				<div class="col-md-4 single-grid">		
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="images/s1.png">
								<div class="thumb-image"> <img src="upfile/<%=goods.getFilename() %>" data-imagezoom="true" class="img-responsive"> </div>
							</li>
						</ul>
					</div>
				</div>	
				<%Ppinfo ppmap = (Ppinfo)dao.findById(goods.getGoodpp(),"Ppinfo"); 
				Protype fmap = (Protype)dao.findById(goods.getFid(),"Protype");
				Protype smap = (Protype)dao.findById(goods.getSid(),"Protype");%>
				<div class="col-md-4 single-grid simpleCart_shelfItem">		
					<h3><%=goods.getGoodname() %></h3>
					<ul class="size">
						<h3>编号:<%=goods.getGoodno() %></h3>
					</ul>
					<ul class="size">
						<h3>品牌:<%=ppmap.getPpname() %></h3>
					</ul>
					<ul class="size">
						<h3>类别</h3>
							<li><%=fmap.getTypename() %></li>
							<li>-</li>
							<li><%=smap.getTypename() %></li>
					</ul>
					<ul class="size">
						<h3>￥:
										<%if(goods.getTprice()!=null&&!goods.getTprice().equals("")){ %>
											<s>
											<%}%>
												<%=goods.getPrice() %>
											<%if(goods.getTprice()!=null&&!goods.getTprice().equals("")){ %>
											</s>
											<%}%>
											&nbsp;&nbsp;
											<%if(goods.getTprice()!=null&&!goods.getTprice().equals("")){ %>
												<%=goods.getTprice() %>
											<%} %>
						</h3>
					</ul>
					<%ArrayList salelist = (ArrayList)dao.findByHql(" from Dddetail where goodid="+goods.getId()); %>
					<div class="tag">
						<p>已售 : <%=salelist.size() %> 件</p>
					</div>
					<input type="hidden" value="<%=goods.getId() %>" id="gid" name="gid" >
					<p class="qty"> 数量 :  </p><input min="1" type="number" id="sl" name="sl" value="1" >&nbsp;&nbsp;&nbsp;&nbsp;(<%=dao.getkc(Integer.parseInt(goods.getId().toString())) %>件)
					<div class="btn_form">
						<a href="javascript:tocar()" class="add-cart item_add">加入购物车</a>	
						<a href="javascript:tobuy()" class="add-cart item_add">直接购买</a>	
						<a href="javascript:tofav()" class="add-cart item_add">加入收藏</a>	
					</div>
				</div>
				
				<jsp:include page="right.jsp"></jsp:include>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	
	<!-- collapse -->
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  图书详情
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<%=goods.getNote() %>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							   图书评价
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
		<%	 
     String hql = " from Pj where 1=1 and goodid='"+gid+"' ";
	 String url = "/booksalessh/good.jsp?1=1&gid="+gid;
	 hql+=" order by id desc";
%>						
	<div>
    <table class="table">
      <thead>
        <tr>
          <th>评价等级</th>
          <th>评价内容</th>
          <th>回复</th>
          <th>评价人</th>
          <th>评价时间</th>
        </tr>
      </thead>
      <tbody>
      <%
      PageManager pageManager = PageManager.getPage("/booksalessh/myorder.jsp?1=1&gid="+gid,10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Pj> list=( ArrayList<Pj>)bean.getCollection(); 
      for(Pj pj:list){
    	  Member pjmb = (Member)dao.findById(pj.getMemberid(),"Member");
	    %>
        <tr>
          <td><%=pj.getJb() %>分</td>
          <td><%=pj.getMsg() %></td>
          <td><%=pj.getHf() %></td>
          <td><%=pjmb.getUname() %></td>
          <td><%=pj.getSavetime() %></td>
        </tr>
        <%} %>
      </tbody>
    </table>
</div>
	<div align="center">${page.info }</div>
							
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!--//collapse -->

	<jsp:include page="foot.jsp"></jsp:include>
  </body>
  <script type="text/javascript">
  function tocar(){     
		 var gid=document.getElementById("gid").value;
		 var sl=document.getElementById("sl").value;    
		 if(sl==""||sl<=0){
		    $("#tsinfo").show();
		    $("#tsinfo").html("请填写正确的数量");
		    return;
		 }  
		 $.ajax({  
		        type: "POST",      
		         url: "cartAdd.action", //servlet的名字     
		          data: "gid="+gid+"&sl="+sl, 
		         success: function(data){       
		    if(data==0){   
			    alert("该图书已加入到购物车");
		    }else{    
		     	location.href="login.jsp";
		    }     
		 }     
		});     
	}     

  function tofav(){     
		 var gid=document.getElementById("gid").value;
		 $.ajax({  
		        type: "POST",      
		         url: "favAdd.action", //servlet的名字     
		          data: "goodid="+gid, 
		         success: function(data){       
		    if(data==0){   
			    alert("该图书已加入收藏夹");
		    }else{    
		     	location.href="login.jsp";
		    }     
		 }     
		});     
	}   


	function tobuy(){     
		 var gid=document.getElementById("gid").value;
		 var sl=document.getElementById("sl").value;    
		 if(sl==""||sl<=0){
		    $("#tsinfo").show();
		    $("#tsinfo").html("请填写正确的数量");
		    return;
		 }  
		 $.ajax({  
		        type: "POST",      
		         url: "tobuy.action", //servlet的名字     
		          data: "goodid="+gid+"&sl="+sl, 
		         success: function(data){       
		    if(data==0){     
		    	location.href="myorder.jsp";
		    }else{
		    	location.href="login.jsp";
			}   
		 }     
		});     
	}     
  </script>
</html>
