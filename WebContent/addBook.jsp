<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Add Book </title>

</head>
<body>
	<form action="utils/addBookToSess.jsp" method="post" name="bookData">
		<table>
			<tr><td>Book Name</td>				<td><input type="text" name="name" id="bookName"/></td></tr>
			<tr><td>Author Name</td>			<td><input type="text" name="author" id="author" /></td></tr>
			<tr><td>Floor</td>					<td><input type=number name="floor" id="floor"/></td></tr>
			<tr><td>Room</td>					<td><input type=number name="room" id="room"/></td></tr>
			<tr><td>Section</td>				<td><input type="text" name="section" id="section"/></td></tr>
			<tr><td>Shelf</td>					<td><input type=number name="shelf" id="shelf"/></td></tr>
			<tr><td>Tags (seperate using ,)</td><td><input name="tags" id="tags" /></td></tr>
		</table>
		<button> Submit </button>
	</form>
</body>
</html>