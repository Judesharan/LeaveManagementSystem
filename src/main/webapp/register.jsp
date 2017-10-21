<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS: Register</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Varela+Round">

<link rel="stylesheet" href="../login/css/style.css">

<style type="text/css">
tab1 {
	padding-left: 8em;
}

tab2 {
	padding-left: 5em;
}

tab3 {
	padding-left: 3em;
}
</style>
</head>
<body>
	<div class="container">
		<h6>
			<tab3>Welcome to Leave Management Portal</tab3>
		</h6>
		<div id="login">
			<h2>
				<span class="fontawesome-lock"></span>Sign Up
			</h2>
			<form action="../auth/register" method="POST">
				<fieldset>
					<p>
						<label for="role">Choose Role</label>
					</p>
					<p>
						<input type="radio" id="role" name="role" required="required"
							value=1> Student
						<tab1> <input type="radio" id="role" name="role"
							required="required" value=2> Professor</tab1>
					</p>
					<p>
						<input type="text" id="name" name="name" placeholder="Enter Name"
							required="required">
					</p>

					<p>
						<input type="text" id="username" name="username"
							placeholder="Enter Username" required="required">
					</p>
					
					<p>
						<input type="password" id="password" name="password"
							placeholder="Enter Password" required="required">
					</p>
					
					<p>
						<select class="dropdown" name="gender">
							<option value="" disabled="disabled" selected="selected">-- Choose Gender --</option>
							<option value="M">Male</option>
							<option value="F">Female</option>
						</select>
					</p>

					<p>
						<input type="tel" id="mobileNumber" name="mobileNumber"
							placeholder="Enter Mobile number">
					</p>

					<p>
						<input type="email" id="emailId" name="emailId"
							placeholder="Enter EmailId">
					</p>
					<p>
						<select class="dropdown" name="departmentId">
							<option value="" disabled="disabled" selected="selected">-- Choose Department --</option>
							<option value=1>Civil</option>
							<option value=2>CSE</option>
							<option value=3>ECE</option>
							<option value=4>EEE</option>
							<option value=5>MECH</option>
						</select>
					</p>
					<p>
						<input type="submit" value="Sign Up">
					</p>
					<p>
						<tab2>Already a user?? <a href="../"
							class='btn btn-primary'>SIGN IN</a></tab2>
					</p>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>