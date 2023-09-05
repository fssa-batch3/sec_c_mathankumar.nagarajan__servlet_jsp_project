<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Importing the Store Model -->
<%@ page import="com.fssa.spartansmt.model.Store"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>SpartansMT Admin</title>
<link rel="stylesheet" type="text/css"
	href="/spartansmt_web/assets/css/admin.css">
<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">

<!-- Google Font link -->
<link
	href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">




</head>
<body>

	<%!public static final String GET_PRODUCTS_BY_ID_SERVLET = "GetProductsByStoreId";%>
	<%!public static final String GET_STORE_DETAILS_SERVLET = "GetStoreDetailsServlet";%>

	<nav>

		<div id="logo">
			<img src="https://iili.io/Hyo19Tb.png" alt="">
		</div>

		<div class="nav">

			<div>
				<i class="fa-solid fa-magnifying-glass search_icon"></i> <input
					id="search" type="search" placeholder="Search...">
			</div>

			<div>
				<span id="profile">Profile</span> <a href="../login/login.html">
					<i class="fa-solid fa-right-from-bracket logout"></i>
				</a>
			</div>

		</div>

	</nav>


	<header>

		<ul>

			<span class="menu">MENU</span>

			<a href="">
				<menu>Dashboard
				</menu>
			</a>

			<a href="">
				<menu>Forms
				</menu>
			</a>

			<a href="<%=GET_STORE_DETAILS_SERVLET%>">
				<menu>Tables
				</menu>
			</a>

		</ul>

		<div class="tables">

			<div class="dash_align">

				<h4>STORE DETAILS</h4>
				<div>
					<span>SpartansMT</span> <i class="fa-solid fa-angle-right"></i> <span
						class="menu">Store Details</span>

					<button id="table_add_product" onclick="addbox()">Add
						Store</button>

				</div>

			</div>

			<div class="store_table">

				<table class="table">

					<tr>
						<th class="td">Name</th>
						<th class="td">Category</th>
						<th class="td">Actions</th>
					</tr>

					<%
					List<Store> storeList = (List<Store>) request.getAttribute("storeList");
					if (storeList != null) {
						for (Store store : storeList) {
					%>

					<tr>
						<td class="td"><%=store.getName()%></td>
						<td class="td"><%=store.getCategory()%></td>


						<td class="td" id="actions_align">

							<button onclick="updatebox(this, <%=store.getId()%>)"
							 data-title="<%=store.getName() %>" data-category="<%=store.getCategory() %>" data-logourl="<%=store.getStoreLogoLink() %>"
								class="btn_edit_store">Edit</button>


							<button id="center_btn" onclick="deletebox(<%=store.getId()%>)"
								class="btn_delete_store">Delete</button> <a
							href=<%=GET_PRODUCTS_BY_ID_SERVLET + "?id=" + store.getId()%>>
								<button class="btn_view_store">View</button>
						</a>

						</td>

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


		<div id="store_update_box">

			<button class="cancel_icon" onclick="cancelbox()">X</button>

			<form method="post" action="AddStoreDetailsServlet">

				<h3 class="center">Add Store Details</h3>

				<table>


					<tr>
						<td class="label">Title:</td>
						<td class="inputs"><input type="text" name="storeTitle"
							id="title" placeholder="Enter Store Name"></td>
					</tr>

					<tr>
						<td class="label">Category:</td>
						<td class="inputs"><input type="text" name="storeCategory"
							id="category" placeholder="Enter Store Category"></td>
					</tr>

					<tr>
						<td class="label">Store logo URL:</td>
						<td class="inputs"><input type="url" name="storeLogo"
							id="image" placeholder="Enter Store Logo Url"></td>
					</tr>

					<!-- <tr>
                        <td class="label">Store Banner URL:</td>
                        <td class="inputs">
                            <input type="url" id="banner"></td>
                    </tr> -->

				</table>

				<div class="btns">
					<button id="add_product_btn" type="submit">Add Store</button>

				</div>

			</form>





		</div>

		<div id="store_update_box1">

			<button class="cancel_icon" onclick="cancelbox()">X</button>

			<form id="update_store_details" method="post">


				<h3 class="center">Update Store Details</h3>

				<table>


					<tr>
						<td class="label">Title:</td>
						<td class="inputs"><input type="text" name="storeTitle"
							id="title title1"  placeholder="Enter Store Name"></td>
					</tr>

					<tr>
						<td class="label">Category:</td>
						<td class="inputs"><input type="text" name="storeCategory"
							id="category category1" placeholder="Enter Store Category"></td>
					</tr>

					<tr>
						<td class="label">Store logo URL:</td>
						<td class="inputs"><input type="url" name="storeLogo"
							id="image image1" placeholder="Enter Store Logo Url"></td>
					</tr>

					<!-- <tr>
                        <td class="label">Store Banner URL:</td>
                        <td class="inputs">
                            <input type="url" id="banner">
                        </td>
                    </tr> -->

				</table>

				<div class="btns">
					<button id="update_btn" type="submit">Update Store</button>

				</div>

			</form>

		</div>


	</header>

	<div id="delete_box">
		<h2 id="delete_file_text">Delete Store</h2>
		<p>Sure you want to delete</p>
		<div id="delete_box_btns">
			<form id="delete_btn" method="post">
				<button type="submit">Delete</button>
			</form>
			<button onclick="canceldelectbox()">Cancel</button>
		</div>
	</div>



	<script type="text/javascript"
		src="/spartansmt_web/assets/js/storelist.js"></script>

</body>
</html>