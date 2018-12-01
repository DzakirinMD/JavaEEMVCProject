<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("currentSessionUser")==null)
      response.sendRedirect("/PizzaOrdering/login.jsp");

%> 

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title></title>
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="../css/zerogrid.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/menu.css">
	<link rel="stylesheet" href="../css/responsiveslides.css">
	<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<script src="../js/jquery-latest.min.js"></script>
	<script src="../js/script.js"></script>
    <script src="../js/jquery183.min.js"></script>
    <script src="../js/responsiveslides.min.js"></script>
    <script>
		// You can also use "$(window).load(function() {"
		$(function () {
		  // Slideshow 
		  $("#slider").responsiveSlides({
			auto: true,
			pager: false,
			nav: true,
			speed: 500,
			namespace: "callbacks",
			before: function () {
			  $('.events').append("<li>before event fired.</li>");
			},
			after: function () {
			  $('.events').append("<li>after event fired.</li>");
			}
		  });
		});
	</script>
	
	
	<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->
    
</head>
<body>
<div class="wrap-body">
<%	String email = (String)session.getAttribute("currentSessionUser");%>

<!-- /////////////////////////////////////////Top -->
<div class="top">
	<div class="zerogrid">
		<div class="row">
			<div class="f-left">
				<span><i class="fa fa-map-marker"></i> Jasin </span>
				<span><i class="fa fa-phone"></i> 06-26401111</span>
				<span><i class="fa fa-envelope"></i> jasinpizza@gmail.com</span>
			</div>
			<div class="f-right">
			</div>
		</div>
	</div>
</div>

<!--////////////////////////////////////Header-->
<header>
	<div class="wrap-header zerogrid">
		<div class="row">
			<div id="cssmenu">
				<ul>
				   <li><a href="/PizzaOrdering/customer/index.jsp">Home</a></li>
				   <li class='active'><a href="/PizzaOrdering/customer/menu.jsp">Menu</a></li>
				   <li><a href="/PizzaOrdering/OrderController?action=listOrder&email=<c:out value="<%=email%>"/>">My Order </a></li> 
				   <li><a href="/PizzaOrdering/AccountController?action=viewAccount&email=<c:out value="<%=email%>"/>">My Account </a></li>
				   <li><a href="/PizzaOrdering/customer/logout.jsp">Logout</a></li>
				</ul>
			</div>
			<a href='index.html' class="logo"><img src="" /></a>
		</div>
	</div>
</header>

<div class="bg-white">
	<div class="zerogrid">
	
	<div class="widget wid-gallery">
						<div class="wid-header">
							<h5>Pizza</h5>
						</div>
						<div class="wid-content">
							<img src="../images/pizza-1.jpg">
							<img src="../images/pizza-2.png">
							<img src="../images/pizza-3.png">
							<img src="../images/pizza-4.jpg">
						</div>
	</div>
	
<div class="widget wid-gallery">
						<div class="wid-header">
							<h5>Side Order</h5>
						</div>
						<div class="wid-content">
							<img src="../images/side-1.png">
							<img src="../images/side-2.jpg">
							<img src="../images/side-3.png">
							<img src="../images/side-4.jpg">
						</div>
	</div>
	
	<div class="widget wid-gallery">
						<div class="wid-header">
							<h5>Drinks</h5>
						</div>
						<div class="wid-content">
							<img src="../images/drinks-1.jpg">
							<img src="../images/drinks-2.jpg">
							<img src="../images/drinks-3.jpg">
							<img src="../images/drinks-4.jpg">
						</div>
	</div>
	
	<div class="clear"></div>
	</div>
</div>

<!--////////////////////////////////////Footer-->

<div class="copyright">
	<div class="zerogrid wrapper">
		Copyright 2017
	</div>
</div>

</div>
</body></html>