<%@page import="com.model.Employee"%>
<%@page import="com.conn.DBconnect"%>
<%@page import="com.dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@page errorPage="Error.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee management System</title>
<%@include file="all_css.jsp"%>
</head>
<body class="bg-light" style="background-color: #eee">
	<%@include file="navbar.jsp"%>

	<!-- 	<div class="container p-3"> -->
	<!-- 		<div class="row"> -->
	<!-- 			<div class="col-md-6 offset-md-3"> -->
	<!-- 				<div class="card"> -->
	<!-- 					<div class="card-body"> -->
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col">
				<div class="card card-registration my-4">
					<div class="row g-0">
						<div class="col-xl-6 d-none d-xl-block">
							<img
								src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img4.webp"
								alt="Sample photo" class="img-fluid"
								style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem; height: -webkit-fill-available;" />
						</div>
						<div class="col-xl-6">
							<div class="card-body p-md-3 text-black">
								<div class="card-body ">

									<p class="fs-3 text-center">
										Edit Employee <i class="fa fa-edit"
											style="font-size: 25px; color: blue"></i>
									</p>





									<%
									int id = Integer.parseInt(request.getParameter("id"));
									EmpDao d = new EmpDao(DBconnect.getConnection());
									Employee emp = d.EmpGetById(id);

									HttpSession ss = request.getSession();
									ss.setAttribute("id", emp.getId());
									%>





									<form action="update" method="post"
										enctype="multipart/form-data">

										<div class="text-center">


											<img src="pics/<%=emp.getProfile()%>" height=" 150px"
												width="150px"
												class="img-circle profile_img rounded img-responsie " />
										</div>

										<div class="mb-3">
											<label class="input-group mb-3"> Add profile Picture</label>
											<input name="profile" type="file"
												value="<%=emp.getProfile()%>" class="custom-file-input"
												id="inputGroupFile02">
										</div>


										<div class="mb-3">
											<label class="form-label">Employee Name</label> <input
												type="text" value="<%=emp.getName()%>" name="name"
												class="form-control">
										</div>


										<div class="col-sm-4 form-group">
											<label for="sex">Gender</label><br>
											<c:set var="gender" value="<%=emp.getGender()%>" />

											Male <input type="radio" name="gender" value="male"
												<c:if test="${gender=='male'}">checked</c:if>>
											Female <input type="radio" name="gender" value="female"
												<c:if test="${gender=='female'}">checked</c:if>>

										</div>
										<br>

										<div class="mb-3">
											<label class="form-label">Date of Birth</label> <input
												type="date" name="date_of_birth"
												value="<%=emp.getDate_of_birth()%>" class="form-control">
										</div>

										<!-- 							<div class="mb-3"> -->
										<%-- 								<label class="form-label">Hobbies</label> <input type="text" name="hobbies"  value="<%=emp.getHobbies() %>"  --%>
										<!-- 									class="form-control"> -->
										<!-- 							</div> -->



										<!-- <div class="col-sm-4 form-group">
											<label class="form-label">Hobbies :</label> <br> <input
												type="checkbox" name="hobbies" value="cricket"> <span
												class="checkmark"></span> <label>Cricket</label> &nbsp; <input
												type="checkbox" name="hobbies" value="travelling"> <span
												class="checkmark"></span> <label>Traveling</label>&nbsp; <input
												type="checkbox" name="hobbies" value="music"> <span
												class="checkmark"></span> <label>Music</label> &nbsp; <input
												type="checkbox" name="hobbies" value="dancing"> <span
												class="checkmark"></span> <label>Dancing</label>

										</div> -->


										<div class="col-sm-4 form-group">
											<c:set var="hobbies" value="<%=emp.getHobbies()%>" />
											<label>Select Hobbies</label> <br /> <input type="checkbox"
												name="hobbies" value="cricket"
												<c:if test="${fn:contains(hobbies, 'cricket')}">checked</c:if>>
											Cricket &nbsp; <input type="checkbox" name="hobbies"
												value="travelling"
												<c:if test="${fn:contains(hobbies, 'travelling')}">checked</c:if>>
											Traveling&nbsp; <input type="checkbox" name="hobbies"
												value="music"
												<c:if test="${fn:contains(hobbies, 'music')}">checked</c:if>>
											Music &nbsp; <input type="checkbox" name="hobbies"
												value="dancing"
												<c:if test="${fn:contains(hobbies, 'dancing')}">checked</c:if>>
											Dancing &nbsp;

										</div>






										<br>

										<div class="mb-3">
											<label class="form-label">Address-1</label> <input
												type="text" name="address_1" value="<%=emp.getAddress_1()%>"
												class="form-control">
										</div>

										<div class="mb-3">
											<label class="form-label">Address-2</label> <input
												type="text" name="address_2" value="<%=emp.getAddress_2()%>"
												class="form-control">
										</div>

										<div class="mb-3">
											<label class="form-label">City</label> <input type="text"
												name="city" value="<%=emp.getCity()%>" class="form-control">
										</div>

										<!-- 							<div class="mb-3"> -->
										<%-- 								<label class="form-label">State</label> <input type="text" name="state"  value="<%=emp.getState() %>"  --%>
										<!-- 									class="form-control"> -->
										<!-- 							</div> -->

										<div class="mb-3">
											<label for="state">Select State</label> <select id="input"
												class="form-control custom-select browser-default"
												onchange="selectState()" name="state" class="form-control">
												<option value="<%=emp.getState()%>"><%=emp.getState()%></option>
												<option value="empty">select state</option>
												<option value="Andhra Pradesh">Andhra Pradesh</option>
												<option value="Andaman and Nicobar Islands">Andaman
													and Nicobar Islands</option>
												<option value="Arunachal Pradesh">Arunachal Pradesh</option>
												<option value="Assam">Assam</option>
												<option value="Bihar">Bihar</option>
												<option value="Chandigarh">Chandigarh</option>
												<option value="Chhattisgarh">Chhattisgarh</option>
												<option value="Dadar and Nagar Haveli">Dadar and
													Nagar Haveli</option>
												<option value="Daman and Diu">Daman and Diu</option>
												<option value="Delhi">Delhi</option>
												<option value="Lakshadweep">Lakshadweep</option>
												<option value="Puducherry">Puducherry</option>
												<option value="Goa">Goa</option>
												<option value="Gujarat">Gujarat</option>
												<option value="Haryana">Haryana</option>
												<option value="Himachal Pradesh">Himachal Pradesh</option>
												<option value="Jammu and Kashmir">Jammu and Kashmir</option>
												<option value="Jharkhand">Jharkhand</option>
												<option value="Karnataka">Karnataka</option>
												<option value="Kerala">Kerala</option>
												<option value="Madhya Pradesh">Madhya Pradesh</option>
												<option value="Maharashtra">Maharashtra</option>
												<option value="Manipur">Manipur</option>
												<option value="Meghalaya">Meghalaya</option>
												<option value="Mizoram">Mizoram</option>
												<option value="Nagaland">Nagaland</option>
												<option value="Odisha">Odisha</option>
												<option value="Punjab">Punjab</option>
												<option value="Rajasthan">Rajasthan</option>
												<option value="Sikkim">Sikkim</option>
												<option value="Tamil Nadu">Tamil Nadu</option>
												<option value="Telangana">Telangana</option>
												<option value="Tripura">Tripura</option>
												<option value="Uttar Pradesh">Uttar Pradesh</option>
												<option value="Uttarakhand">Uttarakhand</option>
												<option value="West Bengal">West Bengal</option>

											</select>
										</div>



										<div class="mb-3">
											<label class="form-label">Pin_code</label> <input type="text"
												name=pin_code value="<%=emp.getPin_code()%>"
												class="form-control">
										</div>

										<div class="mb-3">
											<label class="form-label">Pancard_No</label> <input
												type="text" name="pancard_no"
												value="<%=emp.getPancard_no()%>" class="form-control">
										</div>



										<input type="hidden" name="id" value="<%=emp.getId()%>">

										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="invalidCheck" required /> <label
												class="form-check-label" for="invalidCheck">Agree to
												terms and conditions</label>
											<div class="invalid-feedback">You must agree before
												submitting.</div>
										</div>

										<br>

										<button type="submit" class="btn btn-primary col-md-12">Update</button>
									</form>



								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>