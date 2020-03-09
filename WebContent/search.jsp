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
    							img.setAttribute("src", 'Book_Photos/' + js['stuff'][i]['photo_loc']);
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
    							tags.innerHTML = js['stuff'][i]['tags'];
    							div.append(tags);
    							
    							ele.append(div);
    							searchResult.append(ele);
    							
    							console.log(ele.outerHTML);
    						}
    				}
    		};
    		
    		req.open('GET', "utils/searchBooks.jsp?book_name="+book_name);
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
			<div class="wrapper collapse_content" id="searchResult" style="max-height: 100%"></div>
    	</div>
    </div>
</body>

</html>