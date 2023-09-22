package com.fssa.spartansmt.order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidOrderDetailsException;
import com.fssa.spartansmt.model.Order;
import com.fssa.spartansmt.service.OrderService;

/**
 * Servlet implementation class GetOrderUsingOrderId
 */
@WebServlet("/GetOrderUsingOrderId")
public class GetOrderUsingOrderId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String strOrderId = request.getParameter("orderId");
		int orderId = Integer.parseInt(strOrderId);
		OrderService orderService = new OrderService();

		try {
			Order order = orderService.getOrderUsingOrderId(orderId);
			JSONObject jsonOrderObj = new JSONObject(order);
			out.print(jsonOrderObj);
		} catch (InvalidOrderDetailsException | DAOException e) {
			e.printStackTrace();
		}

	}

}
