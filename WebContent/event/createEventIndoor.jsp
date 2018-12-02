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
	
<!-- JS untuk time picker.. perlukan internet -->	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

<!-- Special staff register -->
<script>
function clearInputs() {
	   document.getElementById('myTextarea').value = '';
	}
	
	function validateForm() {

	    var eventname = document.forms["myForm"]["iname"].value;
	    var staffincharge = document.forms["myForm"]["istaffincharges"].value;
	    var fee = document.forms["myForm"]["ifee"].value;
	    var venue = document.getElementById("myTextarea").value; 
	    var igname = document.forms["myForm"]["igname"].value;
	    
	    if (eventname == "") {
	        document.getElementById("errorevent").innerHTML = "Event cannot be empty !";
	        return false; 
	    } else if (staffincharge == "") {
	        document.getElementById("errorstaffincharge").innerHTML = "Staff in charges cannot be empty !";
	        document.getElementById("errorevent").innerHTML = "";
	        return false;
	    } else if (isNaN(fee) == true) {
	        document.getElementById("errorfee").innerHTML = "Please enter number only !";
	        document.getElementById("errorevent").innerHTML = "";
	        document.getElementById("errorstaffincharge").innerHTML = "";
	        return false;
	    } else if (venue == "") {
	        document.getElementById("errorvenue").innerHTML = "Venue cannot be empty !";
	        document.getElementById("errorevent").innerHTML = "";
	        document.getElementById("errorstaffincharge").innerHTML = "";
	        document.getElementById("errorfee").innerHTML = "";
	        return false;
	    } else if (igname == "") {
	        document.getElementById("errorguest").innerHTML = "Guest name cannot be empty !";
	        document.getElementById("errorvenue").innerHTML = "";
	        document.getElementById("errorevent").innerHTML = "";
	        document.getElementById("errorstaffincharge").innerHTML = "";
	        document.getElementById("errorfee").innerHTML = "";
	        return false;
	    } 
	    alert("Registration Successfull !");   
	}
</script>


</head>

<body>
<%  String email = (String)session.getAttribute("currentSessionUser");%>
<%  String name = (String)session.getAttribute("sessionStaffname");%>
<%  String id = (String)session.getAttribute("sessionStaffID");%>
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
					<li class="active"><a href="/Test/StaffAccountController?action=dashboard&email=<c:out value="<%=email%>"/>"> <i class="menu-icon fa fa-dashboard"></i>Dashboard</a></li> 
					<% if(name.equalsIgnoreCase("admin")) { %> 
					<li class="active"><a href="/Test/StaffAccountController?action=registerStaff&email=<c:out value="<%=email%>"/>"> <i class="menu-icon fa fa-pencil-square-o"></i>Register Staff</a><% } %></li>
					<li class="active"><a href="/Test/StaffAccountController?action=viewAccount&email=<c:out value="<%=email%>"/>"> <i class="menu-icon fa fa-user"></i>View Account</a></li>
					<li class="active"><a href="/Test/StaffAccountController?action=updateAccount&email=<c:out value="<%=email%>"/>"> <i class="menu-icon fa fa-refresh"></i>Update Account</a></li> 
					<li class="active"><a href="/Test/EventController?action=viewEvent&id=<c:out value="<%=id%>"/>"> <i class="menu-icon fa fa-tasks"></i>View Event</a></li>
					<li class="active"><a href="/Test/EventController?action=createIndoorEvent&id=<c:out value="<%=id%>"/>"> <i class="menu-icon fa fa-building-o"></i>Create Indoor Event</a></li> 
					<li class="active"><a href="/Test/EventController?action=createOutdoorEvent&id=<c:out value="<%=id%>"/>"> <i class="menu-icon fa fa-rocket"></i>Create Outdoor Event</a></li>				
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
							<a class="nav-link" href="/Test/StaffAccountController?action=viewAccount&email=<c:out value="<%=email%>"/>"><i class="fa fa-user"></i> MyProfile</a> 
							<a class="nav-link" href="/Test/staff/logout.jsp"><i class="fa fa-power-off"></i> Logout</a>
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

				<div class="card">
					<div class="card-header">
						<strong>Indoor Event Form</strong>  
					</div>
					<div class="card-body card-block">
						<form name="myForm" onsubmit="return validateForm()" method="post" action="EventController" class="form-horizontal">
						<div class="row form-group">
                              	<div class="col-12 col-md-9"><input type="hidden" id="disabled-input" name="idadmin" value="<c:out value="${user.staffID}" />" class="form-control"></div>
                        </div>		
						<!-- PARENT EVENT -->					
							<div class="row form-group">
                         		<div class="col col-md-3"><label for="text-input" class=" form-control-label">Event Name :</label></div>
                            	<div class="col-12 col-md-9"><input type="text" id="text-input" name="iname" placeholder="Enter Event Name.." class="form-control"><span class="help-block" id="errorevent" style="color:red;"></span></div>
                            </div>
                            <div class="row form-group">
                         		<div class="col col-md-3"><label for="text-input" class=" form-control-label">Staff in charges :</label></div>
                            	<div class="col-12 col-md-9"><input type="text" id="text-input" name="istaffincharges" placeholder="Enter Names of staff in charge for the event.." class="form-control"><span class="help-block" id="errorstaffincharge" style="color:red;"></span></div>
                            </div>                         
                            <div class="row form-group">
                         		<div class="col col-md-3"><label for="text-input" class=" form-control-label">Event fee :</label></div>
                            	<div class="col-12 col-md-9"><input type="text" id="text-input" name="ifee" placeholder="0" class="form-control" value=0><small>write 0 for free event</small><span class="help-block" id="errorfee" style="color:red;"></span></div>
                            </div>                         
            				<div class="row form-group">
            					<div class="col col-md-3"><label for="text-input" class=" form-control-label">Event Start Date/Time :</label></div>
              					<div class="input-group date col-12 col-md-9" id="datetimepicker1" data-target-input="nearest">
                   			  	<input type="text" name="istartdatetime" class="form-control datetimepicker-input" data-target="#datetimepicker1"/>
                    				<div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                        			<div class="input-group-text"><i class="fa fa-calendar"></i>
                        			</div>
                   					</div>
                				</div>
            				</div>
            				<div class="row form-group">
            					<div class="col col-md-3"><label for="text-input" class=" form-control-label">Event End Date/Time :</label></div>
              					<div class="input-group date col-12 col-md-9" id="datetimepicker2" data-target-input="nearest">
                   			  	<input type="text" name="ienddatetime" class="form-control datetimepicker-input" data-target="#datetimepicker2"/>
                    				<div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                        			<div class="input-group-text"><i class="fa fa-calendar"></i>
                        			</div>
                   					</div>
                				</div>
            				</div>
        					<div class="row form-group">
                              	<div class="col-12 col-md-9"><input type="hidden" id="disabled-input" name="idadmin" value="<c:out value="${user.staffID}" />" class="form-control"></div>
                              	<input type="hidden" name="indoor" value="indoor" />
                              	<input type="hidden" name="outdoor" value="indoor" />
                          	</div>
                          	
  						<!-- CHILD EVENT -->
        					<div class="row form-group">
                              	<div class="col col-md-3"><label for="textarea-input" class=" form-control-label">Indoor Venue </label></div>
								<div class="col-12 col-md-9"><textarea name="ivenue" id="myTextarea" rows="9" cols="53" form="myform"  placeholder="Enter Indoor Venue.." class="form-control"></textarea><span class="help-block" id="errorvenue" style="color:red;"> </span></div>
                            </div>
         					<div class="row form-group">
                         		<div class="col col-md-3"><label for="text-input" class=" form-control-label">Guest Name :</label></div>
                            	<div class="col-12 col-md-9"><input type="text" id="text-input" name="igname" placeholder="Enter Guest Name.." class="form-control"><span class="help-block" id="errorguest" style="color:red;"></span></div>
                            </div>
							<div class="card-footer">
								<button type="submit" id="submit" class="btn btn-primary btn-sm">
									<i class="fa fa-dot-circle-o"></i> Submit
								</button>
								<button type="reset" onclick="clearInputs()" class="btn btn-danger btn-sm">
									<i class="fa fa-ban"></i> Reset
								</button>
							</div>
						</form>
					</div>
					
				</div>




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
	<!-- Script untuk date time picker -->
	      <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker2').datetimepicker();
            });
        </script>
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
