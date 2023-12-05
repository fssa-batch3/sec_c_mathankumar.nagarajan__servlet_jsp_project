package com.fssa.spartansmt.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.exception.InvalidUserException;
import com.fssa.spartansmt.exception.ServiceException;
import com.fssa.spartansmt.model.User;
import com.fssa.spartansmt.service.UserService;

/**
 * Servlet implementation class GetUserDetailsUsingEmail
 */
@WebServlet("/GetUserDetailsUsingEmail")
public class GetUserDetailsUsingEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserDetailsUsingEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		
		try {
			UserService userService = new UserService();
			User user = userService.getUserByEmail(email);
			JSONObject userObj = new JSONObject(user);
			out.print(userObj.toString());
		}catch(ServiceException e) {
			e.printStackTrace();
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
