<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Add Book </title>
<script>
	function pushData()
	{
		var book_name = document.getElementById("bookName").value;
		var author = document.getElementById("author").value;
		
		var floor = document.getElementById("floor").value;
		var room = document.getElementById("room").value;
		var section = document.getElementById("section").value;
		var shelf = document.getElementById("shelf").value;
		
		var tags = document.getElementById("tags").value;
		
		var fd = new FormData(document.bookData);
		
		var req = new XMLHttpRequest();
		req.onreadystatechange = function()
		{
			console.log(this.readyState + " " + this.status);
		};
		req.open("POST", "utils/submitData.jsp");		
		req.send(fd);

	}
</script>
</head>
<body>
	<form action="utils/addBookToDB.jsp" method="post" enctype="multipart/form-data" name="bookData">
		<table>
			<tr><td>Book Name</td>				<td><input type="text" name="bookName" id="bookName"/></td></tr>
			<tr><td>Author Name</td>			<td><input type="text" name="author" id="author" /></td></tr>
			<tr><td>Book Cover</td>				<td><input type="file" name="photoLoc" id="photoloc"/></td></tr>
			<tr><td>Floor</td>					<td><input type=number name="floor" id="floor"/></td></tr>
			<tr><td>Room</td>					<td><input type=number name="room" id="room"/></td></tr>
			<tr><td>Section</td>				<td><input type="text" name="section" id="section"/></td></tr>
			<tr><td>Shelf</td>					<td><input type=number name="shelf" id="shelf"/></td></tr>
			<tr><td>Tags (seperate using ,)</td><td><input name="tags" id="tags" /></td></tr>
		</table>
		<button type="button" onclick="pushData()"> Submit </button>
	</form>
</body>
</html>