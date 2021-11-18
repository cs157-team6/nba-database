<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>NBA Database Login Page</title>
    </head>

    <body>
        <script language="Javascript">
            /* This is code to check valid email using java script. */
            function ValidateEmail() {
                var emailID = document.login.email;
                //var passwordID = document.form.pwd;
                //check if email is not entered or only spaces are entereds in appropriate textbox
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (!emailID.value.match(mailformat)) {
                	alert("Email is Invalid");
                    emailID.focus();
                    console.log("invalid");
                    return false;
                }
                console.log("valid");
                return true;
            }
            function ValidatePwd() {
                var passwordID = document.login.pwd;
                if (passwordID.value.length < 4) {
                    alert("Please enter a password at least 4 characters long");
                    passwordID.value = "";
                    passwordID.focus();
                    console.log("invalid");
                    return false;
                }
                console.log("valid");
                return true;
            }
        </script>

        <form name="login" action="LoginServlet" method="post">

            Email:
            <input type="text" name="email" onChange="ValidateEmail()" required/><br>

            Password:
            <input type="text" name="pwd" required/>

            <input type="submit" value="submit" onSubmit="return ValidateEmail();">

        </form>
    </body>

    </html>