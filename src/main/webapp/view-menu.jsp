<%@page import="dto.CartItem"%>
<%@page import="dto.Customer"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Menu</title>
</head>
<body>
	<%
	List<FoodItem> foodItems = (List<FoodItem>) request.getAttribute("items");
	Customer customer = (Customer) session.getAttribute("customer");
	List<CartItem> cartItems = customer.getCart().getCartItems();
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
				<th>Remove</th>
				<th>Quantity</th>
				<th>Add</th>
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
				<td><a href="remove-from-cart?id=<%=item.getId()%>"><button>-</button></a></td>
				<td>
					<%
					boolean flag = true;
					for (CartItem cartItem : cartItems) {
						if (cartItem.getName().equals(item.getName())) {
					%><%=cartItem.getQuantity()%> <%
 flag = false;
 break;
 }
 }
 if (flag) {
 %> 0 <%
 }
 %>

				</td>
				<td><a href="add-to-cart?id=<%=item.getId()%>"><button>+</button></a></td>
			</tr>
			<%
			}
			%>

		</table>

		<br> <a href="view-menu"><button>Back</button></a>
	</div>
</body>
</html>