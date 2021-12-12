package logic;

   import java.sql.*;
   public class UserDAO 	
   {
      static Connection currentCon = null;
      static ResultSet rs = null;  
      public static void addUser(UserBean user, String password) {
    	//preparing some objects for connection 
          Statement stmt = null;  
          String insertQuery =
        		  "insert into customer (First_Name, Last_Name, Email, PW) values ('"
   	                   + user.getFirstName()
   	                   + "','"
   	                   + user.getLastName()
   	                   + "','"
   	                   + user.getEmail()
   	                   + "','"
   	                   + password
   	                   + "')";
          //System.out.println(insertQuery);
 	      try 
 	      {
 	         //connect to DB 
 	         currentCon = ConnectionManager.getConnection();
 	         stmt=currentCon.createStatement();
 	         stmt.executeUpdate(insertQuery);
 	      } 
 	
 	      catch (Exception ex) 
 	      {
 	         System.out.println("Log In failed: An Exception has occurred! " + ex);
 	      } 
 		    
 	      //some exception handling
 	      finally 
 	      {
 	         if (rs != null)	{
 	            try {
 	               rs.close();
 	            } catch (Exception e) {}
 	               rs = null;
 	            }
 		
 	         if (stmt != null) {
 	            try {
 	               stmt.close();
 	            } catch (Exception e) {}
 	               stmt = null;
 	            }
 		
 	         if (currentCon != null) {
 	            try {
 	               currentCon.close();
 	            } catch (Exception e) {
 	            }
 	
 	            currentCon = null;
 	         }
 	      }
      }
      
      public static UserBean getUser(String email, String password) {
         //preparing some objects for connection 
         Statement stmt = null;  
         UserBean user = null;
         String searchQuery =
               "select First_Name, Last_Name from customer where Email='"
                        + email
                        + "' AND PW='"
                        + password
                        + "'";
	      try 
	      {
	         //connect to DB 
	         currentCon = ConnectionManager.getConnection();
	         stmt=currentCon.createStatement();
	         rs = stmt.executeQuery(searchQuery);	        
	         boolean more = rs.next();
		       
	         if (more) 
	         {
	            String firstName = rs.getString("First_Name");
	            String lastName = rs.getString("Last_Name");
		     	
	            user = new UserBean(email, firstName, lastName);
	         }
	      } 
	
	      catch (Exception ex) 
	      {
	         System.out.println("Log In failed: An Exception has occurred! " + ex);
	      } 
		    
	      //some exception handling
	      finally 
	      {
	         if (rs != null)	{
	            try {
	               rs.close();
	            } catch (Exception e) {}
	               rs = null;
	            }
		
	         if (stmt != null) {
	            try {
	               stmt.close();
	            } catch (Exception e) {}
	               stmt = null;
	            }
		
	         if (currentCon != null) {
	            try {
	               currentCon.close();
	            } catch (Exception e) {
	            }
	
	            currentCon = null;
	         }
	      }

	      return user;
      }	
   }