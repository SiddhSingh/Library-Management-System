function fetch_content(type)
{
	var url = "utils/";
	if(type == "0")
		url += "addBook.jsp";
	
	else if(type == "1")
		url += "issue.jsp";
	
	else if(type == "2")
		url += "return.jsp";
	
	else if(type == "3")
		url += "studentTransactions.jsp";
	
	var content = document.getElementById("content");
	content.innerHTML = "<iframe src='" + url + "'></iframe>";

}
