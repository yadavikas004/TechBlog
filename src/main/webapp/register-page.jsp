<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>register</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 90%, 64% 100%, 24% 90%, 0 100%, 0 0);
}
</style>
</head>
<body>
	<%@include file="normal_navbar.jsp"%>
	<main class="primary-background banner-background"
		style="padding-bottom: 80px;">
		<div class="container">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-circle fa-3x"></span>
						<p>Register here</p>
						<p class="">${message}</p>
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="POST">

							<div class="mb-3">
								<label for="user_name" class="form-label">User Name</label> <input
									name="user_name" type="text" class="form-control"
									id="user_name" aria-describedby="emailHelp"
									placeholder="Enter Name">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input name="user_email" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Email">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Password">
							</div>

							<div class="mb-3">
								<label for="gender" class="form-label">Select Gender:</label><br />
<!-- 								<input type="radio" id="gender" name="gender" value="male"> -->
<!-- 								<input type="radio" id="gender" name="gender" value="female"> -->
								<input type="radio" id="male" name="gender" value="male" />
								<label for="male">Male</label> 
								<input type="radio" id="female" name="drone" value="female" /> 
								<label for="female">Female</label>
							</div>

							<div class="mb-3">
								<textarea name="about" class="form-control" id="" rows="3"
									placeholder="Enter something about yourself"></textarea>
							</div>

							<div class="mb-3 form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">I accept the Terms of Use & Privacy
									Policy</label>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>

				</div>

			</div>
		</div>

	</main>

	<!-- 	JQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>

	<script src="js/myjs.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			console.log("loaded........");

			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				let form = new FormData(this);

				// 				send register servlet
				$.ajax({

					url : "RegisterServlet",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR);
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>
</body>
</html>