<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.fssa.spartansmt.model.Store"%>

<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spartans Market Town</title>
<link rel="stylesheet" type="text/css"
	href="/spartansmt_web/assets/css/store.css">
<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">
</head>
<body>

	<h1 id="heading">Stores</h1>

	<div class="stores" id="center-stores">

		<%
		List<Store> storeList = (List<Store>) request.getAttribute("storeList");

		if (storeList != null) {

			for (Store store : storeList) {
		%>

		<a href="GetProductsByStoreId?id=<%=store.getId()%>">
			<div class="store">

				<img class="imgstore" src=<%=store.getStoreLogoLink()%>
					alt="store image">
				<div class="floor">
					<h3><%=store.getName()%></h3>
					<p><%=store.getCategory()%></p>
					<p>
						<b>View More Product</b>
					</p>
				</div>

			</div>

		</a>

		<%
		}

		// ...
		} else {
		// Handle the case when storeList is null
		%>

		<p>Null</p>

		<%
		}
		%>

	</div>
	
	
	
</body>
</html>