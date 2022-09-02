<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="Error.jsp"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee management System</title>
<%@include file="all_css.jsp"%>



</head>
<body class="vh-100" style="background-color: #eee">
	<%@include file="navbar.jsp"%>

	<!-- <div class="container p-3">
		<div class="row ">
			<div class="col-md-6 offset-md-6">
				<div class="card text-black" style="border-radius: 25px;">
				 -->

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
										Add Employee <i class="fa fa-users"></i>
									</p>

									<c:if test="${not empty succMsg}">
										<p class="text-center text-success">${succMsg}</p>
										<c:remove var="succMsg" />
									</c:if>

									<c:if test="${not empty errorMsg}">
										<p class="text-center text-success">${errorMsg}</p>
										<c:remove var="errorMsg" />
									</c:if>




									<form action="register" method="post" name="register"
										enctype="multipart/form-data">
										<div class="mb-3">
											<label class="form-label"><i
												class="fa fa-address-book-o"></i> Employee Name </label> <input
												type="text" id="name" name="name" class="form-control"
												required="required" placeholder="Enter Employee name">

										</div>


										<div class="col-sm-4 form-group">
											<label for="sex"><i class="fa fa-mars-stroke"></i>
												Select Gender:</label> <br> <input type="radio" id="male"
												required="required" name="gender" value="male">   <label
												for="male">Male</label>   <input type="radio" id="female"
												name="gender" value="female">   <label for="css">Female</label><br>
											 
										</div>





										<div class="mb-3">
											<label class="form-label"><i
												class="fas fa-birthday-cake"></i> Date of Birth</label> <input
												type="date" id="date_of_birth" name="date_of_birth"
												required="required" class="form-control">
										</div>


										<div class="col-sm-4 form-group">
											<label class="form-label"><i
												class='fas fa-football-ball'></i> Hobbies :</label> <br> <input
												type="checkbox" name="hobbies" value="cricket"> <span
												class="checkmark"></span> <label>Cricket</label> &nbsp; <input
												type="checkbox" name="hobbies" value="travelling"> <span
												class="checkmark"></span> <label>Traveling</label>&nbsp; <input
												type="checkbox" name="hobbies" value="music"> <span
												class="checkmark"></span> <label>Music</label> &nbsp; <input
												type="checkbox" name="hobbies" value="dancing"> <span
												class="checkmark"></span> <label>Dancing</label>
										</div>


										<br>


										<div class="mb-3">
											<label class="form-label"><i
												class="fa-solid fa-address-card"></i> Address-1</label> <input
												type="text" name="address_1" class="form-control"
												placeholder="Locality/House/Street no." required>
										</div>

										<div class="mb-3">
											<label class="form-label"><i
												class="fa-solid fa-address-card"></i> Address-2</label> <input
												type="text" name="address_2" class="form-control"
												placeholder="Village/City Name." required>
										</div>




										<div class="mb-3">
											<label class="form-label"><i class="fa-solid fa-city"></i>
												City</label> <input type="text" name="city" class="form-control"
												placeholder="City" required="required">
										</div>




										<div class="mb-3">
											<label for="state"><i class='fas fa-map-marker-alt'></i>
												Select State</label> <select id="input"
												class="form-control custom-select browser-default"
												onchange="selectState()" name="state" required>
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
											<label class="form-label">Pin_code <i
												class="fas fa-map-pin"></i></label> <input type="number"
												name=pin_code class="form-control" required="required"
												placeholder="pin-code">
										</div>


										<div class="mb-3">
											<label class="form-label"><i
												class="fa-solid fa-id-card-clip"></i> Pancard_No</label> <input
												type="text" name="pancard_no" required="required"
												class="form-control" placeholder="Pan No.">
										</div>

										<div class="mb-3">
											<label class="input-group mb-3"> Add profile Picture</label>
											<input name="profile" type="file" required="required"
												class="custom-file-input" id="inputGroupFile02">
										</div>



										<div class="col-12">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value=""
													id="invalidCheck" required /> <label
													class="form-check-label" for="invalidCheck">Agree
													to terms and conditions <i class="fa fa-check-square-o"></i>
												</label>
												<div class="invalid-feedback">You must agree before
													submitting.</div>
											</div>
										</div>
										<br>
										<button type="submit" class="btn btn-primary col-md-12">Submit</button>
									</form>



								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function ValidateForm(form) {
			if (!alphanumeric(form.elements.name)) {
				alert("errorrrrrrrrrrrrrrr");
			}
		}
	</script>

	<!-- <script type="text/javascript">
			// Wait for the DOM to be ready
			
				// Initialize form validation on the registration form.
				// It has the name attribute "registration"
				$("form[name='register']")
						.validate(
								{
									// Specify validation rules
									rules : {
										// The key name on the left side is the name attribute
										// of an input field. Validation rules are defined
										// on the right side
										name : "required",
										gender : "required",
										date_of_birth : {
											required : true
										},
										hobbies : "required",
										address_1 : "required",
										address_2 : "required",
										city : "required",
										state : "required",
										pin_code : {
											required : true,
											minlength : 6,
											maxlength : 6
										},
										pancard_no : "required",
										profile : "required",
										
										
									},
									// Specify validation error messages
									messages : {
										name : "Please enter your name",
										gender : "Please select your gender",
										date_of_birth : "Please select date of birth",
										hobbies : "Please select hobbies",
										address_1 : "Pleasem enter valid address-1",
										address_2 : "Pleasem enter valid address-2",
										city : "Please enter your city",
										state : "Please select your state",
										pin_code : {
											required : "Please enter pin code",
											minlength : "Please enter valid pin code"
										},
										pancard_no  : "Please enter valid pancard no",
										state : "Please select your profile picture",
										
									},
									// Make sure the form is submitted to the destination defined
									// in the "action" attribute of the form when valid
									submitHandler : function(form) {
										form.submit();
									}
								});
			});
		
			</script> -->

</body>
</html>