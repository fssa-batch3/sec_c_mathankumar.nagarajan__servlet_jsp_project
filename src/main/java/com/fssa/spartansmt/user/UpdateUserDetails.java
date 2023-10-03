package com.fssa.spartansmt.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidUserException;
import com.fssa.spartansmt.exception.ServiceException;
import com.fssa.spartansmt.model.User;
import com.fssa.spartansmt.service.UserService;

/**
 * Servlet implementation class UpdateUserDetails
 */
@WebServlet("/UpdateUserDetails")
public class UpdateUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserDetails() {
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

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = (String) request.getSession(false).getAttribute("actUserEmail");
		Long mobileNumebr = Long.parseLong(request.getParameter("mobileNumber"));

		String address = request.getParameter("address");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		int zipCode = Integer.parseInt(request.getParameter("zipCode"));
		
		System.out.println("hello: " + email);
		System.out.println("hello: " + firstName);
		System.out.println("hello: " + lastName);
		System.out.println("hello: " + mobileNumebr);
		System.out.println("hello: " + address);
		System.out.println("hello: " + country);
		System.out.println("hello: " + state);
		System.out.println("hello: " + zipCode);
		
		
		
		UserService userService = new UserService();
		
		try {
			
			int userId = userService.getUserIdUsingEmail(email);
			
			System.out.println("userId " + userId);
			
			User user = new User(firstName, lastName, email, mobileNumebr, address, country, state, zipCode, userId);
			
			userService.updateUser(user);
			
			request.setAttribute("success", "Successfully Updated");
			
			RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/pages/profile.jsp");
			dis.forward(request, response);
			
			// response.sendRedirect(request.getContextPath() + "/pages/profile.jsp?success=Successfully Updated");
		}catch(ServiceException | DAOException | InvalidUserException e) {
			
			e.printStackTrace();
			
			request.setAttribute("error", e.getMessage());
			
			RequestDispatcher dis = request.getServletContext().getRequestDispatcher("/pages/profile.jsp");
			dis.forward(request, response);
			
		}

		
	}

}
