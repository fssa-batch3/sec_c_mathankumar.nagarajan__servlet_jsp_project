package com.fssa.spartansmt.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.spartansmt.errors.UserValidatorErrors;
import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidUserException;
import com.fssa.spartansmt.exception.ServiceException;
import com.fssa.spartansmt.logger.Logger;
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
		}catch(ServiceException e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			dis = request.getRequestDispatcher("pages/login.jsp");
			dis.forward(request, response);
		}

		try {


			user = userService.getUserByEmail(email);
			if(user.getEmail() == null) {
				throw new InvalidUserException(UserValidatorErrors.INVALID_USER_EMAIL);
			}
			
			String hashPassword = userService.convertHashPassword(password);

			// User Side Validation
			if ("USER".equalsIgnoreCase(user.getRole())) {
				if (user.getEmail() != null) {

					if (user.getEmail().trim().equals(email.trim())
							&& user.getPassword().trim().equals(hashPassword.trim())) {

						session.setAttribute("actUserEmail", user.getEmail());
						request.setAttribute("success", "Welcome Back " + user.getFirstName());
						dis = request.getRequestDispatcher("index.jsp");
						dis.forward(request, response);

					} else {

						request.setAttribute("error", "Enter Valid Email and Password");
						dis = request.getRequestDispatcher("pages/login.jsp");
						dis.forward(request, response);

					}
				} else {
					request.setAttribute("error", "Enter Valid Email Address");
					dis = request.getRequestDispatcher("pages/login.jsp");
					dis.forward(request, response);
				}
			} 
			// Admin Side Validation
			else {
				if (user.getEmail().trim().equals(email.trim())
						&& user.getPassword().trim().equals(hashPassword.trim())) {
					session.setAttribute("actUserEmail", user.getEmail());
					request.setAttribute("success", "Successfully Logged");
					response.sendRedirect(request.getContextPath() + "/GetAllStoreDetailsUserSide");
				}
				else {
					request.setAttribute("error", "Enter Valid Admin Email and Password");
					dis = request.getRequestDispatcher("pages/login.jsp");
					dis.forward(request, response);
				}
				
			}

		} catch (ServiceException | InvalidUserException e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			dis = request.getRequestDispatcher("pages/login.jsp");
			dis.forward(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

}
