package com.fssa.spartansmt.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidProductDetailsException;
import com.fssa.spartansmt.exception.ServiceException;
import com.fssa.spartansmt.model.Product;
import com.fssa.spartansmt.service.ProductService;

/**
 * Servlet implementation class GetProductByProductId
 */
@WebServlet("/GetProductByProductId")
public class GetProductByProductId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductByProductId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int productId = Integer.parseInt(request.getParameter("id"));
		PrintWriter out = response.getWriter();
		out.print(productId);
		ProductService productService = new ProductService();
		Product product = new Product();
		try {
			product = productService.getProductById(productId);
			JSONObject productObj = new JSONObject(product);
			out.print(productObj.toString());
			
		}catch(ServiceException | InvalidProductDetailsException | DAOException e) {
			e.printStackTrace();
			out.println(e.getMessage());
			out.println(e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
