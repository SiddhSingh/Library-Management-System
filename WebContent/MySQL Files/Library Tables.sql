drop database if exists library;
create database library;

use Library;

-- This Query has list of tables

-- Table 1: Book
create table book
(
	id varchar(5) primary key,
    name varchar(100) not null,
    author varchar(50) not null, 
    
    date_added date not null,
    available boolean not null,
    photo_location varchar(50) not null    
);

-- Table 2: Book Tags

create table tags
(
	book_id varchar(5),
    tag varchar(30) not null,
    
    constraint TAG_FK foreign key (book_id) references book(id) on delete cascade
);

-- Table 3: Book Location

create table location
(
	book_id varchar(5) primary key,
    
    floor integer not null,
    room integer not null,
    section varchar(30) not null,
    shelf integer not null,
    
    constraint LOC_FK foreign key (book_id) references book(id) on delete cascade
);

-- Table 4: Librarian_User

create table LibUser
(
	id   varchar(10) primary key,				-- Uses ID and Pass to login, rather than using name
    name varchar(50) not null,
    pass varchar(50) not null
);

-- Table 5: Transaction

create table TypeOfTransaction
(
	id integer primary key,
    name varchar(15) not null
);

-- Table 6: Student Table

create table student
(
	id varchar(30) primary key,
    name varchar(50) not null,
    
    email varchar(60) not null,
    phno varchar(10) not null
);


-- Table 7: Book Transaction Log

create table Log
(
	book_id varchar(5) not null,
    t_id integer not null,
    student_id varchar(50) not null,
    on_date timestamp not null,
    
    constraint Log_Book_FK foreign key (book_id) references book(id),
    constraint Log_TOT_FK foreign key (t_id) references TypeOfTransaction(id),
    constraint Log_Student_FK foreign key (student_id) references student(id)
);
