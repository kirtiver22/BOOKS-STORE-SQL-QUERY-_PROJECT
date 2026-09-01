-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

 --impot tables
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;




--1.retrieve all books in the fiction genre?
SELECT* 
FROM books
WHERE GENRE = 'Fiction';

--2 find books published after 1950?
SELECT *
FROM Books
WHERE published_year > 1950;

--3 list all customers from canada?
SELECT * 
from customers 
where country= 'Canada';

--show orders placed in november 2023?
select *
from orders
where order_date between '2023/11/01' and '2023/11/30';

--retrieve the total stock of books available?
select sum (stock) as total_stock
from books;

-- find the details of most expensive books?
select * from books
order by price desc limit 1;

--show all customers to order more than 1 quantity of books?
select * 
from orders
where quantity >1;

--retrieve allorders where total amoount exceed 20$?
select * 
from orders 
where total_amount >20;

-- list all genre available in the books table?
select distinct genre 
from books;

-- find the book with lowest stock?
select * 
from books
order by stock limit 1;

-- calculaTE THE TOTal revenue genereated from all ordders?
select sum (total_amount) as total_revenue
from orders;

--ADVANCE QUESTIONS 

--1) Retrieve the total number of books sold for each genre?
SELECT* FROM ORDERS;

SELECT b.Genre, SUM(o.Quantity)AS Total_Books_sold
from orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Genre;

--2) find the average price of books in the '"Fantasy" genre?

select AVG (price) as avg_price
from books
where Genre ='Fantasy';

--3) list customers who have placed at least 2 orders?
select customer_id,Count(order_id) as order_count
from orders
group by customer_id
having count(order_id)>=2;

--4) find  the most frequently ordered book?
select o.Book_id,b.title , Count(o.order_id) as order_count
from orders o
join books b on o.book_id=b.book_id
group by o.Book_id,b.title
order by order_count DESC limit 1;

--5) show the top 3 most expensive books of 'fantasy' genre?
select * from books 
where genre = 'Fantasy'
order by price DESc limit 3;

--6) Retrieve the total quantity of books sold by each author?
select b.author ,sum(o.quantity) AS Total_books_sold
from orders o 
join books b on o.book_id=b.book_id
group by b.author

--7) list the cities where customers who  spent over $30 are located?
select distinct c.city,total_amount
from orders o
join customers c on o.customer_id=c.customer_id
where o.total_amount>30;

--8) find the  customer who spent the most on orders?
select c.customer_id,c.name,sum(o.total_amount)as total_spent
from orders o 
join customers c ON o.customer_id=c.customer_id
group by c.customer_id,c.name
order by total_spent DESC  limit 1;

--9)calculate the stock remaining after fulfilling all orders?
select b.book_id,b.title,b.stock , coalesce(sum(o.quantity),0) as order_quantity,
   b.stock - coalesce(sum(o.quantity),0)as remaining_quantity
from books b
left join orders o on b.book_id=o.book_id
group by b.book_id;