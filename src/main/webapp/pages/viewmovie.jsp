<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="../assets/css/viewmovie.css">

<link rel="stylesheet" type="text/css" href="../assets/css/nav.css">

<link
	href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
	rel="stylesheet">

<title>SpartansMT</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="../assets/image/home/logo icon.png" alt="logo icon">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">


</head>
<body>

	<jsp:include page="../nav.jsp"></jsp:include>
	
	
	<header>

		<div>
			<img alt="movie" src="<%=request.getContextPath() %>/assets/image/entertainment/avatar.png">
		</div>

		<div class="about-movie">
			<span class="h1">Avatar: The Way Of Water</span>
			<div class="like-review-alignment">
				<img src="<%=request.getContextPath() %>/assets/image/entertainment/like-img.png"
					alt="like img">
				<h2>678.7k</h2>
				<p>are interested</p>
			</div>
			<div class="interested-booking-box">
				<div>
					<h3>Releasing on 16 Dec, 2022</h3>
					<p>Mark interested to know when bookings open</p>
				</div>
				<button type="submit">I'm interested</button>
			</div>
			<p class="movie-screen">2D, 3D, 3D SCREEN X, 4DX 3D, IMAX 3D</p>
			<p class="movie-screen">English, Kannada, Malayalam, Tamil,
				Telugu, Hindi</p>
			<p class="movie-screen1">3h 12m • Action, Adventure, Fantasy,
				Sci-Fi • UA</p>
			<a href="selectseat.jsp" class="booknow-btn">Book Tickets</a>
		</div>

	</header>

	<div class="about-the-movie">
		<span class="h1">About The Movie</span>
		<p>
			Set more than a decade after the events of the first film, "Avatar
			The Way of Water" begins to tell the story of the Sully family<br>
			(Jake, Neytiri and their kids), the trouble that follows them, the
			lengths they go to keep each other safe, the battles they fight to <br>
			stay alive and the tragedies they endure.
		</p>
		<hr>
		<span class="h1">Cast</span>
	</div>

	<div class="cast">
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/sam-worthington.jpg"
				alt="actor">
			<h3>
				Sam <br> Worthington
			</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/zoe-saldana.jpg"
				alt="actor">
			<h3>Zoe Saldana</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/sigourney-weaver.jpg"
				alt="actor">
			<h3>
				Sigourney<br> Weaver
			</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/stephen-lang.jpg"
				alt="actor">
			<h3>Stephen Lang</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/cliff-curtis.jpg"
				alt="actor">
			<h3>Cliff Curtis</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/joel-david.jpg"
				alt="actor">
			<h3>
				Joel David<br>Moore
			</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/cch-pounder.jpg"
				alt="actor">
			<h3>CCH Pounder</h3>
			<p>Actor</p>
		</div>
		<div>
			<img src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/edie.jpg"
				alt="actor">
			<h3>Edie Falco</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/jemaine-clement.jpg"
				alt="actor">
			<h3>
				Jemaine <br>Clement
			</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/giovanni-ribisi.jpg"
				alt="actor">
			<h3>Giovanni Ribisi</h3>
			<p>Actor</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/kate-winslet.jpg"
				alt="actor">
			<h3>Kate Winslet</h3>
			<p>Actor</p>
		</div>
	</div>
	<hr class="about-the-movie">
	<span class="h1 about-the-movie">Crew</span>
	<div class="cast">
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/james-cameron.jpg"
				alt="actor">
			<h3>James Cameron</h3>
			<p>Director, Writer</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/amanda-silve.jpg"
				alt="actor">
			<h3>Amanda Silver</h3>
			<p>Writer</p>
		</div>
		<div>
			<img
				src="<%=request.getContextPath() %>/assets/image/entertainment/about-avatar/rick-jaffa.jpg"
				alt="actor">
			<h3>Rick Jaffa</h3>
			<p>Writer</p>
		</div>
	</div>


</body>
</html>