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
    <style>
        * {
            font-family: Arial, Helvetica, sans-serif;
        }

        body{
				display: flex;
				width: 99%;
				flex-direction: column;
				justify-content: center;
			}

		#searchBar{
				display: flex;
				width: 100%;
				align-items: center;
				justify-content: center;
			}

			input[id="search"]
			{
				padding: 10px 15px;
				border-radius: 3px;
                font-size: larger;
				border: thin solid black;
				width: 50%;
				margin: 50px 0px 50px 50px;
			}
        
        .wrapper {
            display: flex;
            width: 100%;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        
        .card {
            margin: 20px;
            border-radius: 5px;
            position: relative;
            width: 240px;
            height: 360px;
            background: white;
            display: flex;
            transition: 0.4s;
            box-shadow: 0px 7px 10px rgba(0, 0, 0, 0.5);
            z-index: 2;
        }
        
        .card:hover {
            opacity: 1;
            transform: translateY(20px);
        }
        
        .card>div * {
            line-height: normal;
        }
       
        
        .card>img {
            height: 100%;
            z-index: 2;
            border-radius: inherit;
            width: 100%;
            object-fit: cover;
            position: absolute;
            transition: 0.4s;
        }
        
        .card>div {
            z-index: 3;
            position: relative;
            color: white;
            top: 50%;
            margin: 0px 10px;
            transform: translateY(0px);
            transition: 0.4s;
            opacity: 0;
        }
        
        .card:hover>img {
            filter: brightness(0.5);
        }
        
        .card:hover>div {
            opacity: 1;
        }
            .collapse_button{
                width: 99%;
                border: none;
                background: #333;
                color:white;
                cursor: pointer;
                padding: 15px;
                border-radius: 5px;
                font-size: 15px;
            }

            .collapse_content{
                max-height: 0;
                transition: max-height 0.4s ease-out;
                overflow: hidden;
            }        
    </style>
    <script>
    	function searchBook(book_name)
    	{
    		var req = new XMLHttpRequest();
    		var searchResult = document.getElementById("searchResult");
    		searchResult.innerHTML = "";
    		
    		console.log(book_name);
    		
    		req.onreadystatechange = function()
    		{
    			if(this.status == 200 && this.readyState == 4)
    				{
    					var js = JSON.parse(this.responseText);
						console.log(js);
    					
    					for(i=0;i<js['stuff'].length;i++)
    						{
    							var ele = document.createElement("div");
    							ele.setAttribute("class", "card");
    							
    							var img = document.createElement("img");
    							img.setAttribute("src", js['stuff'][i]['photo_loc']);
    							ele.append(img);
    							
    							var div = document.createElement("div");
    							
    							var book_name = document.createElement("h3");
    							book_name.innerHTML = js['stuff'][i]['book_name'];
    							div.append(book_name);
    							
    							var author = document.createElement("p");
    							author.innerHTML = js['stuff'][i]['author'];
    							div.append(author);
    							
    							var location = document.createElement("p");
    							location.innerHTML = js['stuff'][i]['location'];
    							div.append(location);
    							
    							var tags = document.createElement("p");
    							tags.innerHTML = js['stuff'][i]['tags'].join(",");
    							div.append(tags);
    							
    							ele.append(div);
    							searchResult.append(ele);
    						}
    				}
    		};
    		
    		req.open('GET', "searchBooks.jsp?book_name="+book_name);
    		req.send();
    	}
    	
    	function open(content)
    	{   		
           content.style.maxHeight = content.scrollHeight + "px";
    	}	
    	
    	function close(content)
    	{    		
           content.style.maxHeight = null;
    	}
    	
    	function toggleContent(button)
        {
            var content = button.nextElementSibling;

            button.classList.toggle("active");

            if(button.classList.contains("active"))
				content.style.maxHeight = content.scrollHeight + "px";
            	
            else
				content.style.maxHeight = null;
        }
    
    </script>
    
</head>

<body>
    <div id="searchBar">
			<input onchange="searchBook(this.value)" placeholder="Search Books...." id="search" />
	</div>
	<div>
		<button type="button" class="collapse_button active" onclick="toggleContent(this)">Search Results</button> 
		<div class="wrapper collapse_content" id="searchResult" style="max-height: 100%">
		</div>
		<button type="button" class="collapse_button active" onclick="toggleContent(this)">Recommended</button>
    	<div class="wrapper collapse_content" style="max-height: 100%">

        <%
        	try{
        		Class.forName("com.mysql.jdbc.Driver");	
        	}
        	catch(Exception e)
        	{
        		System.out.println(e);
        	}
        
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Library", "aarya","aarya");
        
            String query = "select * from book";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next())
                {
					String putHTML = "";
                    
					putHTML += "<div class='card'>";

                    putHTML += "<img src='" + rs.getString("photo_loc") + "' />";

                    putHTML +=  "<div>";
                    
                    putHTML +=  "<h3>" + rs.getString("book_name") + "</h3>";
                    putHTML +=  "<p>" + rs.getString("author") + "</p>";

                    String location_query = "select book.book_id, concat(location.shelf, concat(' Shelf', concat(', ', concat(location.section , ' Section')))) as 'Location' from book, location where book.book_id = location.book_id" +
                                " and book.book_id = " + rs.getString("book_id");
           
                    Statement location_statement = conn.createStatement();
                    ResultSet location_result = location_statement.executeQuery(location_query);
					location_result.next();
                    
                    putHTML +=  "<p >" + location_result.getString("Location") + "</p>";

                    String tags_query = "select tag_name from tags where book_id = " + rs.getInt("book_id") + " limit 4";
                    Statement tag_statement = conn.createStatement();
                    ResultSet tags_result = tag_statement.executeQuery(tags_query);
                    
                    putHTML +=  "<p> Tags :- " ;

                    String listOfTags = "";
                    while(tags_result.next())
                    	listOfTags += tags_result.getString("tag_name") + ",";

                    putHTML += listOfTags.length() != 0 ? listOfTags.substring(0, listOfTags.length() - 1) : "";
                    
                    putHTML +=  "</p>";
                    
                    putHTML +=  "</div>";

                    putHTML +=  "</div>";
                    
                    out.println(putHTML);
                }
        %>
    </div>
    </div>
</body>

</html>