package com.fssa.spartansmt.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	RequestDispatcher dis = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		String strPhoneNumber = request.getParameter("phonenumber");
		long phoneNumber = Long.parseLong(strPhoneNumber);
		String password = request.getParameter("createpassword");
		String confirmPass = request.getParameter("confirmpassword");

		User user = new User(firstName, lastName, email, phoneNumber, password);

		try {

			UserService userService = new UserService();
			if (password.trim().equals(confirmPass.trim())) {

				userService.addUser(user);
				request.setAttribute("success", "Successfully Registered");
				dis = request.getRequestDispatcher("pages/login.jsp");

			} else {

				request.setAttribute("error", "Password don't match to the confirm password");
				dis = request.getRequestDispatcher("pages/registration.jsp");

			}

		} catch (ServiceException | SQLException e) {
			
			e.getStackTrace();
			request.setAttribute("error", e.getMessage());
			dis = request.getRequestDispatcher("pages/registration.jsp");
		
		} finally {
			dis.forward(request, response);
		}

	}

}
