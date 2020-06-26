# 1.Query the existence of 1 course
SELECT * FROM student_course WHERE courseId = 1

# 2.Query the presence of both 1 and 2 courses
SELECT * FROM student_course WHERE courseId IN (1,2)

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT  studentId,NAME,AVG(score) FROM student JOIN student_course ON id = studentId WHERE score >=60 GROUP BY NAME

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM student WHERE id NOT IN(SELECT studentId FROM student_course)

# 5.Query all SQL with grades
SELECT * FROM student WHERE id IN (SELECT studentId FROM student_course)

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT * FROM student WHERE id IN
(SELECT studentId FROM student_course WHERE courseId IN(1,2) GROUP BY studentId HAVING COUNT(studentId)>1)

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT * FROM student WHERE id IN 
(SELECT studentID FROM student_course JOIN student ON id= studentId WHERE courseId = 1 AND score < 60 ORDER BY score)

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT NAME,courseId,AVG(score) FROM student_course JOIN course ON id = courseId GROUP BY courseId ORDER BY AVG(score) DESC, courseId
 
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT s.name,score FROM student s JOIN student_course sc ON s.id = sc.studentId JOIN course c ON courseId = c.id WHERE sc.score <60 AND c.name = 'math'