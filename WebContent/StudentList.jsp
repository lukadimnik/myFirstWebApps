<%-- 1. The following tag allows the use of the JSP tags in this file: --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- 2. The following tag allows the use of the JSTL core tags in this file: --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/StudentList.css">
<title>Student List</title>
</head>
<body>
	<h1>Student List</h1>

	<div>
		<form action="studentListServlet" method="GET">

			<br /> <br />

			<%-- If this JSP page is requested with a parameter called 'movieList' 
		     and the list is not empty, then show the data in an HTML table.
		 --%>
			<table>
				<thead>
					<tr>
						<th>Student id</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Street</th>
						<th>Postcode</th>
						<th>Postoffice</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ studentList }" var="studentObject">
						<tr>
							<td><c:out value="${ studentObject.id}" /></td>
							<td><c:out value="${ studentObject.firstName }" /></td>
							<td><c:out value="${ studentObject.lastName }" /></td>
							<td><c:out value="${ studentObject.street }" /></td>
							<td><c:out value="${ studentObject.postCode }" /></td>
							<td><c:out value="${ studentObject.postOffice }" /></td>
							<td><a
								href='DeleteStudent?studentId=<c:out value="${ studentObject.id }" />'
								onClick="return confirm('Do you want to delete the Student?')" >Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>