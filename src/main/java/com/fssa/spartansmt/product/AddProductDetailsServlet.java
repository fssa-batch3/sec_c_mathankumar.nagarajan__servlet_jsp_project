package com.fssa.spartansmt.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidProductDetailsException;
import com.fssa.spartansmt.exception.InvalidStoreDetailsException;
import com.fssa.spartansmt.model.Product;
import com.fssa.spartansmt.service.ProductService;
import com.fssa.spartansmt.service.StoreService;

/**
 * Servlet implementation class AddProductDetailsServlet
 */
@WebServlet("/AddProductDetailsServlet")
public class AddProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductDetailsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productTitle = request.getParameter("productTitle");
		String strProductPrice = request.getParameter("productPrice");
		String productImageUrl = request.getParameter("productImageUrl");
		String strStoreId = request.getParameter("id");
		
		double productPrice = Double.parseDouble(strProductPrice);
		int storeId = Integer.parseInt(strStoreId);

		
		PrintWriter out = response.getWriter();

		ProductService productService = new ProductService();
		try {
			
			
			Product product = new Product();

			product.setStoreId(storeId);
			product.setProductTitle(productTitle);
			product.setProductPrice(productPrice);
			product.setProductImage(productImageUrl);
			product.setUploadedDate(LocalDate.now());

			boolean isadded = productService.addProduct(product);

			if (isadded) {
				request.setAttribute("success", "Successfully added a product");
				RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/GetAllProductDetailsUsingStoreId");
				dis.include(request, response);
			}

		} catch (DAOException | InvalidProductDetailsException e) {
			e.getMessage();
		}

//		RequestDispatcher dis = request.getRequestDispatcher("/GetProductsByStoreId?id="+ storeId);
//		dis.include(request, response);

	}

}
