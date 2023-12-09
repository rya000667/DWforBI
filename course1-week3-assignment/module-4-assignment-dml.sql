--1. List the city, state, and zip codes in the customer table. Your result should not have duplicates. (Hint: The DISTINCT keyword eliminates duplicates.)
SELECT DISTINCT(city, state, zip), '1. List the city, state, and zip codes in the customer table. Your result should not have duplicates.'
FROM customer
;

--2. List the name, department, phone number, and email address of employees with a phone number beginning with “3-”.
SELECT empname, department, phone, email
FROM customer

WHERE
phone LIKE '3-%'
;

/* 3. List all columns of the resource table with a rate between $10 and $20. Sort the result by rate. */
SELECT *
FROM resourcetbl

WHERE
 rate BETWEEN 10 AND 20

ORDER BY rate
;

/* 4. List the event requests with a status of “Approved” or “Denied” and an authorized date in July 2022. 
Include the event number, authorization date, and status in the output.
*/
SELECT *
FROM eventrequests

WHERE
  status IN ('Approved', 'Denied')
  AND dateauth BETWEEN 07-01-2022 AND 07-31-2022
;


/* 5. List the location number and name of locations that are part of the “Basketball arena”. 
Your WHERE clause should not have a condition involving the facility number compared to a constant (“F101”). 
Instead, you should use a condition on the FacName column for the value of “Basketball arena”.
*/
SELECT locno, locname
FROM location JOIN facility
ON
location.facno=facility.facno

;

/* 6. For each event plan, list the plan number, count of the event plan lines, and sum of the number of resources assigned. 
For example, plan number P100 has 4 lines and 7 resources assigned. You only need to consider event plans that have at least one line.
*/
SELECT eventplan.planno, COUNT(eventplanline.planno) AS totalEventPlanLines, SUM(resourcecnt) AS totalResourcesAssigned
FROM eventplan JOIN eventplanline
ON
eventplan.planno=eventplanline.planno

GROUP BY
 eventplan.planno
HAVING
 COUNT(eventplanline.planno) > 1
;

/* 7. For each event plan with a time start in October 2022, list the plan number, count of the event plan lines, 
and sum of the number of resources assigned. For example, plan number P100 has 4 lines and 7 resources assigned. 
The result should only contain event plans that have sum of resources of 10 or more. 
For conditions on columns containing both date and time details, you should include both the date and time for 
conditions testing end of day. 
In PostgreSQL, the condition to test the end of December 2022 should use a TIMESTAMP
constant of '31-Dec-2022 11:59PM'. In Oracle with the DATE data type for a column, you should use the TO_DATE function such as
 TO_DATE('31-Dec-2022 23:59', 'DD-Mon- YYYY HH24:MI').
 */
SELECT 
 eventplan.planno,
 COUNT(eventplanline.planno) AS totalEventPlanLines,
 SUM(resourcecnt) AS totalResourcesAssigned
FROM eventplan JOIN eventrequest
ON
eventplan.eventno=eventrequest.eventno
JOIN eventplanline
ON
eventplan.planno=eventplanline.planno

WHERE
dateheld BETWEEN '10-01-2022' AND '10-31-2022'

GROUP BY
 eventplan.planno
HAVING
 SUM(resourcecnt) > 10
;