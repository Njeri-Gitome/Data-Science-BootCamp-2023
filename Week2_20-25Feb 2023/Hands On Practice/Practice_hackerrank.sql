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

/*Insert additional data*/

INSERT INTO Submissions (submission_date,submission_id, hacker_id, score )
VALUES
('2016-03-01', 30173, 36396, 70),
('2016-03-02', 34928, 20703, 0),
('2016-03-02', 38740, 15758, 60),
('2016-03-02', 42769, 79722, 25),
('2016-03-02', 44364, 79722, 60),
('2016-03-03', 45440, 20703, 0),
('2016-03-03', 49050, 36396, 70),
('2016-03-03', 50273, 79722, 5),
('2016-03-04', 50344, 20703, 0),
('2016-03-04', 51360, 44065, 90),
('2016-03-04', 54404, 53473, 65),
('2016-03-04', 61533, 79722, 45),
('2016-03-05', 72852, 20703, 0),
('2016-03-05', 74546, 38289, 0),
('2016-03-05', 76487, 62529, 0),
('2016-03-05', 82439, 36396, 10),
('2016-03-05', 90006, 36396, 40),
('2016-03-06', 90404, 20703, 0);


/*QUERIES AND SUB-QUERIES*/
/*Union of the two tables*/
SELECT s.submission_date, h.hacker_id, h.name
FROM hackers AS h  
LEFT JOIN submissions s
ON h.hacker_id = s.hacker_id
UNION
SELECT s.submission_date, h.hacker_id, h.name
FROM hackers AS h  
RIGHT JOIN submissions s
ON h.hacker_id = s.hacker_id


/*Write a query to print total number of unique hackers who made at least submission each day (starting on the first day of the contest)*/
SELECT DATE(submission_date) AS submission_date,
       COUNT(DISTINCT hacker_id) AS unique_hackers
FROM submissions
WHERE submission_date >= (SELECT MIN(submission_date) 
                                 FROM submissions) -- starting on the first day of the contest
GROUP BY submission_date

/*For more understanding on the interpretation breakdown check it on the hackerrank description
https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem */

/*alternatively*/

SELECT DATE(submission_date),COUNT(DISTINCT hacker_id) AS hackers
FROM  submissions 
GROUP BY submission_date 
HAVING 
  COUNT(*) >= 1

/*NUMBER OF SUBMISSIONS BY EACH HACKER ON EACH DAY*/
SELECT submission_date,
       hacker_id,
       COUNT(submission_id) AS num_of_submissions
FROM submissions
WHERE submission_date BETWEEN '2016-03-01' AND '2016-03-15'
GROUP BY 1,2
ORDER BY 1,2;


/*Distinct submissions*/
SELECT s.submission_date, h.hacker_id, h.name,s.score, 
       COUNT (DISTINCT s.hacker_id) /*total number of unique hackers*/
       FROM submissions AS s
JOIN Hackers AS h
ON s.hacker_id = h.hacker_id
WHERE submission_date BETWEEN '2016-03-01' AND '2016-03-15'
GROUP BY s.submission_date,h.hacker_id,s.score,h.name;



/*CHAT GPT SOLUTION*/
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
