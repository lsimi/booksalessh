<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.util.PageManager"%>
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
    
    <%	 CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
     String hql = " from Imgadv where 1=1 ";
	 String url = "/booksalessh/admin/imgadv.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
		 hql+=" and (linkname like'%"+key+"%')";
	 url+="&key="+key;
	 }
	 	hql+=" order by id desc";
%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">滚动图片</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">滚动图片</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            <%String suc = (String)request.getAttribute("suc");
			if(suc!=null){%>
			    <div class="alert alert-info">
			        <button type="button" class="close" data-dismiss="alert">×</button>
			        	<%=suc %>
			        	<script type="text/javascript">
			        		location.href="admin/imgadv.jsp";
			        	</script>
		    	</div>
			<%}%>
				<div class="btn-toolbar">
					<div class="search-well">
						<button class="btn btn-primary" onclick="imgadvadd()" type="button"><i class="icon-plus"></i> 滚动广告</button>
					</div>  	
				</div>
			
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>缩略图片</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      <%String did = request.getParameter("did");
   if(did!=null)
   {
	   dao.delete(did,"Imgadv");
   }
   PageManager pageManager = PageManager.getPage("/booksalessh/admin/imgadv.jsp?1=1",10, request);
   pageManager.doList(hql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<Imgadv> list=( ArrayList<Imgadv>)bean.getCollection(); 
   	for(Imgadv imgadv:list){
	    %>
        <tr>
          <td><img src="upfile/<%=imgadv.getFilename() %>" height="25" width="800"/></td>
          <td>
              <a href="admin/imgadv.jsp?did=<%=imgadv.getId() %>" ><i class="icon-remove"></i></a>
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
    	function imgadvadd(){
			location.href="admin/imgadvadd.jsp";
        }
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
  </body>
</html>
