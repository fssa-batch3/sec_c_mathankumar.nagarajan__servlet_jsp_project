package com.fssa.spartansmt.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidUserException;
import com.fssa.spartansmt.model.User;
import com.fssa.spartansmt.service.UserService;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
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
				if (userService.addUser(user)) {
					out.println("User Successfully Registered!");

					// RequestDispatcher dis = request.getRequestDispatcher("");
					// dis.forward(request, response);
				} else {
					out.println("Invalid Email And Password");
				}
			} else {
				out.println("Password and Confirm Password Doesn't Match");
			}

		} catch (DAOException | InvalidUserException e) {
			e.getStackTrace();
		}

	}

}
