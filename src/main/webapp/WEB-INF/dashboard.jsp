<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
	<div class="bg-dark py-3">
		<div
			class="container d-flex justify-content-between align-items-center">
			<h1 class="text-white mb-0">
				Welcome
				<c:out value="${instructor.instructorName}" />.
			</h1>
			<div>
				<a href="/create" class="btn btn-light me-2">Create Course</a> <a
					href="/logout" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>

	<div class="container mt-4">
		<h3 class="mb-2">Course Schedule:</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">Class Name</th>
					<th scope="col">Instructor</th>
					<th scope="col">Weekday</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="course" items="${courses}">
					<tr>
						<td><c:out value="${course.courseName}" /></td>
						<td><c:out value="${course.instructor.instructorName}" /></td>
						<td><c:out value="${course.weekDay}" /></td>
						<td>$<c:out value="${course.price}" /></td>
						<td class="d-flex gap-3"><c:choose>
								<c:when test="${course.instructor.id == instructor.id}">
									<a href="/edit/${course.id}" class="btn btn-info">Edit</a>
									<form action="/delete/${course.id}" method="post">
										<input type="hidden" name="_method" value="delete"> <input
											type="submit" value="Delete" class="btn btn-danger">
									</form>
									<a href="/view/${course.id}" class="btn btn-success">Show</a>
								</c:when>
								<c:otherwise>
									<a href="/view/${course.id}" class="btn btn-success">Show</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>