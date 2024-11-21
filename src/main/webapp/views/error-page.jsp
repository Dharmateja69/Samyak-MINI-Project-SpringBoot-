<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            text-align: center;
            padding: 50px;
            margin: auto;
        }

        .error-title {
            color: #ff6b6b;
            font-size: 36px;
        }

        .error-message {
            color: #555;
            font-size: 18px;
            margin: 20px 0;
        }

        .actions a {
            display: inline-block;
            margin: 10px 10px;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .actions a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="error-title">Oops! Something went wrong.</h1>
        <p class="error-message">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "An unexpected error has occurred." %>
        </p>
        <div class="actions">
           
            <a href="<%= request.getContextPath() %>/home">Go to Home</a>
        </div>
    </div>
</body>
</html>
