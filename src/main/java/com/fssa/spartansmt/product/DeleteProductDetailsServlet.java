package com.fssa.spartansmt.product;

import java.io.IOException;
import java.io.PrintWriter;

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
		int productId = Integer.parseInt(strProductId);
		
		ProductService productService = new ProductService();
		PrintWriter out = response.getWriter();
		try {
			boolean isDeleted = productService.deleteProduct(productId);
			if (isDeleted) {
				out.println("<h1>Successfully deleted a product</h1>");
			}
		}catch (DAOException | InvalidProductDetailsException e) {
			e.getStackTrace();
		}
		
		
	}

}
