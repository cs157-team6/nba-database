package logic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection currentCon = null;
    static ResultSet rs = null;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserBean user = new UserBean(request.getParameter("email"), request.getParameter("firstName"), request.getParameter("lastName"));
			UserDAO.addUser(user, request.getParameter("pwd"));
			HttpSession session = request.getSession();	    
	        session.setAttribute("user", user);
            session.setMaxInactiveInterval(30*60);
            //Get the encoded URL string
			String encodedURL = response.encodeRedirectURL("Home.jsp");
			response.sendRedirect(encodedURL);
		} 
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}	
	}

}
