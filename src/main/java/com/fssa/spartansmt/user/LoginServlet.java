package com.fssa.spartansmt.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidUserException;
import com.fssa.spartansmt.exception.ServiceException;
import com.fssa.spartansmt.model.User;
import com.fssa.spartansmt.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dis = null;
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserService userService = new UserService();
		User user = new User();

		// create session
		HttpSession session = request.getSession();

		try {

			userService.login(email, password);

			user = userService.getUserByEmail(email);
			if (user.getEmail().trim().equals(email.trim()) && user.getPassword().trim().equals(password.trim())) {

				session.setAttribute("actUserEmail", user.getEmail());
				request.setAttribute("success", "Successfully Logged In");
				dis = request.getRequestDispatcher("index.jsp");
				dis.forward(request, response);
				
			}else {
				
				request.setAttribute("error", "Enter Valid Email and Password");
				dis = request.getRequestDispatcher("pages/login.jsp");
				dis.forward(request, response);
				
			}

		} catch (ServiceException | DAOException | InvalidUserException e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			dis = request.getRequestDispatcher("pages/login.jsp");
			dis.forward(request, response);
		}

	}

}
