	<%@page import="com.conn.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystaile.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 80% 90%, 50% 100%, 20% 90%,
		1% 100%, 0% 35%, 0 1%);
}
</style>

</head>
<body>

	<%@include file="nav.jsp"%>
	<!--//banner-->

	<div class="container-fluid p-0 m-0">

		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to Employee Management</h3>

				<p>Inspiration isn't always easy to come through. So, whenever
					employee morale is down, and motivation is running low, a
					collection of the best motivational quotations will help lift your
					team's spirits.</p>
				<p>Motivating employees is a primary concern for any good
					leader. That's why they must search for new ways to boost the
					morale of their teams.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa 	fa fa-user-plus"></span> Start ! its Free
				</button>
				<a href="login.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa fa-user-circle fa-spin"></span> Login
				</a>

			</div>
		</div>

	</div>

	<!--//cards-->

	<div class="container">

		<div class="row mb-2">

			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Features</h5>
						<p class="card-text">Employee Management Employee
							Onboarding Attendance Tracker Shift Scheduling Timesheets
							Corporate LMS Performance Management HR Analytics</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Resources</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Compare with</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


		</div>


	</div>

	<!--javascripts-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="Js/myjsfile.js" type="text/javascript"></script>
</body>
</html>