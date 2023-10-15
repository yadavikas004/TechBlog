package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h1><!DOCTYPE html></h1>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet RegisterServlet<title>");
		out.println("</head>");
		out.println("<body>");

//		fetch all form data
		String check = request.getParameter("check");
//		out.println(check);
		if (check == null) {
			out.println("<h4>box not checked</h4>");
			System.out.println("Box not Checked");
//			request.setAttribute("message", "box not checked");
//			RequestDispatcher rd = request.getRequestDispatcher("/register-page.jsp");
//			rd.forward(request, response);
		} else {
			// baki ka data yaha nikalna...
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");

			// create user object and set all data to that object..
			User user = new User(name, email, password, gender, about);

			// create a user dao object
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if (dao.saveUser(user)) {
				// save...
				out.println("<h4>done</h4>");
				System.out.println("Done Added Data to Database");
//				request.setAttribute("message", "Done Added Data to Database");
//				RequestDispatcher rd = request.getRequestDispatcher("/login-page.jsp");
//				rd.forward(request, response);
			} else {
				out.println("<h4>error<h4>");
			}
		}
		out.println(check);
		out.println("</body>");
		out.println("</html>");
	}
//		doGet(request, response);

}
