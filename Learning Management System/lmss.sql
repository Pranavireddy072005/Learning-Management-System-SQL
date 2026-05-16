CREATE DATABASE LearningManagementSystem;
USE LearningManagementSystem;

CREATE TABLE Students(
Student_id INT PRIMARY KEY,
name VARCHAR(100),
age INT NOT NULL,
gender VARCHAR(10),
dept VARCHAR(50),
city VARCHAR(25),
email varchar(100) 
);
CREATE TABLE Teachers(
teacher_id INT PRIMARY KEY,
teacher_name VARCHAR(25),
specialization VARCHAR(50),
teacher_email VARCHAR(100)
);
CREATE TABLE Courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(50),
duration INT,
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);
CREATE TABLE Enrollments(
enrollments_id INT PRIMARY KEY,
Student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (Student_id) REFERENCES Students(Student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Assignments(
assignment_id INT PRIMARY KEY,
course_id INT,
title VARCHAR(50),
due_date DATE,
marks INT,
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO Students
(Student_id,name,age,gender,dept,city,email)
VALUES
(401,'Anwika',18,"F","CSE","Mumbai","anwikajalla@gmail.com"),
(402,'Adweika',16,"F","CSE","Bengaluru","adweikapilla@gmail.com"),
(403,'Bob',18,"F","ECE","Mumbai","bobsalvatore@gmail.com"),
(404,'Casey',17,"F","CSE","Hyderabad","caseyklaus@gmail.com"),
(405,'Donald',19,"M","ECE","Mumbai","donaldtrump@gmail.com"),
(406,'Emanuel',20,"M","ECE","Mumbai","emanuealcarie@gmail.com"),
(407,'Frooty',21,"F","CSE","Mumbai","frootytooty@gmail.com"),
(408,'grok',23,"M","ECE","Hyderabad","grok123@gmail.com"),
(409,'hailey',19,"F","ECE","Bengaluru","haileybeiber12@gmail.com"),
(410,'Ivanka',20,"F","CSE","Mumbai","ivankatea66@gmail.com");

INSERT INTO Teachers
(teacher_id,teacher_name,specialization,teacher_email)
VALUES
(901,"lily","ECE","lilyrosey@gmail.com"),
(902,"rosie","CSE","rosie123@gmail.com"),
(903,"tulip","ECE","tulipboquet45@gmail.com"),
(904,"jasmine","CSE","jasmineflower@gmail.com"),
(905,"whiterose","CSE","whiterose25@gmail.com"),
(906,"redrose","ECE","redrose@gmail.com"),
(907,"bluerose","ECE","bluerose55@gmail.com"),
(908,"pinkrose","CSE","pinkrose22@gmail.com");

INSERT INTO Courses
(course_id,course_name,duration,Teacher_id)
VALUES
(1,'DBMS',50,904),
(2,'Java',40,902),
(3,'ESD',60,901),
(4,'EDC',50,906),
(5,'Python',75,905),
(6,'Matlab',90,903),
(7,'IFS',40,908),
(8,'DSP',50,907);

INSERT INTO Enrollments
(enrollments_id,student_id,course_id,enrollment_date)
VALUES
(101,401,1,'2025-08-5'),
(102,402,2,'2025-08-6'),
(103,403,3,'2025-08-7'),
(104,404,5,'2025-08-7'),
(105,405,4,'2025-08-5'),
(106,406,6,'2025-08-6'),
(107,407,2,'2025-08-6'),
(108,408,8,'2025-08-7'),
(109,409,3,'2025-08-6'),
(110,410,7,'2025-08-5');


INSERT INTO Assignments
(assignment_id,course_id,title,due_date,marks)
VALUES
(301,1,'DBMS','2025-09-5',30),
(302,5,'Python','2025-09-6',20),
(303,2,'Java','2025-09-7',40),
(304,4,'EDC','2025-09-6',10),
(305,6,'Matlab','2025-09-5',15),
(306,3,'ESD','2025-09-6',25),
(307,7,'IFS','2025-09-7',50),
(308,8,'DSP','2025-09-7',30);

SELECT Students.name,Subjects.Subject_name,Marks.marks
FROM Students
INNER JOIN Marks
ON Students.student_id = Marks.student_id
INNER JOIN Subjects
ON Marks.subject_id = Subjects.Subject_id;

SELECT * FROM Students
WHERE dept = 'CSE';

SELECT * FROM Courses WHERE duration>50;

SELECT * FROM Assignments WHERE marks>=25;

SELECT Students.name, Courses.course_name
FROM Students
INNER JOIN Enrollments
ON Students.student_id = Enrollments.student_id
INNER JOIN Courses
ON Enrollments.course_id = Courses.course_id;

SELECT Teachers.teacher_name,Courses.course_name
FROM Teachers
INNER JOIN Courses
ON Teachers.teacher_id=Courses.teacher_id;

SELECT Courses.course_name,Assignments.title
FROM Courses
INNER JOIN Assignments
ON Courses.course_id = Assignments.course_id;

