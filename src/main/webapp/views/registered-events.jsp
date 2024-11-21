<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*, com.spring.boot.model.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Registered Events</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: 30px auto;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	padding: 20px;
}

h1 {
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
	text-align: left;
	padding: 12px 15px;
	border: 1px solid #ddd;
}

th {
	background-color: #007bff;
	color: white;
	text-transform: uppercase;
	font-size: 14px;
}

td {
	color: #555;
	font-size: 14px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #d1ecf1;
}

.message {
	text-align: center;
	margin-top: 20px;
	color: #555;
	font-size: 16px;
	padding: 15px;
	background-color: #f8f9fa;
	border-radius: 5px;
}

.back-link {
	display: inline-block;
	text-align: center;
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border-radius: 4px;
	text-decoration: none;
	margin-top: 20px;
}

.back-link:hover {
	background-color: #0056b3;
	text-decoration: none;
}

.no-events {
	text-align: center;
	color: #555;
	font-size: 16px;
	padding: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Events You Have Registered For</h1>

		<%
		@SuppressWarnings("all")
		List<Event> registeredEvents = (List<Event>) request.getAttribute("registeredEvents");

		if (registeredEvents != null && !registeredEvents.isEmpty()) {
		%>
		<table>
			<thead>
				<tr>
					<th>Event ID</th>
					<th>Title</th>
					<th>Description</th>
					<th>Amount</th>
					<th>Resource Person</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Event event : registeredEvents) {
				%>
				<tr>
					<td><%=event.getId()%></td>
					<td><%=event.getTitle()%></td>
					<td><%=event.getDescription()%></td>
					<td>$<%=event.getAmnt()%></td>
					<td><%=event.getResourcePerson() != null ? event.getResourcePerson().getName() : "N/A"%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<div class="no-events">You have not registered for any events yet.</div>
		<%
		}
		%>

		<div style="text-align: center;">
			<a class="back-link" href="<%=request.getContextPath()%>/user-dashboard">Back to Dashboard</a>
		</div>
	</div>
</body>
</html>
