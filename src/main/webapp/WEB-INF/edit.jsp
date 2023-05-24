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
<title>Edit</title>
</head>
<body>
	<div class="bg-dark py-3">
		<div
			class="container d-flex justify-content-between align-items-center">
			<h1 class="text-white mb-0">Edit ${infoCourse.courseName}.</h1>
			<div>
				<form action="/delete/${infoCourse.id}" method="post"
					class="d-inline">
					<input type="hidden" name="_method" value="delete"> <input
						type="submit" value="Delete Course" class="btn btn-danger me-2">
				</form>
				<a href="/dashboard" class="btn btn-light me-2">Home</a> <a
					href="/logout" class="btn btn-danger">Logout</a>
			</div>


		</div>
	</div>

	<div class="container mt-3">
		<form:form action="/update/${editCourse.id}" method="post"
			modelAttribute="editCourse">
			<input type="hidden" name="_method" value="put">
			<form:hidden path="instructor" value="${instructor.id}" />

			<div class="mb-3">
				<form:label path="courseName" class="form-label">Course Name:</form:label>
				<form:input path="courseName" class="form-control" type="text" />
				<form:errors path="courseName" class="text-danger" />
			</div>

			<div class="mb-3">
				<form:label path="weekDay" class="form-label">Day Of Week:</form:label>
				<form:select path="weekDay" class="form-select">
					<option value="Monday"
						<c:if test="${editCourse.weekDay == 'Monday'}">selected</c:if>>Monday</option>
					<option value="Tuesday"
						<c:if test="${editCourse.weekDay == 'Tuesday'}">selected</c:if>>Tuesday</option>
					<option value="Wednesday"
						<c:if test="${editCourse.weekDay == 'Wednesday'}">selected</c:if>>Wednesday</option>
					<option value="Thursday"
						<c:if test="${editCourse.weekDay == 'Thursday'}">selected</c:if>>Thursday</option>
					<option value="Friday"
						<c:if test="${editCourse.weekDay == 'Friday'}">selected</c:if>>Friday</option>
					<option value="Saturday"
						<c:if test="${editCourse.weekDay == 'Saturday'}">selected</c:if>>Saturday</option>
					<option value="Sunday"
						<c:if test="${editCourse.weekDay == 'Sunday'}">selected</c:if>>Sunday</option>
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

			<div class="form-group">
				<input type="submit" value="Submit" class="btn btn-primary" />
			</div>
		</form:form>


	</div>
</body>
</html>