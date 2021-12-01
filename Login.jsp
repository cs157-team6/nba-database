<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <html>

    <head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Projects - CS157A</title>
    	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    	<link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
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
			<section class="login-clean">
		        <form name="login" action="LoginServlet" method="post" onSubmit="return ValidateEmail();">
            		<h2 class="visually-hidden">NBA Database Login</h2>
            		<div class="illustration"><i class="icon ion-ios-navigate"></i></div>
					<%
					    if(null!=request.getAttribute("errorMsg"))
					    {
					        out.println("<b class=\"text-danger\">" + request.getAttribute("errorMsg") + "</b> <br/>");
					    }
					%>
            		<div class="mb-3"><input class="form-control" type="email" name="email" placeholder="Email"></div>
            		<div class="mb-3"><input class="form-control" type="password" name="pwd" required placeholder="Password"></div>
            		<div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit">Log In</button></div>
		            <a class="forgot" href="<%= request.getContextPath() + "/Register.jsp"%>">Not Registered? Click Here!</a>
		        </form>
			</section>
		</main>
    </body>

    </html>