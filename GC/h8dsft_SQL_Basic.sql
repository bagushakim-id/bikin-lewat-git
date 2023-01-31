CREATE TABLE teachers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(25) NOT NULL,
    last_name varchar(50),
    school varchar(50) NOT NULL,
    hire_date date,
    salary numeric
    );
    
INSERT INTO teachers (id,first_name, last_name, school, hire_date, salary)
VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
		(2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
		(3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
		(4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
		(5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
		(6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
		(7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
		(8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
		(9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
		(10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);
           
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
		('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
		('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
		('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
		('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);
           
CREATE TABLE courses (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(20),
    teachers_id INT,
    total_students INT
    );

INSERT INTO courses (name, teachers_id, total_students)
    VALUES  ('Calculus', 2, 20),
            ('Physics', 2, 10),
            ('Calculus', 1, 30),
            ('Computer Science', 1, 20),
            ('Politic', 13, 15),
            ('Algebra', 2, 10),
            ('Algebra', 13, 30),
            ('Computer Science', 10, 35),
            ('Life Science', 11, 20),
            ('Chemistry', 9, 22),
            ('Chemistry', 8, 16),
            ('Calculus', 5, 19),
            ('Politic', 4, 17),
            ('Biology', 6, 22),
            ('Physics', 3, 29),
            ('Biology', 8, 28),
            ('Calculus', 12, 34),
            ('Physics', 13, 34),
            ('Biology', 14, 25),
            ('Calculus', 15, 20);
            
select * from teachers;
select * from courses;
            
-- C1 Group By

-- Who is the teacher with the highest salary for each university? Frank Abbers
select *
from teachers
order by school, salary desc;

-- Who is the teacher with the highest salary from Standford University ? Frank Abbers
select *
from teachers
where school = "Standford University"
order by salary desc;

-- C2 Join

-- Display all courses with teacher's identity
select c.teachers_id, t.first_name, t.last_name, t.school, t.hire_date, c.name
from teachers t
join courses c
on t.id = c.teachers_id
order by c.name;

-- Display how many courses per universities
select t.school, count(c.name) total_courses
from teachers t
join courses c
on t.id = c.teachers_id
group by t.school;

-- Display how many total_students per teachers
select c.teachers_id, t.first_name, t.last_name, sum(c.total_students) total_students
from teachers t
join courses c
on t.id = c.teachers_id
group by c.teachers_id
order by c.teachers_id asc;

-- Display how many courses per teachers

