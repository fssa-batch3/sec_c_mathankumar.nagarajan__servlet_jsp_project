package com.fssa.spartansmt.store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidStoreDetailsException;
import com.fssa.spartansmt.service.StoreService;

/**
 * Servlet implementation class DelectStoreDetailsServlet
 */
@WebServlet("/DelectStoreDetailsServlet")
public class DelectStoreDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelectStoreDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strStoreId = request.getParameter("storeId");
		int storeId = Integer.parseInt(strStoreId);
		
		try {
			boolean isDeleted = StoreService.deleteStore(storeId);
			if (isDeleted) {
				request.setAttribute("success", "Successfully deleted a store");
				RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/GetAllStoreDetailsUserSide");
				dis.include(request, response);
			}
		}catch (DAOException | InvalidStoreDetailsException e) {
			e.getStackTrace();
		}
		
		
	}

}
