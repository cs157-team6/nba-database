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
		    												+ "('United Center', 'Illinois', 'Chicago', 20917), ('State Farm Arena', 'Georgia', 'Atlanta', 18118), " 
		    												+ "('Wells Fargo Center', 'Pennsylvania', 'Philadelphia', 20478);";
		    stmt.executeUpdate(insertStadium); 
		    
		    String createTeamTable = "CREATE TABLE Team (Name VARCHAR(100), Region VARCHAR(50), PRIMARY KEY (Name));";
		    stmt.executeUpdate(createTeamTable);
		    String insertTeam = "INSERT INTO Team VALUES ('Orlando Magic', 'Southeast'), ('San Antonio Spurs', 'Southwest'), ('Brooklyn Nets', 'Atlantic'), "
		    										  + "('Golden State Warriors', 'Pacific'), ('Milwaukee Bucks', 'Central'), ('Miami Heat', 'Southeast'), "
		    										  + "('Sacramento Kings', 'Pacific'), ('New York Knicks', 'Atlantic'), ('Portland Trail Blazers', 'Northwest'), "
		    										  + "('Cleveland Cavaliers', 'Central'), ('Charlotte Hornets', 'Southeast'), ('Minnesota Timberwolves', 'Northwest'), "
		    										  + "('Chicago Bulls', 'Central'), ('Philadelphia 76ers', 'Atlantic'), ('Dallas Mavericks', 'Southwest');";
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
			String insertMatch = "INSERT INTO Matches VALUES (1,'Orlando Magic', 'San Antonio Spurs', '2021-09-24', '18:43:41', 'Amway Center', 1 ), "
														  + "(2, 'San Antonio Spurs', 'Brooklyn Nets', '2021-01-16', '12:12:42', 'AT&T Center', 2 ), "
														  + "(3, 'Brooklyn Nets', 'Golden State Warriors', '2021-09-20', '01:01:02', 'Barclays Center', 3), " 
														  + "(4, 'Golden State Warriors', 'Milwaukee Bucks', '2021-10-03', '04:40:06', 'Chase Center', 4), " 
														  + "(5, 'Milwaukee Bucks', 'Miami Heat', '2021-08-19', '16:52:09', 'Fiserv Forum', 5), " 
														  + "(6, 'Miami Heat', 'Sacramento Kings', '2021-10-25', '21:54:58', 'FTX Arena', 6), " 
														  + "(7, 'Sacramento Kings', 'Portland Trail Blazers', '2021-05-23', '12:03:11', 'Golden 1 Center', 7), " 
														  + "(8, 'Portland Trail Blazers', 'Cleveland Cavaliers', '2021-06-22', '13:29:14', 'Madison Square Guarden', 8), " 
														  + "(9, 'Cleveland Cavaliers', 'Charlotte Hornets', '2021-05-28', '05:02:15', 'Moda Center', 9), " 
														  + "(10, 'Charlotte Hornets', 'Minnesota Timberwolves', '2021-10-30', '22:55:13', 'Rocket Mortgage FieldHouse', 10), " 
														  + "(11, 'Minnesota Timberwolves', 'Chicago Bulls', '2021-06-12', '13:41:54', 'Spectrum Center', 11), " 
														  + "(12, 'Chicago Bulls', 'Philadelphia 76ers', '2021-03-25', '03:57:36', 'Target Center', 12), " 
														  + "(13, 'Philadelphia 76ers', 'New York Knicks', '2021-01-12', '06:38:34', 'United Center', 13), " 
														  + "(14, 'New York Knicks', 'Dallas Mavericks', '2021-05-20', '11:19:33', 'Wells Fargo Center', 14), " 
														  + "(15, 'Dallas Mavericks', 'Orlando Magic', '2021-01-06', '05:42:05', 'State Farm Arena', 15);";
			stmt.executeUpdate(insertMatch);
			
			String createReservedTable = "CREATE TABLE Reserved (Seat_Number INT, Stadium_Name VARCHAR(100), Match_ID INT, Customer_ID INT, Price INT)";
			stmt.executeUpdate(createReservedTable);
			String insertReserved = "INSERT INTO Reserved VALUES (1, 'Amway Center', 1, 1, 50), (2, 'AT&T Center', 2, 2, 25), (3,'Barclays Center', 3, 3, 75), (4, 'Chase Center', 4, 4, 100), " 
															  + "(5, 'Fiserv Forum', 5, 5, 105), (6, 'FTX Arena', 6, 6, 80), (7, 'Golden 1 Center', 7, 7, 95), (8, 'Madison Square Guarden', 8, 8, 115), " 
															  + "(9, 'Moda Center', 9, 9, 85), (10, 'Rocket Mortgage FieldHouse', 10, 10, 130), (11, 'Spectrum Center', 11, 11, 111), (12, 'Target Center', 12, 12, 45), " 
															  + "(13, 'United Center', 13, 13, 100), (14, 'Wells Fargo Center', 14, 14, 90), (15, 'State Farm Arena', 15, 15, 45);";
			stmt.executeUpdate(insertReserved);
		
			String createSeatTable = "CREATE TABLE Seat (Seat_Number INT, Stadium_Name VARCHAR(100));";
			stmt.executeUpdate(createSeatTable);
			String insertSeat = "INSERT INTO Seat VALUES (1, 'Amway Center'), (2, 'AT&T Center'), (3, 'Barclays Center'), (4, 'Chase Center'), (5, 'Fiserv Forum'), (6, 'FTX Arena'), " 
													  + "(7, 'Golden 1 Center'), (8, 'Madison Square Guarden'), (9, 'Moda Center'), (10, 'Rocket Mortgage FieldHouse'), " 
													  + "(11, 'Spectrum Center'), (12, 'Target Center'), (13, 'United Center'), (14, 'Wells Fargo Center'), (15, 'State Farm Arena');";
			stmt.executeUpdate(insertSeat);
			
			String createRecordTable = "CREATE TABLE Record (Record_ID INT, Description VARCHAR(1000), Value INT, Player_Number TINYINT, Team_Name VARCHAR(100), Match_ID INT);";
			stmt.executeUpdate(createRecordTable);
			String insertRecord = "INSERT INTO Record VALUES (1, 'Highest points made', 30, 1, 'Orlando Magic', 1), (2, 'Highest field goals made', 30, 1, 'Orlando Magic', 1), " 
														  + "(3, 'Highest steals made', 3, 2,'San Antoino Spurs', 2), (4, 'Highest blocks made', 4, 3, 'Brooklyn Nets', 3), " 
														  + "(5, 'Highest rebounds made', 23, 4, 'Golden State Warriors', 4), (6, 'Highest 3 pointers made', 4, 5, 'Milwaukee Bucks', 5), " 
														  + "(7, 'Highest Average points made per game', 20, 1,'Orlando Magic', NULL), (8, 'Highest Average field goals made', 20, 1, 'Orlando Magic', NULL), " 
														  + "(9, 'Highest Average steals made', 2, 2, 'San Antonio Spurs', NULL), (10, 'Highest Average blocks made', 3, 3, 'Brooklyn Nets', NULL), " 
														  + "(11, 'Highest Average rebounds made', 20, 4, 'Golden State Warriors', NULL), (12, 'Highest Average 3 pointers made', 3, 5, 'Milwaukee Bucks', NULL), " 
														  + "(13, 'Highest assists made', 11, 6, 'Chicago Bulls', 12), (14, 'Highest Average assists made', 8, 6, 'Chicago Bulls', NULL), " 
														  + "(15, 'Highest number of season games played', 1601, 1, 'Orlando Magic', NULL);";
			stmt.executeUpdate(insertRecord);
			
			String createShotTable = "CREATE TABLE Shot (Match_ID INT, Shot_Number INT, Shot_Type VARCHAR(100), Player_Number TINYINT, Team_Name VARCHAR(100));";
			stmt.executeUpdate(createShotTable);
			String insertShot = "INSERT INTO Shot VALUES (3, 3, '3 pointer', 3, 'Brooklyn Nets'), (2, 3,'free throw', 5, 'San Antoino Spurs'), " 
													  + "(4, 4,'2 pointer', 6, 'Golden State Warriors'), (5, 6,'3 pointer', 7, 'Milwaukee Bucks'), " 
													  + "(6, 3,'free throw', 8, 'Miami Heat'), (7, 2,'2 pointer', 5, 'Sacramento Kings'), " 
													  + "(8, 5,'3 pointer', 9, 'Portland Trail Blazers'), (9, 4,'free throw', 10, 'Cleveland Cavaliers'), " 
													  + "(10, 3,'2 pointer', 11, 'Charlotte Hornets'), (11, 2,'3 pointer', 12, 'Minnesota Timberwolves'), " 
													  + "(12, 5,'free throw', 13, 'Chicago Bulls'), (13, 4,'2 pointer', 14, 'Philadelphia 76ers'), " 
													  + "(14, 3,'3 pointer', 15, 'New York Knicks'), (15, 2,'free throw', 16, 'Dallas Mavericks'), " 
													  + "(1, 4,'2 pointer', 17, 'Orlando Magic');";
			stmt.executeUpdate(insertShot);
			
			String createRefereeTable = "CREATE TABLE Referee (Referee_ID INT, First_Name VARCHAR(100), Last_Name VARCHAR(100), PRIMARY KEY (Referee_ID));";
			stmt.executeUpdate(createRefereeTable);
			String insertReferee = "INSERT INTO Referee VALUES (1, 'Jerome', 'Childs'), (2, 'Humphrey', 'Miles'), (3, 'Callie', 'Sparks'), (4, 'Owen', 'Browning'), " 
															+ "(5, 'Sania', 'England'), (6, 'Kiran', 'Wharton'), (7, 'Zakir', 'Dickens'), (8, 'Sonny', 'Pennington'), " 
															+ "(9, 'Rianna', 'Harrington'), (10, 'Davina', 'Mooney'), (11, 'Lachlan', 'Sharpe'), (12, 'Fredrick', 'Hatfield'), " 
															+ "(13, 'Dru', 'Miranda'), (14, 'Siena', 'Gordon'), (15, 'Alex', 'Neal');";
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
