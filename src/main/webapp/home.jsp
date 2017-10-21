<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS: Home</title>

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
		<h6><tab3>Welcome to Leave Management Portal</tab3></h6>
		<div id="login">
			<h2>
				<span class="fontawesome-lock"></span>Sign In
			</h2>
			<form action="../auth/login" method="POST">
				<fieldset>
					<p>
						<label for="role">Role</label>
					</p>
					<p>
						<input type="radio" id="role" name="role" required="required" value=1>
						Student
						<tab1> <input type="radio" id="role" name="role" required="required"
							value=2> Professor</tab1>
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
						<input type="submit" value="Sign In">
					</p>
					<p>
						<tab2>New to LMS?? <a href="../auth/register"
							class='btn btn-primary'>SIGN UP</a></tab2>
					</p>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>