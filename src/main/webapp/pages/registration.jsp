<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spartans Market Town</title>
<!-- Header Logo -->
<link rel="icon" type="image/png" sizes="32x32"
	href="https://iili.io/HpZaout.png">

<!-- CSS File -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/registration.css">

</head>
<body>

	<%!public static final String REGISTRATION_SERVLET = "../RegistrationServlet";%>


	<p id="signin">
		Already have an account? <a href="../../pages/login/login.html">Sign
			in here!</a>
	</p>


	<form action="<%=REGISTRATION_SERVLET %>" method="post">


		<div class="container">

			<div>
				<img id="sign-img" src="https://iili.io/J9JnfKN.png"
					alt="signup img">
			</div>
			<div>
				<h1>Create An Account</h1>
				<div class="box-column">
					<label>First Name<br> <input type="text"
						id="firstname" name="firstname" class="input"
						pattern="[A-Za-Z ]{1-16}" required></label> <label>Last
						Name<br> <input type="text" id="lastname" name="lastname"
						class="input" pattern="[A-Za-Z ]{1-16}" required>
					</label>
				</div>

				<div class="box-column">
					<label>Email<br> <input type="email" id="email"
						required name="email" class="input"></label>

					<!-- Change Address to Phone Number -->

					<label> Phone number<br> <input type="tel"
						pattern="[6789][0-9]{9}" id="address" required name="phonenumber"
						class="input"></label>
				</div>

				<div class="box-column">

					<label>Create Password<br> <input id="creatpassword"
						type="password" name="createpassword" class="input" required>
					</label> <label>Confirm Password<br> <input
						id="confirmpassword" type="password" required
						name="confirmpassword" class="input">
					</label>

				</div>
				<label><input type="checkbox" name="checkbox" id="checkbox">Creating
					your account and you accepting<b>Terms & Conditions.</b></label> <br>

				<button type="submit" class="create-ac-btn">
					<b>Create Account</b>
				</button>

				<div class="box-column">
					<div class="icons-alignment">
						<img class="icon" src="https://iili.io/J9JnTxf.png"
							alt="facebook icon">
						<p>
							<b>Sign up Using Facebook!</b>
						</p>
					</div>
					<div class="icons-alignment">
						<img class="icon" src="https://iili.io/J9JnYU7.png" alt="icon">
						<p>
							<b>Sign up Using Twitter!</b>
						</p>
					</div>
				</div>

			</div>

		</div>

	</form>



</body>
</html>