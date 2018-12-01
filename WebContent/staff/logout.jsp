<%@ page language="java" 
      contentType="text/html; charset=windows-1256"
      pageEncoding="windows-1256"
   %>
   <% 
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", 0);
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
	<title>Jasin Pizza</title>
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="css/zerogrid.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/menu.css">
	<link rel="stylesheet" href="css/responsiveslides.css">
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<script src="js/jquery-latest.min.js"></script>
	<script src="js/script.js"></script>
    <script src="js/jquery183.min.js"></script>
    <script src="js/responsiveslides.min.js"></script>
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
				   <li class='active'><a href="index.html">Home</a></li>
				   <li><a href="menu.html">Menu</a></li>
				   <li><a href="contact.html">Contact</a></li>
				   <li><a href="stafflogin.jsp">staff-Login</a></li>
				</ul>
			</div>
			<a href='index.html' class="logo"><img src="" /></a>
		</div>
	</div>
</header>


<!--////////////////////////////////////Container-->
<section id="container" class="home-page">
	<div class="wrap-container clearfix">
		<div id="main-content">
			<section><!--Start Box-->
				<div class="wrap-box">
					<div class="zerogrid">
						<div class="row">
							<div class="col-2-3">
								<div class="wrap-col">
									<div>
									<% 
									session.setAttribute("currentSessionUser", null);
									session.invalidate();
									response.sendRedirect("/Test/staff-login.jsp");%>
									<p>You have been successfully logout</p>
									</div>
								</div>
							</div>
							<div class="col-1-3">
								<div class="wrap-col">
									<div class="sub-title">
										<h2></h2>
									</div>
									
								</div>
							</div>
							<div class="col-1-3">
								<div class="wrap-col">
									<div class="sub-title">
										<h2></h2>
									</div>
									
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
		</div>
	</div>
</section>

</div>
</body></html>