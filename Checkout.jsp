<%@ page import="java.sql.*"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>NBA Teams</title>
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap.min.css">
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
					<li class="nav-item"><a class="nav-link" href="Home.jsp">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<main class="page projects-page">
		<section class="portfolio-block projects-cards">
			<div class="container">
				<div class="heading">
					<h2> Checkout</h2>
				</div>
				<div class="container">
				<%
				String db = "cs157A-team6";
				String user; // assumes database name is the same as username
				user = "root";
				String password = "O5Fu3!T9fs";
				try {
					java.sql.Connection con;
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157A-team6?autoReconnect=true&useSSL=false", user,
					password);
					Statement stmt = con.createStatement();
					String id = request.getParameter("match");
					ResultSet rs = stmt.executeQuery("Select Matches.Team1Name, Matches.Team2Name, Stadium.Name, Stadium.Capacity, count(*) from `cs157A-team6`.Reserved, `cs157A-team6`.Matches, `cs157A-team6`.Stadium where `cs157A-team6`.Matches.Match_ID =" + id +" and `cs157A-team6`.Reserved.Match_ID = `cs157A-team6`.Matches.Match_ID and `cs157A-team6`.Matches.Stadium_Name = `cs157A-team6`.Stadium.Name group by 1;");
					String stadium ="";
					if(rs.next()) {
						stadium = rs.getString(3);
						out.println("<h2>Match: " + rs.getString(1) + " VS " + rs.getString(2) + "</h2><br/><h2>Stadium: "+stadium+ "</h2><br/><h3>Seats remaining: " + (rs.getInt(4) - rs.getInt(5)) + "</h3><br/>");
					}
					rs = stmt.executeQuery("Select Seat_Number from seat Where seat_number NOT IN (select Seat_Number from reserved where Match_ID = '"+id+"') AND Stadium_Name = '"+stadium+"';");
					out.println("<form action=\"Confirmation.jsp\" method=\"POST\">");
					while (rs.next()){
						int val = rs.getInt(1);
						out.println("<input type= \"checkbox\" name = \"seats\" value = \""+ val +"\">Seat #"+ val +"</input>");
					}
					out.println("<input type=\"hidden\" name= \"match\" value=\"" + id +"\"><input type=\"hidden\" name= \"stadium\" value=\"" + stadium +"\"><input type=\"submit\" value = \"Purchase\"></form>");
					rs.close();
					stmt.close();
					con.close();
				} catch (SQLException e) {
					out.println("SQLException caught: " + e.getMessage());
				}
				%>
				</div>
			</div>
		</section>
	</main>
	<footer class="page-footer"></footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
