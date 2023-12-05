<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">


<!-- Here is linked the nav bar css file -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/nav.css">

<!-- Title Icon -->
<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">

<!-- for nav icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<style type="text/css">

	body{
		margin:0px;
		padding:0px;
		width:100%;
		text-align:center;
	}
	
	main{
		background-image:
		url(<%=request.getContextPath() %>/assets/image/home/error_gif.gif);
		background-repeat: no-repeat;
		height: 400px;
		background-position: center;	
		width:100%;
		text-align:center;
	}
	
	#error_tag{
		margin-top:60px;
		font-size: 60px;
		text-align:center;
		font-weight: bold;
	}
	
	.link_404{
		background-color: #39ac31;
		padding: 20px 40px;
		color:white;
		font-weight:bold;
	}
	
	.contant_box_404 p{
		margin-bottom:50px;
	}

}
</style>

</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	
	<p id="error_tag"></p>

	<main>

		<!-- 
			<img alt="" src="<%=request.getContextPath() %>/assets/image/home/error_gif.gif">
		 -->
	</main>

	<div class="contant_box_404">
		<h2>Look like you're lost</h2>

		<p>the page you are looking for not available!</p>

		<a href="<%=request.getContextPath()%>/index.jsp" class="link_404">Go
			to Home</a>
	</div>


	<script type="text/javascript">
	
		var url = window.location.href;
	    function UrlExists(url) {
	        let http = new XMLHttpRequest();
	        http.open('HEAD', url, false);
	        http.send();

			let error = document.getElementById("error_tag");
		    error.innerText = http.status;
		    
	    }
	    UrlExists(url);
	
	</script>

</body>
</html>