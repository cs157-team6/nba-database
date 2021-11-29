<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
		<meta charset="utf-8">
		<meta name="viewport"
		content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Projects - CS157A</title>
		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
		<style>
			table, th, td {
			border: 1px solid black;
			text-align: center;
			margin-left: auto;
			margin-right: auto;
			}
		</style>
	</head>

    <body>
        <script type="text/Javascript">
            /* This is code to check valid email using java script. */
            function ValidateEmail() {
                var emailID = document.login.email;
                //var passwordID = document.form.pwd;
                //check if email is not entered or only spaces are entereds in appropriate textbox
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (!emailID.value.match(mailformat)) {
                	alert("Email is Invalid");
                    emailID.focus();
                    return false;
                }
                return true;
            }
            function ValidatePwd() {
                var passwordID = document.login.pwd;
                if (passwordID.value.length < 4) {
                    alert("Please enter a password at least 4 characters long");
                    passwordID.value = "";
                    passwordID.focus();
                    return false;
                }
                return true;
            }
        </script>

		<main class="page projects-page">
			<section class="portfolio-block projects-cards">
				<div class="container">
					<h1>NBA Database Login</h1>
			        <form name="login" action="LoginServlet" method="post" onSubmit="return ValidateEmail();">
						<%
						    if(null!=request.getAttribute("errorMsg"))
						    {
						        out.println("<b class=\"text-danger\">" + request.getAttribute("errorMsg") + "</b> <br/>");
						    }
						%>
			            Email:
			            <input type="text" name="email" required/><br>
			            Password:
			            <input type="text" name="pwd" required/>
						<br/>
			            <input type="submit" value="Submit" >
						<br/>
						<a href="<%= request.getContextPath() + "/Register.jsp"%>">Not Registered? Click Here!</a>
			        </form>
	    		</div>
			</section>
		</main>
    </body>

    </html>