<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (session.getAttribute("currentSessionUser") == null)
		response.sendRedirect("/Test/login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="ISO-8859-1">
<title>Update Account</title>
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
                <a class="navbar-brand" href="index.html">Manage Account Page</a> 
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
                     <h2>Update Account</h2>   
                        <h5><p>Current IC: <b><c:out value="<%=ic%>" /></b></p> </h5>
                    </div>
                </div>
        <!-- /. ROW  -->
                 <hr />
               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Update Staff Information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">   
	<form method="post" action="AccountController">
		<div class="form-group">
		<label>Your IC:</label><br> 
		<input type="text" name="ic" value="<c:out value="<%=ic%>" />" readonly>
		</div>
		<div class="form-group">
		<label>New Email:</label><br>
		<input type="email" name="email" value="<c:out value="${user.kariahemail}" />" required>
		</div>
		<div class="form-group">
		<label>New Address:</label><br>
		<input type="text" name="address" value="<c:out value="${user.kariahaddress}" />" required>
		</div>
		<div class="form-group">
		<label>New Phone:</label><br> 
		<input type="text" name="notel" value="<c:out value="${user.kariahnotel}" />" required>
		</div>
		<div class="form-group">
		<label>New Password:</label><br> 
		<input type="password" name="password" value="<c:out value="${user.password}" />" required>
		</div>
		 <br> <input  class="btn btn-success" type="submit" value="Submit">
		<input  class="btn btn-danger" type="reset" value="Reset">
	</form>
</body>
</html>