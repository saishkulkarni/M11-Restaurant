<%@page import="dto.CartItem"%>
<%@page import="dto.Cart"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Cart Items</title>
</head>
<body>
	<%
	Cart cart = (Cart) request.getAttribute("cart");
	%>
	<div align="center">
		<h1>View Cart Items</h1>
		<table>
			<tr>
				<th>Image</th>
				<th>Name</th>
				<th>Quantity</th>
				<th></th>
				<th>Price</th>
				<th></th>
				<th>Total</th>
			</tr>

			<%
			for (CartItem item : cart.getCartItems()) {
			%>
			<tr>
				<td><img
					src="data:image/jpeg;base64,<%=Base64.encodeBase64String(item.getImage())%>"
					alt="<%=item.getName()%>" height="100px" width="100px"></td>
				<td><%=item.getName()%></td>
				<td><%=item.getQuantity()%></td>
				<td>X</td>
				<td><%=item.getPrice() / item.getQuantity()%></td>
				<td>=</td>
				<td><%=item.getPrice()%></td>
			</tr>
			<%
			}
			%>
			<tr>
				<th colspan="6">Total Price:</th>
				<th><%=cart.getTotalPrice()%></th>
			</tr>
		</table><br> <a href="place-order"><button>Place Order</button></a><br>

		<br> <a href="customer-home.html"><button>Back</button></a>
	</div>
</body>
</html>