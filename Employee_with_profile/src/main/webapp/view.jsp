<%@page import="com.model.Employee"%>
<%@page import="com.conn.DBconnect"%>
<%@page import="com.dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page errorPage="Error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>
</head>
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 500px;
	margin: auto;
	text-align: center;;
}
</style>

<body>
	<%@include file="navbar.jsp"%>




	<!-- 					<div class="card-body"> -->
	<div class="container py-5 h-100">

		<div class="col">
			<div class="card card-registration my-3">
				<div class="row g-0">


					<div class="card">


						<p class="fs-3 text-center">
							Employee Details<i style="font-size: 25px; color: blue"></i>
						</p>


						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="text-center text-success">${errorMsg}</p>
							<c:remove var="errorMsg" />
						</c:if>






						<%
						int id = Integer.parseInt(request.getParameter("id"));
						EmpDao d = new EmpDao(DBconnect.getConnection());
						Employee emp = d.EmpGetById(id);

						HttpSession ss = request.getSession();
						ss.setAttribute("id", emp.getId());
						%>


						<!--//details-->



						<div>
							<table class="table" style="width: 400px">

								<tbody>



									<div class="text-center">


										<img src="pics/<%=emp.getProfile()%>" height=" 150px"
											width="150px"
											class="img-circle profile_img rounded img-responsie " />
									</div>


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
							
								style="font-size: 12px">Home</a> <br>

						</div>
						<br>
						<!--profile edit-->

					</div>
				</div>
			</div>
		</div>

		<br>

	</div>



</body>
</html>