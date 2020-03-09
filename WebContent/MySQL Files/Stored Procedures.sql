use library;

-- This SQL makes Stored Procedures and Triggers

-- Trigger 1: Inserting into book
drop procedure if exists `New_Book`;
delimiter \\
	
	create procedure `New_Book`
    (
		in name varchar(100),
        in author varchar(50),
        in photo_location varchar(50),
        in floor integer,
        in room integer,
        in section varchar(30),
        in shelf integer,
        in tags varchar(200)
        
    )   
    
    begin
    
		declare book_id varchar(10) default left(uuid(), 10);
        
        set @tag_list_query = concat(
									"insert into tags values('", 
									concat(
											concat(book_id, "','"),
											concat( 
													replace(
															tags,
															",", 
															concat(
																	"'),('", 
																	concat(book_id, "','")
																)
															),
													"')"
												)
											)
									);
        
        insert into book(`id`, `name`, `author`, `date_added`, `available`, `photo_location`)
        values (book_id, name, author, curdate(), true, photo_location);
        
        insert into location(`book_id`, `floor`, `room`, `section`, `shelf`)
        values (book_id, floor, room, section, shelf);
        
		prepare insert_tags from @tag_list_query;
        execute insert_tags;
        
        
    end
	
\\

delimiter ;

