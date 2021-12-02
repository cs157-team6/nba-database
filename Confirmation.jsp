<%@ page import="java.sql.*,logic.UserBean"%>
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
			<a class="navbar-brand logo" href="Home.html">NBA Database</a>
			<button data-bs-toggle="collapse" class="navbar-toggler"
				data-bs-target="#navbarNav-1">
				<span class="visually-hidden">Toggle navigation</span><span
					class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav-1">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="Home.html">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<main class="page projects-page">
		<section class="portfolio-block projects-cards">
			<div class="container">
				<%
				/*
				if((int) session.getAttribute("step") != 2){
					response.sendRedirect("Tickets.jsp");
				}
				else{
					session.removeAttribute("step");
				}
				*/
				
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
					String[] list = request.getParameterValues("seats");
					String id = request.getParameter("match");
					String stadium = request.getParameter("stadium");
					String first =request.getParameter("firstName");
					String last =request.getParameter("lastName");
					String email =request.getParameter("email");
					//check if user exists
					String userQuery = "select ID from customer where Email  = (?);";
					PreparedStatement ps = con.prepareStatement(userQuery);
					ps.setString(1, email);
					ResultSet set = ps.executeQuery();
					int customerID = 0;
					if(set.next()){//result found
						customerID = set.getInt(1);
					}
					else{//no customer exists
						
						String insertQuery1 = "insert into customer (First_Name, Last_Name, Email) values (?,?,?);";
						ps = con.prepareStatement(insertQuery1);
						ps.setString(1, first);
						ps.setString(2, last);
						ps.setString(3, email);
						ps.executeUpdate();
						
						userQuery = "select ID from customer where Email  = (?);";
						ps = con.prepareStatement(userQuery);
						ps.setString(1, email);
						set = ps.executeQuery();
						if(set.next()){//result found
							customerID = set.getInt(1);
						}
					}
					
					//seats already selected will never be an option: Thus no need to check if it exists!
					/*
					String insertQuery2 = "";
					for(String seat : list){
						insertQuery2 = insertQuery2 + "insert into reserved values ('"+seat+"', '"+stadium+"', '"+id+"', '"+customerID+"');";
					}
					int res = stmt.executeUpdate(insertQuery2);
					*/
					
					out.print("<div class=\"heading\"><h2>Purchase Confirmed!</h2></div>");
					//out.print("<div class= \"row justify-content-md-center\"><div class= \"col-md-3\"><h4>Purchased for: "+last+", "+first+"</h4></div></div><div class= \"row justify-content-md-center\"><div class= \"col-md-3\"><h4>At: "+email+"</h4></div></div>");
					out.print("<div class= \"row justify-content-md-center\"><div class= \"col-md-auto\"><a class = \"btn btn-primary text-white\" href=\"Tickets.jsp\">Browse Upcoming Games</a></div></div> ");
					set.close();
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
