function validation() {
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var wrongPasswordText = document.getElementById("wrong");

	var form = document.loginForm;

	var req = new XMLHttpRequest();
	var url = './utils/validate.jsp';
	var param = 'username=' + username + '&password=' + password;

	req.onreadystatechange = function() {
		
		console.log(this.readyState + " " + this.status);
		
		if (this.readyState == 4 && this.status == 200) {
			var result = this.responseText.trim();

			if (result === "1") {
				form.submit();
			} else
				wrong.removeAttribute("hidden");
		}
	}

	req.open('POST', url, true);
	req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	req.send(param);
}

function r() {
	document.getElementById("wrong").setAttribute("hidden", "");
}
