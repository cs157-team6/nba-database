<%@ page import="java.sql.*"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>NBA Matches</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
<style>
body {
	background-color: #eee;
}

#searchBar {
	background-image: url('assets/img/MagnifyingGlass.png');
	background-position: 13px 13px;
	background-repeat: no-repeat;
	display: block;
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 10px;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
}

table {
	margin-left: auto;
	margin-right: auto;
}

th, td {
	text-align: center;
	width: 200px;
}

th {
	border-top: 1px solid black;
	border-right: 1px solid black;
	border-left: 1px solid black;
	background-color: white;
}

td {
	padding: 0;
	background-color: #eee;
}

td div {
	border-top: 1px solid black;
	border-left: 1px solid black;
	border-bottom: 1px solid black;
	margin-bottom: 20px;
	padding: 10px;
	background-color: white;
	height: 160px;
}

#lastCol {
	border-right: 1px solid black;
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-dark navbar-expand-lg fixed-top bg-white portfolio-navbar gradient">
		<div class="container">
			<a class="navbar-brand logo" href="Home.html">NBA Database</a>
			<button data-bs-toggle="collapse" class="navbar-toggler"
				data-bs-target="#navbarNav-1">
				<span class="visually-hidden">Toggle navigation</span><span
					class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav-1">
				<ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="Home.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="Matches.jsp">Matches</a></li>
                    <li class="nav-item"><a class="nav-link" href="Tickets.jsp">Tickets</a></li>
                    <li class="nav-item"><a class="nav-link" href="Teams.jsp">Teams</a></li>
                    <li class="nav-item"><a class="nav-link" href="Players.jsp">Players</a></li>
                    <li class="nav-item"><a class="nav-link" href="Stadiums.jsp">Stadiums</a></li>
                    <li class="nav-item"><a class="nav-link" href="Records.jsp">Records</a></li>
                    <li class="nav-item"><a class="nav-link" href="Analytics.jsp">Analytics</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<main class="page projects-page">
		<section class="portfolio-block projects-cards">
			<div class="container">
				<div class="heading">
					<h2>NBA Matches</h2>
				</div>
				<%
				String db = "cs157A-team6";
				String user; // assumes database name is the same as username
				user = "root";
				String password = "root";
				try {

					java.sql.Connection con;
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157A-team6?autoReconnect=true&useSSL=false", user,
					password);

					Statement stmt = con.createStatement();
					Statement stmtTeam1 = con.createStatement();
					Statement stmtTeam2 = con.createStatement();
					ResultSet rs = stmt.executeQuery(
					"SELECT Referee_ID, Match_ID, Team1Name, Team2Name, DATE_FORMAT(Date, '%m-%d-%Y') Date, TIME_FORMAT(Time, '%h:%i %p') Time, Stadium_Name, First_Name, Last_Name FROM matches NATURAL JOIN referee WHERE matches.Date >= curdate() ORDER BY Date ASC, Time ASC");
					out.println(
					"<input type='text' id='searchBar' onkeyup='searchFunc()' placeholder='Search by team, stadium, or referee...'><table id = 'MatchesTable'><tr><th>Date & Time</th><th>Team 1</th><th>Team 2</th><th>Stadium</th><th>Refereed By</th></tr>");

					while (rs.next()) {
						ResultSet rsTeam1 = stmtTeam1
						.executeQuery("SELECT ImgLinkHTML FROM team WHERE Name = '" + rs.getString(3) + "'");
						rsTeam1.next();
						ResultSet rsTeam2 = stmtTeam2
						.executeQuery("SELECT ImgLinkHTML FROM team WHERE Name = '" + rs.getString(4) + "'");
						rsTeam2.next();

						out.println("<tr><td><div><br><br>" + rs.getString(5) + "<br>" + rs.getString(6) + "</div></td><td><div>"
						+ rsTeam1.getString(1) + "<br><br><b>" + rs.getString(3) + "</b></div></td><td><div>"
						+ rsTeam2.getString(1) + "<br><br><b>" + rs.getString(4) + "</b></td><td><div><br><br>"
						+ rs.getString(7) + "</div></td><td><div id = 'lastCol'><br><br>" + rs.getString(8) + " "
						+ rs.getString(9) + "</div></td></tr>");

						rsTeam2.close();
						rsTeam1.close();
					}
					out.println("</table>");
					rs.close();
					stmtTeam1.close();
					stmt.close();
					con.close();
				} catch (SQLException e) {
					out.println("SQLException caught: " + e.getMessage());
				}
				%>
			</div>
		</section>
	</main>
	<footer class="page-footer"></footer>
	<script>
		function searchFunc() {
			input = document.getElementById("searchBar");
			filter = input.value.toUpperCase();
			table = document.getElementById("MatchesTable");
			row = table.getElementsByTagName("tr");
			for (i = 0; i < row.length; i++) {
				cell = row[i].getElementsByTagName("td")[0];
				cell1 = row[i].getElementsByTagName("td")[1];
				cell2 = row[i].getElementsByTagName("td")[2];
				cell3 = row[i].getElementsByTagName("td")[3];
				cell4 = row[i].getElementsByTagName("td")[4];
				if (cell) {
					if ((cell.innerHTML.toUpperCase().indexOf(filter) > -1)
							|| (cell1.innerHTML.toUpperCase().indexOf(filter) > -1)
							|| (cell2.innerHTML.toUpperCase().indexOf(filter) > -1)
							|| (cell3.innerHTML.toUpperCase().indexOf(filter) > -1)
							|| (cell4.innerHTML.toUpperCase().indexOf(filter) > -1)) {
						row[i].style.display = "";
					} else {
						row[i].style.display = "none";
					}
				}
			}
		}
	</script>
</body>

</html>
