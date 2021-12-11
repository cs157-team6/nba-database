<%@ page import="java.sql.*"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>NBA Teams</title>
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

table, th, td {
	border: 1px solid black;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
	background-color: white;
}

th, td {
	text-align: center;
	width: 200px;
}

form{
	color: white;
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
					<h2>Seat Availability</h2>
				</div>
				<%
				//session.setAttribute("step", 1);
				
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
					"Select   Matches.Match_ID, Stadium.Name, Stadium.Capacity, count(*), Matches.Team1Name, Matches.Team2Name, DATE_FORMAT(Date, '%m-%d-%Y') Date, TIME_FORMAT(Time, '%h:%i %p') Time from `cs157A-team6`.Reserved, `cs157A-team6`.Matches, `cs157A-team6`.Stadium where `cs157A-team6`.Reserved.Match_ID = `cs157A-team6`.Matches.Match_ID and `cs157A-team6`.Matches.Stadium_Name = `cs157A-team6`.Stadium.Name group by 1 ORDER BY Date ASC, Time ASC;");
					out.println("<input type='text' id='searchBar' onkeyup='searchFunc()' placeholder='Search by team or stadium...'>");
					out.println("<table id=\"TicketsTable\"><tr><th>Date & Time</th><th>Team 1</th><th>Team 2</th><th>Stadium</th><th>Capacity</th><th>Seats-Taken</th></tr>");
					while (rs.next()) {
						ResultSet rsTeam1 = stmtTeam1
						.executeQuery("SELECT ImgLinkHTML FROM team WHERE Name = '" + rs.getString(5) + "'");
						rsTeam1.next();
						ResultSet rsTeam2 = stmtTeam2
						.executeQuery("SELECT ImgLinkHTML FROM team WHERE Name = '" + rs.getString(6) + "'");
						rsTeam2.next();
						out.println("<tr>"
								+ "<td><div>" + rs.getString(7) + "<br>" + rs.getString(8) + "</div></td>"
								+ "<td><div>" + rsTeam1.getString(1) + "<br><br><b>" + rs.getString(5) + "</b></div></td>"
								+ "<td><div>" + rsTeam2.getString(1) + "<br><br><b>" + rs.getString(6) + "</b></div></td>"
								+ "<td>" + rs.getString(2) + "</td>"
								+ "<td>" + rs.getString(3) + "</td>"
								+ "<td>" + rs.getString(4) + "</td>"
								+ "<td>"
									+ "<form style=\"box-shadow:0px 0px 0px\" action=\"Checkout.jsp\" method=\"POST\">" 
									+ "<input type=\"hidden\" name=\"match\" value=\"" + rs.getString(1) + "\">" 
									+ "<input class=\"btn btn-primary\" type=\"submit\"value=\"Get Tickets\" /></form>"
								+ "</td>"
							+ "</tr>");
					}
					out.println("</table>");
					rs.close();
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
			table = document.getElementById("TicketsTable");
			row = table.getElementsByTagName("tr");
			for (i = 0; i < row.length; i++) {
				cell = row[i].getElementsByTagName("td")[0];
				cell1 = row[i].getElementsByTagName("td")[1];
				cell2 = row[i].getElementsByTagName("td")[2];
				cell3 = row[i].getElementsByTagName("td")[3];
				if (cell) {
					if ((cell.innerHTML.toUpperCase().indexOf(filter) > -1)
							|| (cell1.innerHTML.toUpperCase().indexOf(filter) > -1)
							|| (cell2.innerHTML.toUpperCase().indexOf(filter) > -1)
							|| (cell3.innerHTML.toUpperCase().indexOf(filter) > -1)){
						row[i].style.display = "";
					} else {
						row[i].style.display = "none";
					}
				}
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
