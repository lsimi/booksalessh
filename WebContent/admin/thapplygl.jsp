<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Ppinfo"%>
<%@page import="com.model.Backgoods"%>
<%@page import="com.model.Member"%>
<%@page import="com.model.Sysuser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
	<meta charset="utf-8">
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<%=basePath%>">
    <meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">
    
	<link rel="stylesheet" type="text/css" href="/booksalessh/admin/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/booksalessh/admin/stylesheets/theme.css">
    <link rel="stylesheet" href="/booksalessh/admin/lib/font-awesome/css/font-awesome.css">

    <script src="/booksalessh/admin/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
	
    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">

	
  </head>
  
  <body class="">
    
    <%	 Sysuser admin = (Sysuser)session.getAttribute("admin");
     CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
	 String hql = " from Backgoods where 1=1 ";
	 String url = "/booksalessh/admin/thapplygl.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(admin.getUsertype().equals("图书经手人")){
		 hql += " and goodid in (select id from Goods where saver='"+admin.getId()+"' ) and status='已同意退货' ";
	 }
	 if(!key.equals(""))
	 {
		 hql+=" and (ddno like'%"+key+"%')";
	 url+="&key="+key;
	 }
	 hql+=" order by id desc";
%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">退货申请管理</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">退货申请管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            <%String suc = (String)request.getAttribute("suc");
			if(suc!=null){%>
			    <div class="alert alert-info">
			        <button type="button" class="close" data-dismiss="alert">×</button>
			        	<%=suc %>
			        	<script type="text/javascript">
			        		location.href="admin/thapplygl.jsp";
			        	</script>
		    	</div>
			<%}%>
				<div class="btn-toolbar">
					<div class="search-well">
						<form action="admin/thapplygl.jsp?f=f" method="post" class="form-inline">
							<input class="input-xlarge" placeholder="订单编号..." id="key" name="key" type="text" value="<%=key %>">
		                    <button class="btn" type="submit"><i class="icon-search"></i> Go</button>
						</form>	
					</div>  	
				</div>
			
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>所属订单编号</th>
          <th>图书编号</th>
          <th>图书名称</th>
          <th>退货数量</th>
          <th>退货原因</th>
          <th>退货人</th>
          <th>申请日期</th>
          <th>审核状态</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      <%
      PageManager pageManager = PageManager.getPage("/booksalessh/admin/thapplygl.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Backgoods> list=( ArrayList<Backgoods>)bean.getCollection(); 
      for(Backgoods bg:list){
    	  Goods goods = (Goods)dao.findById(bg.getGoodid(),"Goods");
   		  Member mbmap = (Member)dao.findById(bg.getMemberid(),"Member");
	    %>
        <tr>
          <td><%=bg.getDdno() %></td>
          <td><%=goods.getGoodno() %></td>
          <td><%=goods.getGoodname() %></td>
          <td><%=bg.getSl() %></td>
          <td><%=bg.getReason() %></td>
          <td><%=mbmap.getTname() %><br/><%=mbmap.getTel() %></td>
          <td><%=bg.getSavetime() %></td>
          <td><%=bg.getStatus() %></td>
          <td>
              <%
			    if(bg.getStatus().equals("退货申请中")&&admin.getUsertype().equals("管理员")){ %>
			    <a href="thpass.action?id=<%=bg.getId() %>">同意</a>
			    <a href="thno.action?id=<%=bg.getId() %>">拒绝</a>
			    <%}%>
          </td>
        </tr>
        <%} %>
      </tbody>
    </table>
</div>
<div class="pagination">
    ${page.info }
</div>

    <script src="/booksalessh/admin/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
    	function goodsadd(){
			location.href="admin/goodsadd.jsp";
        }
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
        
        $(function(){
        	  var key2 = $("#key2");
        	  //var opt = $("#key2 option");
        	  $('#key1').change(function(){
	        	  $.ajax({
		        	  url:"searchsontype.action?fatherid="+$('#key1').val(),
		        	  datetype:"json",
		        	  type:"post",
		        	  contentType: "application/Json; charset=UTF-8",
		        	  success:function(msg){
			        	  key2.empty();
			        	  //key2.append("<option value=\"\">请选择</option>");
			        	  key2.append(msg);
        	  		  }
        	  		});
        		});
        	});
    </script>
  </body>
</html>
