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
     String password = "6eP5hy!Vy@@QstA3o8mwRdnK";
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
	    
		    String createCustomerTable = "CREATE TABLE Customer (ID INT NOT NULL, First_Name VARCHAR(50), Last_Name VARCHAR(50), PRIMARY KEY (ID));";
		    stmt.executeUpdate(createCustomerTable);
		    String insertCustomer = "INSERT INTO Customer VALUES (1, 'Annabel', 'Sharma'), (2, 'Yousif', 'Dowling'), (3, 'Zahara', 'Rodriquez'), "
		    												  + "(4, 'Elijah', 'Browning'), (5, 'Norma', 'Villegas'), (6, 'Danica', 'Dyer'), "
		    												  + "(7, 'Rufus', 'Norris'), (8, 'Gideon', 'Hopper'), (9, 'Jobe', 'Derrick'), "
		    												  + "(10, 'Helin', 'Hoffman'), (11, 'Christina', 'Lynn'), (12, 'Jordon', 'Beltran'), "
		    												  + "(13, 'Connar', 'Park'), (14, 'Adele', 'Baldwin'), (15, 'Vanessa', 'Frame');";
		    stmt.executeUpdate(insertCustomer);
		    
		    String createStadiumTable = "CREATE TABLE Stadium (Name VARCHAR(100), State VARCHAR(50), City VARCHAR(50), Capacity INT, PRIMARY KEY (Name));";
		    stmt.executeUpdate(createStadiumTable); 
		    String insertStadium = "INSERT INTO Stadium VALUES ('Amway Center', 'Florida', 'Orlando', 18846), ('AT&T Center', 'Texas', 'San Antonio', 18418), "
		    												+ "('Barclays Center', 'New York', 'Brooklyn', 17732), ('Chase Center', 'California', 'San Francisco', 18064), "
		    												+ "('Fiserv Forum', 'Wisconsin', 'Milwaukee', 17500), ('FTX Arena', 'Florida', 'Miami', 19600), "
		    												+ "('Golden 1 Center', 'California', 'Sacramento', 17583), ('Madison Square Guarden', 'New York', 'New York City', 19812), "
		    												+ "('Moda Center', 'Oregon', 'Portland', 19441), ('Rocket Mortgage FieldHouse', 'Ohio', 'Cleveland', 19432), "
		    												+ "('Spectrum Center', 'North Carolina', 'Charlotte', 19077), ('Target Center', 'Minnesota', 'Minneapolis', 18978), "
		    												+ "('United Center', 'Illinois', 'Chicago', 20917), ('Wells Fargo Center', 'Pennsylvania', 'Philadelphia', 20478);";
		    stmt.executeUpdate(insertStadium); 
		    
		    String createTeamTable = "CREATE TABLE Team (Name VARCHAR(100), Region VARCHAR(50));";
		    stmt.executeUpdate(createTeamTable);
		    String insertTeam = "INSERT INTO Team VALUES ('Orlando Magic', 'Southeast'), ('San Antonio Spurs', 'Southwest'), ('Brooklyn Nets', 'Atlantic'), "
		    										  + "('Golden State Warriors', 'Pacific'), ('Milwaukee Bucks', 'Central'), ('Miami Heat', 'Southeast'), "
		    										  + "('Sacramento Kings', 'Pacific'), ('New York Knicks', 'Atlantic'), ('Portland Trail Blazers', 'Northwest'), "
		    										  + "('Cleveland Cavaliers', 'Central'), ('Charlotte Hornets', 'Southeast'), ('Minnesota Timberwolves', 'Northwest'), "
		    										  + "('Chicago Bulls', 'Central'), ('Philadelphia 76ers', 'Atlantic');";
			stmt.executeUpdate(insertTeam);
	    
			
		
           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </table>
  </body>
</html>
