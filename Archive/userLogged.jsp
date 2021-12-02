<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"  %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>NBA Database Home Page</title>
    </head>

    <body>
        <%
        	Example.UserBean currentUser=(Example.UserBean) (session.getAttribute("currentSessionUser"));
        %>

            Welcome <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>

    </body>

    </html>
