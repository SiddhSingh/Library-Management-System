function fetch_content(type)
{
	var url = "";
	if(type == "0")
		url += "add_book";
	
	else if(type == "1")
		url += "issue";
	
	else if(type == "2")
		url += "return";
	
	else if(type == "3")
		url += "view_student_transaction";
	
	url += ".goto";
	
	var content = document.getElementById("content");
	content.innerHTML = "<iframe src='" + url + "'></iframe>";

}
