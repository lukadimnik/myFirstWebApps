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
<title>Student Search</title>
</head>
<body>
	<h1>Student Search</h1>
	<div>

		<form action="StudentSearchServlet" method="GET">
			<input type="submit" value="Student search" /> <label>Search
				student by ID: </label> <input type="text" name="txtId" />
		</form>

		<br /> <br />

		<%-- If this JSP page is requested with a parameter called 'movieList' 
		     and the list is not empty, then show the data in an HTML table.
		 --%>
		<c:if test="${student.id != 0 }">
			<p>
				<c:out value="${ student.id}" />
				<c:out value="${ student.lastName }" />
				<c:out value="${ student.firstName }" />
			</p>
		</c:if>

		<c:if test="${(student == null || student.id == 0)}">
			<p>
				No students found for the given id:
				<c:out value="${id }"></c:out>
			</p>
		</c:if>
		<c:if test="${msg != null }">
			<p><c:out value="${msg}"></c:out></p>
		</c:if>
		
	</div>
</body>
</html>