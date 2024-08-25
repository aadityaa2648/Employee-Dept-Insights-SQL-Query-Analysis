--1 Display all the information of the EMP table?
SELECT *
FROM emp

--2 Display unique Jobs from EMP table?
SELECT DISTINCT job
FROM emp

--3 List the emps in the asc order of their Salaries?
SELECT *
FROM emp
ORDER BY sal ASC

--4 List the details of the emps in asc order of the Deptno and desc of Jobs?
SELECT *
FROM emp
ORDER BY deptno ASC, job DESC

--5 Display all the unique job groups in the descending order?
SELECT DISTINCT job
FROM emp
ORDER BY job DESC

--6 Display all the details of all ‘Mgrs’
SELECT DISTINCT m.*
FROM emp e
JOIN emp m
ON e.mgr = m.empno

--7 List the emps who joined before 1981.
SELECT *
FROM emp
WHERE FORMAT(hiredate, 'yyyy') < '1981'

--8 List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
SELECT empno, ename, sal, (sal/30) AS daily_salary, (sal*12) AS Annsal
FROM emp
ORDER BY Annsal asc

--9 Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT empno, ename, job, hiredate
FROM emp
WHERE empno NOT IN (SELECT mgr
                    FROM emp
                    WHERE mgr IS NOT NULL)

--10 List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
SELECT e.empno, e.ename, e.sal
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE m.empno != 7369

--11 Display all the details of the emps whose Comm. Is more than their Sal.
SELECT *
FROM emp
WHERE comm > sal

--12 List the emps in the asc order of Designations of those joined after the second half of 1981.
SELECT *
FROM emp
WHERE FORMAT(hiredate, 'yyyy') = '1981'
AND FORMAT(hiredate, 'MM') > '07'

--13 List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.
SELECT *
FROM emp
WHERE hiredate IN ('1981-05-01', '1981-12-03','1981-12-07','1980-01-19')
ORDER BY hiredate ASC

--14 List the emp who are working in the Deptno 10 or 20.
SELECT *
FROM emp
WHERE deptno IN (10, 20)

--15 List the emps who are joined in the year 1981.
SELECT *
FROM emp
WHERE FORMAT(hiredate, 'yyyy') = '1981'

--16 List the emps who are joined in the month of Aug 1980.
SELECT *
FROM emp
WHERE FORMAT(hiredate, 'MM-yyyy') = '08-1980'

--17 List the Enames those are starting with ‘S’ and with five characters.
SELECT ename
FROM emp
WHERE ename LIKE 'S____'

--18 List the emps those are having four chars and third character must be ‘r’.
SELECT *
FROM emp
WHERE ename LIKE '__r_'

--19 List the Five character names starting with ‘S’ and ending with ‘H’.
SELECT ename
FROM emp
WHERE ename LIKE 'S___H'

--20 List the emps who joined in January.
SELECT *
FROM emp
WHERE MONTH(hiredate) = 1

--21 List the emps who joined in the month of which second character is ‘a’.
SELECT *
FROM emp
WHERE CONVERT(VARCHAR(20), hiredate, 100) LIKE '_a%'

--22 List the emps those who joined in 80’s.
SELECT *
FROM emp
WHERE YEAR(hiredate) BETWEEN 1980 AND 1989

--23 List the emps who does not belong to Deptno 20.
SELECT *
FROM emp
WHERE deptno != 20

--24 List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
SELECT *
FROM emp
WHERE job NOT IN ('PRESIDENT', 'MANAGER')
ORDER BY sal ASC

--25 List all the emps who joined before or after 1981.
SELECT *
FROM emp
WHERE FORMAT(hiredate, 'yyyy') < '1981'
OR FORMAT(hiredate, 'yyyy') > '1981'

--26 List the emps whose Empno not starting with digit78.
SELECT *
FROM emp
WHERE empno NOT LIKE '78%'

--27 List the emps who joined in any year but not belongs to the month of March.
SELECT *
FROM emp
WHERE MONTH(hiredate) != 3

--28 List all the Clerks of Deptno 20.
SELECT *
FROM emp
WHERE job = 'CLERK'

--29 List the emps of Deptno 30 or 10 joined in the year 1981.
SELECT *
FROM emp
WHERE deptno IN (30, 10)
AND YEAR(hiredate) = 1981

--30 Display the location of SMITH.
SELECT d.loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.ename = 'SMITH'

--31 List the details of the emps whose Salaries more than the employee BLAKE.
SELECT *
FROM emp
WHERE sal > (SELECT sal
FROM emp
WHERE ename = 'BLAKE')

--32 List the emps whose Jobs are same as ALLEN.
SELECT *
FROM emp
WHERE job = (SELECT job
FROM emp
WHERE ename = 'ALLEN')

--33 List the emps who are senior to King.
SELECT *
FROM emp
WHERE hiredate < (SELECT hiredate
FROM emp
WHERE ename = 'KING')

--34 List the Emps who are senior to their own MGRS.
SELECT e.*
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE e.hiredate < m.hiredate

--35 List the Emps of Deptno 20 whose Jobs are same as Deptno10.
SELECT DISTINCT job
FROM emp
WHERE deptno = 2
AND job IN (SELECT job
            FROM emp
            WHERE deptno = 10)

--36 List the Emps whose Sal is same as FORD or SMITH in desc order of Sal.
SELECT *
FROM emp
WHERE sal IN (SELECT sal
FROM emp
WHERE ename IN ('FORD', 'SMITH'))
ORDER BY sal DESC

--37 List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
SELECT *
FROM emp
WHERE job = (SELECT job
            FROM emp
            WHERE ename = 'MILLER')
OR sal > (SELECT sal
            FROM emp
            WHERE ename = 'ALLEN')

--38 List the emps who are senior to BLAKE working at CHICAGO & BOSTON.
SELECT e.*
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.hiredate < (SELECT hiredate
FROM emp
WHERE ename = 'BLAKE')
AND d.loc IN ('CHICAGO', 'BOSTON')

--39 Any jobs of deptno 10 those that are not found in deptno 20.
SELECT job
FROM emp
WHERE deptno = 10
AND job NOT IN (SELECT job
FROM emp
WHERE deptno = 20)

--40 Find details of highest paid employee.
SELECT *
FROM emp
WHERE sal = (SELECT MAX(sal)
FROM emp)

--41 Find the highest paid employee of sales department.
SELECT *
FROM emp
WHERE sal = (SELECT MAX(sal)
                FROM emp
WHERE deptno = (SELECT deptno
                FROM dept
                WHERE dname = 'SALES'))

--42 List the employees who are senior to most recently hired employee working under king.
SELECT *
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE m.ename = 'KING'
AND e.hiredate < (SELECT TOP 1 e.hiredate
                    FROM emp e
                    JOIN emp m
                    ON e.mgr = m.empno
                WHERE m.ename = 'KING'
                ORDER BY e.hiredate DESC)

--43 List the employees who joined in 1981 with the job same as the most senior person of the year 1981.
SELECT *
FROM emp
WHERE YEAR(hiredate) = 1981
AND job = (SELECT TOP 1 job
            FROM emp
            WHERE YEAR(hiredate) = 1981
            ORDER BY hiredate ASC)

--44 Find the total sal given to the MGR.
SELECT SUM(sal)
FROM emp
WHERE job = 'MANAGER'

--45 Display the average salaries of all the clerks.
SELECT AVG(sal)
FROM emp
WHERE job = 'CLERK'

--46 List the employee in dept 20 whose sal is >the average sal of dept 10 emps.
SELECT *
FROM emp
WHERE deptno = 20
AND sal > (SELECT AVG(sal)
            FROM emp
            WHERE deptno = 10)

--47 List the department,details where at least two emps are working
SELECT deptno, COUNT(empno)
FROM emp
GROUP BY deptno
HAVING COUNT(empno) >= 2

--48 List the details of the department where maximum number of emps are working.
SELECT TOP 1 deptno
FROM emp
GROUP BY deptno
ORDER BY COUNT(empno) DESC

--49 Display the emps whose manager name is jones.
SELECT e.*
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE m.ename = 'JONES'

--50 List the emps who are not working in sales dept.
SELECT e.*
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE d.dname != 'SALES'

--51 List the emps name ,dept, sal and comm. For those whose salary is between 2000 and 5000 while loc is Chicago.
SELECT e.ename, d.deptno, e.sal, e.comm
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.sal BETWEEN 2000 AND 5000
AND d.loc = 'CHICAGO'

--52 List the emps whose sal is greater than his managers salary
SELECT e.*
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE e.sal > m.sal

--53 List the name ,job, dname, location for those who are working as MGRS.
SELECT e.ename, e.job, d.dname, d.loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.job = 'MANAGER'

--54 List the emps whose mgr name is jones and also list their manager name.
SELECT sm.ename AS "senior",
m.ename AS "manager",
e.ename AS "employee"
FROM emp e
JOIN emp m
ON e.mgr = m.empno
JOIN emp sm
ON m.mgr = sm.empno
WHERE m.ename = 'JONES'

--55 List the emps name, job who are with out manager.
SELECT ename
FROM emp
WHERE empno NOT IN (SELECT mgr
                    FROM emp
                    WHERE mgr IS NOT NULL)

--56 List the names of the emps who are getting the highest sal dept wise.
SELECT *
FROM emp e
WHERE e.sal = (SELECT MAX(sal)
                FROM emp
                WHERE deptno = e.deptno)

--57 List the no. of emps in each department where the no. is more than 3.
SELECT deptno
FROM emp
GROUP BY deptno
HAVING COUNT(empno) > 3

--58 List the names of depts. Where atleast 3 are working in that department.
SELECT d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno) >= 3

--59 List the managers whose sal is more than his employess avg salary.
SELECT m.ename,m.sal, AVG(e.sal) AS "avgEmpSalary"
FROM emp e
JOIN emp m
ON e.mgr = m.empno
GROUP BY m.ename, m.sal
HAVING m.sal > AVG(e.sal)

--60 Find out emps whose salaries greater than salaries of their managers.
SELECT e.*
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE e.sal > m.sal

--61 List the managers who are not working under the president.
SELECT *
FROM emp
WHERE job = 'MANAGER'
AND mgr <> (SELECT empno
            FROM emp
            WHERE job = 'PRESIDENT')

--62 List the emps who joined in the month of DEC.
SELECT *
FROM emp
WHERE MONTH(hiredate) = 12

--63 List the emps whose names contains ‘A’.
SELECT *
FROM emp
WHERE ename LIKE '%A%'

--64 List the emps those who joined in company before 15th of the month.
SELECT *
FROM emp
WHERE FORMAT(hiredate, 'dd') < '15'
AND YEAR(hiredate) = 1981

--65 List the emps who are working as Managers.
SELECT *
FROM emp
WHERE empno IN (SELECT mgr
                FROM emp
                WHERE mgr IS NOT NULL)

--66 List THE Name of dept where highest no.of emps are working.
SELECT TOP 1 deptno
FROM emp
GROUP BY deptno
ORDER BY COUNT(empno) DESC

--67 List the emps who joined in the company on the same date.
SELECT e.*
FROM emp e
JOIN emp m
ON e.hiredate = m.hiredate
WHERE e.empno != m.empno

--68 List the Managers name who is having max no.of emps working under him.
SELECT TOP 1 m.ename
FROM emp e
JOIN emp m
ON e.mgr = m.empno
GROUP BY m.ename
ORDER BY COUNT(e.empno) DESC

--69 List the emps with Hire date in format June 4, 1988.
SELECT CONVERT(VARCHAR(20), hiredate, 107) AS "modifiedHiredate", e.*
FROM emp e

--70 List those Managers who are getting less than his emps Salary.
SELECT DISTINCT m.*
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE m.sal < e.sal

--71 Print the details of all the emps who are report to Blake.
SELECT e.*
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE m.ename = 'BLAKE'

--72 Find out how may Managers are their in the company.
SELECT COUNT(DISTINCT m.empno)
FROM emp e
JOIN emp m
ON e.mgr = m.empno

--73 Find out the emps who joined in the company before their Managers.
SELECT e.*
FROM emp e
JOIN emp m
ON e.mgr = m.empno
WHERE e.hiredate < m.hiredate

--74 Find all the emps who earn the minimum Salary for each job wise in ascending order.
SELECT *
FROM emp e
WHERE e.sal = (SELECT MIN(sal)
                FROM emp
                WHERE job = e.job)
                ORDER BY e.sal ASC

--75 Find out all the emps who earn highest salary in each job type. Sort in descending salary order.
SELECT *
FROM emp e
WHERE sal = (SELECT MAX(sal)
            FROM emp
            WHERE job = e.job)
ORDER BY e.sal DESC

--76 Find out the most recently hired emps in each Dept order by Hiredate.
SELECT *
FROM emp e
WHERE hiredate = (SELECT MAX(hiredate)
                    FROM emp
                    WHERE deptno = e.deptno)
ORDER BY e.hiredate ASC

--77 List the employee name,Salary and Deptno for each employee who earns a salary greater than the average for their department order by Deptno.
SELECT ename, sal, deptno
FROM emp e
WHERE sal > (SELECT AVG(sal)
            FROM emp
            WHERE deptno = e.deptno)
            ORDER BY deptno ASC

--78 List the Deptno where there are no emps.
SELECT deptno
FROM dept
WHERE deptno NOT IN (SELECT DISTINCT deptno
                    FROM emp)

--79 List the No.of emp’s and Avg salary within each department for each job.
SELECT deptno, job, AVG(sal) AS "avg_sal", COUNT(empno) AS "emp_count"
FROM emp
GROUP BY deptno, job

--80 Find the maximum average salary drawn for each job except for ‘President’.
SELECT TOP 1 job, AVG(sal)
FROM emp
WHERE job != 'PRESIDENT'
GROUP BY job

--81 List the Name, Job and Salary of the emps who are not belonging to the department 10 but who have the same job and Salary as the emps of dept 10.
SELECT ename, job, sal
FROM emp
WHERE deptno != 10
AND job IN (SELECT job
            FROM emp
            WHERE deptno = 10)
AND sal IN (SELECT sal
            FROM emp
            WHERE deptno = 10)