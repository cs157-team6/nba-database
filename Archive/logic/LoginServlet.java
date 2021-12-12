package logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.ConnectionManager;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static Connection currentCon = null;
    static ResultSet rs = null; 
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
		try {
			UserBean user = UserDAO.getUser(request.getParameter("email"), request.getParameter("pwd"));
			//no user found
			if(user != null) {
				HttpSession session = request.getSession();	    
		        session.setAttribute("user", user);
	            session.setMaxInactiveInterval(30*60);
	            //Get the encoded URL string
				String encodedURL = response.encodeRedirectURL("Home.jsp");
				response.sendRedirect(encodedURL);
			}
			//success
			else {
				System.out.println("login failed");
				request.setAttribute("errorMsg", "Unable to login. Invalid credentials.");
				request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
			}
		}
	           
	        
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}	
	}

}
