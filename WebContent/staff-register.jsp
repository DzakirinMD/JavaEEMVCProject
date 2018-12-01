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
<!-- Special staff register -->
<script>
function clearInputs() {
	   document.getElementById('myTextarea').value = '';
	}

	function validateForm() {

	    var name = document.forms["myForm"]["name"].value;
	    var address = document.getElementById("myTextarea").value;
	    var phone = document.forms["myForm"]["notel"].value;
	    var email = document.forms["myForm"]["email"].value;
	    var password = document.forms["myForm"]["password"].value;
	  
	    if (name == "") {
	        document.getElementById("errorname").innerHTML = "Name cannot be empty !";
	        return false; 
	    } else if (/^[a-zA-Z.]{1,50}$/.test(name) != true) {
	        document.getElementById("errorname").innerHTML = "name is less than 50 character";
	        return false;
	    } else if (address == "") {
	        document.getElementById("erroraddress").innerHTML = "Address cannot be empty !";
	        document.getElementById("errorname").innerHTML = "";
	        return false;
	    } else if (phone == "") {
	        document.getElementById("errorphone").innerHTML = "Phone Number cannot be empty !";
	        document.getElementById("erroraddress").innerHTML = "";
	        document.getElementById("errorname").innerHTML = "";
	        return false;
	    } else if (isNaN(phone) == true) {
	        document.getElementById("errorphone").innerHTML = "Please enter number only !";
	        return false;
	    } else if (email == "") {
	        document.getElementById("erroremail").innerHTML = "Email cannot be empty !";
	        document.getElementById("errorphone").innerHTML = "";
	        document.getElementById("erroraddress").innerHTML = "";
	        document.getElementById("errorname").innerHTML = "";
	        return false;
	    } else if (/^[^0-9][A-z0-9_]+[@][A-z0-9_]+([.][A-z0-9_]+)*[.][A-z]{2,4}$/.test(email) != true) {
	        document.getElementById("erroremail").innerHTML = "Your e-mail is NOT valid. Try again...";
	        return false;
	    } else if (password == "") {
	        document.getElementById("errorpassword").innerHTML = "Password cannot be empty !";
	        document.getElementById("erroremail").innerHTML = "";
	        document.getElementById("errorphone").innerHTML = "";
	        document.getElementById("erroraddress").innerHTML = "";
	        document.getElementById("errorname").innerHTML = "";
	        return false;
	    } else if (/^[a-zA-Z0-9.]{5,12}$/.test(password) != true) {
	        document.getElementById("errorpassword").innerHTML = "Password 5 - 12 characters only";
	        document.getElementById("erroremail").innerHTML = "";
	        document.getElementById("errorphone").innerHTML = "";
	        document.getElementById("erroraddress").innerHTML = "";
	        document.getElementById("errorname").innerHTML = "";
	        return false;
	    } 
	    document.getElementById("errorpassword").innerHTML = "";
	    alert("Registration Successfull !");   
	}


</script>




</head>

<body>
	<%  String email = (String)session.getAttribute("currentSessionUser");%>
	<%  String name = (String)session.getAttribute("sessionStaffname");%>

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
					<li class="active"><a href="/Test/StaffAccountController?action=updateAccount&email=<c:out value="<%=email%>"/>"> <i class="menu-icon fa fa-user"></i>Update Account</a></li> 
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<h5>
								Welcome
								<c:out value="<%=name%>" />
								, Love to see you back.
							</h5>
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
						<strong>Registration Form</strong>  
					</div>
					<div class="card-body card-block">
						<form name="myForm" onsubmit="return validateForm()" method="post" action="StaffAccountController" class="form-horizontal">
							<div class="row form-group">
                              	<div class="col-12 col-md-9"><input type="hidden" id="disabled-input" name="idadmin" value="<c:out value="${user.staffID}" />" class="form-control"></div>
                          	</div>
							<div class="row form-group">
                         		<div class="col col-md-3"><label for="text-input" class=" form-control-label">Name :</label></div>
                            	<div class="col-12 col-md-9"><input type="text" id="text-input" name="name" placeholder="Enter Name.." class="form-control"><span class="help-block" id="errorname" style="color:red;"></span></div>
                            </div>
                            <div class="row form-group">
                              	<div class="col col-md-3"><label for="textarea-input" class=" form-control-label">Home Address</label></div>
								<div class="col-12 col-md-9"><textarea name="address" id="myTextarea" rows="9" cols="53" form="myform"  placeholder="Enter Address.." class="form-control"></textarea><span class="help-block" id="erroraddress" style="color:red;"> </span></div>
                            </div>
                            <div class="row form-group">
                         		<div class="col col-md-3"><label for="text-input" class=" form-control-label">Phone Number :</label></div>
                            	<div class="col-12 col-md-9"><input type="text" id="text-input" name="notel" placeholder="Enter Phone Number.." class="form-control"><span class="help-block" id="errorphone" style="color:red;"></span></div>
                            </div>
							<div class="row form-group">
								<div class="col col-md-3"><label for="hf-email" class=" form-control-label">Email</label></div>
								<div class="col-12 col-md-9"><input type="email" id="hf-email" name="email" placeholder="Enter Email..." class="form-control"><span class="help-block" id="erroremail" style="color:red;"></span></div> 
							</div>
							<div class="row form-group">
                            	<div class="col col-md-3"><label class=" form-control-label">Position</label></div>
                            	<div class="col col-md-9">
                                <div class="form-check">
                                	<div class="radio">
                                		<label for="radio1" class="form-check-label ">
                                    		<input type="radio" id="radio1" name="position" value="Imam" class="form-check-input" checked="checked">Imam 
                                   		</label>
                                	</div>
                                	<div class="radio">
                                		<label for="radio1" class="form-check-label ">
                                    		<input type="radio" id="radio1" name="position" value="Bilal" class="form-check-input">Bilal
                                   		</label>
                                	</div>
                                	<div class="radio">
                                		<label for="radio1" class="form-check-label ">
                                    		<input type="radio" id="radio1" name="position" value="Staff" class="form-check-input">Staff
                                   		</label>
                                	</div>
                                </div>
                                </div>
                                </div>
							<div class="row form-group">
                         		<div class="col col-md-3"><label for="text-input" class=" form-control-label">Manager ID :</label></div>
                            	<div class="col-12 col-md-9"><input type="text" id="text-input" name="managerid" placeholder="Please leave it empty if the staff don't have a manager" class="form-control"><span class="help-block" id="errorname" style="color:red;"> </span></div>
                            </div>																	
							<div class="row form-group">
								<div class="col col-md-3"><label for="hf-password" class=" form-control-label">Password</label></div>
								<div class="col-12 col-md-9"><input type="password" id="hf-password" name="password" placeholder="Password 5 - 12 characters only" class="form-control"><span class="help-block" id="errorpassword" style="color:red;"></span>
								</div>
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
