<%@ page import="java.util.List, com.spring.boot.model.User"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
    <title>Add Event</title>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <style>
        /* Reset some default styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        
        h2 {
            color: #333;
            text-align: center;
            margin-top: 30px;
        }
        
        .form-container {
            width: 60%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 12px 15px;
            text-align: left;
        }

        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: vertical;
        }

        .form-container select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
        }

        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .select2-container--default .select2-selection--single {
            height: 36px;
            line-height: 36px;
        }

        .message {
            text-align: center;
            color: #ff6347;
            margin-top: 20px;
        }

    </style>
    <script>
        $(document).ready(function() {
            $('.select2').select2({
                placeholder: "Select a user",
                allowClear: true
            });
        });
    </script>
</head>
<body>

    <h2>Add Event</h2>

    <div class="form-container">
        <form:form action="add-event" method="post" modelAttribute="event">
            <table>
                <tr>
                    <td>Title:</td>
                    <td><form:input path="title" /></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><form:textarea path="description" rows="3" /></td>
                </tr>
                <tr>
                    <td>Amount:</td>
                    <td><form:input path="amnt" type="number" /></td>
                </tr>
                <tr>
                    <td>Resource Person:</td>
                    <td>
                        <form:select path="resourcePerson.id" class="select2">
                            <form:option value="" label="Select a user" />
                            <%
                            @SuppressWarnings("unchecked")
                            List<User> allUsers = (List<User>) request.getAttribute("allUsers");
                            for (User user : allUsers) {
                            %>
                            <form:option value="<%= user.getId() %>"><%=user.getName()%></form:option>
                            <%
                            }
                            %>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Add Event" />
                          <a class="back-link" href="<%=request.getContextPath()%>/admin-dashboard">Back to Dashboard</a>
                    </td>
                </tr>
            </table>
          
        </form:form>
    </div>

</body>
</html>
