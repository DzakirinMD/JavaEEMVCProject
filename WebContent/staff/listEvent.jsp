<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("currentSessionUser")==null)
      response.sendRedirect("/Test/stafflogin.jsp");

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
  	<link rel="stylesheet" href="css/zerogrid.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/menu.css">
	<link rel="stylesheet" href="css/responsiveslides.css">
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<style>
	
	table, td, th {
	font-family: "Oswald",Arial,Helvetica,"Nimbus Sans L",sans-serif;
    border: 1px solid #FFCD02;
    text-align: left;
    }

	table {
    	width: 100%;
	}	

	th, td {
    padding-left: 10px;
	}
	
	th {
    background-color: #FFCD02;
    color: white;
    font-size:20px;
	}
	
	td{
	font-size:18px;
	}
	
	p {
	font-family: "Oswald",Arial,Helvetica,"Nimbus Sans L",sans-serif;
    font-size:18px;
    }
	</style>
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
				   <li><a href="/Test/customer/index.jsp">Home</a></li>
				   <li><a href="/Test/customer/menu.jsp">Menu</a></li>
				   <li class='active'><a href="/Test/EventController?action=listEvent&email=<c:out value="<%=email%>"/>">My Order </a></li> 
				   <li><a href="/Test/AccountController?action=viewAccount&email=<c:out value="<%=email%>"/>">My Account </a></li>
				   <li><a href="/Test/customer/logout.jsp">Logout</a></li>
				</ul>
			</div>
			<a href='index.html' class="logo"><img src="" /></a>
		</div>
	</div>
</header>

<div class="bg-white">
	<div class="zerogrid">
	<p>Welcome <b><c:out value="<%=email%>" /></b></p>
	<br/><h1>My Order</h1> 
	<br/><br/>
	
	<!-- START OF TABLE -->
	
	<table>
            <tr>
                <th>Order Id</th>
                <th>Crust</th>
                <th>Extra Cheese</th>
                <th>Topping</th>
                <th>Quantity</th>
            </tr>
        <c:forEach items="${events}" var="pizza">
                <tr>
                    <td><c:out value="${event.eventid}" /></td>
                    <td><c:out value="${event.eventname}" /></td>
                    <td><c:out value="${event.staffincharge}" /></td>
                </tr>
        </c:forEach>
    </table>
    
    <!-- END OF TABLE -->
    
    <p><a href="EventController?action=insert"><b>Add Pizza</b></a></p>
	
	</div>
	
	<div class="clear"></div>
	</div>
</div>

<!--////////////////////////////////////Footer-->

</body></html>