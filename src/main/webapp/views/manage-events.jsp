<%@ page import="java.util.*,com.spring.boot.model.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Events</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

.container {
	width: 90%;
	margin: 20px auto;
	background: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	padding: 20px;
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: center;
}

th {
	background-color: #007bff;
	color: #fff;
	text-transform: uppercase;
	font-size: 14px;
}

td {
	font-size: 14px;
	color: #555;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #d1ecf1;
}

td a {
	text-decoration: none;
	font-size: 14px;
	padding: 5px 10px;
	border-radius: 4px;
	display: inline-block;
	margin: 2px;
}

.edit-link {
	background-color: #28a745;
	color: #fff;
}

.del-link {
	background-color: #dc3545;
	color: #fff;
}

.action-icons img {
	width: 20px;
	height: 20px;
	margin-left: 5px;
	cursor: pointer;
}

.message {
	text-align: center;
	margin-bottom: 20px;
	font-size: 16px;
	color: #155724;
	background-color: #d4edda;
	border: 1px solid #c3e6cb;
	padding: 10px;
	border-radius: 4px;
}

.no-events {
	text-align: center;
	color: #555;
	font-size: 16px;
	padding: 20px 0;
	background-color: #f8f9fa;
}

.back-link {
	display: block;
	text-align: center;
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border-radius: 4px;
	text-decoration: none;
	width: 200px;
	margin: 20px auto 0;
}

.back-link:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Manage Events</h2>

		<%
		@SuppressWarnings("unchecked")
		List<Event> allEvents = (List<Event>) request.getAttribute("allEvents");
		if (allEvents != null && !allEvents.isEmpty()) {
		%>

		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Description</th>
					<th>Amount</th>
					<th>Resource Person</th>
					<th>Registered Users</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Event event : allEvents) {
				%>
				<tr>
					<td><%=event.getId()%></td>
					<td><%=event.getTitle()%></td>
					<td><%=event.getDescription()%></td>
					<td>$<%=event.getAmnt()%></td>
					<td><%=event.getResourcePerson().getName()%></td>
					<td>
						<%
						List<User> registeredUsers = event.getRegisteredUsers();
						if (registeredUsers == null) {
							registeredUsers = new ArrayList<>();
						}
						if (!registeredUsers.isEmpty()) {
							for (User user : registeredUsers) {
						%> 
						<span><%=user.getName()%></span><br> 
						<% }
						} else {
						%>
						<em>No registered users</em>
						<%
						}
						%>
					</td>
					<td>
						<a class="edit-link" href="<%=request.getContextPath()%>/editEvent/<%=event.getId()%>">Edit</a>
						<a class="del-link" href="<%=request.getContextPath()%>/deleteEvent/<%=event.getId()%>" onclick="return confirm('Are you sure you want to delete this event?');">Delete</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<div class="no-events">No events found.</div>
		<%
		}
		%>

		<a class="back-link" href="<%=request.getContextPath()%>/admin-dashboard">Back to Dashboard</a>
	</div>
</body>
</html>
