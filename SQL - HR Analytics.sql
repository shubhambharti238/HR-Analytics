/*==============================================================
                    HR ANALYTICS
            Employee Attrition & Workforce Analysis

Author      : Shubham Kumar Bharti
Database    : MySQL
Tools       : SQL | Power BI | Excel

Description :
This project analyzes employee attrition, workforce demographics,
income distribution, work-life balance, and departmental trends
to generate actionable HR insights.

==============================================================*/
USE HR_Analytics;

/*==============================================================
                    DATA VALIDATION
==============================================================*/

SELECT 
    COUNT(*) AS Total_Records
FROM
    hr_analytics;

SELECT 
    *
FROM
    hr_analytics
LIMIT 10;





/*==============================================================
                        KPI 1
                  TOTAL EMPLOYEES
==============================================================*/

SELECT 
    COUNT(*) AS Total_Employees
FROM
    hr_analytics;





/*==============================================================
                        KPI 2
                  EMPLOYEES LEFT
==============================================================*/

SELECT 
    COUNT(*) AS Employees_Left
FROM
    hr_analytics
WHERE
    Attrition = 'Yes';





/*==============================================================
                        KPI 3
                   ATTRITION RATE
==============================================================*/

SELECT 
    ROUND(SUM(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS Attrition_Rate
FROM
    hr_analytics;





/*==============================================================
                        KPI 4
             AVERAGE MONTHLY INCOME
==============================================================*/

SELECT 
    ROUND(AVG(Monthly_Income), 2) AS Average_Monthly_Income
FROM
    hr_analytics;





/*==============================================================
                        KPI 5
          AVERAGE WORK LIFE BALANCE
==============================================================*/

SELECT 
    ROUND(AVG(Work_Life_Balance), 2) AS Average_Work_Life_Balance
FROM
    hr_analytics;





/*==============================================================
PROJECT QUESTION 1
Average Attrition Rate for all Departments
==============================================================*/

SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND((SUM(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END) * 100.0) / COUNT(*),
            2) AS Attrition_Rate
FROM
    hr_analytics
GROUP BY Department
ORDER BY Attrition_Rate DESC;



/*==============================================================
PROJECT QUESTION 2
Average Hourly Rate of Male Research Scientist
==============================================================*/

SELECT 
    ROUND(AVG(Hourly_Rate), 2) AS Average_Hourly_Rate
FROM
    hr_analytics
WHERE
    Gender = 'Male'
        AND Job_Role = 'Research Scientist';





/*==============================================================
PROJECT QUESTION 3
Attrition Rate vs Monthly Income Statistics
==============================================================*/

SELECT 
    Attrition,
    COUNT(*) AS Employees,
    ROUND(AVG(Monthly_Income), 2) AS Average_Monthly_Income,
    MIN(Monthly_Income) AS Minimum_Income,
    MAX(Monthly_Income) AS Maximum_Income
FROM
    hr_analytics
GROUP BY Attrition;





/*==============================================================
PROJECT QUESTION 4
Average Working Years for each Department
==============================================================*/

SELECT 
    Department,
    ROUND(AVG(Total_Working_Years), 2) AS Average_Working_Years
FROM
    hr_analytics
GROUP BY Department
ORDER BY Average_Working_Years DESC;





/*==============================================================
PROJECT QUESTION 5
Job Role vs Work Life Balance
==============================================================*/

SELECT 
    Job_Role,
    ROUND(AVG(Work_Life_Balance), 2) AS Average_Work_Life_Balance
FROM
    hr_analytics
GROUP BY Job_Role
ORDER BY Average_Work_Life_Balance DESC;





/*==============================================================
PROJECT QUESTION 6
Attrition Rate vs Years Since Last Promotion
==============================================================*/

SELECT 
    Years_Since_Last_Promotion,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(SUM(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS Attrition_Rate
FROM
    hr_analytics
GROUP BY Years_Since_Last_Promotion
ORDER BY Years_Since_Last_Promotion;




/*==============================================================
BONUS QUERY 1
Department with Highest Average Salary
==============================================================*/

SELECT 
    Department, ROUND(AVG(Monthly_Income), 2) AS Average_Salary
FROM
    hr_analytics
GROUP BY Department
ORDER BY Average_Salary DESC;





/*==============================================================
BONUS QUERY 2
Top 5 Highest Paid Employees
==============================================================*/

SELECT 
    Employee_Number, Monthly_Income
FROM
    hr_analytics
ORDER BY Monthly_Income DESC
LIMIT 5;



/*==============================================================
END OF PROJECT
==============================================================*/