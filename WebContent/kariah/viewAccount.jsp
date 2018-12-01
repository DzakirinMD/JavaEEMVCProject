<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("currentSessionUser")==null)
      response.sendRedirect("/Test/login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="ISO-8859-1">
<title>My Account</title>
<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<%	String ic = (String)session.getAttribute("currentSessionUser");%>

<div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Kariah Page</a> 
            </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				   <li class='active'><a href="/Test/customer/index.jsp"><i class="fa fa-dashboard fa-3x"></i>Home</a></li>
				   <li><a href="/Test/customer/menu.jsp"><i class="fa fa-edit fa-3x"></i>Register Event</a></li>
				   <li><a href="/Test/OrderController?action=listOrder&ic=<c:out value="<%=ic%>"/>"><i class="fa fa-desktop fa-3x"></i>Event Listing</a></li> 
				   <li><a href="/Test/AccountController?action=viewAccount&ic=<c:out value="<%=ic%>"/>"><i class="fa fa-desktop fa-3x"></i>My Account </a></li>
				   <li><a href="/Test/customer/logout.jsp"><i class="fa fa-square-o fa-3x"></i>Logout</a></li>
				</ul>
			</div>
   </div>
	</nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>My Account</h2>   
                        <h5>Welcome <b><c:out value="<%=ic%>" /></b> , Love to see you back. </h5>
                       
                    </div>
                </div>
        <!-- /. ROW  -->
                 <hr />
               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
	<p><b>IC:</b> <c:out value="<%=ic%>" /></p>	
	<p><b>Name:</b> <c:out value="${user.kariahname}" /></p>
	<p><b>Address:</b> <c:out value="${user.kariahaddress}" /></p>
	<p><b>Phone:</b> <c:out value="${user.kariahnotel}" /></p>
	<p><b>Email:</b> <c:out value="${user.kariahemail}" /></p>
	<p><b>Gender:</b> <c:out value="${user.kariahgender}" /></p>
    <br/>
    <p><a href="AccountController?action=updateAccount&ic=<c:out value="<%=ic%>" />">
    <b>Update Account</b></a></p>
  	</div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
</body>
</html>