<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>




<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/paymentpage.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/nav.css">

<link
	href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
	rel="stylesheet">

<title>SpartansMT</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath()%>/assets/image/home/logo icon.png"
	alt="logo icon">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">

</head>

<body>

	<%
	String email = (String) request.getSession().getAttribute("actUserEmail");
	%>

	<jsp:include page="../nav.jsp"></jsp:include>


	<h1 id="checkout">CHECKOUT</h1>

	<form id="form" method="post">

		<header>

			<div id="left_div">

				<div>

					<h2>Personal Details</h2>
					<div>

						<div>
							<label for="">First Name <br> <input id="first_name"
								type="text" class="input" disabled>
							</label>
						</div>

						<div>
							<label for="">Last Name <br> <input id="last_name"
								type="text" class="input" disabled>
							</label>
						</div>

						<div>
							<label for="">Email Address <br> <input id="email"
								type="email" value="<%=email%>" class="input" disabled>
							</label>
						</div>

						<div>
							<label for="">Phone Number <br> <input
								id="phone_number" pattern="[789][0-9]{9}" type="number"
								class="input" disabled>
							</label>
						</div>

					</div>

				</div>

				<div>

					<h2>Shipping Details</h2>
					<div>
						<h3 id="shipping_address">Shipping Address</h3>

						<div>
							<label for="">Street Address <br> <input type="text"
								id="address" required name="address">
							</label>
						</div>

						<div>
							<label for="">Country <br> <input type="text"
								id="country" class="address" name="country" required>
							</label>
						</div>

						<div>
							<label for="">State <br> <input type="text"
								id="state" class="address" name="state" required>
							</label>
						</div>

						<div>
							<label for="">Zip code <br> <input type="number"
								pattern="[0-9]{6}" id="zip_code" name="zipCode" class="address" required>
							</label>
						</div>

					</div>

				</div>

				<div>

					<p>Payment Method</p>
					<div>
						<div class="payment_input_align">

							<label for=""> <img class="icon_img"
								src="<%=request.getContextPath()%>/assets/image/home/paypal.png"
								alt="icon"> Paypal
							</label> <input name="Payment" type="radio" value="Paypal" class="radio"
								required>

						</div>

			
						<div class="payment_input_align">

							<label for=""> <img class="icon_img"
								src="<%=request.getContextPath()%>/assets/image/home/cash_on_delivery.png"
								alt="icon"> Cash on delivery
							</label> <input name="Payment" type="radio" value="Cash on delivery"
								class="radio" required>

						</div>

						<div id="paypal_varify">

							<label for=""> Paypal Email Address <br> <input
								type="email">

							</label>

						</div>

						<div id="card-details">

							<label for=""> Card number <br> <input
								id="card_number" type="number" pattern="{12}">
							</label> <label for=""> Expiry date <br> <input
								id="card_expiry_date" type="date">
							</label> <label for=""> CVC/CVV <br> <input id="card_cvv"
								type="number" pattern="{3}">
							</label>

						</div>

					</div>

				</div>

			</div>

			<div id="right_div">

				<h2>Order summary</h2>

				<div id="order_summary">

					<!-- <div class="order_items">

                        <img class="product_img" src="../../assets/image/stores/ivenus-apple/mobile (6).png" alt="product">
                        <div>
                            <h4 id="order_title">bdjkbsanemathandkujamrdjsbafabsano</h4>
                            <p>Store name: Iphones</p>
                            <p>$121212</p>
                        </div>

                    </div>

                    <div class="order_items">

                        <img class="product_img" src="../../assets/image/stores/Charles-Keith/bag3.jpeg" alt="product">
                        <div>
                            <h4 id="order_title">uyfhdjsbafabsano</h4>
                            <p>Store name: Iphones</p>
                            <p>$121212</p>
                        </div>

                    </div> -->

				</div>

				<span>Discount code</span> <label id="discount" for=""> <input
					type="text" name="" id="discount_code">
					<button id="apply_btn">Apply</button>
				</label>

				<div>

					<div id="total_box">
						<div>
							<h3>Subtotal</h3>
							<h3>Delivery cast</h3>
							<hr>
							<h3>total</h3>
						</div>

						<div>
							<h3 id="subtotal"></h3>
							<h3>Free</h3>
							<hr>
							<h3 id="total"></h3>
						</div>

					</div>

				</div>

				<div id="btn_id">

					<button type="submit" id="checkout_btn">Checkout</button>

				</div>

			</div>

		</header>

	</form>

	<!-- ajax Script Link -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script>   
	
		// Golbal Scope variable used to get ajax values
		let userId;
		let productIdArr = [];
	
		// get date code

        // let newdate;
        // COMMENTED
        /*
        const dateObj = new Date();
        const month = dateObj.getUTCMonth() + 1; //months from 1-12
        const day = dateObj.getUTCDate()+2;
        const year = dateObj.getUTCFullYear();

        const newdate = `${day  }/${  month  }/${  year}`;
        console.log(newdate)

        // orders id code
        const order_id = Date.now();
        console.log(order_id) */ // END
        
        
        
     	// Getting Email from Input Box Value
       	const email = document.getElementById("email").value;
        console.log(email);
       
        // Getting user object using Ajax
		function getUserDetails() {
			const url = "http://localhost:8080/spartansmt_web/GetUserDetailsUsingEmail?email=" + email;
			axios.get(url)
			  .then(function (response) {
			    // handle success
			    console.log(response.data);
			    const user = response.data;
			    displayUser(user);
			  })
			  .catch(function (error) {
			    // handle error
			    console.log(error);
				})
		}
		
		function displayUser(user) {
	
			userId = user.userId;
			
			
	        document.getElementById("first_name").value = user.firstName;
	        document.getElementById("last_name").value = user.lastName;
	        document.getElementById("email").value = user.email;
	        document.getElementById("phone_number").value = user.phoneNumber;
	        
	        if(user.address != null){
				document.getElementById("address").value = user.address;
			}
			if(user.country != null){
				document.getElementById("country").value = user.country;
			}
			if(user.state != null){
				document.getElementById("state").value = user.state;
			}
			if(user.zipCode != null){
				document.getElementById("zip_code").value = user.zipCode;
			}
		
		}
		getUserDetails();
		
		// console.log("user: " + userId)

        /*
        const Cart = JSON.parse(localStorage.getItem("Cart")) ?? []
        const storess = JSON.parse(localStorage.getItem("stores"))*/  // END

        const url = window.location.search;                // ?name=Arun
        const urlParams = new URLSearchParams(url);        // converting string into key value pair
        const paramsId = urlParams.get("id")             // return value of the "name" key
        // console.log(paramsId);

        // const num = Number(paramsId)

        let storeName;

        let itemObj = {};

        let totalPrice = 0;

        if (paramsId == Number(paramsId)) {

            console.log("work")

           function getProductDetails() {
			const url = "http://localhost:8080/spartansmt_web/GetProductByProductId?id=" + paramsId;
			axios.get(url)
			  .then(function (response) {
			    // handle success
			    console.log(response.data);
			    const product = response.data;
			    displayProduct(product);
			  })
			  .catch(function (error) {
			    // handle error
			    console.log(error);
			  })
			}
		
		function displayProduct(product) {
			
			const productData = JSON.parse(product.substring(1));

			totalPrice += productData.productPrice;
			productIdArr.push(Number(paramsId));
            // console.log(totalPrice)

            // let div_order_items;
            // let img_product_img;
            // let div;
            // let h4_order_title;
            // let p_store_name;
            // let p_price;

            // <div class="order_items"></div>
            const div_order_items = document.createElement("div")
            div_order_items.setAttribute("class", "order_items")

            // <img class="product_img" src="../../assets/image/stores/ivenus-apple/mobile (6).png" alt="product">
            const img_product_img = document.createElement("img")
            img_product_img.setAttribute("class", "product_img")
            img_product_img.setAttribute("src", productData.productImage)
            img_product_img.setAttribute("alt", "product_img")
            div_order_items.prepend(img_product_img)

            // <div></div>
            const div = document.createElement("div")
            div_order_items.append(div)

            // <h4 id="order_title"></h4>
            const h4_order_title = document.createElement("h4")
            h4_order_title.setAttribute("id", "order_title")
            h4_order_title.innerText = productData.productTitle;
            div.prepend(h4_order_title)

            // <p>Store name: Iphones</p>
            const p_store_name = document.createElement("p")
            //p_store_name.innerText = `Storename: ${  storeName}`;
            div.append(p_store_name);

            // <p>$121212</p>
            const p_price = document.createElement("p")
            p_price.innerHTML = '&#8377;' + productData.productPrice;
            div.append(p_price)

            document.querySelector("#order_summary").append(div_order_items)
            
            // Appended the Total Price in the HTML Tag
            document.getElementById("subtotal").innerHTML = '&#8377;' + totalPrice;
            document.getElementById("total").innerHTML = '&#8377;' + totalPrice;
            
		}
		
		getProductDetails();

        }
		// COMMENTED
        /*else {
            // console.log("dont")

            Cart.find(el => {

                if (paramsId === el.user_email) {

                    storess.find(e => {

                        if (e.value === el.store_value) {

                            storeName = e.title

                        }
                        // return e;
                    })

                    totalPrice += Number(el.price) * el.quantity

                    // let div_order_items;
                    // let img_product_img;
                    // let div;
                    // let h4_order_title;
                    // let p_store_name;
                    // let p_price;

                    // <div class="order_items"></div>
                    const div_order_items = document.createElement("div")
                    div_order_items.setAttribute("class", "order_items")

                    // <img class="product_img" src="../../assets/image/stores/ivenus-apple/mobile (6).png" alt="product">
                    const img_product_img = document.createElement("img")
                    img_product_img.setAttribute("class", "product_img")
                    img_product_img.setAttribute("src", el.image)
                    img_product_img.setAttribute("alt", "product_img")
                    div_order_items.prepend(img_product_img)

                    // <div></div>
                    const div = document.createElement("div")
                    div_order_items.append(div)

                    // <h4 id="order_title"></h4>
                    const h4_order_title = document.createElement("h4")
                    h4_order_title.setAttribute("id", "order_title")
                    h4_order_title.innerText = el.title;
                    div.prepend(h4_order_title)

                    // <p>Store name: Iphones</p>
                    const p_store_name = document.createElement("p")
                    p_store_name.innerText = `Storename:${  storeName}`;
                    div.append(p_store_name);

                    // <p>$121212</p>
                    const p_price = document.createElement("p")
                    p_price.innerText = `₹${  el.price  } ` + `x` + ` ${  el.quantity}`
                    div.append(p_price)

                    document.querySelector("#order_summary").append(div_order_items)

                }
                // return el;
            })

        } */ // END

        /*console.log("print" + totalPrice)
        document.getElementById("subtotal").innerHTML = '&#8377;' + totalPrice;
        document.getElementById("total").innerHTML = '&#8377;' + totalPrice;

        */
        
        // get checkout btn
        const form = document.getElementById("form")
        form.onsubmit = function checkout(e) {

            e.preventDefault()

            // payment option checked value
            const payment_option = document.querySelector(".radio:checked").value
            console.log(payment_option)

            form.setAttribute("action", "<%=request.getContextPath() %>/PlaceOrderServlet?userId=" + userId + "&totalPrice=" + totalPrice + "&paymentOption=" + payment_option + "&productIdArr=" + productIdArr)

            form.submit();
            
     } 

            /*const orders = JSON.parse(localStorage.getItem("orders")) ?? []

            // if(order_id == )

            if (paramsId == Number(paramsId)) {

                // let orders = JSON.parse(localStorage.getItem("orders")) ?? []

                const obj = {};

                obj.product_id = itemObj.value
                obj.user_email = active_user.user_email
                obj.order_id = order_id
                obj.ordered_by = storeName;
                obj.payment_option = payment_option;
                obj.order_date = newdate;
                obj.image = itemObj.image
                obj.title = itemObj.title
                obj.quantity = 1;
                obj.price = itemObj.price
                
                // user address
                obj.address = active_user.address
                obj.country = active_user.country
                obj.state = active_user.state
                obj.zip_code = active_user.zip_code
                obj.mobile_number = active_user.mobile_number

                orders.push(obj)
                localStorage.setItem("orders", JSON.stringify(orders))

            }
            /*else {

                // let orders = JSON.parse(localStorage.getItem("orders")) ?? []

                Cart.find(el => {

                    if (paramsId === el.user_email) {

                        const obj = {};

                        obj.product_id = el.value
                        obj.user_email = el.user_email
                        obj.order_id = order_id
                        obj.ordered_by = "Cart"
                        obj.payment_option = payment_option;
                        obj.order_date = newdate;
                        obj.image = el.image
                        obj.title = el.title
                        obj.quantity = el.quantity
                        obj.price = el.price

                        // user address
                        obj.address = active_user.address
                        obj.country = active_user.country
                        obj.state = active_user.state
                        obj.zip_code = active_user.zip_code
                        obj.mobile_number = active_user.mobile_number

                        orders.push(obj)
                        localStorage.setItem("orders", JSON.stringify(orders))

                    }
                    // return el;
                })

            }

            window.location.href = `confirm_order.html?order_id=${  order_id}`;

        }

        // Cart count codes

        const Cart1 = JSON.parse(localStorage.getItem("Cart")) ?? []
        const active_user1 = JSON.parse(localStorage.getItem("active_user"))
        const cart_count = document.getElementById("cart_count")
        let count = 0;

        Cart1.find(e => {
            if (e.user_email === active_user1.user_email) {
                count++
            }
            // return e;
        })
        console.log(count)

        cart_count.innerText = count
        
        */
        
        
        /*let form = document.querySelector("form")
        form.addEventListener("submit", function(e){

            form.setAttribute("action", "PlaceOrderServlet?userId=" + userId + "&totalPrice=" + totalPrice + "&paymentOption=" )

        })*/
        
        
    </script>

</body>

</html>