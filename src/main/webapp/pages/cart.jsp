<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/cart.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
        rel="stylesheet">
    
    <title>SpartansMT</title>
    
	<link rel="stylesheet" type="text/css"
	href="../assets/css/nav.css">

    <link rel="icon" type="image/png" sizes="32x32" href="../assets/image/home/logo icon.png" alt="logo icon">
    
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">

</head>

<body>

	<jsp:include page="../nav.jsp"></jsp:include>

    <div id="empty_cart">
        <img src="https://iili.io/HUEYLrv.webp" alt="empty_cart">

        <button id="showNow_btn">Shop Now</button>
    </div>

    <div id="order-summary-word">
        <h2>Order Summary</h2>
    </div>

    <div class="main-contant">
       

    </div>

    <div class="details">
        <div class="price-details">
            <div>
                <span class="h1">Price Details</span>
                <h3 id="total_items"></h3>
                <h3>Delivery Charge</h3>
                <hr>
                <h3>Total Payable</h3>
                <hr>
                <h4 id="total_discount"></h4>
            </div>
            <div id="align-details">
                <h3 id="totalValue"></h3>
                <h3>FREE</h3>
                <hr>
                <h3 id="totalValue1"></h3>
                <hr>
            </div>

        </div>

        <div class="price-details">
            <div>
                <span class="h1">Your Details</span>
                <h4>Name:</h4>
                <h4>Emaii:</h4>
                <h4>Moblie No:</h4>
                <h4>Address:</h4>
            </div>
            <div id="align-details2">
                <h4 id="user-name-address"></h4>
                <h4 id="user-email-address"></h4>
                <h4 id="user_mobile_number"></h4>
                <h4 id="user-address"></h4>
            </div>
        </div>

    </div>
    <div id="place-order-container">
        <!-- <a href="pages/cart/payment-page.html">
            <h4 id="place-order-btn">Place Order</h4>
        </a> -->
    </div>

    <!-- Footer starting -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>   
	
		function getBaseUrlFromCurrentPage() {
			const baseUrl = window.location.protocol + '//' + window.location.host + '/';
			const contextPath = window.location.pathname.split('/')[1]; // Extract the context path
	
			return baseUrl + contextPath;
		}
	
		
		// Nav bar Cart Count
		// Here is Getting Cart Array to the Local Stroage
    	const Cart = JSON.parse(localStorage.getItem("Cart")) ?? [];
		
		// Here is Getting the <p> tag in HTML Using Id
	    const cart_count = document.getElementById("cart_count");
		
    	let count = 0;
    	Cart.find(e => {
        	if (e.email === "<%=request.getSession(false).getAttribute("actUserEmail") %>") {
            	count++
        	}
    	})
		
    	// Assigning a cart count to the cart_count element
    	cart_count.innerText = Number(count);

        
        /* Here is Adding the Cart Count in the h3 tag
           It is locatated in the cart page below the 
           Product Details Heading.
        */
        document.getElementById("total_items").innerText = "Price (" + count + "  : Items)";
        
		
        // Here is getting the user email using Jsp Scriptlet 
        <%
        	String email = (String) request.getSession(false).getAttribute("actUserEmail");
        %>
        
     	// Getting user object using Ajax
		function getUserDetails() {
			const url = getBaseUrlFromCurrentPage() + "/GetUserDetailsUsingEmail?email=<%=email %>";
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
			
			document.getElementById("user-name-address").innerText = user.firstName + " " + user.lastName;
		    document.getElementById("user-email-address").innerText = user.email;
		    document.getElementById("user-address").innerText = user.address + ", " + user.state + ", " + user.country + ", " + user.zipCode;
		    document.getElementById("user_mobile_number").innerText = user.phoneNumber;

		    // document.getElementById("total_discount").innerText = `Your Total Savings on this order` + ` ₹ ${totalDiscount}`

			
		}
        
		// Here is Called the GetUserDetails Ajax Method
		getUserDetails();
        
        
       
		
        let div_order_summary;
        let div_detalis;
        let produte_img;
        let title;
        let p_special_price;
        let div_column;
        let h6_rate;
        let p_line_through;
        let p_green
        let h4;
        let div_rating;
        let p;
        let b;
        let h4_rating;
        let h3_add_more_items;
        let label_number_of_items;

        

        const produte_list = JSON.parse(localStorage.getItem("Cart"))
        

        let totalValue = 0;

        let totalDiscount = 0

        let totalItems = 0;


        for (let i = 0; i < produte_list.length; i++) {

            if (produte_list[i].email === "<%=request.getSession(false).getAttribute("actUserEmail") %>") {

                // cart Product Quantity
                const quantity = 1;

                // total discount code for line 267 to 269
                let discount = 0;
                // discount = Number(produte_list[i].full_price) - Number(produte_list[i].price)
                totalDiscount += discount

                // total value code
                totalValue += Number(produte_list[i].productPrice) * quantity;
                console.log(totalValue);

                // total products in the cart page code
                totalItems++

                // Product Value

                div_order_summary = document.createElement("div");
                div_order_summary.setAttribute("class", "order-summary");
                // console.log(div_order_summary);

                produte_img = document.createElement("img");
                produte_img.setAttribute("class", "order-img");
                produte_img.setAttribute("src", produte_list[i].productImage)
                // produte_img.setAttribute("alt",  produte_list[i]["produte_img"]["alt"])
                div_order_summary.prepend(produte_img);

                div_detalis = document.createElement("div");
                div_order_summary.append(div_detalis);

                title = document.createElement("h1");
                title.setAttribute("class", "product_value")
                title.innerText = produte_list[i].productTitle;
                title.setAttribute("data-value", produte_list[i].productId)
                div_detalis.prepend(title);

                p_special_price = document.createElement("p");
                p_special_price.setAttribute("class", "price-color");
                p_special_price.innerText = "Special Price";
                div_detalis.append(p_special_price);

                div_column = document.createElement("div");
                div_column.setAttribute("class", "column");
                div_detalis.append(div_column);

                h6_rate = document.createElement("h6");
                h6_rate.setAttribute("class", "rate");
                h6_rate.innerHTML = "&#x20b9;" + produte_list[i].productPrice;
                h6_rate.setAttribute("data-keyword", produte_list[i].productPrice)

                div_column.prepend(h6_rate);


                h4 = document.createElement("h4");
                h4.innerText = "Delivery FREE";
                div_detalis.append(h4);

                div_rating = document.createElement("div");
                div_rating.setAttribute("class", "rating-line");
                div_detalis.append(div_rating);


                h3_add_more_items = document.createElement("h3");
                h3_add_more_items.setAttribute("class", "add-more-items");
                // h3_add_more_items.innerText = "Add More Items";
                div_detalis.append(h3_add_more_items);

                label_number_of_items = document.createElement("label");
                label_number_of_items.setAttribute("id", "input_label")
                label_number_of_items.innerText = "Add More Items";
                h3_add_more_items.append(label_number_of_items);


                const p_minus = document.createElement("button")
                p_minus.setAttribute("class", "minus")
                p_minus.innerText = "-";
                label_number_of_items.append(p_minus)

                const span = document.createElement("input")
                span.setAttribute("class", "qty")
                span.setAttribute("value", produte_list[i].quantity)
                span.setAttribute("type", "text")
                span.innerText = quantity;
                label_number_of_items.append(span)

                const p_plus = document.createElement("button")
                p_plus.setAttribute("class", "plus")
                p_plus.innerText = "+";

                label_number_of_items.append(p_plus)

                const btn_remove = document.createElement("button")
                btn_remove.innerText = "Remove Cart";
                btn_remove.setAttribute("class", "remove_cart_btn")
                btn_remove.setAttribute("id", "btn_remove_cart")
                h3_add_more_items.append(btn_remove)

                document.querySelector("div.main-contant").append(div_order_summary);

                btn_remove.addEventListener("click", () => {

                    for (let j = 0; j < produte_list.length; j++) {

                        // console.log(produte_list[i])

                        if (produte_list[i].email === "<%=request.getSession(false).getAttribute("actUserEmail") %>" && produte_list[i].productTitle === produte_list[j].productTitle) {

                            // console.log(produte_list[i])

                            produte_list.splice(i, 1);

                            localStorage.setItem("Cart", JSON.stringify(produte_list));

                            location.reload(1)
                            break
                        }

                    }

                })

           }

        }
            
            
            

        // Total value 
        document.getElementById("totalValue").innerHTML = "&#x20b9;" + totalValue;
        document.getElementById("totalValue1").innerHTML = "&#x20b9;" + totalValue;

        // Cart Quantity Codes (+ and -)

        const plus_btn = document.querySelectorAll(".plus")
        const minus_btn = document.querySelectorAll(".minus")
        const price_pr = document.querySelectorAll(".rate")
        const num_digit = document.querySelectorAll(".qty")

        const full_price = document.querySelectorAll(".line-through")
        const discount = document.querySelectorAll(".discount")

        const product_value = document.querySelectorAll(".product_value")

        for (let i = 0; i < plus_btn.length; i++) {

            plus_btn[i].addEventListener("click", () => {

                num_digit[i].value++
                totalItems++

                // Total price (+)
                const totalvalue = parseFloat(price_pr[i].dataset.keyword) * parseFloat(num_digit[i].value)
                // console.log(totalvalue)
                price_pr[i].innerHTML = "&#8377;" + totalvalue;

                // Total product count 
                document.getElementById("total_items").innerText = "Price ( " + totalItems + " : Items)";

                // Total price for all product
                totalValue += parseFloat(price_pr[i].dataset.keyword);
                document.getElementById("totalValue").innerHTML = "&#8377;" + totalValue;
                document.getElementById("totalValue1").innerHTML = "&#8377;" + totalValue;

            })

        }

        for (let i = 0; i < minus_btn.length; i++) {

            minus_btn[i].addEventListener("click", () => {
                if (num_digit[i].value > 1) {

                    num_digit[i].value--;
                    totalItems--;

                    // Total price (-)
                    const totalvalue = parseFloat(price_pr[i].dataset.keyword) * parseFloat(num_digit[i].value)
                    // console.log(totalvalue)
                    price_pr[i].innerHTML = "&#8377;" + totalvalue;

                    // Total product count ++
                    document.getElementById("total_items").innerText = "Price ( " + totalItems +" : Items)";

                    // Total price for all product
                    totalValue -= parseFloat(price_pr[i].dataset.keyword);
                    document.getElementById("totalValue").innerHTML = "&#8377;" + totalValue;
                    document.getElementById("totalValue1").innerHTML = "&#8377;" + totalValue;

                }

            })

        }
        

        
       

        // Place Order Button Codes for JS

        // <a href="../../pages/cart/payment-page.html">            // HTML Code Converted into JS
        //     <h4 id="place-order-btn">Place Order</h4>
        // </a>

        // let a_tag;
        // let h4_place_order_btn;

        const a_tag = document.createElement("a")
        a_tag.setAttribute("id", "place_order_a")
        a_tag.addEventListener("click", () => {

            produte_list.find(e => {

                if (e.email === "<%=request.getSession(false).getAttribute("actUserEmail")%>") {

                    for (let i = 0; i < num_digit.length; i++) {
                        // num_digit[i].value
                        console.log(e);
                        if (e.productId == product_value[i].dataset.value) {

                            e.quantity = Number(num_digit[i].value)

                            localStorage.setItem("Cart", JSON.stringify(produte_list))

                            break;

                            //console.log(e);
                        }

                    }

                    window.location.href = `<%=request.getContextPath() %>/pages/paymentpage.jsp?id=<%=request.getSession(false).getAttribute("actUserEmail")%>`

                }
                
            })

        })

        // This HTML Tag Converted into JS Below
        // a_tag.setAttribute("href", "../../pages/cart/payment-page.html?id=" + user.user_email)

        const h4_place_order_btn = document.createElement("p")
        h4_place_order_btn.setAttribute("id", "place-order-btn")
        h4_place_order_btn.innerText = "Place order";
        a_tag.prepend(h4_place_order_btn)

        document.querySelector("#place-order-container").append(a_tag)

        

        // Empty Cart Codes
        if (Number(totalValue) === 0) {

            document.getElementById("empty_cart").style.display = "flex";
            document.getElementById("order-summary-word").style.display = "none";
            document.querySelector(".main-contant").style.display = "none"; // flex
            document.querySelector(".details").style.display = "none"; //flex
            document.getElementById("place-order-container").style.display = "none";
            document.querySelector(".back-to-top").style.display = "none"; // block
            document.querySelector("footer").style.display = "none";

            document.getElementById("showNow_btn").addEventListener("click", () => {
                window.location.href = "<%=request.getContextPath()%>/index.jsp";
            })

        }
        else {

            document.getElementById("empty_cart").style.display = "none";
            document.getElementById("order-summary-word").style.display = "block";
            document.querySelector(".main-contant").style.display = "flex"; // flex
            document.querySelector(".details").style.display = "flex"; //flex
            document.getElementById("place-order-container").style.display = "block";
            document.querySelector(".back-to-top").style.display = "block"; // block
            document.querySelector("footer").style.display = "block";

        }

        // Shop Now btn
    </script>

</body>

</html>