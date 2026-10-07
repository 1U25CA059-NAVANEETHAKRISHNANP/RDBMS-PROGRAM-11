CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT
);

INSERT INTO Student VALUES
(1001, 'Arun', 101),
(1002, 'Divya', 102),
(1003, 'Karthik', 101);

INSERT INTO Course VALUES
(201, 'Database Systems'),
(202, 'Data Structures'),
(203, 'Mathematics');

INSERT INTO Enrollment VALUES
(1, 1001, 201),
(2, 1002, 202),
(3, 1003, 203);

CREATE VIEW StudentDetails AS
SELECT 
    S.StudentName,
    C.CourseName,
    CASE
        WHEN S.DepartmentID = 101 THEN 'Computer Science'
        WHEN S.DepartmentID = 102 THEN 'Mathematics'
        ELSE 'Other Department'
    END AS DepartmentName
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID;

SELECT * FROM StudentDetails;
