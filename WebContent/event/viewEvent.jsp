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
      response.sendRedirect("/Test/stafflogin.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Event</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%	String email = (String)session.getAttribute("currentSessionUser");%>

<header>
	<div class="wrap-header zerogrid">
		<div class="row">
			<div id="cssmenu">
				<ul>
				   <li ><a href="/Test/staff/index.jsp">Home</a></li>

				   <li ><a href="/Test/EventController?action=indoorEvent&email=<c:out value="<%=email%>"/>">Create Indoor Event </a></li> 
				   <li><a href="/Test/EventController?action=outdoorEvent&email=<c:out value="<%=email%>"/>">Create Outdoor Event </a></li> 
				   <li class='active'><a href="/Test/EventController?action=viewEvent&email=<c:out value="<%=email%>"/>">View Event </a></li> 
				   <li ><a href="/Test/StaffAccountController?action=viewAccount&email=<c:out value="<%=email%>"/>">My Staff Account </a></li>
				   <li><a href="/Test/staff/logout.jsp">Logout</a></li>
				</ul>
			</div>
			<a href='index.html' class="logo"><img src="" /></a>
		</div>
	</div>
</header> 
	<h2>My Event</h2>
	<table>
            <tr>
                <th>Event Id</th>
                <th>Event</th>
                <th>Event Cheese</th>
                <th>Event</th>
                <th>Event</th>
                <th>Event Cheese</th>
                <th>Event</th>
            
            </tr>
        <c:forEach items="${events}" var="event">
                <tr>
                    <td><c:out value="${event.eventid}" /></td>
                    <td><c:out value="${event.eventname}" /></td>
                    <td><c:out value="${event.eventstaffincharges}" /></td>
                    <td><c:out value="${event.eventfee}" /></td>
                    <td><c:out value="${event.eventdatestarttime}" /></td>
                    <td><c:out value="${event.eventdateendtime}" /></td>
                    <td><c:out value="${event.staffid}" /></td>
                   
                </tr>
        </c:forEach>
    </table>
    
  	
</body>
</html>