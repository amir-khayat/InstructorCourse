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
<title>Create Course</title>
</head>
<body>
	<div class="bg-dark py-3">
		<div
			class="container d-flex justify-content-between align-items-center">
			<h1 class="text-white mb-0">Create Course.</h1>
			<div>
				<a href="/dashboard" class="btn btn-light me-2">Home</a> <a
					href="/logout" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>

	<div class="container mt-3">
		<form:form action="/create" method="post" modelAttribute="newCourse">
			<form:hidden path="instructor" value="${instructor.id}" />
			<div class="mb-3">
				<form:label path="courseName" class="form-label">Course Name:</form:label>
				<form:input path="courseName" class="form-control" type="text" />
				<form:errors path="courseName" class="text-danger" />
			</div>
			<div class="mb-3">
				<form:label path="weekDay" class="form-label">Day Of Week:</form:label>
				<form:select path="weekDay" class="form-select">
					<option value="Monday">Monday</option>
					<option value="Tuesday">Tuesday</option>
					<option value="Wednesday">Wednesday</option>
					<option value="Thursday">Thursday</option>
					<option value="Friday">Friday</option>
					<option value="Saturday">Saturday</option>
					<option value="Sunday">Sunday</option>
				</form:select>
				<form:errors path="weekDay" class="text-danger" />
			</div>
			<div class="mb-3">
				<form:label path="price" class="form-label">Drop In Price:</form:label>
				<form:input type="number" path="price" class="form-control"
					placeholder="Enter price" required="true" />
				<form:errors path="price" class="text-danger" />
			</div>
			<div class="mb-3">
				<form:label path="description" class="form-label">Description:</form:label>
				<form:textarea path="description" class="form-control" rows="5"
					cols="50"></form:textarea>
				<form:errors path="description" class="text-danger" />
			</div>
			<input type="submit" value="Submit" class="btn btn-primary" />
		</form:form>
	</div>


</body>
</html>