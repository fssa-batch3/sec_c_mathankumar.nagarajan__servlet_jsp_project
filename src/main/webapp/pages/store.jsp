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
	
<link rel="stylesheet" type="text/css"
	href="/spartansmt_web/assets/css/nav.css">
	
<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

</head>
<body>

	<jsp:include page="/nav.jsp"></jsp:include>

	<img id="banner" src="https://iili.io/J9alynn.jpg" alt="">

	<div class="search">
		<input type="search" id="search_box"> <label for="search_box">Search</label>
	</div>

	<h2 id="store-center">STORES</h2>



	<div class="stores" id="center-stores">

	</div>


	<jsp:include page="/footer.jsp"></jsp:include>



	<script type="text/javascript">
	
	// Search function
    const stores_searchbox = document.getElementById("search_box");
    stores_searchbox.addEventListener("keyup", e => {

        const search = e.target.value.toLowerCase();
        const stores = document.querySelectorAll(".search_store");

        stores.forEach(ele => {

            const match_name = ele.children[1].textContent.toLowerCase();

            if (match_name.includes(search)) {
                ele.style.display = "block";
            }
            else {
                ele.style.display = "none";
            }

        })

    })

	
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/storedetailsajax.js"></script>

</body>
</html>