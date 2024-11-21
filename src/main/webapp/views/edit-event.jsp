<%@ page import="java.util.*,com.spring.boot.model.*, org.springframework.web.util.HtmlUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Event</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .message {
            padding: 10px;
            background-color: #f8d7da;
            color: #721c24;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 16px;
            color: #555;
        }

        input, select, textarea {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #007BFF;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Event</h2>

        <% 
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
        %>
        <div class="message"><%= HtmlUtils.htmlEscape(message) %></div>
        <% } %>

        <%
                 @SuppressWarnings("unchecked")
            Event event = (Event) request.getAttribute("event");
            List<User> allUsers = (List<User>) request.getAttribute("allUsers");
        %>

        <form action="<%= request.getContextPath() %>/editEvent/<%= event.getId() %>" method="post">
            <input type="hidden" name="id" value="<%= event.getId() %>"/>

            <label for="title">Event Title:</label>
            <input type="text" name="title" id="title" value="<%= event.getTitle() %>" required="true"/>

            <label for="description">Description:</label>
            <textarea name="description" id="description" rows="4" required="true"><%= event.getDescription() %></textarea>

            <label for="amount">Amount:</label>
            <input type="number" name="amnt" id="amount" value="<%= event.getAmnt() %>" required="true"/>

            <label for="resourcePerson">Resource Person:</label>
            <select name="resourcePerson.id" id="resourcePerson">
                <option value="" disabled>Select a user</option>
                <%
                    if (allUsers != null && !allUsers.isEmpty()) {
                        for (User user : allUsers) {
                %>
                <option value="<%= user.getId() %>" <%= event.getResourcePerson() != null && event.getResourcePerson().getId() == user.getId() ? "selected" : "" %>>
                    <%= user.getName() %>
                </option>
                <%
                        }
                    }
                %>
            </select>

            <button type="submit">Update Event</button>
        </form>

        <a href="<%= request.getContextPath() %>/manageEventsView" class="back-link">Back to Manage Events</a>
    </div>
</body>
</html>
