<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/profile.css">

<title>SpartansMT</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath() %>/assets/image/home/logo icon.png" alt="logo icon">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer">

<!-- Notify CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">

<!-- Notify Js script file -->
<script
	src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>


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



	<%
	String userEmail = (String) request.getSession().getAttribute("actUserEmail");
	if (userEmail != null) {
	%>

	<header id="profile_page">

		<div class="profile">

			<div>
				<img src="<%=request.getContextPath() %>/assets/image/services/buildings.jpg" alt="User Profile">
				<h3 id="user_name"></h3>

			</div>

			<br>

			<ul>
				<a href="<%=request.getContextPath()%>/pages/profile.jsp?id=profile">
					<menu id="btn_profile" class="active">Profile
					</menu>
				</a>
				<a href="<%=request.getContextPath()%>/pages/profile.jsp?id=orders">
					<menu id="btn_order" class="active">Orders
					</menu>
				</a>

				<a
					href="<%=request.getContextPath()%>/pages/profile.jsp?id=wishlist">
					<menu id="btn_wishlist" class="active">Wishlist
					</menu>
				</a>
				<!-- <menu id="btn_payment" class="active">Payment</menu> -->
			</ul>

		</div>

		<div class="details profile_details" id="profile_details">

			<div class="pages_align">
				<a href="<%=request.getContextPath()%>/index.jsp">
					<h4>Home</h4>
				</a> <i class="fa-solid fa-chevron-right"></i> <a
					href="../pages/home/profile.html?id=orders">
					<h4>Profile</h4>
				</a>
			</div>

			<form id="form"
				action="<%=request.getContextPath()%>/UpdateUserDetails"
				method="post">

				<div class="name">
					<div>
						<label for="first_name">First name</label> <br> <input
							type="text" id="first_name" class="two_input" name="firstName"
							disabled>
					</div>
					<div>
						<label for="last_name">Last name</label> <br> <input
							type="text" id="last_name" name="lastName" class="two_input"
							disabled>
					</div>
				</div>

				<div>
					<label for="email">Email</label> <br> <input type="email"
						name="email" value="<%=userEmail%>" id="email" class="one_input"
						disabled>
				</div>

				<div>
					<label for="address">Mobile number</label> <br> <input
						id="mobileNumber" type="tel" pattern="[789][0-9]{9}"
						name="mobileNumber" class="one_input" required disabled>
				</div>

				<div>
					<label for="address2">Address</label> <br> <input
						id="address2" type="text" class="one_input" name="address"
						required disabled>
				</div>

				<div class="name">

					<div>
						<label for="country">Country</label> <br> <input id="country"
							type="text" name="country" pattern="^[a-zA-Z ]+$" class="three_input" required disabled>
					</div>

					<div>
						<label for="state">State</label> <br> <input id="state"
							type="text" name="state" pattern="^[a-zA-Z ]+$" class="three_input" required disabled>
					</div>

					<div>
						<label for="zip_code" class="three_input">Zip Code</label> <br>
						<input id="zip_code" name="zipCode" type="number" pattern="[0-9]{6}" min="100000" max="999999"
							pattern="[0-9]{6}" required disabled>
					</div>

				</div>

				<div class="btn_flex">
					<button id="edit" onclick="editItem()" type="button">Edit
						Profile</button>
					<button id="update" type="submit">Update Profile</button>
					<!-- <button onclick="deleteItem()" type="button">Delete
						Profile</button> -->

				</div>

			</form>

		</div>

		<div class="details order_details" id="order_details">

			<div class="pages_align">
				<a href="<%=request.getContextPath()%>/index.jsp">
					<h4>Home</h4>
				</a> <i class="fa-solid fa-chevron-right"></i>
				<h4>Orders</h4>
			</div>

			<span class="h1">Orders</span>

			<div class="silder_fles">
				<h4 id="product_count"></h4>

				<!-- <div> -->
				<!-- <p id="silder_left"><i class="fa-solid fa-caret-left"></i></p> -->
				<!-- <p id="silder_point">1</p> -->
				<!-- <p id="silder_right"><i class="fa-solid fa-caret-right"></i></p> -->
				<!-- </div> -->

			</div>

			<div class="order_list">

				<!-- <div>

                    <div class="order_numer">
                        <h1>Order 629173</h1>
                    </div>

                    <div class="order_date">
                        <p class="order_color"></p>
                        <p>Shipped on 01 Apr, 2023</p>
                    </div>

                    <div class="order_product">

                        <img class="product_img" src="../assets/image/stores/items/nike1.jpg" alt="">

                    </div>

                </div>

                <div>

                    <div class="order_numer">
                        <h1>Order 522429</h1>
                    </div>

                    <div class="order_date">
                        <p class="order_color"></p>
                        <p>Shipped on 01 Apr, 2023</p>
                    </div>

                    <div class="order_product">

                        <img class="product_img" src="../assets/image/stores/ivenus/mobile (1).jpg" alt="">

                    </div>

                </div>

                <div>

                    <div class="order_numer">
                        <h1>Order 526782</h1>
                    </div>

                    <div class="order_date">
                        <p class="order_color"></p>
                        <p>Shipped on 01 Apr, 2023</p>
                    </div>

                    <div class="order_product">

                        <img class="product_img" src="../assets/image/stores/jack-zone/dress10.jpg" alt="">

                    </div>

                </div>

                <div>

                    <div class="order_numer">
                        <h1>Order 556729</h1>
                    </div>

                    <div class="order_date">
                        <p class="order_color"></p>
                        <p>Shipped on 01 Apr, 2023</p>
                    </div>

                    <div class="order_product">

                        <img class="product_img" src="../assets/image/stores/jack-zone/dress12.jpg" alt="">

                    </div>

                </div> -->

			</div>

		</div>

		<div class="details wishlist_details" id="wishlist_details">

			<div class="pages_align">
				<a href="<%=request.getContextPath()%>/index.jsp">
					<h4>Home</h4>
				</a> <i class="fa-solid fa-chevron-right"></i>
				<h4>WishList</h4>
			</div>

			<span class="h1">Wishlist</span>

			<div class="limit">
				<p id="wl_total_items"></p>
				<!-- <div id="slider">
                    <p>
                        <i class="fa-solid fa-caret-left"></i>
                    </p>
                    <p>1</p>
                    <p>
                        <i class="fa-solid fa-caret-right"></i>
                    </p>
                </div> -->
			</div>

			<div class="items">

				<!-- <div>
                    
                    <img src="../assets/image/stores/items/nike1.jpg" alt="">
                    <h3>this product is one of the most expensive product in the world</h3>
                    <h4>$12112</h4>
                    <button>Add to Cart</button>
                    <i class="fa-solid fa-xmark"></i>

                </div>

                <div>
                    
                    <img src="../assets/image/stores/ivenus-apple/mac (1).png" alt="">
                    <h3>this product is one of the most expensive product in the world</h3>
                    <h4>$12112</h4>
                    <button>Add to Cart</button>
                    <i class="fa-solid fa-xmark"></i>

                </div>

                <div>
                    
                    <img src="../assets/image/stores/Charles-Keith/bag2.jpeg" alt="">
                    <h3>this product is one of the most expensive product in the world</h3>
                    <h4>$12112</h4>
                    <button>Add to Cart</button>
                    <i class="fa-solid fa-xmark"></i>

                </div>

                <div>
                    
                    <img src="../assets/image/stores/label-designer-wear/shopping (2).webp" alt="">
                    <h3>this product is one of the most expensive product in the world</h3>
                    <h4>$12112</h4>
                    <button>Add to Cart</button>
                    <i class="fa-solid fa-xmark"></i>

                </div> -->

			</div>

		</div>

	</header>
	<%
	} else {
	%>
	<script>
		window.location.href = "<%=request.getContextPath()%>/pages/login.jsp";
	</script>
	<%
	}
	%>

	<!-- ajax Script Link -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>        
    	
    	
    	document.getElementById("profile_details").style.display = "block";
        document.getElementById("order_details").style.display = "none";
        document.getElementById("wishlist_details").style.display = "none";

        
        // pages display's codes
        const btn_profile = document.getElementById("btn_profile")
        btn_profile.addEventListener("click", el => {
        	el.preventDefault();
            document.getElementsByClassName("profile_details")[0].style.display = "block";
            document.getElementsByClassName("wishlist_details")[0].style.display = "none"
            document.getElementsByClassName("order_details")[0].style.display = "none";
            console.log("profile")
        })

        const btn_order = document.getElementById("btn_order")
        btn_order.addEventListener("click", el => {
        	el.preventDefault();
            document.getElementsByClassName("order_details")[0].style.display = "block";
            document.getElementsByClassName("profile_details")[0].style.display = "none";
            document.getElementsByClassName("wishlist_details")[0].style.display = "none"
            console.log("orders")
        })

        const btn_wishlist = document.getElementById("btn_wishlist");
        btn_wishlist.addEventListener("click", el => {
        	el.preventDefault();
            document.getElementsByClassName("wishlist_details")[0].style.display = "block"
            document.getElementsByClassName("profile_details")[0].style.display = "none";
            document.getElementsByClassName("order_details")[0].style.display = "none";
            console.log("wishlist")
        })
        
        
        // Here is Create userId to Get the user Id via the ajax call (below mentioned)
        let userId = 0;
		
       	// Getting Email from Input Box Value
       	const email = document.getElementById("email").value;
       
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
			document.getElementById("mobileNumber").value = user.phoneNumber;
			
			if(user.address != null){
				document.getElementById("address2").value = user.address;
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
			getAllOrders();
        
		}
		
        // Called the Get User Details Ajax function.
		getUserDetails();
        
        
		let items_count = 0;
		// Edit Profile Input Box Enable Function
        function editItem() {

            document.getElementById("first_name").disabled = false
            document.getElementById("last_name").disabled = false
            document.getElementById("mobileNumber").disabled = false
            document.getElementById("address2").disabled = false
            document.getElementById("zip_code").disabled = false
            document.getElementById("state").disabled = false
            document.getElementById("country").disabled = false

        }
		
		
		
     	// Order Details Codes
     	function getAllOrders() {
			const url = "http://localhost:8080/spartansmt_web/GetAllOrderesUsingUserId?userId=" + userId;
			axios.get(url)
			  .then(function (response) {
			    // handle success
			    console.log(response.data);
			    const order = response.data;
			    displayOrders(order);
			  })
			  .catch(function (error) {
			    // handle error
			    console.log(error);
				})
		}
     	
     	// Using GetProductByProductId Ajax will assign the image link
     	// let imageLink = "";
     	
     	function displayOrders(order){
     		
     		console.log(order)
     		
     		//if(order != ""){
     		order.forEach((e,i) => {
     		
     			 // items count
                items_count++

                // order page div alignment
                // let div;
                // let div_order_numer;
                // let h1_order_id;
                // let div_order_date;
                // let p_order_color;
                // let p_order_date;
                // let div_order_product;
                // let img_product_img;

                const div = document.createElement("div")
                div.setAttribute("class", "product")
                div.addEventListener("click", () => {

                    window.location.href = "<%=request.getContextPath()%>/pages/ordertracker.jsp?id=" + e.orderId;

                })

                const div_order_numer = document.createElement("div")
                div_order_numer.setAttribute("class", "order_numer")
                div.prepend(div_order_numer)

                const h1_order_id = document.createElement("h2")
                h1_order_id.innerText = "Order id:" + e.orderId;
                div_order_numer.prepend(h1_order_id)

                const div_order_date = document.createElement("div")
                div_order_date.setAttribute("class", "order_date")
                div.append(div_order_date)

                const p_order_color = document.createElement("p")
                p_order_color.setAttribute("class", "order_color")
                div_order_date.prepend(p_order_color)

                const p_order_date = document.createElement("p")
                p_order_date.innerText = "Shipped on " + e.orderDate;
                div_order_date.append(p_order_date)

                const div_order_product = document.createElement("div")
                div_order_product.setAttribute("class", "order_product")
                div.append(div_order_product)
	
                //console.log(e.orderedProducts[0].productId);
               
            
     			
                const img_product_img = document.createElement("h2")
                //img_product_img.setAttribute("class", "product_img img_link")
              	img_product_img.innerText = "Ordered Product: " + e.orderedProducts.length;
                // img_product_img.setAttribute("class", "img_link")
                // img_product_img.setAttribute("src", imageLink)
                
                // img_product_img.setAttribute("alt", "Product image")
                div_order_product.prepend(img_product_img)

                //getProductDetails(e.orderedProducts[0].productId,i);
                
                document.querySelector(".order_list").prepend(div)
     			
                
     			
     		})
     		//}

     		
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
 		
 		function displayProduct(productData,i) {
 			
 			document.querySelectorAll(".img_link")[i].setAttribute("src", productData.productImage);
 			
 		}
     	
     	
     	
     	/*
        const orders = JSON.parse(localStorage.getItem("orders")) ?? []
        
        orders.find(el => {

            // for(let i=orders.length; i<orders.length-4; i++){

            if (el.user_email === active_user.user_email) {

               
                
            }

            // }

            // return el;

        })
		*/
		
		
		
		
		
		
		
		
		

        // Update Profile Details codes

        const form = document.getElementById("form")
        form.addEventListener("submit", () => {

            // const active_user = JSON.parse(localStorage.getItem('active_user'));

            // const users = JSON.parse(localStorage.getItem('arr'));

            users.forEach(e => {

                if (active_user.user_email === e.user_email) {

                    active_user.first_name = document.getElementById("first_name").value
                    active_user.last_name = document.getElementById("last_name").value
                    active_user.user_email = document.getElementById("email").value
                    active_user.mobile_number = document.getElementById("address").value
                    active_user.address = document.getElementById("address2").value
                    active_user.zip_code = document.getElementById("zip_code").value

                    active_user.state = document.getElementById("state").value;
                    active_user.country = document.getElementById("country").value;

                    document.getElementById("first_name").value = active_user.first_name;
                    document.getElementById("last_name").value = active_user.last_name;
                    document.getElementById("email").value = active_user.user_email;
                    document.getElementById("address").value = active_user.mobile_number;
                    document.getElementById("address2").value = active_user.address;
                    document.getElementById("zip_code").value = active_user.zip_code;
                    document.getElementById("state").value = active_user.state
                    document.getElementById("country").value = active_user.country

                    // selectedValue = active_user["state"];
                    // countryValue = active_user["country"];

                    localStorage.setItem("active_user", JSON.stringify(active_user))

                    e.first_name = active_user.first_name
                    e.last_name = active_user.last_name
                    e.user_email = active_user.user_email
                    e.mobile_number = active_user.mobile_number
                    e.address = active_user.address
                    e.zip_code = active_user.zip_code
                    e.state = active_user.state
                    e.country = active_user.country

                    localStorage.setItem("arr", JSON.stringify(users))

                    location.reload();

                    document.getElementById("first_name").disabled = true
                    document.getElementById("last_name").disabled = true
                    document.getElementById("address").disabled = true
                    document.getElementById("address2").disabled = true
                    document.getElementById("zip_code").disabled = true
                    document.getElementById("country").disabled = true
                    document.getElementById("state").disabled = true

                }
            })

        })

        // delect profile codes
        function deleteItem() {

            // const users = JSON.parse(localStorage.getItem("arr"));

            for (let i = 0; i < users.length; i++) {
                if (document.getElementById("email").value === users[i].user_email) {
                    users.splice(i, 1)
                    alert("Your account have been deleted")
                    localStorage.setItem("arr", JSON.stringify(users));

                    window.location.href = "../pages/login/login.html";
                }
            }
        }

        

       

        // <div>

        // </div>

        // Wishlist page code converted HTML to JS codes below

        const wishlist_items = JSON.parse(localStorage.getItem("wishList")) ?? []
        let wl_total_items = 0;

        wishlist_items.find(element => {

            if (active_user.user_email === element.user_email) {

                wl_total_items++;

                // WL meen Wishlist
                // let wl_div
                // let wl_img;
                // let wl_h3;
                // let wl_h4;
                // let wl_btn_cart;
                // let icon;

                // <div></div>
                const wl_div = document.createElement("div")

                // <img src="../assets/image/stores/items/nike1.jpg" alt="">
                const wl_img = document.createElement("img")
                wl_img.setAttribute("src", element.image)
                wl_img.setAttribute("alt", "Product img")
                wl_div.prepend(wl_img)

                // <h3>this product is one of the most expensive product in the world</h3>
                const wl_h3 = document.createElement("h3")
                wl_h3.innerText = element.title;
                wl_div.append(wl_h3)

                // <h4>$12112</h4>
                const wl_h4 = document.createElement("h4")
                wl_h4.innerText = `₹${  element.price}`;
                wl_div.append(wl_h4)

                // <button>Add to Cart</button>
                const wl_btn_cart = document.createElement("button")
                wl_btn_cart.innerText = "Add to Cart";
                wl_div.append(wl_btn_cart)

                // <i class="fa-solid fa-xmark"></i>
                const icon = document.createElement("i")
                icon.setAttribute("class", "fa-solid fa-xmark")
                wl_div.append(icon)

                document.querySelector(".items").prepend(wl_div)

                const productTitle = element.title

                icon.addEventListener("click", () => {

                    for (let j = 0; j < wishlist_items.length; j++) {

                        if (productTitle === wishlist_items[j].title) {

                            wishlist_items.splice(j, 1);

                            localStorage.setItem("wishList", JSON.stringify(wishlist_items))

                            location.reload(1)

                            window.location.href = "profile.html?id=wishlist";

                            break;
                        }

                    }

                })

                wl_btn_cart.addEventListener("click", () => {

                    const user = JSON.parse(localStorage.getItem("active_user"))

                    const addCart = JSON.parse(localStorage.getItem("Cart")) ?? [];

                    let check;

                    addCart.find(e => {

                if (e.value === element.value && e.user_email === user.user_email) {
                    return check = 1;
                }
                
                    check = 0;
                    return e;

            })

                    if (check === 1) {
                        alert("already added")
                    }
                    else {

                        const item = {};

                        item.title = element.title;
                        item.image = element.image;
                        item.price = element.price;
                        item.full_price = element.full_price;
                        item.discount = element.discount;
                        item.rating = element.rating;
                        item.reviews = element.reviews;
                        item.value = element.value;
                        item.user_email = user.user_email;

                        // I didn't added Store Value so Clear the Bug After unblock the below code
                        item.store_value = element.store_value;

                        addCart.push(item);
                        localStorage.setItem("Cart", JSON.stringify(addCart));

                        alert("added")

                    }

                })

            }

            // return element;

        })

        document.getElementById("wl_total_items").innerText = `${  wl_total_items  } results`

        /*
        
            <div>

                <div class="order_numer">
                    <h1>Order 629173</h1>
                </div>

                <div class="order_date">
                    <p class="order_color"></p>
                    <p>Shipped on 01 Apr, 2023</p>
                </div>

                <div class="order_product">

                    <img class="product_img" src="../assets/image/stores/items/nike1.jpg" alt="">

                </div>

            </div>

        */

        

        // product count
        const product_count = document.getElementById("product_count")
        product_count.innerText = `${items_count  } Items`

        // get params value to match the page 

        const url = window.location.search;
        const urlParams = new URLSearchParams(url);
        const paramsId = urlParams.get("id")

        console.log(paramsId)

        if (paramsId === "orders") {

            document.getElementsByClassName("order_details")[0].style.display = "block";
            document.getElementsByClassName("profile_details")[0].style.display = "none";
            document.getElementsByClassName("wishlist_details")[0].style.display = "none"

        }
        if (paramsId === "wishlist") {

            document.getElementsByClassName("wishlist_details")[0].style.display = "block"
            document.getElementsByClassName("profile_details")[0].style.display = "none";
            document.getElementsByClassName("order_details")[0].style.display = "none";

        }

    </script>

</body>

</html>