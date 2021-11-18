package Example;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
          try
          {	    

               UserBean user = new UserBean();
               user.setEmail(request.getParameter("email"));
               user.setPassword(request.getParameter("pwd"));

               user = UserDAO.login(user);
                         
               if (user.isValid())
               {
                    
                    HttpSession session = request.getSession(true);	    
                    session.setAttribute("currentSessionUser",user); 
                    response.sendRedirect("userLogged.jsp"); //logged-in page      		
               }
                    
               else {
                    response.sendRedirect("LoginPage.jsp"); //error page 
               }
          } 
                         
                         
          catch (Throwable theException) 	    
          {
               System.out.println(theException); 
          }
     }
}