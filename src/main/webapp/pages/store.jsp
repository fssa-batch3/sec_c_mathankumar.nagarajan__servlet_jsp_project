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

	<jsp:include page="/nav.jsp"></jsp:include>

	<img id="banner" src="https://iili.io/J9alynn.jpg" alt="">

	<div class="search">
		<input type="search" id="search_box"> <label for="search_box">Search</label>
	</div>

	<h2 id="store-center">STORES</h2>



	<div class="stores" id="center-stores">

		<%
		List<Store> storeList = (List<Store>) request.getAttribute("storeList");

		if (storeList != null) {

			for (Store store : storeList) {
		%>

		<a href="GetAllProductDetailsUsingStoreId?id=<%=store.getId()%>">
			<div class="store search_store">

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

</body>
</html>