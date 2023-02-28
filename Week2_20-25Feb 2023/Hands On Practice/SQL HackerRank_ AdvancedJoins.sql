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