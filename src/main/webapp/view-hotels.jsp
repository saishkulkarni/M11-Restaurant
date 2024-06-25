<%@page import="dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Hotels</title>
</head>
<body>
	<%
	List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
	%>

	<div align="center">
		<h1>Hotels List</h1>
		<table border="1">
			<tr>
				<th>Hotel Name</th>
				<th>Hotel Address</th>
				<th>Hotel Mobile</th>
				<th>Select</th>
			</tr>

			<%
			for (Hotel hotel : hotels) {
			%>
			<tr>
				<th><%=hotel.getName()%></th>
				<th><%=hotel.getAddress()%></th>
				<th><%=hotel.getMobile()%></th>
				<th><a href="view-food?id=<%=hotel.getId()%>"><button>Select</button></a></th>
			</tr>
			<%
			}
			%>
		</table><br>
<a href="customer-home.html"><button>Back</button></a>
	</div>
</body>
</html>