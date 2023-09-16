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

</head>

<body>

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
	
	const url = window.location.search;                // ?name=Arun
    const urlParams = new URLSearchParams(url);        // converting string into key value pair
    const paramsId = urlParams.get("id")             // return value of the "name" key
    console.log(paramsId);
	
    // below function to get the product details via db
    
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
	                coupon: " 10% instant discount on SBI Credit Card, up to ₹750 on orders of ₹2,500 and above T&C",
	            },
	            {
	                offer: "Bank Offer:",
	                coupon: " Flat ₹100 Instant Cashback on Paytm Wallet. Min Order Value ₹1000. Valid once per Paytm account T&C",
	            }
	        ]

	        for (let i = 0; i < 3; i++) {
	            li = document.createElement("li");
	            li.innerText = b[i].coupon;
	            ol.append(li);

	            const bold = document.createElement("b");
	            bold.innerText = b[i].offer
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
	        a_buy_no1.setAttribute("href", `../../../cart/payment-page.html?id=${paramsId}`)
	        div_button.append(a_buy_no1)


	        const a_buy_now = document.createElement("button");
	        a_buy_now.setAttribute("type", "button");
	        a_buy_now.innerText = "Buy Now";
	        a_buy_no1.append(a_buy_now)

	        document.querySelector("div.view-product").append(div_product_img);
	        document.querySelector("div.view-product").append(div);

			
		}
		
		getProductDetails();
	
	</script>

</body>

</html>