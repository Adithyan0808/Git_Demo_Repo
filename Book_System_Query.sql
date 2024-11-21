create table book(
	ISBN int primary key,
	title varchar(30),
	genre varchar(30),
	publication_date date,
	price smallmoney
)

create table publisher(
	publisherID int primary key,
	name varchar(30),
	address varchar(50),
	contact bigint,
	ISBN int,
	foreign key(ISBN) references book(ISBN)
)

create table author(
	authorID int primary key,
	Name varchar(30)
)

create table BookAuthor(
	ISBN int,
	AuthorID int,
	foreign key(ISBN) references book(ISBN),
	foreign key(AuthorID) references author(AuthorID)
)

create table OrderTable(
	OrderID int primary key,
	OrderDate date,
	TotalAmount smallmoney,
	status varchar(30),
	UserID int,
	foreign key(UserID) references users(UserID)
)

create table users(
	UserID int primary key,
	email varchar(40),
	ContactNumber bigint
)

create table BookOrder(
	ISBN int,
	OrderID int,
	foreign key(ISBN) references Book(ISBN),
	foreign key(OrderID) references OrderTable(OrderID)
)

insert into book(ISBN, title, genre, publication_date, price) values
(10001, 'The Alchemist', 'Fiction', '2010-05-14', 299.00),
(10002, '2 States', 'Romance', '2014-01-15', 199.00),
(10003, 'Shiva Trilogy', 'Mythology', '2012-08-21', 399.00),
(10004, 'Wings of Fire', 'Autobiography', '2005-10-15', 249.00),
(10005, 'The Guide', 'Fiction', '2001-12-01', 150.00),
(10006, 'Train to Pakistan', 'Historical', '2009-04-25', 175.00),
(10007, 'God of Small Things', 'Fiction', '1997-06-03', 299.00),
(10008, 'Wise and Otherwise', 'Short Stories', '2010-02-14', 199.00),
(10009, 'Half Girlfriend', 'Romance', '2015-04-01', 225.00),
(10010, 'Interpreter of Maladies', 'Short Stories', '2000-11-15', 150.00);

insert into Publisher(publisherID, name, address, contact, ISBN) values
(2001, 'Penguin India', 'New Delhi, Delhi', 9876543210, 10001),
(2002, 'Rupa Publications', 'Kolkata, West Bengal', 9123456789, 10002),
(2003, 'HarperCollins India', 'Noida, Uttar Pradesh', 9321654780, 10003),
(2004, 'Jaico Publishing House', 'Mumbai, Maharashtra', 9812345678, 10004),
(2005, 'Srishti Publishers', 'New Delhi, Delhi', 8765432109, 10005),
(2006, 'India Ink', 'Bangalore, Karnataka', 9988776655, 10006),
(2007, 'Random House', 'Gurgaon, Haryana', 9878987898, 10007),
(2008, 'Sterling Publishers', 'Chennai, Tamil Nadu', 9786678890, 10008),
(2009, 'Westland', 'Mumbai, Maharashtra', 9123765489, 10009),
(2010, 'HarperCollins India', 'Noida, Uttar Pradesh', 9321654781, 10010);

insert into Author (authorID, name) values
(3001, 'Paulo Coelho'),
(3002, 'Chetan Bhagat'),
(3003, 'Amish Tripathi'),
(3004, 'A.P.J. Abdul Kalam'),
(3005, 'R.K. Narayan'),
(3006, 'Khushwant Singh'),
(3007, 'Arundhati Roy'),
(3008, 'Sudha Murty'),
(3009, 'Jhumpa Lahiri'),
(3010, 'Anita Desai');


insert into BookAuthor (ISBN, authorID) values
(10001, 3001),
(10002, 3002),
(10003, 3003),
(10004, 3004),
(10005, 3005),
(10006, 3006),
(10007, 3007),
(10008, 3008),
(10009, 3002),
(10010, 3009);

INSERT INTO Users (userID, email, contactNumber) VALUES
(4001, 'user1@gmail.com', 9876543210),
(4002, 'user2@hotmail.com', 9123456789),
(4003, 'user3@yahoo.com', 9988776655),
(4004, 'user4@gmail.com', 9898989898),
(4005, 'user5@hotmail.com', 9123451234),
(4006, 'user6@gmail.com', 9876512345),
(4007, 'user7@yahoo.com', 9321654781),
(4008, 'user8@gmail.com', 9812312345),
(4009, 'user9@hotmail.com', 9123765489),
(4010, 'user10@yahoo.com', 9786671234);


INSERT INTO OrderTable (orderID, orderDate, totalAmount, status, userID) VALUES
(5001, '2024-01-12', 299.00, 'Shipped', 4001),
(5002, '2024-02-15', 199.00, 'Delivered', 4002),
(5003, '2024-03-18', 399.00, 'Shipped', 4003),
(5004, '2024-04-25', 249.00, 'Delivered', 4004),
(5005, '2024-05-21', 150.00, 'Pending', 4005),
(5006, '2024-06-30', 175.00, 'Shipped', 4006),
(5007, '2024-07-10', 299.00, 'Delivered', 4007),
(5008, '2024-08-22', 199.00, 'Shipped', 4008),
(5009, '2024-09-14', 225.00, 'Delivered', 4009),
(5010, '2024-10-01', 150.00, 'Pending', 4010);

INSERT INTO BookOrder (ISBN, orderID) VALUES
(10001, 5001),
(10002, 5002),
(10003, 5003),
(10004, 5004),
(10005, 5005),
(10006, 5006),
(10007, 5007),
(10008, 5008),
(10009, 5009),
(10010, 5010);

use [Book System]

--SQL query to list all books where price > 20
select * from book where price > 200

--SQL query to list all books where publisherID = 2001
select * from book where ISBN = (select ISBN from publisher where publisherID = 2001)

--SQL query to find all orders where status = "pending"
select * from OrderTable where status = 'pending'

--SQL query to change price of book with ISBN = 10002 to 300
update book set price = 300 where ISBN = 10002
select * from book where ISBN = 10002

--SQL query to increase the price of all book in "Technolog" genre by 10%
update book set price = price *1.1 where genre = 'Fiction'

--SQL query to delete record in book where ISBN = 10002
delete from book where ISBN = 10001

--SQL query to get details of books published on or after jan 1, 2022
select * from book where publication_date >= '01-01-2010'

--SQL query to list all books where the genre is not "science"
select * from book where genre != 'science'

--SQL query to list all customer with contact number that are not null
select * from users where ContactNumber is not null
select * from book
-- 1. title of book with highest price
select title from book where price = (select max(price) from book)
-- 2. List of author who have written books Fiction genre
select title from book where genre = 'Fiction'
-- 3. Find the titles of books that have never been ordered

-- 4.Get the names of customers who have placed orders totaling more than ‘amount as per values you have in database’

-- 5. List all books that cost more than the average price of all books

-- 6. Retrieve books published by the publisher with the fewest books


-- 7. Find the average quantity of books per order


-- 8. Display each book's title and its rank by price (highest to lowest)


-- 9. Find customers who have placed more orders than the average orders per customer


-- 10. List all books along with the number of orders Use a correlated subquery to count orders for each book













