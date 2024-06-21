<!DOCTYPE html>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.FoodItem"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Food Item</title>
</head>
<body>
	<%
	FoodItem item = (FoodItem) request.getAttribute("item");
	%>
	<div align="center">
		<h1>Enter Updated Food Details</h1>
		<form action="edit-food-item" method="post"
			enctype="multipart/form-data">
			Id: <input type="text" name="id" value="<%=item.getId()%>" readonly="readonly"><br>
			Name:<input type="text" name="name" value="<%=item.getName()%>"><br>
			Cost:<input type="text" name="price" value="<%=item.getPrice()%>"><br>
			Type:
			<%
		if (item.getType().equals("veg")) {
		%>
			<input type="radio" name="type" value="veg" checked="checked">VEG
			<input type="radio" name="type" value="non-veg">NON-VEG
			<%
			} else {
			%>
			<input type="radio" name="type" value="veg">VEG <input
				type="radio" name="type" value="non-veg" checked="checked">NON-VEG
			<%
			}
			%>

			<br> Stock :<input type="number" name="stock"
				value="<%=item.getStock()%>"><br> 
			Picture :<input
				type="file" name="image"> 
			<img
				src="data:image/jpeg;base64,<%=Base64.encodeBase64String(item.getImage())%>"
				alt="<%=item.getName()%>" height="100px" width="100px"> <br>
			<button>Update</button>
		</form>
	</div>
</body>
</html>