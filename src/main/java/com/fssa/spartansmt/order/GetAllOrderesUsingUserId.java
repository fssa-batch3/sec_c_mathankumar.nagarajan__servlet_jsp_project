package com.fssa.spartansmt.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidOrderDetailsException;
import com.fssa.spartansmt.model.Order;
import com.fssa.spartansmt.service.OrderService;

/**
 * Servlet implementation class GetAllOrderesUsingUserId
 */
@WebServlet("/GetAllOrderesUsingUserId")
public class GetAllOrderesUsingUserId extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		String strUserId = "1";
				//request.getParameter("userId");
		int userId = Integer.parseInt(strUserId);
		OrderService orderService = new OrderService();
		
		try {
			List<Order> orderList = orderService.getAllOrdersUsingUserId(userId);
			JSONArray jsonOrderArr = new JSONArray(orderList);
			out.print(jsonOrderArr.toString());
		}catch(InvalidOrderDetailsException | DAOException e) {
			e.printStackTrace();
		}
	
	}

	
}
