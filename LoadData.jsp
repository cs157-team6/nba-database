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
		    
		    String createTeamTable = "CREATE TABLE Team (Name VARCHAR(100), Region VARCHAR(50), PRIMARY KEY (Name));";
		    stmt.executeUpdate(createTeamTable);
		    String insertTeam = "INSERT INTO Team VALUES ('Orlando Magic', 'Southeast'), ('San Antonio Spurs', 'Southwest'), ('Brooklyn Nets', 'Atlantic'), "
		    										  + "('Golden State Warriors', 'Pacific'), ('Milwaukee Bucks', 'Central'), ('Miami Heat', 'Southeast'), "
		    										  + "('Sacramento Kings', 'Pacific'), ('New York Knicks', 'Atlantic'), ('Portland Trail Blazers', 'Northwest'), "
		    										  + "('Cleveland Cavaliers', 'Central'), ('Charlotte Hornets', 'Southeast'), ('Minnesota Timberwolves', 'Northwest'), "
		    										  + "('Chicago Bulls', 'Central'), ('Philadelphia 76ers', 'Atlantic');";
			stmt.executeUpdate(insertTeam);
	    
			String createPlayerTable = "CREATE TABLE Player (Team_Name VARCHAR(100), Number TINYINT, Name VARCHAR(50), Age TINYINT, Position VARCHAR(20));";
			stmt.executeUpdate(createPlayerTable);
			String insertPlayer = "INSERT INTO Player VALUES ('Orlando Magic', 1, 'Jonathan Isaac', 24, 'F'), ('Orlando Magic', 3, 'Chuma Okeke', 23, 'F'), "
														  + "('Orlando Magic', 4, 'Jalen Suggs', 20, 'G'), ('Orlando Magic', 5, 'Mo Bamba', 23, 'C'), "
														  + "('Orlando Magic', 7, 'Michael Carter-Williams', 30, 'G'), ('Orlando Magic', 13, 'R.J. Hampton', 20, 'G'), "
														  + "('Orlando Magic', 14, 'Gary Harris', 27, 'G'), ('Orlando Magic', 15, 'Mychal Mulder', 27, 'G'), "
														  + "('Orlando Magic', 17, 'Ignas Brazdeikis', 22, 'F'), ('Orlando Magic', 20, 'Markelle Fultz', 23, 'G'), "
														  + "('Orlando Magic', 21, 'Moritz Wagner', 24, 'F-C'), ('Orlando Magic', 22, 'Franz Wagner', 20, 'F'), "
														  + "('Orlando Magic', 31, 'Terrence Ross', 30, 'G-F'), ('Orlando Magic', 33, 'Robin Lopez', 33, 'C'), "
														  + "('Orlando Magic', 34, 'Wendell Carter Jr.', 22, 'C-F'), ('Orlando Magic', 50, 'Cole Anthony', 21, 'G'), "
														  + "('Orlando Magic', 55, 'E Twaun Moore', 32, 'G');";
			stmt.executeUpdate(insertPlayer);

			String createMatchesTable = "CREATE TABLE Matches (Match_ID INT, Team1Name VARCHAR(100), Team2Name VARCHAR(100), Date DATE, Time TIME, Stadium_Name VARCHAR(100), Referee_ID INT, PRIMARY KEY (Match_ID));";
			stmt.executeUpdate(createMatchesTable);
			String insertMatch = "";
			stmt.executeUpdate(insertMatch);
			
			String createReservedTable = "CREATE TABLE Reserved (Seat_Number INT, Stadium_Name VARCHAR(100), Match_ID INT, Customer_ID INT, Price INT)";
			stmt.executeUpdate(createReservedTable);
			String insertReserved = "";
			stmt.executeUpdate(insertReserved);
		
			String createSeatTable = "CREATE TABLE Seat (Seat_Number INT, Stadium_Name VARCHAR(100));";
			stmt.executeUpdate(createSeatTable);
			String insertSeat = "";
			stmt.executeUpdate(insertSeat);
			
			String createRecordTable = "CREATE TABLE Record (Record_ID INT, Description VARCHAR(1000), Value TINYINT, Player_Number TINYINT, Team_Name VARCHAR(100), Match_ID INT);";
			stmt.executeUpdate(createRecordTable);
			String insertRecord = "";
			stmt.executeUpdate(insertRecord);
			
			String createShotTable = "CREATE TABLE Shot (Match_ID INT, Shot_Number INT, Shot_Type VARCHAR(100), Player_Number TINYINT, Team_Name VARCHAR(100));";
			stmt.executeUpdate(createShotTable);
			String insertShot = "";
			stmt.executeUpdate(insertShot);
			
			String createRefereeTable = "CREATE TABLE Referee (Referee_ID INT, First_Name VARCHAR(100), Last_Name VARCHAR(100), PRIMARY KEY (Referee_ID));";
			stmt.executeUpdate(createRefereeTable);
			String insertReferee = "";
			stmt.executeUpdate(insertReferee);
			
           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </table>
  </body>
</html>
