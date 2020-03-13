<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cards</title>
    <link type="text/css" rel="stylesheet" href="utils/css/cardStyling.css" />
    <script src="utils/js/cardCreation.js"></script>
    <script src="utils/js/voiceSearch.js"></script>
</head>

<body>
    <div id="searchBar">
		<input onchange="searchBook(this.value)" onsubmit="searchBook(this.value)" placeholder="Search Books...." id="search" />
		<button type="button" onclick="vSearch(this)"> Voice Search </button>
	</div>
		<div>
			<button type="button" class="collapse_button active" onclick="toggleContent(this)">Search Results</button>
			<div class="wrapper collapse_content" id="searchResult" style="max-height: 100%"></div>
    	</div>
    </div>
</body>

</html>