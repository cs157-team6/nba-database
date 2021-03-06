<%@ page import="java.sql.*"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>NBA Stadiums</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
<style>
#searchBar {
	background-image: url('assets/img/MagnifyingGlass.png');
	background-position: 13px 13px;
	background-repeat: no-repeat;
	display: block;
	width: 465px;
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
}

#col1 {
	min-width: 200px;
}

#col2 {
	min-width: 190px;
}

#col3 {
	min-width: 55px;
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
					<h2>NBA Stadiums</h2>
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
					ResultSet rs = stmt.executeQuery("SELECT * FROM stadium ORDER BY Name");
					out.println(
					"<input type='text' id='searchBar' onkeyup='searchFunc()' placeholder='Search for stadium name or address...'><table id = 'StadiumsTable'><tr><th>Stadium Name</th><th>Address</th><th>Capacity</th></tr>");
					while (rs.next()) {
						out.println("<tr><td id = 'col1'>" + rs.getString(1) + "</td><td id = 'col2'>" + rs.getString(2) + "<br>"
						+ rs.getString(3) + ", " + rs.getString(4) + "</td><td id = 'col3'>" + rs.getString(5) + "</td></tr>");
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
			table = document.getElementById("StadiumsTable");
			row = table.getElementsByTagName("tr");
			for (i = 0; i < row.length; i++) {
				cell = row[i].getElementsByTagName("td")[0];
				cell1 = row[i].getElementsByTagName("td")[1];
				if (cell) {
					if ((cell.innerHTML.toUpperCase().indexOf(filter) > -1)
							|| (cell1.innerHTML.toUpperCase().indexOf(filter) > -1)) {
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
