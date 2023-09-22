<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile.css">

<title>SpartansMT</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath()%>/assets/image/home/logo icon.png"
	alt="logo icon">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer">

</head>

<body>

	<div id="order_tracker">

		<div class="pages_align">

			<a href="<%=request.getContextPath()%>/index.jsp">
				<h4>Home</h4>
			</a> <i class="fa-solid fa-chevron-right"></i> <a
				href="<%=request.getContextPath()%>/pages/profile.jsp?id=orders">
				<h4>Orders</h4>
			</a> <i class="fa-solid fa-chevron-right"></i>
			<h4 id="order_id"></h4>

		</div>

		<h1 class="order_id"></h1>

		<div id="order_date_div">

			<h4 id="order_date"></h4>
			<p>|</p>
			<i class="fa fa-plane" aria-hidden="true"></i>
			<h4 id="estimated_date"></h4>

		</div>

		<hr>

		<div id="orders_div"></div>

		<hr>

		<h3 id="total_price"></h3>

		<hr>

		<div id="user_order_details">

			<div>
				<h2>Payment</h2>
				<h3 id="payment_option"></h3>
			</div>

			<div>
				<h2>Address</h2>
				<p id="address"></p>
				<p id="mobile_number"></p>
			</div>

		</div>

	</div>


	<!-- ajax Script Link -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>    
    
    	// let order_id;
        let price = 0;
        // get params value to match the page 

        const url = window.location.search;
        const urlParams = new URLSearchParams(url);
        const paramsId = urlParams.get("id")
        
        
        function getOrder() {
			const url = "http://localhost:8080/spartansmt_web/GetOrderUsingOrderId?orderId=" + paramsId;
			axios.get(url)
			  .then(function (response) {
			    // handle success
			    console.log(response.data);
			    const order = (response.data);
			    displayOrders(order);
			  })
			  .catch(function (error) {
			    // handle error
			    console.log(error);
				})
		}
        
        function displayOrders(order) {
        	
        	 // payment Option
            const payment_option = document.getElementById("payment_option")
            payment_option.innerText = order.totalPrice;

            // order id
            let order_id = document.getElementById("order_id")
            order_id.innerText = "ID: " + order.orderId;

            order_id = document.querySelector(".order_id")
            order_id.innerText = "Order ID: " + order.orderId;

            const order_date = document.getElementById("order_date")
            order_date.innerText = "Order Date: " + order.orderId;

            const estimated_date = document.getElementById("estimated_date")
            estimated_date.innerText = "Estimated delivery: " + order.orderedDate;

            // Total Price
            price += Number(order.totalPrice);
            const total_price = document.getElementById("total_price")
            total_price.innerText = "Total Price: ₹ " + order.totalPrice;

            // Order Items Div Created Codes

            // let div_order_items;
            // let div_order_img;
            // let img;
            // let div_order_items_details;
            // let div;
            let h3;
            let p;
            // let div_order_price;

            const div_order_items = document.createElement("div")
            div_order_items.setAttribute("id", "order_items")

            const div_order_img = document.createElement("div")
            div_order_img.setAttribute("class", "order_img")
            div_order_items.prepend(div_order_img)

            const img = document.createElement("img")
            img.setAttribute("class", "img_link_1")
           // img.setAttribute("src", order.orderedProduct[0].pr)
            img.setAttribute("alt", "Product image")
            div_order_img.prepend(img)

            const div_order_items_details = document.createElement("div")
            div_order_items_details.setAttribute("class", "order_items_details")
            div_order_items.append(div_order_items_details)

            const div = document.createElement("div")
            div_order_items_details.prepend(div)

            h3 = document.createElement("h3")
            h3.setAttribute("class", "title_h3")
            //h3.innerText = .title;
            div.prepend(h3)

            p = document.createElement("p")
            // p.innerText = "Ordered via: ";
            div.append(p)

            const b = document.createElement("b")
            // b.innerText = e.ordered_by;
            p.append(b)

            const div_order_price = document.createElement("div")
            div_order_price.setAttribute("class", "order_price")
            div_order_items_details.append(div_order_price)

            h3 = document.createElement("h3")
            h3.setAttribute("class",  "price_h3")
            h3.innerText = `₹${  e.price}`;
            div_order_price.prepend(h3)

            p = document.createElement("p")
            p.innerText = `Qty: ${  e.quantity}`
            div_order_price.append(p)

            document.querySelector("#orders_div").append(div_order_items)

            // address and mobile number code using active user
            const mobile_number = document.getElementById("mobile_number")
            mobile_number.innerText = e.mobile_number

            // ADDRESS
            const address = document.getElementById("address")
            address.innerText = `${e.address  }, ${  e.state  }, ${  e.country  }, ${  e.zip_code  }.`

            getProductDetails(order.orderId,i)
        	
        	
        }
        
        function getProductDetails(id,i) {
 			const url = "http://localhost:8080/spartansmt_web/GetProductByProductId?id=" + id;
 			axios.get(url)
 			  .then(function (response) {
 			    // handle success
 			    console.log(response.data);
 			    const product = response.data;
 			    displayProduct(product,i);
 			  })
 			  .catch(function (error) {
 			    // handle error
 			    console.log(error);
 			  })
 		}
 		
 		function displayProduct(product,i) {
 			
 			//const productData = JSON.parse(product.substring(1));
 			console.log("i value : "+i);
 			document.querySelectorAll(".img_link_1")[i].setAttribute("src", product.productImage);
 			document.querySelectorAll(".title_h3")[i].innerText = (product.productTitle);
 			document.querySelectorAll(".price_h3")[i].innerText = (product.price);
 			
 			console.log(productData.productImage);
 			
 		}
        
        getOrder();

        /*const orders = JSON.parse(localStorage.getItem("orders"))
        orders.find(e => {

            if (e.order_id == paramsId) {

               
            }
            // return e;
        })*/

        // const active_user = JSON.parse(localStorage.getItem("active_user"))
    </script>

</body>

</html>