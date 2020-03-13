use library;

-- This SQL makes Stored Procedures and Triggers

-- Trigger 1: Inserting into book
drop procedure if exists `New_Book`;
drop function if exists `Issue`;
drop function if exists `Return`;
drop procedure if exists `Student_Transaction`;

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
    
		declare book_id varchar(10) default left(uuid(), 5);
        
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

create function `Issue`
	(
		book_id varchar(5),
        student_id varchar(50)
    )
    returns
		boolean
	begin
		declare avail boolean;
        
		select 
			available into avail 
			from `Book` 
            where id = book_id;
            
		if avail = 0 then
			return false;
		else
			update `Book` set available = false where id = book_id;
            insert into `Log` values(book_id, 0, student_id, now());
		end if;
        
        return true;
			
    end
    
\\

create function `Return`
	(
		book_id varchar(5),
        student_id varchar(50)
    )
    returns
		boolean
	begin
		declare avail boolean;
        
		select 
			available into avail 
			from `Book` 
            where id = book_id;
            
		if avail = 1 then
			return false;
		else
			update `Book` set available = true where id = book_id;
            insert into `Log` values(book_id, 1, student_id, now());
            
		end if;
        
		return true;
    end
    
\\

create procedure `Student_Transaction`
	(
		student_id varchar(30)
	)
    begin
		select 
			concat("Book ID : ", 
					concat(book_id, 
							concat(" ",
									concat( (select name from `TypeOfTransaction` where id = `Log`.t_id),
											concat(" on ", on_date)
											)
                                )
                            )
					) as `Transaction Details`
            from  `Log`
            where `Log`.student_id = student_id
            order by on_date desc;
    end
    
\\
