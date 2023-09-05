<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spartans Market Town</title>
<link rel="stylesheet" type="text/css"
	href="/spartansmt_web/assets/css/style.css">
<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

</head>
<body>
	<%!public static final String GET_ALL_STORE_DETAILS = "GetStoreDetailsServlet";%>


	<nav id="#homepage">
		<!-- <input type="checkbox" id="check"> -->
		<img id="logo" src="https://iili.io/HyZGiwF.png" alt="logo">
		<ul>
			<li>Home</li>
			<li>Stores</li>
			<li>Offers</li>
			<li>Entertainment</li>
			<li>Foodcourt</li>
			<li>Services</li>
			<li>Cart</li>
			<li><a id="signup" href="pages/login/login.html">Sign In</a></li>
		</ul>
		<!-- <label for="check" class="checkbtn"> <i
			class="material-symbols-outlined" style="color: black;">menu</i>
		</label> -->

	</nav>



	<h3>Click Below Link:-</h3>

	<a href=<%=GET_ALL_STORE_DETAILS%>>Get All Store Details</a>

</body>
</html>