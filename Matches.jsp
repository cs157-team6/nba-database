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
table, th, td {
	border: 1px solid black;
	text-align: center;
	margin: 50px auto;
	padding: 5px;
	min-width: 200px;
	background-color: white;
}

body {
	background-color: #eee;
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-dark navbar-expand-lg fixed-top bg-white portfolio-navbar gradient">
		<div class="container">
			<a class="navbar-brand logo" href="#">NBA Database</a>
			<button data-bs-toggle="collapse" class="navbar-toggler"
				data-bs-target="#navbarNav-1">
				<span class="visually-hidden">Toggle navigation</span><span
					class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav-1">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="Matches.jsp">Matches</a></li>
					<li class="nav-item"><a class="nav-link" href="Teams.jsp">Teams</a></li>
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
				String password = "6eP5hy!Vy@@QstA3o8mwRdnK";
				try {

					java.sql.Connection con;
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157A-team6?autoReconnect=true&useSSL=false", user,
					password);

					Statement stmt = con.createStatement();
					Statement stmtTeam1 = con.createStatement();
					Statement stmtTeam2 = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM matches NATURAL JOIN referee ORDER BY Date ASC, Time ASC");

					while (rs.next()) {

						ResultSet rsTeam1 = stmtTeam1
						.executeQuery("SELECT ImgLinkHTML FROM team WHERE Name = '" + rs.getString(3) + "'");
						rsTeam1.next();
						ResultSet rsTeam2 = stmtTeam2
						.executeQuery("SELECT ImgLinkHTML FROM team WHERE Name = '" + rs.getString(4) + "'");
						rsTeam2.next();

						out.println(
						"<table><tr><th>Date & Time</th><th>Team 1</th><th>Team 2</th><th>Stadium</th><th>Refereed By</th></tr><tr><td>"
								+ rs.getString(5) + "<br>" + rs.getString(6) + "</td><td>" + rsTeam1.getString(1)
								+ "<br><br><b>" + rs.getString(3) + "</b></td><td>" + rsTeam2.getString(1) + "<br><br><b>"
								+ rs.getString(4) + "</td><td>" + rs.getString(7) + "</td><td>" + rs.getString(8) + " "
								+ rs.getString(9) + "</td></tr></table>");

						rsTeam2.close();
						rsTeam1.close();
					}
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>