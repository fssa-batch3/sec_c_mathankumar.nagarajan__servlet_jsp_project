package com.fssa.spartansmt.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.model.Store;
import com.fssa.spartansmt.service.StoreService;

/**
 * Servlet implementation class GetStoreDetailsServlet
 */
@WebServlet("/GetStoreDetailsServlet")
public class GetStoreDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StoreService storeService = new StoreService();
		try {
			List<Store> storeList = storeService.getAllStoreDetails();
			request.setAttribute("storeList", storeList);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/pages/adminstore.jsp");
		dis.forward(request, response);

	}

}
