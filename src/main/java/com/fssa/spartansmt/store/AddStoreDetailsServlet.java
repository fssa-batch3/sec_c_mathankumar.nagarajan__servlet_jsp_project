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
 * Servlet implementation class AddStoreDetailsServlet
 */
@WebServlet("/AddStoreDetailsServlet")
public class AddStoreDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStoreDetailsServlet() {
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


		String storeTitle = request.getParameter("storeTitle");
		String storeCategory = request.getParameter("storeCategory");
		String storeLogo = request.getParameter("storeLogo");
		
		
		StoreService storeService = new StoreService();
		try {
			Store store = new Store(storeTitle, storeCategory, storeLogo);
			boolean isadded = storeService.addStore(store);
			
			if(isadded) {
				request.setAttribute("success", "Successfully added store details");
				RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/GetAllStoreDetailsUserSide");
				dis.include(request, response);
			}
			
		}catch (DAOException | InvalidStoreDetailsException e) {
			e.getMessage();
		}
		
		
		
	
	}

}
