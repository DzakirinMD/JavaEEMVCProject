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

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Staff Dashboard</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

</head>

<body>
 <%  String ic = (String)session.getAttribute("currentSessionUser");%>
 <%  String name = (String)session.getAttribute("sessionKariahname");%>
 
 
	<!-- Left Panel -->

	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">

			<div class="navbar-header">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#main-menu" aria-controls="main-menu"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="./"><img src="images/logo.png"
					alt="Logo"></a>
				<!-- Logo Kat tepi panel -->
				<a class="navbar-brand hidden" href="./"><img
					src="images/logo2.png" alt="Logo"></a>
				<!-- Logo Kat tepi panel bila scroll-->
			</div>

			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/Test/AccountController?action=dashboard&ic=<c:out value="<%=ic%>"/>"> <i class="menu-icon fa fa-dashboard"></i>Dashboard</a></li> 
					<li class="active"><a href="/Test/AccountController?action=viewAccount&ic=<c:out value="<%=ic%>"/>"> <i class="menu-icon fa fa-user"></i>View Account</a></li>
					<li class="active"><a href="/Test/AccountController?action=updateAccount&ic=<c:out value="<%=ic%>"/>"> <i class="menu-icon fa fa-refresh"></i>Update Account</a></li> 
					<li class="active"><a href="/Test/EventController?action=KariahViewEvent&ic=<c:out value="<%=ic%>"/>"> <i class="menu-icon fa fa-tasks"></i>View Event</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->

	<!-- Left Panel -->

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">

			<div class="header-menu">

				<div class="col-sm-7">
					<a id="menuToggle" class="menutoggle pull-left"><i
						class="fa fa fa-tasks"></i></a>
					<div class="header-left">
						<button class="search-trigger">
							<i class="fa fa-search"></i>
						</button>
						<div class="form-inline">
							<form class="search-form">
								<input class="form-control mr-sm-2" type="text"
									placeholder="Search ..." aria-label="Search">
								<button class="search-close" type="submit">
									<i class="fa fa-close"></i>
								</button>
							</form>
						</div>
					</div>
				</div>

				<div class="col-sm-5">
					<div class="user-area dropdown float-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<h5>Welcome <c:out value="<%=name%>" />, Love to see you back.</h5>
						</a>

						<div class="user-menu dropdown-menu">
							<a class="nav-link" href="/Test/AccountController?action=viewAccount&email=<c:out value="<%=ic%>"/>"><i class="fa fa-user"></i> MyProfile</a> 
                            <a class="nav-link" href="/Test/kariah/logout.jsp"><i class="fa fa-power-off"></i> Logout</a>
						</div>
					</div>

				</div>
			</div>

		</header>
		<!-- /header -->
		<!-- Header-->

		<!-- CONTENT -->

		<div class="content mt-3">
			<div class="animated fadeIn">


  <!-- Indoor -->			
<h2>Indoor Event</h2>    
  <table class="table table-hover">
    <thead>
      	<tr>
			<th >Event ID</th>
			<th >Event Name</th>
			<th >Staff in charges</th>
			<th >Event Fee</th>
			<th >Date/Time Begin</th>
			<th >Date/Time End</th>
			<th >Event creator</th>
			<th >Venue</th>
			<th >Guest Name</th>
			<th ></th>
			
		</tr>
    </thead>
    <tbody>
     <c:forEach items="${ievents}" var="ievent">
     	
                <tr>
                    <td><c:out value="${ievent.eventid}" /></td>
                    <td><c:out value="${ievent.eventname}" /></td>
                    <td><c:out value="${ievent.eventstaffincharges}" /></td>
                    <td><c:out value="${ievent.eventfee}" /></td>
                    <td><c:out value="${ievent.eventdatestarttime}" /></td>
                    <td><c:out value="${ievent.eventdateendtime}" /></td>
                    <td><c:out value="${ievent.staffid}" /></td>
                     <td><c:out value="${ievent.indoorvenue}" /></td>
                    <td><c:out value="${ievent.indoorguestname}" /></td>
    
                   
                    <td><button onclick="location.href='http://google.com';" type="button" class="btn btn-secondary"><i class="fa fa-refresh"></i>&nbsp; Join</button></td>
                   
                </tr>
        </c:forEach>
    </tbody>
  </table>
  
  <!-- Outdoor -->
  			
<h2>Outdoor Event</h2>    
  <table class="table table-hover">
    <thead>
      	<tr>
			<th >Event ID</th>
			<th >Event Name</th>
			<th >Staff in charges</th>
			<th >Event Fee</th>
			<th >Date/Time Begin</th>
			<th >Date/Time End</th>
			<th >Event creator</th>
			<th >Place</th>
			<th >Organizer Name</th>
			<th ></th>
			
		</tr>
    </thead>
    <tbody>
     <c:forEach items="${oevents}" var="oevent">
     	
                <tr>
                    <td><c:out value="${oevent.eventid}" /></td>
                    <td><c:out value="${oevent.eventname}" /></td>
                    <td><c:out value="${oevent.eventstaffincharges}" /></td>
                    <td><c:out value="${oevent.eventfee}" /></td>
                    <td><c:out value="${oevent.eventdatestarttime}" /></td>
                    <td><c:out value="${oevent.eventdateendtime}" /></td>
                    <td><c:out value="${oevent.staffid}" /></td>
                     <td><c:out value="${oevent.outdoorplace}" /></td>
                    <td><c:out value="${oevent.organizername}" /></td>
    
                   
                    <td><button onclick="location.href='http://google.com';" type="button" class="btn btn-secondary"><i class="fa fa-refresh"></i>&nbsp; Join</button></td>
                   
                </tr>
        </c:forEach>
    </tbody>
  </table>
			
			



			</div>
			<!-- End of animate -->
		</div>
		<!-- end of mt-3 -->
		<!-- .CONTENT -->
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
	<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/js/main.js"></script>


	<script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
	<script src="assets/js/dashboard.js"></script>
	<script src="assets/js/widgets.js"></script>
	<script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
	<script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>

	<script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
   

</body>

</html>
