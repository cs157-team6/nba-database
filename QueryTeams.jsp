<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>JDBC Connection example</h1>
    
    <table border="1">
      <tr>
        <td>Name</td>
        <td>Region</td>
      </tr>
    <% 
     String db = "cs157A-team6";
     String user; // assumes database name is the same as username
     user = "root";
     String password = "root";

        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157A-team6?autoReconnect=true&useSSL=false",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"Team\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Team");
            while (rs.next()) {
                out.println(rs.getString(1) + " " + rs.getString(2) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </table>
  </body>
</html>
