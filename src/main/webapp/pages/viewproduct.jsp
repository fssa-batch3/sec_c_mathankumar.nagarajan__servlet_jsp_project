<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page language="java" import="com.fssa.spartansmt.model.Product" %>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/viewproduct.css">

<link
	href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="/spartansmt_web/assets/css/nav.css">

<title>SpartansMT</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath()%>/assets/image/home/logo icon.png">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
	
	<!-- Notify -->
	<!-- Notify CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
    
    <!-- Notify Js script file -->
    <script src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>

</head>

<body>
	
	<%String email = (String) request.getSession().getAttribute("actUserEmail");%>
	

	<jsp:include page="../nav.jsp"></jsp:include>

	<div class="view-product">
        
    </div>
	
	<div class="details"></div>

	<!-- Scroll Line -->

	<h2 id="most-viewed">- - - - - - - - - - MOST VIEWED STORES - - -
		- - - - - - -</h2>
	<div id="scroll-box"></div>

	<!-- Footer starting -->
	<jsp:include page="../footer.jsp"></jsp:include>


	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript">
	
	
	
	
	function getBaseUrlFromCurrentPage() {
		const baseUrl = window.location.protocol + '//' + window.location.host + '/';
		const contextPath = window.location.pathname.split('/')[1]; // Extract the context path

		return baseUrl + contextPath;
	}
	
	
	const url = window.location.search;                // ?name=Arun
    const urlParams = new URLSearchParams(url);        // converting string into key value pair
    const paramsId = urlParams.get("id")             // return value of the "name" key
    console.log(paramsId);
    
    // Below is Getting the Object from getProductDetails Ajax method
    let product = {};
	
    // below function to get the product details via db
    
    function getProductDetails() {
			const url = getBaseUrlFromCurrentPage() + "/GetProductByProductId?id=" + paramsId;
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
		
		function displayProduct(productData) {
			
			// Here is Assigning the productDate obj to product obj
			product = productData;
			
			let div;
	        let div_column;
	        let h6_rate;
	        let p_line_through;
	        let p_green;
	        let h5;
	        let h2;
	        let ol;
	        let li;

	        const div_product_img = document.createElement("div")
	        div_product_img.setAttribute("class", "product_div")

	        const product_image = document.createElement("img");
	        product_image.setAttribute("class", "product-img")
	        product_image.setAttribute("src", productData.productImage)
	        product_image.setAttribute("alt", "Product Image");
	        div_product_img.append(product_image)

	        div = document.createElement("div");
	        div.setAttribute("id", "details_div");
	        // console.log(div)

	        // <h1>Nike Mens Air Zoom Vomero 15 Running Shoe</h1>
	        const h1_title = document.createElement("h2");
	        h1_title.setAttribute("class", "title")
	        h1_title.innerText = productData.productTitle;
	        div.prepend(h1_title)

	        // <p><span class="price-color"> special Price</span></p>
	        const p_price_color = document.createElement("p");
	        p_price_color.setAttribute("class", "price-color");
	        p_price_color.innerText = "Special Price";
	        div.append(p_price_color);

	        // <div class="column"></div>
	        div_column = document.createElement("div");
	        div_column.setAttribute("class", "column");
	        div.append(div_column);

	        // <h6 class="rate">&#8377;6,000</h6>
	        h6_rate = document.createElement("h6")
	        h6_rate.setAttribute("class", "rate")
	        h6_rate.innerHTML = '&#8377;' + productData.productPrice;
	        // h6_rate.innerText = ;
	        div_column.prepend(h6_rate)

	        // <p class="line-through">&#8377;10,000</p>
	        p_line_through = document.createElement("p")
	        p_line_through.setAttribute("class", "line-through");
	        // p_line_through.innerText = `₹${product.full_price}`;
	        div_column.append(p_line_through);

	        // <p><b><span class="green">(40% off)</span></b></p>
	        p_green = document.createElement("p")
	        p_green.setAttribute("class", "green")
	        // p_green.innerText = `(${product.discount}%)`;
	        div_column.append(p_green);

	
	        // <h2>Available offers</h2>
	        h2 = document.createElement("h2");
	        h2.innerText = "Available Offers";
	        div.append(h2)

	        // <ol></ol>
	        ol = document.createElement("ol")
	        div.append(ol)

	        // <li>
	        // <b>Special Price:</b> 
	        // Get extra 3% off (price inclusive of cashback/coupon)
	        // <a href="#">T&C</a>
	        // </li>
	        // <li><b>Bank Offer:</b> 10% instant discount on SBI Credit Card, up to ₹750 on orders of ₹2,500 and above <a href="#">T&C</a></li>
	        // <li><b>Bank Offer:</b> Flat ₹100 Instant Cashback on Paytm Wallet. Min Order Value ₹1000. <br>Valid once per Paytm account <a href="#">T&C</a></li>

	        const b = [
	            {
	                offer: "Special Price:",
	                coupon: " Get extra 3% off (price inclusive of cashback/coupon) T&C",
	            },
	            {
	                offer: "Bank Offer:",
	                coupon: " 10% instant discount on SBI Credit Card, up to &#8377;750 on orders of &#8377;2,500 and above T&C",
	            },
	            {
	                offer: "Bank Offer:",
	                coupon: " Flat &#8377;100 Instant Cashback on Paytm Wallet. Min Order Value &#8377;1000. Valid once per Paytm account T&C",
	            }
	        ]

	        for (let i = 0; i < 3; i++) {
	            li = document.createElement("li");
	            li.innerHTML = b[i].coupon;
	            ol.append(li);

	            const bold = document.createElement("b");
	            bold.innerHTML = b[i].offer
	            li.prepend(bold);
	        }

	        // <div class="button"></div>
	        const div_button = document.createElement("div");
	        div_button.setAttribute("class", "button");
	        div.append(div_button);

	      

	        const a_add_to_cart = document.createElement("button");
	        a_add_to_cart.setAttribute("type", "button");
	        a_add_to_cart.setAttribute("id", "btn_cart");
	        // a_add_to_cart.setAttribute("onclick", addCart())                     //add to cart
	        a_add_to_cart.innerText = "Add to Cart";
	        div_button.prepend(a_add_to_cart)

	        const a_buy_no1 = document.createElement("a");
	        a_buy_no1.setAttribute("id", "alertBuyNow");
	        div_button.append(a_buy_no1)


	        const a_buy_now = document.createElement("button");
	        a_buy_now.setAttribute("type", "button");
	        a_buy_now.innerText = "Buy Now";
	        a_buy_no1.append(a_buy_now)

	        document.querySelector("div.view-product").append(div_product_img);
	        document.querySelector("div.view-product").append(div);
	        
	        
	     	// Add to Cart Codes Below Written
	     	
			const btn_cart = document.getElementById("btn_cart")
	        btn_cart.addEventListener("click", el => {
	        	
	        	if("<%=email%>" != null){
	        		addCart(el);
	        	}else{
	        		login()
	        	}

	        })
	        const alertBuyNow = document.getElementById("alertBuyNow")
	        alertBuyNow.addEventListener("click", el => {
	        	
	        	if("<%=email%>" != null){
	        		window.location.href = "<%=request.getContextPath() %>/pages/paymentpage.jsp?id=" + paramsId;
	        	}else{
	        		login()
	        	}

	        })
	       
	        

			
		}
		
		getProductDetails();
		
		
		function addCart(el){
			
			console.log(product)

            //const user = JSON.parse(localStorage.getItem("active_user"))

            const addCart = JSON.parse(localStorage.getItem("Cart")) ?? [];

            let check;

            addCart.find(e => {
				
            	if (Number(e.productId) === Number(paramsId) && e.email === "<%=request.getSession(false).getAttribute("actUserEmail") %>") {
                    return check = 1;
                }
        
                check = 0;
                //return e
            })

            if (check === 1) {
                alert("already added")
            }
            else {
            	
            	let productObj = {};
            	
            	productObj.productId = product.productId;
            	productObj.productImage = product.productImage;
            	productObj.productPrice = product.productPrice;
            	productObj.productTitle = product.productTitle;
            	productObj.storeId = product.storeId;
            	productObj.quantity = 1;
            	productObj.email = "<%= request.getSession(false).getAttribute("actUserEmail") %>";

                addCart.push(productObj);
                localStorage.setItem("Cart", JSON.stringify(addCart));

                alert("added")
                location.reload(1)

            }
			
		}
		
		// Is Login or Not Alert Function
		function login(){
		    let error = "Please login your account";
		    Notify.error(error);
		}
		
		// cart count for nav bar

        const Cart = JSON.parse(localStorage.getItem("Cart")) ?? [];
        const cart_count = document.getElementById("cart_count");
        let count = 0;
	
        Cart.find(e => {
            if (e.email === "<%=request.getSession(false).getAttribute("actUserEmail") %>") {
                count++
            }
        })
		
        cart_count.innerText = Number(count);
		
	
	</script>

</body>

</html>