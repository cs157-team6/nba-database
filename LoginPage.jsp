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
            function ValidateForm() {
                var emailID = document.form.email;
                var passwordID = document.form.pwd;
                //check if email is not entered or only spaces are entereds in appropriate textbox
                if ((emailID.value == null) || (emailID.value == "")) {
                    alert("Please Enter your Email ID");
                    // set cursor to the textbox provided for email entry
                    emailID.focus();
                    return false;
                }
                if ((passwordID.value == null) || (passwordID.length < 4)) {
                    alert("Please enter a password at least 4 characters long");
                    passwordID.focus();
                    return false;
                }
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (!emailID.value.match(mailformat)) {
                    emailID.value = "";
                    emailID.focus();
                    return false;
                }
                return true;
            }
        </script>

        <form action="LoginServlet" method="post">

            Email:
            <input type="text" name="email" /><br>

            Password:
            <input type="text" name="pwd" />

            <input type="submit" value="submit" onSubmit="ValidateForm()">

        </form>
    </body>

    </html>