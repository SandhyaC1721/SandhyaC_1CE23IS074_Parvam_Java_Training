CREATE DATABASE IF NOT EXISTS my_sample_db;
USE my_sample_db;
CREATE TABLE IF NOT EXISTS users(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(50) NOT NULL,email VARCHAR(100) UNIQUE);
INSERT INTO users (name,email) VALUES ('SANDHYA','SANDHYAC77@GMAIL.COM'), ('SAN','SANC77@GMAIL.COM'),('SANC','SA177@GMAIL.COM');
SELECT * FROM users;
SELECT name, email FROM users WHERE id=2;
SELECT email FROM users WHERE id=2;
CREATE DATABASE student;
show databases;
use student;
drop database student;
show databases;
CREATE DATABASE student;
use student;
CREATE TABLE students(name VARCHAR(20) NOT NULL,id INT AUTO_INCREMENT PRIMARY KEY, course VARCHAR(10));
INSERT INTO students(name,id,course) VALUES ('san',1,'ise');
SELECT * from students;
create table employee(
	employee_id int primary key auto_increment,
	first_name varchar(50) not null,
	last_name varchar(50),
	hire_date date default '2024-01-5'/ (default_date()), --> if expression use () inside
	email varchar(100) unique,
	salary decimal(10,2) check (salary>0.0),
	employee_status enum('active','on leave','in active') default 'active',
	
	created_at timestamp default current_timestamp,
	updated_at timestamp default current_timestamp on update current_timestamp,
	
	foreign key (dept_id) references departments(dept_id),
	
	//primary key (columns..)--> only one as primary key but it will combine multiple columns as primary key
);

create table departments(
	department_id INt primary key auto_increment,
	department_name varchar(100) not nul;
	created_at timestamp default current_timestamp;
	updated_at timestamp default current_timestamp on update current_timestamp;
);


ALTER TABLE employee
ADD COLUMN phone_number VARCHAR(15);


ALTER TABLE employee
ADD COLUMN gender ENUM('M','F','Other') AFTER last_name,
ADD COLUMN dob DATE AFTER gender;


ALTER TABLE employee
DROP COLUMN phone_number;


ALTER TABLE employee
DROP COLUMN gender,
DROP COLUMN dob;


ALTER TABLE employee
MODIFY salary DECIMAL(12,2) CHECK (salary > 0.0);


ALTER TABLE employee
MODIFY last_name VARCHAR(50) NOT NULL;


ALTER TABLE employee
CHANGE email work_email VARCHAR(100) UNIQUE;


ALTER TABLE employee
RENAME TO employees;

ALTER TABLE employee
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id) REFERENCES departments(department_id);

ALTER TABLE employee
DROP FOREIGN KEY fk_dept;




INSERT INTO departments (department_name) VALUES
('Human Resources'),
('Finance'),
('Engineering'),
('Sales'),
('Marketing');


INSERT INTO employee (first_name, last_name, hire_date, email, salary, employee_status, dept_id)
VALUES
('John', 'Doe', '2023-06-15', 'john.doe@example.com', 60000.00, 'active', 1),
('Jane', 'Smith', '2022-04-10', 'jane.smith@example.com', 75000.00, 'on leave', 3),
('Michael', 'Brown', '2021-12-01', 'michael.brown@example.com', 55000.00, 'active', 2),
('Emily', 'Davis', '2020-07-25', 'emily.davis@example.com', 82000.00, 'inactive', 3),
('David', 'Wilson', '2024-01-05', 'david.wilson@example.com', 50000.00, 'active', 4),
('Sophia', 'Johnson', '2023-09-12', 'sophia.johnson@example.com', 92000.00, 'active', 5);



-- 1. WHERE: Filter rows where salary > 50000
SELECT * 
FROM employee
WHERE salary > 50000;

-- 2. ORDER BY: Sort employees by salary in descending order
SELECT first_name, last_name, salary
FROM employee
ORDER BY salary DESC;

-- 3. LIMIT: Get the 5 earliest hired employees
SELECT employee_id, first_name, salary
FROM employee
ORDER BY hire_date ASC
LIMIT 5;

-- 4. UNIQUE Departments: Get distinct department IDs from employee table
SELECT DISTINCT dept_id
FROM employee;

-- 4b. UNIQUE Department Names by joining departments table
SELECT DISTINCT d.department_name
FROM employee e
JOIN departments d ON e.dept_id = d.department_id;

-- 5. INCREMENT in Salary: Show current and incremented salary (10% hike)
SELECT employee_id, first_name, salary, 
       salary * 1.10 AS new_salary
FROM employee;

-- 5b. Actually update salary in table for dept_id = 2
UPDATE employee
SET salary = salary * 1.10
WHERE dept_id = 2;

-- 6. CONCAT: Combine first and last name into full name
SELECT CONCAT(first_name, ' ', last_name) AS full_name, email
FROM employee;

-- 7. NEED only YEAR: Extract only the year part of hire_date
SELECT first_name, YEAR(hire_date) AS hire_year
FROM employee;

-- 8. AVG: Find average salary per department
SELECT dept_id, AVG(salary) AS avg_salary
FROM employee
GROUP BY dept_id;

-- 9. ROUND: Round the average salary to 2 decimal places
SELECT dept_id, ROUND(AVG(salary), 2) AS avg_salary_rounded
FROM employee
GROUP BY dept_id;

-- 10. COUNT employees per department
SELECT dept_id, COUNT(*) AS total_employees
FROM employee
GROUP BY dept_id;

-- BONUS: Combine expressions - Average salary per hire year, rounded
SELECT YEAR(hire_date) AS hire_year, 
       ROUND(AVG(salary), 0) AS avg_salary
FROM employee
GROUP BY YEAR(hire_date)
ORDER BY hire_year;
