<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.fssa.spartansmt.model.Store"%>

<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spartans Market Town</title>
<link rel="stylesheet" type="text/css" href="assets/css/style.css">

<link rel="stylesheet" type="text/css" href="assets/css/nav.css">

<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

<!-- Notify CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">

<!-- Notify Js script file -->
<script
	src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>

</head>
<body>


	<jsp:include page="nav.jsp"></jsp:include>

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

	<a href="#"> <img id="homecover"
		src="assets/image/home/homecover2.jpg" alt="home cover photo">
	</a>

	<h2 class="center">STORES</h2>

	<div class="stores"></div>

	<a href="<%=request.getContextPath()%>/pages/store.jsp">
		<button class="button">EXPLORE ALL STORES</button>
	</a>

	<h2 class="center display_none">FOODCOURT</h2>

	<div class="stores display_none">
		<img id="food-background" src="assets/image/home/food-background.jpg"
			alt="store-image">
		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store1.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>Food Park</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>11AM TO 12AM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store2.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>Domino's</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>10AM TO 12PM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store3.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>ivenus</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>11AM TO 12AM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store4.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>ivenus</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>10AM TO 12AM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store5.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>ivenus</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>11AM TO 12AM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<!-- First foodcourt line end -->
		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store6.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>ivenus</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>9AM to 9PM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store7.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>ivenus</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>10AM TO 12AM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store8.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>ivenus</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>11AM TO 12AM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store1.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>ivenus</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>10AM TO 12AM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

		<div class="store1">
			<img class="imgstore1" src="assets/image/foodcourt/store9.png"
				alt="store-image">
			<div class="floor1">
				<div>
					<h3>ivenus</h3>
					<p>Openning Time</p>
					<p>Coustomer rating</p>
				</div>
				<div>
					<p>Third floor</p>
					<p>11AM TO 12AM</p>
					<p class="star-rating">4.5 / 5</p>
				</div>
			</div>
		</div>

	</div>
	<!-- second foodcourt line end -->
	<a href="pages/foodcourt/foodcourt.html" class="display_none">
		<button class="button">EXPLORE ALL FOODCOURT</button>
	</a>
	<h2 class="center display_none">MOVIES</h2>

	<div class="movie-list display_none">

		<div>
			<img class="movie-img" src="assets/image/home/wakanda.png"
				alt="movie-image">
			<h2>
				Black Panther: Wakanda <br>Forever
			</h2>
			<p>Action, Adventure, Drama</p>
		</div>
		<div>
			<img class="movie-img" src="assets/image/home/avatar.png"
				alt="movie-image">
			<h2>Avatar</h2>
			<p>Action, Adventure, Fantasy, Sci-Fi</p>
		</div>
		<div>
			<img class="movie-img" src="assets/image/home/lovetoday.png"
				alt="movie-img">
			<h2>Love Today</h2>
			<p>Drama, Romantic</p>
		</div>

		<div>
			<img class="movie-img" src="assets/image/home/actionhero.png"
				alt="movie-image">
			<h2>An Action Hero</h2>
			<p>Action, Comedy, Thriller</p>
		</div>

	</div>
	<a href="pages/entertainment/entertainment.html" class="display_none">
		<button class="button">EXPLORE ALL MOVIES</button>
	</a>
	<h2 class="center display_none">OFFERS</h2>

	<div class="offers-home display_none">
		<div class="offers-home-img">
			<img src="assets/image/home/offer4.jpg" alt="offer-image"> <img
				src="assets/image/home/offer1.jpg" alt="offer-image"> <img
				src="assets/image/home/offer5.jpg" alt="offer-image"> <img
				src="assets/image/home/offer6.jpg" alt="offer-image"> <img
				src="assets/image/home/offer8.jpg" alt="offer-image">
		</div>
		<div class="offers-home-img">
			<img src="assets/image/home/offer3.jpg" alt="offer-image"> <img
				src="assets/image/home/offer5.jpg" alt="offer-image"> <img
				src="assets/image/home/offer6.jpg" alt="offer-image"> <img
				src="assets/image/home/offer8.jpg" alt="offer-image">
		</div>
		<div class="offers-home-img">
			<img src="assets/image/home/offer4.jpg" alt="offer-image"> <img
				src="assets/image/home/offer5.jpg" alt="offer-image"> <img
				src="assets/image/home/offer6.jpg" alt="offer-image"> <img
				src="assets/image/home/offer8.jpg" alt="offer-image">
		</div>

	</div>
	<a href="pages/offer/offer.html" class="display_none">
		<button class="button">EXPLORE ALL OFFERS</button>
	</a>

	<!-- Footer starting -->

	<jsp:include page="footer.jsp"></jsp:include>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="main.js"></script>


</body>


</html>