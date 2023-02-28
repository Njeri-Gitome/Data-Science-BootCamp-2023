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

SELECT submission_date,
/*Scalar placement*/  
                 /*Subquery 2 to obtain unique hackers in a day */
       (SELECT Count(DISTINCT hacker_id) AS Unique_Hackers 
        FROM submissions AS S2                              /* subquery s2*/
        WHERE  S2.submission_date = S1.submission_date
        AND (SELECT Count(DISTINCT S3.submission_date)
             FROM   submissions AS S3                       /*subquery 3 */
             WHERE  S3.hacker_id = S2.hacker_id
             AND S3.submission_date < S1.submission_date
            ) = Datediff(S1.submission_date, '2016-03-01')   /*Datediff - calculate date difference btwn the two dates*/
       ) AS Number_of_Hackers,
       
       (SELECT hacker_id FROM submissions S2
        WHERE  S2.submission_date = S1.submission_date
        GROUP  BY hacker_id
        ORDER  BY Count(submission_id) DESC, hacker_id ASC LIMIT  1
       ) AS HackerID_With_Max_Entries,

       (SELECT name FROM hackers
        WHERE  hacker_id = HackerID_With_Max_Entries
       ) AS Hacker_Name

FROM   (SELECT DISTINCT submission_date
        FROM submissions) S1                                     /*subquery S1**/
GROUP BY submission_date;