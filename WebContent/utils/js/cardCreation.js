function searchBook(book_name)
    	{
    		var req = new XMLHttpRequest();
    		var searchResult = document.getElementById("searchResult");
    		searchResult.innerHTML = "";
    		
    		console.log(book_name);
    		if(book_name === "")
    			return;
    		
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