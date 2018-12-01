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
		response.sendRedirect("/Test/stafflogin.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Create Event</title>
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
	<%	String email = (String)session.getAttribute("currentSessionUser");%>

<div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Create Event Page</a> 
            </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				   <li ><a href="/Test/staff/index.jsp"><i class="fa fa-dashboard fa-3x"></i>Home</a></li>
				   <li ><a href="/Test/EventController?action=indoorEvent&email=<c:out value="<%=email%>"/>"><i class="fa fa-edit fa-3x"></i>Create Indoor Event </a></li> 
				   <li class='active'><a href="/Test/EventController?action=outdoorEvent&email=<c:out value="<%=email%>"/>"><i class="fa fa-edit fa-3x"></i>Create Outdoor Event </a></li> 
				   <li><a href="/Test/StaffAccountController?action=viewAccount&email=<c:out value="<%=email%>"/>"><i class="fa fa-desktop fa-3x"></i>My Staff Account </a></li>
				   <li><a href="/Test/staff/logout.jsp"><i class="fa fa-square-o fa-3x"></i>Logout</a></li>
				</ul>
			</div>
   </div>
	</nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Creating Event Form</h2>   
                        <h5>Hi <c:out value="<%=email%>" /> fill in the form to create outdoor event</h5>
                    </div>
                </div>
        <!-- /. ROW  -->
                 <hr />
               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Create Outdoor Event
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">  
	<form method="post" action="EventController">
	<!-- parent form -->
		<div class="form-group">
		<label>Event ID:</label><br>
		<input type="text" name="eventid">
		</div>
		<div class="form-group">
		<label>Event Name:</label><br>
		<input type="text" name="eventname" >
		</div><div class="form-group">
		<label>Number of staff Involve:</label><br>
		<input type="text" name="eventinvolve">
		</div>
		<div class="form-group">
		<label>Staff in charge:</label><br>
		<input type="text" name="eventcharge">
		</div>
		<div class="form-group">
		<label>Your ID:</label><br>
		<input type="text" name="staffid" value="<c:out value="${user.staffID}" />" readonly>
		</div>
		
		
	<!-- Child form -->
		<div class="form-group">
		<label>Outdoor No:</label><br>
		<input type="text" name="oeventid" >
		</div>
		<div class="form-group">
		<label>Place:</label><br>
		<input type="text" name="oeventplace">
		</div>
		<div class="form-group">
		<label>Date:</label><br>
		<input type="text" name="oeventdate" placeholder="dd/mm/yyyy">
		</div>
		<div class="form-group"> 
		<label>Start Time: </label><br> 
		<input type="time" name="oeventstime">
		</div>
		<div class="form-group"> 
		<label>End Time: </label><br> 
		<input type="time" name="oeventetime" >
		</div>
		<div class="form-group"> 
		<label>Organization Name:</label><br>
		<input type="text" name="oeventorganizer" >
		</div>

		<br> <input class="btn btn-success" type="submit" value="Submit">
		<input class="btn btn-danger" type="reset" value="Reset">
	</form>
</div>
       </div>
      </div>
     </div>
     <!-- End Form Elements -->
   </div>
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