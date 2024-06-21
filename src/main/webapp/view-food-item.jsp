<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Food Items</title>
</head>
<body>
	<%
	List<FoodItem> foodItems = (List<FoodItem>) request.getAttribute("foodItems");
	%>
	<div align="center">
	<h1>View Food Items</h1>
		<table border="1">
			<tr>
				<th>Name</th>
				<th>Stock</th>
				<th>Image</th>
				<th>Price</th>
				<th>Hotel Name</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>

			<%
			for (FoodItem item : foodItems) {
			%>
			<tr>
				<td><%=item.getName()%></td>
				<td><%=item.getStock()%></td>
				<td><img
					src="data:image/jpeg;base64,<%=Base64.encodeBase64String(item.getImage())%>"
					alt="<%=item.getName()%>" height="100px" width="100px"></td>
				<td><%=item.getPrice()%></td>
				<td><%=item.getHotel().getName()%></td>
				<td><a href="edit-food-item?id=<%=item.getId()%>"><button>Edit</button></a></td>
				<td><a href="delete-food-item?id=<%=item.getId()%>"><button>Delete</button></a></td>
			</tr>
			<%
			}
			%>

		</table>
		
		<br>
		<a href="hotel-home.html"><button>Back</button></a>
	</div>
</body>
</html>