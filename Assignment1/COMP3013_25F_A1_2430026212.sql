/* Name: Wang Zirui, ID: 24300212 */

/* a) Find the GPA of Goliath (student name). */
SELECT student.gpa
FROM student
WHERE student.sname='Goliath';

/* b) Find the division which offers the course Computer Organization (course name). */
SELECT program.division
FROM program,course
WHERE course.cname='Computer Organization' AND course.pname=program.pname;

/* c) Find the name of courses taken by at least one student whose gpa is 4.0. */
SELECT DISTINCT course.cname
FROM student,course,enroll
WHERE student.sID = enroll.sID AND enroll.cID = course.cID AND student.gpa = 4.0;

/* d) Find the name of girls who have taken Database (course name). */
SELECT DISTINCT student.sname
FROM student,course,enroll
WHERE course.cname='Database' AND course.cID=enroll.cID AND enroll.sID=student.sID AND student.gender='female';

/* e) Find the name of boys who have taken Database or Algorithm (course names). */
SELECT DISTINCT student.sname
FROM student,course,enroll
WHERE (course.cname='Database' OR course.cname='Algorithm') AND course.cID=enroll.cID AND enroll.sID=student.sID AND student.gender='male';

/* f) Find the name of students who have enrolled some 1-credit courses. */
SELECT DISTINCT student.sname
FROM student,course,enroll
WHERE course.credit=1 AND course.cID=enroll.cID AND enroll.sID=student.sID;

/* g) Find the name of students who have received F (grade) for a 3-credit course. */
SELECT DISTINCT student.sname
FROM student,course,enroll
WHERE course.credit=3 AND course.cID=enroll.cID AND enroll.grade='F' AND enroll.sID=student.sID;

/* h) Find the name of students who have enrolled courses from different divisions. */
SELECT DISTINCT s1.sname
FROM student AS s1, enroll AS e1, course AS c1, program AS p1, enroll AS e2, course AS c2, program AS p2
WHERE s1.sID = e1.sID AND e1.cID = c1.cID AND c1.pname = p1.pname AND s1.sID = e2.sID AND e2.cID = c2.cID AND c2.pname = p2.pname AND p1.division <> p2.division;