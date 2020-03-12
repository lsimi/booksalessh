<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.model.Goods"%>
<%@page import="com.model.Dddetail"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理系统</title>
    
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
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
    
    

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    
    <%String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");%>
    
    <div class="content">
        
        <div class="header">


            <h1 class="page-title">Home</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">销售量分析</li>
        </ul>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
        <div class="container-fluid">
            <div class="row-fluid">
                    
<%Sysuser admin = (Sysuser)session.getAttribute("admin");
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
String hql = " from Goods where delstatus='0'";

ArrayList<Goods> list = (ArrayList<Goods>)dao.findByHql(hql);
ArrayList<HashMap> rslist = new ArrayList<HashMap>();
for(Goods gd:list){
	HashMap m = new HashMap();
	String hql1 = " from Dddetail where goodid='"+gd.getId()+"'";

	ArrayList<Dddetail> numlist = (ArrayList<Dddetail>)dao.findByHql(hql1);
	int a = 0;
	for(Dddetail dddetail:numlist){
		a+=Integer.valueOf(dddetail.getSl());
	}
	m.put("goodname",gd.getGoodname());
	m.put("sl",a);
	rslist.add(m);
}
%>
<div class="row-fluid">
    <div class="block">
        <a href="#page-stats" class="block-heading" data-toggle="collapse">销售量分析</a>
        <div id="page-stats" class="block-body collapse in">

            <div class="stat-widget-container">
                <div id="chartdiv" align="center"> FusionCharts. </div>
  	<script language="JavaScript" src="/booksalessh/admin/FusionCharts.js"></script>
  	 <script type="text/javascript">
		var chart = new FusionCharts("/booksalessh/admin/FCF_Column3D.swf", "ChartId", "900", "300");
		var xmlstr = "<graph showNames='1'  decimalPrecision='0'  > "+
		<%
		
//String sql = "select outtime,count(*) as sl from cwtocar where outtime is not null group by outtime  ";

		
		for(HashMap mm:rslist){
		 %>
		  "   <set name='<%=mm.get("goodname")%>' value='<%=mm.get("sl")%>'/> "+
		<%}%>
		  "   </graph>"; 
		   chart.setDataXML(xmlstr);		   
		   chart.render("chartdiv");
		</script>

              

            </div>
        </div>
    </div>
</div>





                    
                  <!--    <footer>
                        <hr>
                        <p class="pull-right">Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>

                        <p>&copy; 2012 <a href="#" target="_blank">Portnine</a></p>
                    </footer>
                    -->
            </div>
        </div>
    </div>
    


    <script src="/booksalessh/admin/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
  </body>
</html>
