/* Julia conducted a days of learning SQL contest. The start date of the contest was March 01, 2016 and 
the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least 1 submission
each day (starting on the first day of the contest), and find the hacker_id and name of the
hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number
of submissions, print the lowest hacker_id. The query should print this  information for each day of the 
contest, sorted by the date.*/

CREATE DATABASE HackerRank;

USE HackerRank;

/* Creating Tables*/

CREATE TABLE Hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR (255)
);

CREATE TABLE Submissions(
    submission_date DATE,
    submission_id INT PRIMARY KEY,
    hacker_id INT,
    score INT,
    FOREIGN KEY (hacker_id) REFERENCES Hackers(hacker_id)


);

/*Inserting Sample records into the tables*/
INSERT INTO Hackers (hacker_id, name )
VALUES
(15758, 'Rose'),
(20703, 'Angela'),
(36396, 'Frank'),
(38289, 'Patrick'),
(44065, 'Lisa'),
(53473, 'Kimberly'),
(62529, 'Bonnie'),
(79722, 'Michael');


INSERT INTO Submissions (submission_date,submission_id, hacker_id, score )
VALUES
('2016-03-01', 8494, 20703, 0),
('2016-03-01', 22403, 53473, 15),
('2016-03-01', 23965, 79722, 60);



SELECT s.submission_date, s.score, s.hacker_id, h.name
FROM Submissions AS s
LEFT JOIN Hackers AS h
ON s.hacker_id = h.hacker_id
GROUP BY s.submission_date, s.score, s.hacker_id, h.name
ORDER BY s.submission_date, s.score;


SELECT s.submission_date, 
       s.score, 
       COUNT(DISTINCT s.hacker_id,) /*total number of unique hackers*/
       h.name

 /*Inline placement*/
FROM (
    SELECT submission_date,

    
)


WITH table1 AS
(
    SELECT score, hacker_id
    FROM submissions
    WHERE score > 1
);

table 2 AS
