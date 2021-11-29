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
					<li class="nav-item"><a class="nav-link" href="Teams.jsp">Teams</a></li>
					<li class="nav-item"><a class="nav-link" href="Matches.jsp">Matches</a></li>
					<li class="nav-item"><a class="nav-link" href="Players.jsp">Players</a></li>
					<li class="nav-item"><a class="nav-link" href="Records.jsp">Records</a></li>
					<li class="nav-item"><a class="nav-link" href="Stadiums.jsp">Stadiums</a></li>
					<li class="nav-item"><a class="nav-link" href="Tickets.jsp">Tickets</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<footer class="page-footer"></footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
