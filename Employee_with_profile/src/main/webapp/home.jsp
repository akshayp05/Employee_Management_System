<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.EmpDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conn. DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="Error.jsp"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>


</head>
<body class="bg-light" style="background-color: #eee">
	<%@include file="navbar.jsp"%>


<%
boolean f = (boolean) session.getAttribute("currentUser");
if (f == true) {
	response.sendRedirect("login.jsp");
}
%>



	<!-- Button trigger modal -->


	<div class="m-3">
		<div class="row">

			<p class="text-center fs-1">
				All Employee Details <i class="fa fa-users"></i>
			</p>

			<c:if test="${not empty succMsg}">
				<p class="text-center text-success">${succMsg}</p>
				<c:remove var="succMsg" />
			</c:if>

			<c:if test="${not empty errorMsg}">
				<p class="text-center text-success">${errorMsg}</p>
				<c:remove var="errorMsg" />
			</c:if>
			<!-- table start -->
			<table class="table table-success table-striped"
				style="width: 80%; margin-left: 10%">
				<thead>
					<tr style="font-size: 23px; text-align: center;">

						<th>ID</th>
						<th>Name</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody style="text-align: center;">
					<%
					EmpDao d = new EmpDao(DBconnect.getConnection());
					List<Employee> list = d.showAllEmp();
					for (Employee emp : list) {
					%>
					<tr style="font-size: 12px">
						<th scope="row"><%=emp.getId()%></th>
						<td><%=emp.getName()%></td>


						<td><a href="edit_emp.jsp?id=<%=emp.getId()%>"
							class="btn btn-sm btn-primary "
							onclick="return confirm('Are you sure you want to edit?')"
							style="font-size: 12px">Edit</a> <a
							href="delete?id=<%=emp.getId()%>"
							class="btn btn-sm btn-danger ms-1"
							onclick="return confirm('Are you sure you want to delete?')"
							style="font-size: 12px"> Delete</a> <a
							href="#profile-model<%=emp.getId()%>" data-toggle="modal"
							data-target="#profile-model<%=emp.getId()%>"
							class="btn btn-success ms-1" style="font-size: 12px"> View</a></td>


					</tr>
					<%
					}
					%>

				</tbody>

			</table>
		</div>
	</div>

	<%
	EmpDao d1 = new EmpDao(DBconnect.getConnection());
	List<Employee> list1 = d1.showAllEmp();
	for (Employee emp : list1) {
	%>


	<!-- Modal -->
	<div class="modal fade" id="profile-model<%=emp.getId()%>"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content ">
				<div class="modal-header <a href="edit_emp.jsp?id=<%=emp.getId()%>"">
					<h5 class="modal-title text-center" id="exampleModalLabel">Employee
						Detail</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=emp.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;"> <br>
						<h5 class="modal-title mt-3" id="exampleModalLabel">
							<%=emp.getName()%>
						</h5>
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=emp.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Employee Name :</th>
										<td><%=emp.getName()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=emp.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">D.O.B. :</th>
										<td><%=emp.getDate_of_birth()%></td>

									</tr>
									<tr>
										<th scope="row">Hobbies. :</th>
										<td><%=emp.getHobbies()%></td>

									</tr>
									<tr>
										<th scope="row">Address-1 :</th>
										<td><%=emp.getAddress_1()%></td>

									</tr>
									<tr>
										<th scope="row">Address-2 :</th>
										<td><%=emp.getAddress_2()%></td>

									</tr>
									<tr>
										<th scope="row">City :</th>
										<td><%=emp.getCity()%></td>

									</tr>
									<tr>
										<th scope="row">State :</th>
										<td><%=emp.getState()%></td>

									</tr>
									<tr>
										<th scope="row">Pin_code :</th>
										<td><%=emp.getPin_code()%></td>

									</tr>
									<tr>
										<th scope="row">Pancard_No. :</th>
										<td><%=emp.getPancard_no()%></td>

									</tr>
								</tbody>
							</table>
							<br> <a href="edit_emp.jsp?id=<%=emp.getId()%>"
								class="btn btn-secondary "
								onclick="return confirm('Are you sure you want to edit?')"
								style="font-size: 12px">Edit</a> &nbsp; &nbsp; &nbsp; &nbsp; <a
								href="home.jsp" class="btn btn-sm btn-primary "
								
								style="font-size: 12px">Back</a> <br>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>

	<%
	}
	%>


	<!-- table end -->


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