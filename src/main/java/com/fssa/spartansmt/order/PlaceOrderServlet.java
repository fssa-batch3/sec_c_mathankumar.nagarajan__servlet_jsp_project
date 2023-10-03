package com.fssa.spartansmt.order;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidOrderDetailsException;
import com.fssa.spartansmt.exception.InvalidUserException;
import com.fssa.spartansmt.logger.Logger;
import com.fssa.spartansmt.model.Order;
import com.fssa.spartansmt.model.OrderedProduct;
import com.fssa.spartansmt.service.OrderService;

/**
 * Servlet implementation class PlaceOrderServlet
 */
@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<OrderedProduct> orderedProductList = new ArrayList();
		OrderService orderService = new OrderService();
		
		// String firstName = request.getParameter("firstName");
		// String lastName = request.getParameter("lastName");
		// String email = request.getParameter("email");
		// String mobileNumber = request.getParameter("mobileNumber");
		String address = request.getParameter("address");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		int zipCode = Integer.parseInt(request.getParameter("zipCode"));
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
		
		String paymentOption = request.getParameter("paymentOption");
		
		
		
		
		
				
		
		try {
			
			String strProductId = request.getParameter("productIdArr");
			String strQuentity = request.getParameter("quentityArr");
			Logger.info(strQuentity);
			
			if(strProductId.length() == 1) {
				int productId = Integer.parseInt(strProductId);
				orderedProductList.add(new OrderedProduct(productId, 1));
			}else {
				
				String[] arrProductId = strProductId.split(",");
				
				String[] arrQuentity = strQuentity.split(",");
				
				try {
					int i;
					for(i=0; i<arrProductId.length; i++) {
						int productId = Integer.parseInt(arrProductId[i]);
						int quentity = Integer.parseInt(arrQuentity[i]); 
						// TODO: Here is get the quantity for the product via the cart
						// And then to change the i to quantity.
						orderedProductList.add(new OrderedProduct(productId, quentity));
					}
					
				}catch (NumberFormatException e) {
					e.printStackTrace();
				}
				
			}
			

			Order order = new Order(userId, paymentOption, totalPrice, LocalDate.now(), orderedProductList, address, country, state, zipCode);
			orderService.placeOrder(order);
			response.sendRedirect(request.getContextPath() + "/pages/confirmorder.jsp");
			
		}catch(DAOException | InvalidUserException | InvalidOrderDetailsException e) {
			e.printStackTrace();
		}
	
	
	}

}
