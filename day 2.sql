create database bookstore;
use bookstore;
create table books(book_id int primary key,title varchar(100),author varchar(50),price decimal(10,2),publication_date date,category varchar(30),in_stock int);
INSERT INTO books (book_id, title, author, price, publication_date, category, in_stock) VALUES
(1, 'Learning SQL', 'Alan Beaulieu', 25.00, '2023-02-15', 'technology', 40),
(2, 'Data Science 101', 'John Smith', 35.00, '2023-04-10', 'technology', 60),
(3, 'Mystery of the Old House', 'Mary Johnson', 15.00, '2023-05-20', 'mystery', 10),
(4, 'Advanced MySQL', 'Steve Brown', 45.00, '2023-03-05', 'technology', 30),
(5, 'Education Today', 'Alice Thompson', 20.00, '2023-06-01', 'education', 25),
(6, 'Python for Beginners', 'Emma Wilson', 28.00, '2023-01-10', 'technology', 50),
(7, 'Thrilling Tales', 'Robert Thompson', 18.00, '2023-02-25', 'mystery', 15),
(8, 'SQL Cookbook', 'David Anderson', 40.00, '2023-03-15', 'technology', 35),
(9, 'Teaching Strategies', 'Linda Johnson', 22.00, '2023-04-05', 'education', 20),
(10, 'Data Analytics with Python', 'Michael Thomson', 32.00, '2023-05-12', 'technology', 55);
select * from books where category = 'technology';
select title, price from books where price < 30.00;
select * from books where publication_date >= '2023-03-01';
select * from books where category = 'technology' and price < 30;
select * from books where (category = 'technology' or category = 'mystery') and price < 30;
select * from books where category != 'Technology';
select * from books where category != 'mystery';
select * from books where not category = 'Technology';
select * from books where author is null;
select * from books where author is not null;
select * from books where title like '%sql%';
select * from books where title like '%Technology%';
select * from books where title like 'the%';
select * from books where title like '%the';
select * from books where title like binary 'the%';
select * from books where title like '_the%';
select * from books where price between 20 and 30;
select * from books where category in ('technology','mystery','education');
select * from books where price between 20 and 30 and publication_date >= '2023-01-01';
select * from books where price > (select avg(price) from books);
select * from books where author ='John Smith';
select author from books;
select * 
from books 
where category = 'technology' 
and title like '%data%' 
and in_stock > 50;
select * 
from books 
where title like '%data%' ;
select * 
from books 
where category = 'technology' 
and title like '%data%' 
and in_stock > 50
and price < 40;
select * 
from books 
where (category = 'technology' and price > 30)
   or (category = 'mystery' and price < 20);
   select * 
from books 
where (author like '%son%' or author like '%th%')
and publication_date > '2023-03-01';
-- Logical Operators in SQL Examples
SELECT * 
FROM books
WHERE category = 'technology' 
  AND price < 30;
  SELECT * 
FROM books
WHERE category = 'technology' 
   OR category = 'mystery';
   SELECT * 
FROM books
WHERE NOT category = 'technology';
SELECT * 
FROM books
WHERE (category = 'technology' AND price < 30)
   OR (category = 'mystery' AND price < 20);
   SELECT author
FROM books
WHERE category = 'technology' ;
CREATE DATABASE IF NOT EXISTS db12;
USE db12;
-- Comparison Operators in SQL
CREATE TABLE products(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock INT
);
SELECT * 
FROM products 
WHERE price = 600;
SELECT * FROM products WHERE price != 600;
SELECT * FROM products WHERE NOT price = 600;
SELECT * FROM products WHERE price <> 600; -- ANSI standard
SELECT * FROM products WHERE price < 500;
SELECT * FROM products WHERE price >= 1000;
SELECT * FROM products WHERE category = 'technology';
SELECT * FROM products WHERE product_name > 'mouse';
SELECT '100' < '2';  -- Output: 1 (TRUE), because string comparison is character by character ('1' < '2')
SELECT 100 < '234dsfksf'; -- Output: 1 (TRUE)
SELECT 100 < '34jsdh'; -- Output: 0 (FALSE)
SELECT * 
FROM orders 
WHERE placed_order < '2025-02-01';
-- 1. STRING FUNCTIONS
select concat(first_name,' ',last_name) as full_name from students;
select first_name, length(first_name) as length from students;
select first_name, upper(first_name) as upper_name from students;
select first_name, lower(first_name) as lower_name from students;
select trim(upper("          ok         ")) as sample;
select first_name, substring(first_name,1,4) as sub_name from students;
select first_name, locate('a', first_name) as position from students;
select first_name, replace(email,'example.com','paarvam.com') as updated_email from students;
select first_name, reverse(first_name) as reversed_name from students;
select first_name, left(first_name,2) as first_two, right(first_name,2) as last_two from students;
select ascii('a');
select ascii('akjkdj'); -- returns ASCII of first character
select char_length('hello');
select * from students where soundex('jane') = soundex(first_name);
select num_value, abs(num_value) as absolute_value from numbers;
select num_value, ceil(num_value) as round_up, floor(num_value) as round_down from numbers;
select num_value, round(num_value,2) as round_2 from numbers;
select num_value, truncate(num_value,2) as truncated_2 from numbers;
select num_value, power(num_value,2) as squared from numbers;
select mod(10,3);
select num_value, sqrt(abs(num_value)) as sqrt_val from numbers;
select num_value, sin(num_value) as sin_val from numbers;
select pi();
select now();         -- full date & time
select curdate();     -- date only
select curtime();     -- time only
select year(now());   -- year
select month(now());  -- month
select day(now());    -- day
select hour(now());   -- hour
select minute(now()); -- minute
select second(now()); -- second
-- 3.b Formatting dates
select date_format('2025-03-03','%W, %M, %e, %Y');
select date_format('2025-03-03','%e/%Y');       -- 03/2025
select date_format('2025-03-03','%e/%M/%Y');    -- 03/March/2025
select date_format('2025-03-03','%e/%m/%Y');    -- 03/03/2025
select date_add('2025-03-03', interval 7 day);
select date_add('2025-03-03', interval 7 month);
select date_sub('2025-03-03', interval 7 month);
select datediff('2025-03-03','2025-06-03');
select unix_timestamp('2025-03-03') as unix_time;
select from_unixtime(12345678765) as real_date;
select * from orders where order_date >= date_sub(now(), interval 7 day);
select count(*) from employees;
select sum(salary) from employees;
select avg(salary) from employees;
select min(price), max(price) from products;
select department, avg(salary) as avg_salary
from employees
group by department
having avg(salary) > 50000;
CREATE DATABASE IF NOT EXISTS db_grouping;
USE db_grouping;
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);
INSERT INTO employees ( employee_id, first_name, last_name,department,salary,joining_date) VALUES (1,'san','c','ise',20000.00,'2023-06-09'),(2,'meghana','kr','ai',30000.00,'2024-06-08');
select department, count(*) as total_employees 
from employees 
group by department;
select department, avg(salary) as avg_salary 
from employees 
group by department;
select department, max(salary) as highest_salary, min(salary) as lowest_salary 
from employees 
group by department;
select department, year(joining_date) as joining_year, count(*) as total 
from employees 
group by department, year(joining_date);
select department, avg(salary) as avg_sal 
from employees 
group by department 
order by avg_sal desc;
select *,
    case
        when salary < 6000 then 'low salary'
        when salary between 6000 and 7000 then 'medium salary'
        else 'high salary'
    end as salary_range
from employees;
select count(*) as total,
    case
        when salary < 6000 then 'low salary'
        when salary between 6000 and 7000 then 'medium salary'
        else 'high salary'
    end as salary_range
from employees
group by salary_range;
select department, count(*) as total 
from employees 
group by department 
having total > 2;
select department, count(*) as total, avg(salary) as avg_sal 
from employees 
group by department 
having total > 2 and avg_sal > 40000;
CREATE DATABASE IF NOT EXISTS db_replace;
USE db_replace;
----------------------------------------------------
-- CREATE EMPLOYEES TABLE
----------------------------------------------------
CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Similar structure to employees table
CREATE TABLE IF NOT EXISTS employees_backup (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);
REPLACE INTO employees (emp_id, name, salary)
VALUES (1, 'John Doe', 55000.00);
REPLACE INTO employees_backup (id, name, salary)
SELECT emp_id, name, salary
FROM employees;
----------------------------------------------------
-- CREATE DATABASE AND USE IT
----------------------------------------------------
CREATE DATABASE IF NOT EXISTS db_primary_key;
USE db_primary_key;

CREATE TABLE IF NOT EXISTS employees_inline (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary key defined inline
    name VARCHAR(50),
    salary DECIMAL(10,2)
);
CREATE TABLE IF NOT EXISTS employees_table_level (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    PRIMARY KEY (id)  -- Primary key defined at table level
);
CREATE TABLE IF NOT EXISTS order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id) -- Composite key
);
ALTER TABLE employees_inline
ADD PRIMARY KEY (id);
CREATE DATABASE IF NOT EXISTS db_foreign_key;
USE db_foreign_key;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50)
);
CREATE TABLE employee_passports (
    passport_id INT PRIMARY KEY,
    emp_id INT UNIQUE,  -- Ensures one-to-one relationship
    passport_number VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
        ON DELETE RESTRICT   -- Cannot delete employee if passport exists
        ON UPDATE CASCADE   -- Update emp_id in passports if emp_id in employees changes
);
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id), -- Composite PK ensures no duplicate enrollments
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE parent_table (
    parent_id INT PRIMARY KEY,
    parent_name VARCHAR(50)
);

CREATE TABLE child_table (
    child_id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent_table(parent_id)
        ON DELETE CASCADE  
        ON UPDATE CASCADE
);

ALTER TABLE employees1
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
ON UPDATE CASCADE;
ALTER TABLE employees1
DROP FOREIGN KEY fk_emp_dept;
CREATE TABLE employees2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_emp_dept   
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
     ON DELETE RESTRICT       
    ON UPDATE CASCADE         
);
create database gaming_center;
use gaming_center;
create table members(memeber_id int primary key auto_increment,name varchar(100) not null,email varchar(100) unique not null,phone varchar(15) unique,join_date date not null,balance decimal(10,2) default 0.00,status enum('active','inactive') default 'active');
create table games(games_id int primary key auto_increment,game_name varchar(100) unique not null ,cost_per_hour decimal(10,2) not null check(cost_per_hour>=0),status enum('availabe','unavailable') default 'availabe');
create table recharges(recharge_id int primary key auto_increment,memeber_id int not null,amount decimal(10,2) not null check(amount>0),recharge_date datetime default current_timestamp,foreign key(memeber_id) references members(memeber_id) on delete cascade on update cascade);
create table transactions(transaction_id int primary key auto_increment,memeber_id int not null,games_id int not null,play_time_hrs decimal(5,2) not null check (play_time_hrs >0),cost decimal(10,2) not null check(cost >=0),transaction_date datetime default current_timestamp,foreign key(memeber_id) references members(memeber_id) on delete cascade on update cascade,foreign key(games_id)  references games(games_id)on delete cascade on update cascade,constraint unique_member_game_tx unique(memeber_id,games_id,transaction_date));
create table daily_collections(
collection_id  int primary key auto_increment,collection_date date unique not null,total_recharges decimal(12,2)default 0.00,total_spent decimal(12,2)default 0.00,net_collection decimal(12,2)generated always as (total_recharges-total_spent)stored);
ALTER TABLE recharges
ADD CONSTRAINT fk_recharges_members
FOREIGN KEY (memeber_id) REFERENCES members(memeber_id);
ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_members
FOREIGN KEY (memeber_id) REFERENCES members(memeber_id);
ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_games
FOREIGN KEY (games_id) REFERENCES games(games_id);


