<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.spartansmt.model.Product"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spartans Market Town</title>

<link rel="stylesheet" type="text/css"
	href="/spartansmt_web/assets/css/product.css">

<link rel="stylesheet" type="text/css"
	href="/spartansmt_web/assets/css/nav.css">

<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">


</head>
<body>

	<jsp:include page="../nav.jsp"></jsp:include>

	<div class="products">

		<%
		List<Product> productList = (List<Product>) request.getAttribute("productList");

		if (productList != null) {

			for (Product product : productList) {
		%>

		<div class="wishlist">
			<div class="wishlist_icon">
				<img class="icon" id="wishlist_icon"
					src="https://iili.io/Hy2cCoG.png" alt="img wishlist icon">
			</div>
			<a href="<%=request.getContextPath() %>/pages/viewproduct.jsp?id=<%=product.getProductId() %>">
			<div class="products_items">
				<img class="productsimg" src="<%=product.getProductImage()%>"
					alt="Product Images">
				<div>
					<h2 class="product_title"><%=product.getProductTitle()%></h2>
					<div class="column">
						<p class="item-price"><%=product.getProductPrice()%></p>
						<p class="cress">10000</p>
						<p>(40%)</p>
					</div>
					<div class="star_center_tag">
						<img class="star-rating" src="https://iili.io/Hy3tspf.png"
							alt="star rating img">
						<h3>4.5</h3>
						<h4>(2023)</h4>
					</div>
					<h5>FREE Delivery By SpartansMT</h5>
				</div>
			</div>
			</a>
		</div>

		<%
		}

		} else {
		%>

		<h2>Empty</h2>

		<%
		}
		%>

	</div>


	

</body>
</html>