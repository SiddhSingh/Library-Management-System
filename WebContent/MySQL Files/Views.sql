use Library;

-- This is to create Views
drop view if exists `Book_Description`;

create view `Book_Description` as
	select 
		book.id 			as `Book ID`,
        book.name 			as `Book Name`,
        book.author 		as `Author`,
        book.date_added 	as `Date_Added`,
        book.available		as `Is_Available`,
        book.photo_location as `Photo_Location`,
        location.floor 		as `Floor No`,
        location.room 		as `Room No`,
        location.section 	as `Section`,
        location.shelf 		as `Shelf`,
        (select group_concat(tag) from tags where book_id = book.id) as `Tags`
	from 
		book join location on (id);
        