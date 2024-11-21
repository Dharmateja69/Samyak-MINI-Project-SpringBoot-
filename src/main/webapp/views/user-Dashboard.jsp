
<%@page import="com.spring.boot.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }
        header {
            background-color: #28a745;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 8px;
        }
        .message {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            margin-bottom: 20px;
            border-left: 4px solid #28a745;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin-bottom: 20px;
            border-left: 4px solid #dc3545;
        }
        .welcome {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .actions a {
            display: inline-block;
            margin: 10px 5px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .actions a:hover {
            background-color: #0056b3;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <header>
        User Dashboard
    </header>
    <div class="container">
       <%
	// Retrieve the user object and message from the request scope
	com.spring.boot.model.User user = (com.spring.boot.model.User) request.getAttribute("user");
	String message = (String) request.getAttribute("message");

	if (message != null) {
	%>
	<p><%=message%></p>
	<%
	}
	%>
        <% 
        // Check if user exists and display information
        if (user != null) {
        %>
        <p class="welcome">
            Welcome to your dashboard, <strong><%= user.getUsername() %></strong>! You are a regular user.
        </p>
        <div class="actions">
            <a href="<%= request.getContextPath() %>/Logout">Logout</a>
            <a href="register-events">Register for Events</a>
            <a href="registered-events">My Registered Events</a>
        </div>
        <% 
        } else { 
        %>
        <div class="error">User not found. Please log in again.</div>
        <% 
        } 
        %>
    </div>
    <footer>
        © 2024 Event Management System. All rights reserved.
    </footer>
</body>
</html>
