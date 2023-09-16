<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../assets/css/cart.css">
    
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
	
	
	<script>        // const user_email = localStorage.getItem("key")

        // const user_email = localStorage.getItem("user_email");
        // const first_name = localStorage.getItem("first_name")
        // const address = localStorage.getItem("address")

        // console.log(user_email);
        // console.log(first_name);
        // console.log(address);

        // document.getElementById("user-email-address").innerText = user_email;
        // document.getElementById("user-name-address").innerText = first_name;
        // document.getElementById("user-address").innerText = address;

        let div_order_summary;
        // let div_img;
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
        // let input_items;
        let label_number_of_items;

        // const produte_list = [
        //     {
        //         "produte_img":{
        //             "src":"../../assets/image/stores/items/nike1.jpg",
        //             "alt": "Product Image"
        //         },
        //         "produte_title" : "Nike Mens Air Zoom Vomero 15 Running Shoe",
        //         "rate": "₹6000",
        //         "full_rate": "₹10,000",
        //         "offer": "(40% off)",
        //         "rating":"4.5",
        //         "rating_value": "( 2200 ) Rating"
        //     },
        //     {
        //         "produte_img":{
        //             "src":"../../assets/image/stores/items/nike12.jpg",
        //             "alt": "Product Image"
        //         },
        //         "produte_title" : "ASIAN Delta-20 Sports Running Walking ",
        //         "rate": "₹5,000",
        //         "full_rate": "₹10000",
        //         "offer": "(50% off)",
        //         "rating":"4.7",
        //         "rating_value": "( 3228 ) Rating"
        //     }
        // ]

        const produte_list = JSON.parse(localStorage.getItem("Cart"))
        const user = JSON.parse(localStorage.getItem("active_user"))

        let totalValue = 0;

        let totalDiscount = 0

        let totalItems = 0;

        // let params = "";

        // produte_list.find(e => {

        for (let i = 0; i < produte_list.length; i++) {

            if (produte_list[i].user_email === user.user_email) {

                // cart Product Quantity
                const quantity = 1;

                // total discount code for line 267 to 269
                let discount = 0
                discount = Number(produte_list[i].full_price) - Number(produte_list[i].price)
                totalDiscount += discount

                // total value code
                totalValue += Number(produte_list[i].price) * quantity;

                // total products in the cart page code
                totalItems++

                // url params value
                // params += produte_list[i]["value"] + ","

                // console.log(produte_list[i].price)

                // for (let i=0; i < produte_list.length; i++) {
                // console.log("hello world")

                // Product Value

                div_order_summary = document.createElement("div");
                div_order_summary.setAttribute("class", "order-summary");
                // console.log(div_order_summary);

                produte_img = document.createElement("img");
                produte_img.setAttribute("class", "order-img");
                produte_img.setAttribute("src", produte_list[i].image)
                // produte_img.setAttribute("alt",  produte_list[i]["produte_img"]["alt"])
                div_order_summary.prepend(produte_img);

                div_detalis = document.createElement("div");
                div_order_summary.append(div_detalis);

                title = document.createElement("h1");
                title.setAttribute("class", "product_value")
                title.innerText = produte_list[i].title;
                title.setAttribute("data-value", produte_list[i].value)
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
                h6_rate.innerText = `₹${produte_list[i].price}`;
                h6_rate.setAttribute("data-keyword", produte_list[i].price)

                div_column.prepend(h6_rate);

                p_line_through = document.createElement("p");
                p_line_through.setAttribute("class", "line-through");
                p_line_through.innerText = `₹${produte_list[i].full_price}`;
                p_line_through.setAttribute("data-full_price", produte_list[i].full_price)
                div_column.append(p_line_through);

                p_green = document.createElement("p");
                p_green.setAttribute("class", "green");
                div_column.append(p_green);

                b = document.createElement("b")
                b.setAttribute("class", "discount")
                b.setAttribute("data-discount", produte_list[i].discount)
                b.innerText = `(${produte_list[i].discount}%)`;
                p_green.append(b)

                h4 = document.createElement("h4");
                h4.innerText = "Delivery FREE";
                div_detalis.append(h4);

                div_rating = document.createElement("div");
                div_rating.setAttribute("class", "rating-line");
                div_detalis.append(div_rating);

                p = document.createElement("p");
                p.innerText = "★";
                div_rating.prepend(p);

                b = document.createElement("b")
                b.innerText = produte_list[i].rating;
                p.append(b)

                h4_rating = document.createElement("h4");
                h4_rating.innerText = `( ${produte_list[i].reviews} )`;
                div_rating.append(h4_rating);

                h3_add_more_items = document.createElement("h3");
                h3_add_more_items.setAttribute("class", "add-more-items");
                // h3_add_more_items.innerText = "Add More Items";
                div_detalis.append(h3_add_more_items);

                label_number_of_items = document.createElement("label");
                label_number_of_items.setAttribute("id", "input_label")
                label_number_of_items.innerText = "Add More Items";
                h3_add_more_items.append(label_number_of_items);

                // input_items = document.createElement("input");
                // input_items.setAttribute("class", "number-of-items")
                // input_items.setAttribute("type", "number");
                // input_items.setAttribute("type", "number");
                // input_items.setAttribute("placeholder", "1");
                // input_items.setAttribute("name", "number");
                // input_items.setAttribute("min", "1");
                // input_items.setAttribute("max", "5");
                // label_number_of_items.append(input_items)

                // let rate;
                // let currentProductRate;

                const p_minus = document.createElement("button")
                p_minus.setAttribute("class", "minus")
                p_minus.innerText = "-";
                // p_minus.addEventListener("click", function () {
                //     if (quantity > 1) {
                //         quantity--;
                //         span.value = quantity;
                //         // console.log(rate);
                //         currentProductRate -=  produte_list[i]["price"]
                //         h6_rate.innerText = "₹" + currentProductRate;
                //         console.log(currentProductRate);
                //         // p_line_through.innerText = "₹" + produte_list[i]["full_price"]/quantity;
                //     }
                // })

                label_number_of_items.append(p_minus)

                const span = document.createElement("input")
                span.setAttribute("class", "qty")
                span.setAttribute("value", quantity)
                span.setAttribute("type", "text")
                span.innerText = quantity;
                label_number_of_items.append(span)

                const p_plus = document.createElement("button")
                p_plus.setAttribute("class", "plus")
                p_plus.innerText = "+";
                // p_plus.addEventListener("click", function () {
                //     quantity++;
                //     span.value = quantity;

                //     // rate =  produte_list[i]["price"]*quantity
                //     currentProductRate = produte_list[i]["price"] * quantity;
                //     h6_rate.innerText = "₹" + currentProductRate;
                //     console.log(productRate);
                //     p_line_through.innerText = produte_list[i]["full_price"]*quantity;

                // });

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

                        if (produte_list[i].user_email === user.user_email && produte_list[i].title === produte_list[j].title) {

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
        document.getElementById("totalValue").innerText = `₹ ${totalValue}`
        document.getElementById("totalValue1").innerText = `₹ ${totalValue}`

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
                price_pr[i].innerText = `₹${totalvalue}`;

                // Total full price (+)
                const full_price_value = parseFloat(full_price[i].dataset.full_price) * parseFloat(num_digit[i].value)
                full_price[i].innerText = `₹${full_price_value}`;

                // Total discount (%)
                const discount_value = parseFloat(discount[i].dataset.discount) * parseFloat(num_digit[i].value)
                discount[i].innerText = `(${discount_value}%)`

                // Total product count 
                document.getElementById("total_items").innerText = `Price ( ${totalItems} : Items)`

                // Total price for all product
                totalValue += parseFloat(price_pr[i].dataset.keyword)
                document.getElementById("totalValue").innerText = `₹ ${totalValue}`
                document.getElementById("totalValue1").innerText = `₹ ${totalValue}`

            })

        }

        for (let i = 0; i < minus_btn.length; i++) {

            minus_btn[i].addEventListener("click", () => {
                if (num_digit[i].value > 1) {

                    num_digit[i].value--;
                    totalItems--;

                    // Total price (-)
                    const totalvalue = parseFloat(price_pr[i].dataset.keyword) * parseFloat(num_digit[i].value)
                    console.log(totalvalue)
                    price_pr[i].innerText = `₹${totalvalue}`;

                    // Total full price (-)
                    const full_price_value = parseFloat(full_price[i].dataset.full_price) * parseFloat(num_digit[i].value)
                    full_price[i].innerText = `₹${full_price_value}`;

                    // Total discount (%)
                    const discount_value = parseFloat(discount[i].dataset.discount) * parseFloat(num_digit[i].value)
                    discount[i].innerText = `(${discount_value}%)`

                    // Total product count ++
                    document.getElementById("total_items").innerText = `Price ( ${totalItems} : Items)`

                    // Total price for all product
                    totalValue -= parseFloat(price_pr[i].dataset.keyword)
                    document.getElementById("totalValue").innerText = `₹ ${totalValue}`
                    document.getElementById("totalValue1").innerText = `₹ ${totalValue}`

                }

            })

        }

        document.getElementById("user-name-address").innerText = `${user.first_name} ${user.last_name}`
        document.getElementById("user-email-address").innerText = user.user_email
        document.getElementById("user-address").innerText = user.address
        document.getElementById("user_mobile_number").innerText = user.mobile_number

        document.getElementById("total_discount").innerText = `Your Total Savings on this order` + ` ₹ ${totalDiscount}`

        document.getElementById("total_items").innerText = `Price ( ${totalItems} : Items)`

        // Place Order Button Codes for JS

        // <a href="../../pages/cart/payment-page.html">            // HTML Code Converted for JS
        //     <h4 id="place-order-btn">Place Order</h4>
        // </a>

        // let a_tag;
        // let h4_place_order_btn;

        const a_tag = document.createElement("a")
        a_tag.setAttribute("id", "place_order_a")
        a_tag.addEventListener("click", () => {

            produte_list.find(e => {

                if (e.user_email === user.user_email) {

                    for (let i = 0; i < num_digit.length; i++) {
                        // num_digit[i].value
                        if (e.value === product_value[i].dataset.value) {

                            e.quantity = Number(num_digit[i].value)

                            localStorage.setItem("Cart", JSON.stringify(produte_list))

                            break;

                            // console.log(e);
                        }

                    }

                    window.location.href = `../../pages/cart/payment-page.html?id=${user.user_email}`

                }
                // return e;
            })

        })

        // a_tag.setAttribute("href", "../../pages/cart/payment-page.html?id=" + user.user_email)

        const h4_place_order_btn = document.createElement("h4")
        h4_place_order_btn.setAttribute("id", "place-order-btn")
        h4_place_order_btn.innerText = "Place order";
        a_tag.prepend(h4_place_order_btn)

        document.querySelector("#place-order-container").append(a_tag)

        // cart icon count code

        const Cart = JSON.parse(localStorage.getItem("Cart")) ?? []
        const active_user = JSON.parse(localStorage.getItem("active_user"))
        const cart_count = document.getElementById("cart_count")
        let count = 0;

        Cart.find(e => {
            if (e.user_email === active_user.user_email) {
                count++
            }
            // return e;
        })
        console.log(count)

        cart_count.innerText = count

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
                console.log(1)
                window.location.href = "../home/home.html";
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