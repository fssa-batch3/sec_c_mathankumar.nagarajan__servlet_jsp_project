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
	<%!public static final String GET_ALL_STORE_DETAILS_2 = "GetAllStoreDetailsUserSide";%>


	<jsp:include page="nav.jsp"></jsp:include>



	<h3>Click Below Link:-</h3>
	<a href=<%=GET_ALL_STORE_DETAILS%>>Get All Store Details</a>
	
	<h3>User Side:-</h3>
	<a href=<%=GET_ALL_STORE_DETAILS_2%>>Get All Store Details</a>
	

</body>
</html>