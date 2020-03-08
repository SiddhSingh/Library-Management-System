<%
	if(session.getAttribute("username") != null)
		response.sendRedirect("libDashboard.jsp");
%>
<!doctype html>
<html>
	<head>
		<title> Librarian Login </title>
		<style>
			
			*{
				font-family: Arial;
			}
			
			.container{
				display: flex;
				flex-direction: column;
				width: 30%;
				justify-content: center;
			}
			.centering{
				position: fixed;
				top: 30%;
				width: 100%;
				display: flex;
				justify-content: center;
			}

			
			#login > input, #login > button
			{
				font-size: larger;
				border-radius: 4px;
				border: thin solid black;
				padding: 10px;
				margin: 5px;
			}
			
		</style>
		<script>
			function validation()
			{
				var username = document.getElementById("username").value;
				var password = document.getElementById("password").value;
				var wrongPasswordText = document.getElementById("wrong");
				
				var form = document.loginForm;
				
				var req = new XMLHttpRequest();
				var url = 'validate.jsp';
				var param = 'username=' + username + '&password=' + password;

				req.onreadystatechange = function()
				{
					if(this.readyState == 4 && this.status == 200)
						{
							var result = this.responseText.trim();	
							
							if(result === "1")
								{								
									form.submit();
								}
							else
								wrong.removeAttribute("hidden");
						}
				}
				
				req.open('POST', url, true);
				req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				req.send(param);
			}
		
			function r()
			{
				document.getElementById("wrong").setAttribute("hidden", "");
			}
			
		</script>
		
	</head>
	<body>
		<form name="loginForm" action="libDashboard.jsp" method="post">
			<div class="centering">
				<div class="container" id="login">
					<input type="text"     placeholder="Username..." id="username" name="username" onkeydown="r()"/>
					<input type="password" placeholder="Password..." id="password" name="password" onkeydown="r()"/>
					<button type="button" onclick="validation()"> Login </button>
					<h5 id="wrong" style="text-align: center; color: red" hidden> Wrong Username / Password</h5>
				</div>
			</div>
		</form>
	</body>
</html>