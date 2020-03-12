<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
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
<%
String id = request.getParameter("id");
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
Sysuser sysuser = (Sysuser)dao.findById(id,"Sysuser");
%>
  <body class="">
	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    
    
       <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">系统用户编辑</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">系统用户编辑</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
						<div class="alert alert-info" id="erroinfo" style="display: none">
				        	<button type="button" class="close" data-dismiss="alert">×</button>
			    		</div>
<div class="well">
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
		    <form id="form" action="useredit.action?id=<%=id %>" method="post">
		        <label>用户名</label>
		        <input type="text" value="<%=sysuser.getUsername() %>" id="username" name="username" class="input-xlarge span12" readonly="readonly" required>
		        <label>密码</label>
		        <input type="password" value="<%=sysuser.getUserpwd() %>" id="userpwd" name="userpwd" class="input-xlarge span12" required>
		        <label>姓名</label>
		        <input type="text"  value="<%=sysuser.getRealname() %>" id="realname" name="realname" class="input-xlarge span12" required>
		        <label>性别</label>
		        <select id="sex" name="sex" required>
		        	<option value="男" <%if(sysuser.getSex().equals("男")){out.print("selected==selected");} %>>男</option>
		        	<option value="女" <%if(sysuser.getSex().equals("女")){out.print("selected==selected");} %>>女</option>
		        </select>
		        <label>身份证号</label>
		        <input type="text" value="<%=sysuser.getIdcard() %>" id="idcard" name="idcard" class="input-xlarge span12" required>
		        <label>电话</label>
		        <input type="number" value="<%=sysuser.getTel() %>" id="tel" name="tel" class="input-xlarge span12" required>
		        <label>email</label>
		        <input type="text" value="<%=sysuser.getEmail() %>" id="email" name="email" class="input-xlarge span12" required>
		        <label>地址</label>
		        <input type="text" value="<%=sysuser.getAddr() %>" id="addr" name="addr" class="input-xlarge span12" required>
		        <label>用户角色</label>
		        <select id="usertype" name="usertype" class="input-xlarge span12" required>
		        	<option value="">请选择</option>
		        	<option value="管理员" <%if(sysuser.getUsertype().equals("管理员")){out.print("selected==selected");} %>>管理员</option>
		        </select>
		        <button class="btn btn-primary"><i class="icon-save"></i> Save</button>
		    </form>
      </div>
  </div>

</div>

<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Delete Confirmation</h3>
  </div>
  <div class="modal-body">
    
    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
    <button class="btn btn-danger" data-dismiss="modal">Delete</button>
  </div>
</div>
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