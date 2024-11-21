<%@page import="com.spring.boot.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }
        header {
            background-color: #007bff;
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
        Admin Dashboard
    </header>
    <div class="container">
        <%-- Display message from session if exists --%>
        <%
        com.spring.boot.model.User user = (com.spring.boot.model.User) session.getAttribute("user");
        String message = (String) session.getAttribute("message");

        if (message != null) {
        %>
        <div class="message"><%= message %></div>
        <%
        session.removeAttribute("message");
        }

        if (user != null) {
        %>
        <p><strong>ID:</strong> <%= user.getId() %></p>
        <p>
            Welcome, <strong><%= user.getName() %></strong>! You have admin privileges.
        </p>
        <div class="actions">
            <a href="<%= request.getContextPath() %>/Logout">Logout</a>
            <a href="add-event">Add Event</a>
            <a href="manageEventsView">Manage Events</a>
        </div>
        <% 
        } else { 
        %>
        <div class="error">User not found in session. Please log in again.</div>
        <% 
        } 
        %>
    </div>
    <footer>
        © 2024 Event Management System. All rights reserved.
    </footer>
</body>
</html>
