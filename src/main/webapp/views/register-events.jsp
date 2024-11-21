<%@ page import="java.util.*, com.spring.boot.model.*, org.springframework.web.util.HtmlUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register for Events</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fb;
            color: #333;
            margin: 20px;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        .message {
            color: #d9534f;
            font-size: 1.1em;
            text-align: center;
            padding: 10px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td {
            background-color: #fafafa;
        }

        tr:nth-child(even) td {
            background-color: #f1f1f1;
        }

        tr:hover td {
            background-color: #e2e2e2;
        }

        .pay-link {
            color: white;
            background-color: #28a745;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            font-weight: bold;
        }

        .pay-link:hover {
            background-color: #218838;
        }

        .pay-link:active {
            background-color: #1e7e34;
        }

        .action-icons {
            cursor: pointer;
        }

        .action-icons img {
            width: 20px;
            height: 20px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 1.1em;
        }

        .back-link a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h2>Register for Events</h2>

    <%
    String message = (String) request.getAttribute("message");
    if (message != null && !message.isEmpty()) {
    %>
    <div class="message"><%=HtmlUtils.htmlEscape(message)%></div>
    <%
    }
    %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Amount</th>
                <th>Resource Person</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            @SuppressWarnings("unchecked")
            List<Event> allEvents = (List<Event>) request.getAttribute("allEvents");
            if (allEvents != null && !allEvents.isEmpty()) {
                for (Event event : allEvents) {
            %>
            <tr>
                <td><%=event.getId()%></td>
                <td><%=event.getTitle()%></td>
                <td><%=event.getDescription()%></td>
                <td><%=event.getAmnt()%></td>
                <td><%=event.getResourcePerson().getName()%></td>
                <td>
                    <a class="pay-link" href="<%=request.getContextPath()%>/registerEvent/<%=event.getId()%>"
                        onclick="return confirm('Are you sure you want to register and pay for this event?');">
                        Pay & Register
                    </a>
                </td>
            </tr>
            <%
            }
            } else {
            %>
            <tr>
                <td colspan="6" style="text-align: center;">No events found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>

    <div class="back-link">
        <a href="<%=request.getContextPath()%>/user-dashboard">Back to Dashboard</a>
    </div>

</body>
</html>
