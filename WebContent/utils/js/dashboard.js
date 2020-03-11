function fetch_content(type)
{
	type = type.trim();
	
	var url = "utils/";
	if(type === "Add Book")
		url += "addBook.jsp";
	
	else if(type === "Issue")
		url += "issue.jsp";
	
	else if(type === "Return")
		url += "return.jsp";
	
	else if(type === "View Student Transactions")
		url += "studentTransactions.jsp";
	
//	var req = new XMLHttpRequest();
	var content = document.getElementById("content");
	content.innerHTML = "<iframe src='" + url + "'></iframe>";
//	
//	req.onreadystatechange = function()
//	{
//		if(this.readyState === 4 && this.status === 200)
//			{
//				content.innerHTML = this.responseText;
//			}
//	};
//	
//	req.open('GET', url);
//	req.send();
}
