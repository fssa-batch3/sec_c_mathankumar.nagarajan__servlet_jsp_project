<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    
    <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/login.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
        rel="stylesheet">
    
    <title>SpartansMT</title>
    
    <link rel="icon" type="image/png" sizes="32x32" href="../assets/image/home/logo icon.png" alt="logo icon">
    
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">

    <!-- Notify CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
    
    <!-- Notify Js script file -->
    <script src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>

</head>

<body>

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

    <header>
        <form id="form" action="<%=request.getContextPath() %>/LoginServlet" method="post">

            <main>

                <div>
                    <img src="<%=request.getContextPath() %>/assets/image/signup/login-page-img.jpg" alt="login-page-img">
                </div>
                <div>
                    <h1>Sign In</h1>
                    <div class="input-alignment">
                        <span class="material-symbols-outlined">person</span>
                        <label>
                            <input class="input-box" id="confirm_email" type="email" name="email" placeholder="Email" required></label>
                    </div>
                    <hr>
                    <div class="input-alignment">
                        <span class="material-symbols-outlined">lock</span>
                        <label>
                            <input class="input-box" id="password" type="password" name="password"
                                placeholder="Password"
                                pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$" required></label>
                    </div>
                    <hr>
                    <label>
                        <input id="checkbox" type="checkbox">Remember Me
                    </label>
                    <br>

                    <button id="login" type="submit">
                        <b>Login</b>
                    </button>

                </div>

            </main>
        </form>

        <div class="footer">
            <div>
                <a href="<%=request.getContextPath() %>/pages/registration.jsp">
                    <p>Create an account</p>
                </a>
            </div>
            <div id="icons">
                <p>Or login with</p>
                <img src="<%=request.getContextPath() %>/assets/image/home/facebook.png" alt="facebook icon">
                <img src="<%=request.getContextPath() %>/assets/image/home/twitter-sign.png" alt="twitter icon">
                <img src="<%=request.getContextPath() %>/assets/image/home/google-icon.png" alt="google-icon">
            </div>
        </div>

    </header>

    


	<!--  Notify.error("Invalid"); -->
	

</body>

</html>