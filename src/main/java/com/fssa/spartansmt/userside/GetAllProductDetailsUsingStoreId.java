package com.fssa.spartansmt.userside;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.model.Product;
import com.fssa.spartansmt.service.ProductService;

/**
 * Servlet implementation class GetAllProductDetailsUsingStoreId
 */
@WebServlet("/GetAllProductDetailsUsingStoreId")
public class GetAllProductDetailsUsingStoreId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllProductDetailsUsingStoreId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int storeId = Integer.parseInt(request.getParameter("id"));
		ProductService productService = new ProductService();
		try {
			List<Product> productList = (List<Product>) productService.getAllProductsByStoreId(storeId);
			request.setAttribute("productList", productList);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/pages/product.jsp");
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
