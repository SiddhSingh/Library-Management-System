use Library;

-- This is to create Views
drop view if exists `Book_Description`;

create view `Book_Description` as
	select 
		book.id 			as `Book_ID`,
        book.name 			as `Book_Name`,
        book.author 		as `Author`,
        book.date_added 	as `Date_Added`,
        book.available		as `Is_Available`,
        book.photo_location as `Photo_Location`,
        location.floor 		as `Floor_No`,
        location.room 		as `Room_No`,
        location.section 	as `Section`,
        location.shelf 		as `Shelf`,
        (select group_concat(tag) from tags where book.id = tags.book_id) as `Tags`
	from 
		book, location
	where
		book.id = location.book_id;
        