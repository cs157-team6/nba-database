<%@ page import="java.sql.*"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Cleveland Cavaliers</title>
<link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
<style>
table, th, td {
	border: 1px solid black;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
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
					<li class="nav-item"><a class="nav-link" href="../index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="../Matches.jsp">Matches</a></li>
					<li class="nav-item"><a class="nav-link" href="../Teams.jsp">Teams</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<main class="page projects-page">
		<section class="portfolio-block projects-cards">
			<div class="container">
				<div class="heading">
					<img style="min-width: 300px; height: 200px;"
						src="https://i.imgur.com/Fzxm85n.png">
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
					ResultSet rs = stmt.executeQuery("SELECT * FROM `cs157a-team6`.player WHERE Team_Name = 'Cleveland Cavaliers' ORDER BY Number ASC");
					out.println("<table><tr><th>Uniform Number</th><th>Player Name</th><th>Age</th><th>Position</th></tr>");
					while (rs.next()) {
						out.println("<tr><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4)
						+ "</td><td>" + rs.getString(5) + "</td></tr>");
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>