package com.fssa.spartansmt.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidProductDetailsException;
import com.fssa.spartansmt.service.ProductService;

/**
 * Servlet implementation class DeleteProductDetailsServlet
 */
@WebServlet("/DeleteProductDetailsServlet")
public class DeleteProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strProductId = request.getParameter("productId");
		String strStoreId = request.getParameter("id");
		int productId = Integer.parseInt(strProductId);
		int storeId = Integer.parseInt(strStoreId);
		
		ProductService productService = new ProductService();
		PrintWriter out = response.getWriter();
		try {
			boolean isDeleted = productService.deleteProduct(productId);
			if (isDeleted) {
				request.setAttribute("success", "Successfully deleted a product");
				request.setAttribute("id", storeId);
				RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/GetAllProductDetailsUsingStoreId");
				dis.include(request, response);
			}
		}catch (DAOException | InvalidProductDetailsException e) {
			e.getStackTrace();
		}
		
		
	}

}
