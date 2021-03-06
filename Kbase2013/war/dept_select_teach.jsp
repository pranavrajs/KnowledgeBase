<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,javax.servlet.http.*,java.util.*,com.kbase.app.server.*,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory" %>
<% 
    if ((session.getAttribute("email_admin") == null) || (session.getAttribute("email_admin") == "")) {
			response.sendRedirect("kbase.jsp");
		} else {
			if(!session.getAttribute("dept_no").equals("0"))
				response.sendRedirect("tchr_dash.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Dashboard - Knowledge Base</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="kbase.jsp">Knowledge Base</a>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i> Account <b class="caret"></b></a>
            <ul class="dropdown-menu" style="border-radius:0;">
              <li><a href="javascript:;">Settings</a></li>
              <li><a href="javascript:;">Help</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> <%=session.getAttribute("email_admin")%><b class="caret"></b></a>
            <ul class="dropdown-menu" style="border-radius:0;">
              <li><a href="logout.jsp">Logout</a></li>
            </ul>
          </li>
        </ul>
        <form class="navbar-search pull-right">
          <input type="text" class="search-query" style="border-radius:0;" placeholder="Search">
        </form>
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<div class="subnavbar">
</div>
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
				
         
        <div class="span12" style="min-height:300px;">
          <div class="widget widget-nopad">
            <!-- /widget-header -->
            <div class="widget-header"> <i class="icon-th-list"></i>
              <h3>Select your Department</h3>
            </div>
            <div class="widget-content" style="min-height:300px;">
              <div class="widget big-stats-container">
              			<div class="subnavbar"></div>
							<div class="span6">
										<form action="update_dept" method="post">
                  <p>Select your Department :</p> 
						               
                  <select name="dept_id">
							<option value="0">Nil</option>                  
<%
		PersistenceManager pm_dept_sel = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm_dept_sel.newQuery("SELECT FROM com.kbase.app.server.Department WHERE uty_id == " + session.getAttribute("uty_id"));
			@SuppressWarnings("unchecked")
			List<Department> result = (List<Department>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Department d : result)
				{
				
						String u_name = (String) d.getName();
						Long id = d.getId();
						
					%>
					
						<option value="<%	out.print(id.toString());%>"><%	out.println(u_name);%></option>					
						
					<%				
				}
				
			}		
		}
		finally
		{
			pm_dept_sel.close();
		}
 %>
					</select>
					<br />
					<input type="submit" class="btn btn-primary" value="Update" >
					</form>		
					<br />
					<p style="text-align:justify;"> 
						KnowledgeBase is an online platform where you can access the resources of your university , we are simply importing your classroom to an online virtual class. You have your teachers to guide you here. Knowledge Base focus on creating Digital Literacy all over India					
					</p>		
            			</div>
            			<div class="span3">
               		 	<img src="img/book.jpg" style="margin:10%;margin-left:50%;width:80%" alt="Book" style="border:0;" />
            			</div>      
            			<div class="subnavbar"></div>
							      
              </div><!-- big-stats -->
            </div><!--  -->
         </div>
        </div>
        <!-- /span12 --> 
    
    
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->
<%@ include file="footer.jsp" %>
<%
    }
%>