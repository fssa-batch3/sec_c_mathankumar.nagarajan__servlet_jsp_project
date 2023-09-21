<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/confirmorder.css">
    <link href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
        rel="stylesheet">
    <title>SpartansMT</title>
    <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath() %>/assets/image/home/logo icon.png" alt="logo icon">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
</head>

<body>


    <header>

        <h1>Your order has been received</h1>
        <div>
            <img src="<%=request.getContextPath() %>/assets/image/home/order_confirmation.gif" alt="order confirm image">
        </div>
        <h2>Thank you for your purchase !</h2>
        <p id="order_id"></p>
        <p>You will receive an order confirmation email with details of your order</p>

        <button id="check_status">Check status</button>

    </header>

    <script>        
    	
    	const url = window.location.search;
        const urlParams = new URLSearchParams(url);
        const paramsId = urlParams.get("order_id")

        const order_id = document.getElementById("order_id")
        order_id.innerText = `Your order ID is:${  paramsId}`

        const check_status = document.getElementById("check_status")
        check_status.addEventListener("click", () =>{
            window.location.href = "<%=request.getContextPath() %>/pages/profile.jsp?id=orders";
        });
        
    </script>

</body>

</html>