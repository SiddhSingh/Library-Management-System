<%
	if(session.getAttribute("user") != null)
		response.sendRedirect("dashboard.goto");
%>
<!doctype html>
<html>
	<head>
		<title> Librarian Login </title>
		<link type="text/css" rel="stylesheet" href="utils/css/loginStyling.css" />
		<script src="utils/js/loginValidation.js"></script>
	</head>
	<body>
		<form name="loginForm" action="dashboard.goto" method="post">
			<div class="centering">
				<div class="container" id="login">
					<input type="text"     placeholder="Username..." id="username" name="username" onkeydown="r()"/>
					<input type="password" placeholder="Password..." id="password" name="password" onkeydown="r()"/>
					<button type="button" onclick="validation()"> Login </button>
					<h5 id="wrong" style="text-align: center; color: red" hidden=""> Wrong Username / Password</h5>
				</div>
			</div>
		</form>
	</body>
</html>