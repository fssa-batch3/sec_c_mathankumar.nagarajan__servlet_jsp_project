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
import com.fssa.spartansmt.model.Store;
import com.fssa.spartansmt.service.StoreService;

/**
 * Servlet implementation class UpdateStoreDetailsServlet
 */
@WebServlet("/UpdateStoreDetailsServlet")
public class UpdateStoreDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStoreDetailsServlet() {
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
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String storeTitle = request.getParameter("storeTitle");
		String storeCategory = request.getParameter("storeCategory");
		String storeLogo = request.getParameter("storeLogo");
		
		String strStoreId = request.getParameter("id");
		int storeId = Integer.parseInt(strStoreId);
		System.out.println(storeId);
		
		PrintWriter out = response.getWriter();
		
		StoreService storeService = new StoreService();
		try {
			Store store = new Store();
			store.setId(storeId);
			store.setName(storeTitle);
			store.setCategory(storeCategory);
			store.setStoreLogoLink(storeLogo);
			boolean isadded = storeService.updateStore(store);
			
			if(isadded) {
				out.println("<h1>Successfully updated store details</h1>");
			}
			
		}catch (DAOException | InvalidStoreDetailsException e) {
			e.getMessage();
		}
		
		RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/GetStoreDetailsServlet");
		dis.include(request, response);
		
	}

}
