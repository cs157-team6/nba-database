<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>JDBC Connection example</h1>
    
    <table border="1">
      <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Major</td>
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
            
            
            Statement stmt = con.createStatement();
            /*

	    out.println("initial entries in table \"hw1\": <br/>");

	    ResultSet rs = stmt.executeQuery("SELECT * FROM hw1");
            while (rs.next()) {
                out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + "<br/><br/>");
            }
	    */

	    String createTeamsTable = "CREATE TABLE Teams (Name CHAR(20), City CHAR(20));";
	    stmt.executeUpdate(createTeamsTable); 
	    
	    String createPlayersTable = "CREATE TABLE Players (Name CHAR(20), TeamName CHAR(20));";
	    stmt.executeUpdate(createPlayersTable); 

	    String createMatchesTable = "CREATE TABLE Matches (Team1 CHAR(20), Team2 CHAR(20), Location CHAR(50), Date CHAR(20));";
	    stmt.executeUpdate(createMatchesTable); 

	    String insertPlayer = "Insert into Players Values('Michael Jordan', 'Chicago Bulls');";
	    stmt.executeUpdate(insertPlayer); 

	    insertPlayer = "Insert into Players Values('Kobe Bryant', 'LA Lakers');";
	    stmt.executeUpdate(insertPlayer); 
           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </table>
  </body>
</html>
