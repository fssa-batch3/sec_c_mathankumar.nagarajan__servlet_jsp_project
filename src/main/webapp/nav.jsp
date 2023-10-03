
<%@page import="com.fssa.spartansmt.model.User"%>
<%
String userEmail = (String) request.getSession().getAttribute("actUserEmail");
if (userEmail == null) {
%>

<nav id="#homepage">
	<img id="logo" src="https://iili.io/HyZGiwF.png" alt="logo">
	<ul>
		<li onclick="login()">Home</li>
		<li onclick="login()">Stores</li>
		<li onclick="login()">Offers</li>
		<li onclick="login()">Entertainment</li>
		<li onclick="login()">Foodcourt</li>
		<li onclick="login()">Services</li>
		<li onclick="login()">Cart</li>
		<li><a id="signup"
			href="<%=request.getContextPath()%>/pages/login.jsp">Sign In</a></li>
	</ul>
</nav>

<%
} else {
%>

<!-- isActive class for nav : class="nav-highlighted" -->

<nav id="#homepage">
	<img id="logo" src="https://iili.io/HyZGiwF.png" alt="logo">
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
						<i class="material-symbols-outlined">person</i> Profile
					</p>
				</a> <a
					href="<%=request.getContextPath()%>/pages/profile.jsp?id=orders">
					<p>
						<i class="material-symbols-outlined">shopping_bag</i> My Orders
					</p>
				</a> <a href="../home/profile.html?id=wishlist">
					<p>
						<i class="material-symbols-outlined">favorite</i> WishList
					</p>
				</a> <a href="<%=request.getContextPath()%>/LogoutServlet">
					<p>
						<i class="material-symbols-outlined">logout</i> Logout
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