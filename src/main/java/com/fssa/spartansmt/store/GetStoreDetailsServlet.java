package com.fssa.spartansmt.store;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.spartansmt.exception.DAOException;
import com.fssa.spartansmt.model.Store;
import com.fssa.spartansmt.service.StoreService;

/**
 * Servlet implementation class GetStoreDetailsServlet
 */
@WebServlet("/GetStoreDetailsServlet")
public class GetStoreDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StoreService storeService = new StoreService();
		try {
			List<Store> storeList = storeService.getAllStoreDetails();
			JSONArray jsonStoreList = new JSONArray(storeList);
			PrintWriter out = response.getWriter();
			out.println(jsonStoreList.toString());
			out.flush();
			out.close();
			
			
		} catch (DAOException e) {
			e.printStackTrace();
		}

	}

}
