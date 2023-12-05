function getBaseUrlFromCurrentPage() {
	const baseUrl = window.location.protocol + '//' + window.location.host + '/';
	const contextPath = window.location.pathname.split('/')[1]; // Extract the context path

	return baseUrl + contextPath;
}

	function getAllStores() {
			const url = getBaseUrlFromCurrentPage()+"/GetStoreDetailsServlet";
			axios.get(url)
			  .then(function (response) {
			    // handle success
			    const storeArr = response.data;
			    displayStores(storeArr);
			  })
			  .catch(function (error) {
			    // handle error
			    console.log(error);
			  })
		}
		
		function displayStores(storeArr) {
			
			for(let i=0; i<10; i++) {
				
			a_items = document.createElement("a");              // create tage
            a_items.setAttribute("href", getBaseUrlFromCurrentPage()+`/GetProductsByStoreId?id=${storeArr[i].id}`);
            
                              
            div_store = document.createElement("div");
            div_store.setAttribute("class", "store");
            a_items.append(div_store)                           // placeing place 


            img_imgstore = document.createElement("img");       // creating img tag
            img_imgstore.setAttribute("src", storeArr[i].storeLogoLink);  // add some attribute
            img_imgstore.setAttribute("alt", "Store Logo");
            img_imgstore.setAttribute("class", "imgstore");
            div_store.append(img_imgstore);
            

            div_floor = document.createElement("div");
            div_floor.setAttribute("class", "floor");
            div_store.append(div_floor);

            div = document.createElement("div");
            div_floor.append(div);

            h3_storenames = document.createElement("h3");
            h3_storenames.setAttribute("class", "storenames");
            h3_storenames.innerText = storeArr[i].name;
            div.append(h3_storenames);

            p_storecategory = document.createElement("p");
            p_storecategory.setAttribute("class", "store_category");
            p_storecategory.innerText = storeArr[i].category;
            div.append(p_storecategory);

            p_viewmore = document.createElement("p");
            p_viewmore.setAttribute("class", "viewmore");
            p_viewmore.innerText = "View More";
            div.append(p_viewmore);

            //document.querySelector("div.stores").append(div_store);
            document.querySelector("div.stores").append(a_items);
				
			}
			
			
		}
		
		getAllStores();
		
		
		
        
        
        