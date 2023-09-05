
		
function updatebox(button, storeId) {
	
    document.querySelector("#store_update_box").style.display = "none";
    document.querySelector("#store_update_box1").style.display = "block";
           
    //console.log("Store ID:" + store);
           	
    // let storeLogoUrl = button.getAttribute("name");
    // console.log("ID:" + storeId);
	document.getElementById("update_store_details").setAttribute("action", "UpdateStoreDetailsServlet?id=" + storeId);
	
	 let storeDetails = {
		"title" : button.getAttribute("data-title"),
        "category" : button.getAttribute("data-category"),
        "logourl" : button.getAttribute("data-logourl")
	 }
	 console.log(storeDetails.title)
	 document.getElementById("title1").value = storeDetails.title;
	 
	

}

function cancelbox(){
	document.querySelector("#store_update_box").style.display = "none";
	document.querySelector("#store_update_box1").style.display = "none";
}

function addbox() {
    document.querySelector("#store_update_box").style.display = "block";
	document.querySelector("#store_update_box1").style.display = "none";
}
        
function deletebox(storeId){
    document.querySelector("#delete_box").style.display = "block";    
 
    document.getElementById("delete_btn").setAttribute("action", "DelectStoreDetailsServlet?storeId=" + storeId);   
}

function canceldelectbox(){
    document.querySelector("#delete_box").style.display = "none";
}
   
        
        