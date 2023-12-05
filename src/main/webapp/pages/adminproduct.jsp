<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Importing Product Model Class -->
<%@ page import="com.fssa.spartansmt.model.Product"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SpartansMT Admin</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/assets/css/admin.css">

<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">

<!-- Google Font link -->
<link
	href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	
	<!-- Notify CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
    
    <!-- Notify Js script file -->
    <script src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>
	


</head>
<body>

	<%!public static final String GET_ALL_STORE_DETAILS = "GetAllStoreDetailsUserSide";%>

	<!-- Notify Alert -->
	<%
	String success = (String) request.getAttribute("success");
	String error = (String) request.getAttribute("error");
	%>


	<%
	if (error != null) {
	%>
	<script>
		   let error = "<%=error%>";
		   Notify.error(error);
	</script>
	<%
	}
	%>

	<%
	if (success != null) {
	%>
	<script>
		let success = "<%=success%>";
		Notify.success(success);
	</script>
	<%
	}
	%>


	<nav>

		<div id="logo">
			<img src="<%=request.getContextPath() %>/assets/image/home/logo.png" alt="SpartansMT">
		</div>

		<div class="nav">

			<div>
				<i class="fa-solid fa-magnifying-glass search_icon"></i> <input
					id="search" type="search" placeholder="Search...">
			</div>

			<div>
				<span id="profile">Profile</span> <a
					href="<%=request.getContextPath()%>/LogoutServlet"> <i
					class="fa-solid fa-right-from-bracket logout"></i>
				</a>
			</div>

		</div>

	</nav>

	<header>

		<ul>

			<span class="menu">MENU</span>

			<a href="<%=request.getContextPath()%>/pages/adminhome.jsp">
				<menu>Dashboard
				</menu>
			</a>

			<a href="">
				<menu>Forms
				</menu>
			</a>

			<a href=<%=GET_ALL_STORE_DETAILS%>>
				<menu>Tables
				</menu>
			</a>

		</ul>

		<div class="tables">

			<div class="dash_align">

				<h4>PRODUCT DETAILS</h4>
				<div>

					<span>SpartansMT</span> <i class="fa-solid fa-angle-right"></i> <a
						href=<%=GET_ALL_STORE_DETAILS%>> <span class="menu">Store
							Details</span>
					</a> <i class="fa-solid fa-angle-right"></i> <span class="menu">Product
						Details</span>

					<button id="table_add_product" onclick="addbox()">Add
						Product</button>

				</div>

			</div>

			<div class="store_table">

				<table class="table">

					<tr>
						<th class="td">Image</th>
						<th class="td">Title</th>
						<th class="td">Price</th>
						<th class="td">Edit Product Details</th>
						<th class="td">Delete Products</th>
					</tr>

					<%
					List<Product> productList = (List<Product>) request.getAttribute("productList");
					if (productList != null) {
						for (Product product : productList) {
					%>

					<tr>
						<td class="td"><img class="product_img"
							src=<%=product.getProductImage()%> alt="Product Image"></td>
						<td class="td"><%=product.getProductTitle()%></td>
						<td class="td"><%=product.getProductPrice()%></td>

						<td class="td"><button class="btn_edit_store"
								onclick="updatebox(this, <%=product.getStoreId()%>, <%=product.getProductId()%>)">Edit</button></td>

						<td class="td"><button class="btn_view_store"
								onclick="deletebox(<%=product.getProductId()%>, <%=product.getStoreId()%>)">Delete</button></td>
					</tr>

					<%
					}
					} else {
					%>
					<p>Empty</p>
					<%
					}
					%>


				</table>

			</div>

		</div>


		<div id="product_update_box">

			<button class="cancel_icon" onclick="cancelbox()">X</button>

			<form
				action="AddProductDetailsServlet?id=<%=request.getParameter("id")%>"
				method="post">

				<h3 class="center">Add Product Details</h3>

				<table>



					<tr>
						<td class="label">Title :</td>
						<td class="inputs"><input name="productTitle" type="text"
							id="product_title" pattern="^[a-zA-Z0-9 ]+$" required></td>
					</tr>

					<tr>
						<td class="label">Price :</td>
						<td class="inputs"><input name="productPrice" type="number"
							step="0.01" id="price" min="1" required></td>
					</tr>

					<tr>
						<td class="label">Product URL Link :</td>
						<td class="inputs"><input type="url" name="productImageUrl"
							id="product_image" required></td>
					</tr>

				</table>

				<div class="btns">

					<button id="add_product_btn" type="submit">Add Product</button>


				</div>

			</form>

		</div>

		<div id="product_update_box1">

			<button class="cancel_icon" onclick="cancelbox()">X</button>

			<form method="post" id="product_form">

				<h3 class="center">Update Product Details</h3>

				<table>



					<tr>
						<td class="label">Title :</td>
						<td class="inputs"><input name="productTitle" type="text"
							id="product_title" pattern="^[a-zA-Z0-9 ]+$" required></td>
					</tr>

					<tr>
						<td class="label">Price :</td>
						<td class="inputs"><input name="productPrice" type="number"
							step="0.01" id="price" min="1" required></td>
					</tr>

					<tr>
						<td class="label">Product URL Link :</td>
						<td class="inputs"><input type="url" name="productImageUrl"
							id="product_image" required></td>
					</tr>

				</table>

				<div class="btns">

					<button id="update_btn" type="submit">Update Product</button>

				</div>

			</form>

		</div>



	</header>


	<div id="delete_box">
		<h2 id="delete_file_text">Delete Product</h2>
		<p>Sure you want to delete</p>
		<div id="delete_box_btns">
			<form id="delete_btn" method="post">
				<button type="submit">Delete</button>
			</form>
			<button onclick="canceldelectbox()">Cancel</button>
		</div>
	</div>



	<script type="text/javascript"
		src="/spartansmt_web/assets/js/productlist.js"></script>

</body>
</html>