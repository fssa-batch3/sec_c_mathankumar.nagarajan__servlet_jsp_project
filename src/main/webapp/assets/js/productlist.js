function updatebox(button, storeId, productId) {
	document.querySelector("#product_update_box").style.display = "none";
	document.querySelector("#product_update_box1").style.display = "block";
            
	//let productId = button.getAttribute("name");
    document.getElementById("product_form").setAttribute("action", "UpdateProductDetailsServlet?productId=" + productId + "&id=" + storeId);

}

function addbox() {
	document.querySelector("#product_update_box").style.display = "block";
    document.querySelector("#product_update_box1").style.display = "none";
}
        

function deletebox(productId, storeId){
    document.querySelector("#delete_box").style.display = "block";   
    document.getElementById("delete_btn").setAttribute("action", "DeleteProductDetailsServlet?productId=" + productId + "&id=" + storeId);
    
}
function canceldelectbox(){
    document.querySelector("#delete_box").style.display = "none";
}

function cancelbox(){
	document.querySelector("#product_update_box").style.display = "none";
	document.querySelector("#product_update_box1").style.display = "none";
}
        