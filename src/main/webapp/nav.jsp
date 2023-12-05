
<%@page import="com.fssa.spartansmt.model.User"%>
<%
String userEmail = (String) request.getSession().getAttribute("actUserEmail");
if (userEmail == null) {
%>

<nav id="#homepage">
	<img id="logo" src="<%=request.getContextPath()%>/assets/image/home/logo1.png" alt="logo">
	<ul>
		<li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
		<li><a href="<%=request.getContextPath()%>/pages/store.jsp">Stores</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/pages/offers.jsp">Offers</a>
		</li>
		<li><a
			href="<%=request.getContextPath()%>/pages/entertainment.jsp">Entertainment</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/pages/foodcourt.jsp">Foodcourt</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/pages/service.jsp">Services</a>
		</li>
		<li><a id="signup"
			href="<%=request.getContextPath()%>/pages/login.jsp">Sign In</a></li>
	</ul>
</nav>

<%
} else {
%>

<!-- isActive class for nav : class="nav-highlighted" -->

<nav id="#homepage">
	<img id="logo" src="<%=request.getContextPath()%>/assets/image/home/logo1.png" alt="logo">
	<ul>
		<li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
		<li><a href="<%=request.getContextPath()%>/pages/store.jsp">Stores</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/pages/offers.jsp">Offers</a>
		</li>
		<li><a
			href="<%=request.getContextPath()%>/pages/entertainment.jsp">Entertainment</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/pages/foodcourt.jsp">Foodcourt</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/pages/service.jsp">Services</a>
		</li>

		<li><a href="<%=request.getContextPath()%>/pages/cart.jsp"> <i
				id="cart_icon" class="material-symbols-outlined">shopping_cart</i>
		</a></li>
		
		<p id="cart_count"></p>

		<!-- <p id="cart_count"></p> -->
		<li class="dropdown"><i class="material-symbols-outlined">expand_more</i>
			<div class="dropdown-content">
				<a href="<%=request.getContextPath()%>/pages/profile.jsp">
					<p>
						<i class="material-symbols-outlined expend">person</i> Profile
					</p>
				</a> <a
					href="<%=request.getContextPath()%>/pages/profile.jsp?id=orders">
					<p>
						<i class="material-symbols-outlined expend">shopping_bag</i> My Orders
					</p>
				</a> <a href="<%=request.getContextPath()%>/pages/profile.jsp?id=wishlist">
					<p>
						<i class="material-symbols-outlined expend">favorite</i> WishList
					</p>
				</a> <a href="<%=request.getContextPath()%>/LogoutServlet">
					<p>
						<i class="material-symbols-outlined expend">logout</i> Logout
					</p>
				</a>
			</div></li>

	</ul>
</nav>

<%
}
%>

<script>
	function login(){
	let error = "Please Login Your Account";
	Notify.error(error);
	}
</script>