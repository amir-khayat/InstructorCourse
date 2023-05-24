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
<title>View</title>
</head>
<body>

	<div class="bg-dark py-3">
		<div
			class="container d-flex justify-content-between align-items-center">
			<h1 class="text-white mb-0">${course.courseName} with
				${instructor.instructorName}.</h1>
			<div>
				<a href="/dashboard" class="btn btn-light me-2">Home</a> <a
					href="/logout" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>

	<div class="container mt-3">
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Day:</h5>
				<p class="card-text">${course.weekDay}</p>
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Cost:</h5>
				<p class="card-text">$${course.price}</p>
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Description:</h5>
				<p class="card-text">${course.description}</p>
			</div>
		</div>
	</div>


</body>
</html>