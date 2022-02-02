1.How can you retrieve all the information from the cd.facilities table?
 ANS:-SELECT * FROM facilities;


2.You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
ANS:-SELECT name,membercost FROM facilities;


3.How can you produce a list of facilities that charge a fee to members?
ANS:-SELECT * FROM facilities WHERE membercost > 0;


4.How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
Return the facid, facility name, member cost, and monthly maintenance of the facilities in question
ANS:-SELECT facid,name,membercost,monthlymaintenance FROM facilities 
where membercost > 0 AND membercost< monthlymaintenance/50;

 
5.How can you produce a list of all facilities with the word 'Tennis' in their name?
ANS:-SELECT * FROM `facilities` WHERE name LIKE '%Tennis%';


6.How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
ANS:-SELECT * FROM `facilities` WHERE facid IN(1,5);


7.How can you produce a list of members who joined after the start of September 2012? 
Return the memid, surname, firstname, and joindate of the members in question.
ANS:-SELECT memid,surname,firstname,joindate FROM members 
  WHERE joindate>='2012-09-01';


8.How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
ANS:-SELECT DISTINCT(surname) FROM members  
  ORDER BY surname
  LIMIT 10;


9.You'd like to get the signup date of your last member. How can you retrieve this information?
ANS:-SELECT max(joindate) FROM `members`;


10.Produce a count of the number of facilities that have a cost to guests of 10 or more.
ANS:-SELECT COUNT(name) FROM facilities WHERE guestcost>=10;


11.Produce a list of the total number of slots booked per facility in the month of September 2012. 
Produce an output table consisting of facility id and slots, sorted by the number of slots.
ANS:-SELECT facid,SUM(slots) AS Total_slot FROM `bookings` 
WHERE starttime BETWEEN '2012-07-01'AND'2012-07-30'
GROUP BY facid
ORDER BY SUM(slots);


12.Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id
ANS:-SELECT facid, SUM(slots) AS total_Slots FROM bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

 
13.How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
Return a list of start time and facility name pairings, ordered by the time.
ANS:-SELECT starttime, name FROM bookings
INNER JOIN facilities 
ON facilities.facid = bookings.facid
WHERE name LIKE '%Tennis Court%' AND starttime BETWEEN '2012-09-21 00:00:00' AND '2012-09-21 23:59:59' 
ORDER BY starttime;


14.How can you produce a list of the start times for bookings by members named 'David Farrell'?
ANS:-SELECT starttime FROM bookings
INNER JOIN members 
ON members.memid = bookings.memid
WHERE surname LIKE '%Farrell%' AND firstname LIKE '%David%'  
ORDER BY starttime;


SQL DATABASE
1.CREATE DATABASE School;

2.CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name varchar(10),
    last_name varchar(15),
    homeroom_number int,
    phone_number int UNIQUE NOT NULL,
    Email varchar(250) UNIQUE,
    graduation_year int
) 

3.CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    first_name varchar(10),
    last_name varchar(15),
    homeroom_number int,
    department varchar(150),
    phone_number int UNIQUE NOT NULL,
    Email varchar(250) UNIQUE NOT NULL
) 

4.INSERT into students(student_id,first_name,last_name,homeroom_number,phone_number,graduation_year)
VALUES(1,'Mark','Watney',5,777-555-1234,2035);

5.INSERT into teachers(teacher_id,first_name,last_name,homeroom_number,department,Email,phone_number)
VALUES(1,'Jonas','Salk',5,'Biology','jsalk@school.org',777-555-4321);
