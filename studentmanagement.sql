-- 1. Create Database
CREATE DATABASE IF NOT EXISTS StudentManagement;
USE StudentManagement;

-- 2. Create Students Table
CREATE TABLE IF NOT EXISTS Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(1),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

-- 3. Insert Sample Records
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES 
('Alice', 'F', 16, 'A', 85, 90, 88),
('Bob', 'M', 17, 'B', 78, 82, 80),
('Charlie', 'M', 16, 'A', 92, 89, 94),
('Diana', 'F', 15, 'C', 65, 70, 68),
('Ethan', 'M', 17, 'B', 81, 76, 79),
('Fiona', 'F', 16, 'A', 95, 92, 91),
('George', 'M', 15, 'C', 60, 58, 62),
('Hannah', 'F', 17, 'B', 88, 84, 85),
('Ian', 'M', 16, 'B', 72, 70, 75),
('Jane', 'F', 15, 'A', 90, 93, 89);

-- 4. Task 1: Display all students
SELECT * FROM Students;

-- 5. Task 2: Average score per subject
SELECT 
    ROUND(AVG(MathScore), 2) AS AvgMath,
    ROUND(AVG(ScienceScore), 2) AS AvgScience,
    ROUND(AVG(EnglishScore), 2) AS AvgEnglish
FROM Students;

-- 6. Task 3: Top performer(s)
SELECT *, 
       (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
WHERE (MathScore + ScienceScore + EnglishScore) = (
    SELECT MAX(MathScore + ScienceScore + EnglishScore) FROM Students
);

-- 7. Task 4: Count of students per grade
SELECT Grade, COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;

-- 8. Task 5: Average score by gender
SELECT Gender,
       ROUND(AVG(MathScore), 2) AS AvgMath,
       ROUND(AVG(ScienceScore), 2) AS AvgScience,
       ROUND(AVG(EnglishScore), 2) AS AvgEnglish
FROM Students
GROUP BY Gender;

-- 9. Task 6: Math > 80
SELECT * FROM Students
WHERE MathScore > 80;

-- 10. Task 7: Update grade for specific student
-- Example: Update grade of StudentID = 3
UPDATE Students
SET Grade = 'A+'
WHERE StudentID = 3;
