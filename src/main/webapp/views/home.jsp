<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EMS Home</title>
    <style>
        /* Reset default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fc;
            color: #333;
            line-height: 1.6;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Header section */
        header {
            background-color: #333;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        header h1 {
            font-size: 36px;
            margin: 0;
        }

        /* Navigation bar */
        nav {
            background-color: #4CAF50;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            margin: 0 10px;
            font-size: 18px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        nav a:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        nav a:active {
            background-color: #388e3c;
        }

        /* Content section */
        .container {
            text-align: center;
            margin: 30px 0;
            flex-grow: 1;  /* Ensures content area grows to take up available space */
        }

        .container a {
            display: inline-block;
            padding: 15px 25px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 20px;
            margin: 10px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .container a:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        /* Footer section */
        footer {
            background-color: #333;
            color: white;
            padding: 20px 0;
            text-align: center;
            font-size: 14px;
        }

        footer a {
            color: #4CAF50;
            text-decoration: none;
            margin: 0 5px;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Responsive styling */
        @media screen and (max-width: 768px) {
            header h1 {
                font-size: 28px;
            }

            nav a {
                padding: 10px 15px;
                font-size: 16px;
            }

            .container a {
                padding: 12px 20px;
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Event Management - Registration System</h1>
    </header>

    <!-- Navigation Bar -->
    <nav>
        <a href="home">Home</a>
        <a href="add-user">Register</a>
        <a href="login">Login</a>
        <a href="create-admin">Create New Admin</a>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <a href="add-user">Register</a>
        <a href="login">Login</a>
        <a href="create-admin">Create New Admin</a>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Event Management System. All Rights Reserved.</p>
        <p>
            <a href="terms">Terms of Service</a> | 
            <a href="privacy">Privacy Policy</a>
        </p>
    </footer>

</body>
</html>
