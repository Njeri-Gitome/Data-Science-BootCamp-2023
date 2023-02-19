CREATE DATABASE BookStore;

USE BookStore;


CREATE TABLE bookstore (
	store_id INT PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255),
    county VARCHAR (255)	
);

/*Populate a single record*/

INSERT INTO bookstore ( store_id, store_name, phone, email ,county )
VALUES(1, 'Eccentrics', 0715296570, 'info@eccentrics.com', 'Kajiado');

/*Populate a multiple records*/
INSERT INTO bookstore ( store_id, store_name, phone, email ,county )
VALUES
(2, 'Bookworms Haven',  2468013579, 'info@bookwormshaven.com', 'Laikipia'),
(3, 'The Literary Loft', 9876543120, 'info@literaryloft.com', 'Kisumu '),
(4, 'Tome Time', 1234567890, 'info@tometime.com', 'Kakamega'),
(5, 'Boundless Books', 3692581470, 'info@boundlessbooks.com', 'Samburu'),
(6, 'The Reading Room', 4265187309, 'info@readingroom.com', 'Homa Bay'),
(7, 'Inkwell Books', 9582713640, 'info@inkwellbooks.com', 'Kiambu'),
(8, 'Secondhand Prose', 6398574120, 'info@secondhandprose.com', 'Taita Taveta'),
(9, 'The Book Nook', 4152638907, 'info@booknook.com', 'Kitui'),
(10,'Bibliophile Corner', 8024651397, 'info@bibliophilecorner.com', 'Bomet');


/*Data Retreival*/
SELECT * FROM bookstore;


CREATE TABLE categories (
	category_id INT NOT NULL PRIMARY KEY,
    category_name VARCHAR(255)    	
);

INSERT INTO categories (category_id, category_name)
VALUES
(1001, 'Romance'),
(2002, 'Thriller'),
(3003, 'Self-help'),
(4004, 'Mystery'),
(5005, 'Science fiction'),
(6006,'Historical fiction'),
(7007, 'Travel guides'),
(8008, 'Poetry'),
(9009,'Memoirs'),
(1010,'Fantasy');



CREATE TABLE Books(
    book_id INT NOT NULL PRIMARY KEY,
    Book_Name VARCHAR(255),
    category_id INT NOT NULL,
    author VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)

);

INSERT INTO Books (book_id, Book_Name, category_id, author)
VALUES
(1, 'The Notebook',  1001,'Nicholas Sparks'),
(2, 'The Alchemist', 2002,'Paulo Coelho' ),
(3, 'The Nightingale',3003,'Kristin Hannah' ),
(4, 'Pride and Prejudice',1001,'Jane Austen'),
(5, 'Dune', 5005, 'Frank Herbert'),
(6, 'The Fault in Our Stars',1001, 'John Green'),
(7, 'The Hitchhikers Guide to the Galaxy', 5005, 'Douglas Adams'),
(8, 'The Last Song',9009, 'Nicholas Sparks'),
(9, 'Message in a Bottle', 9009, 'Nicholas Sparks'),
(10, 'The Time Travelers Wife', 1001, 'Audrey Niffenegger');
 


 CREATE TABLE stock(
    store_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT,
    FOREIGN KEY (store_id) REFERENCES bookstore(store_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
 );

INSERT INTO stock (store_id, book_id, quantity)
VALUES
  (1, 1, 1048),  (1, 2, 5482),  (2, 1, 2870),  (2, 3, 1235),  (1, 4, 7857), 
  (3, 1, 415),   (3, 3, 172),   (3, 4, 1189),  (1, 3, 3583),  (2, 4, 600),
  (1, 5, 200),   (2, 5, 578),   (3, 5, 113),   (1, 6, 1822),  (2, 6, 378), 
  (3, 6, 252),   (1, 7, 400),   (2, 7, 689),   (3, 7, 858);


/*SQL JOINS*/

/*INNER JOIN*/
SELECT c.category_name, b.Book_Name, b.author
FROM categories AS c
JOIN Books AS b
ON c.category_id = b.category_id
ORDER BY category_name;


/*LEFT JOIN*/
SELECT c.category_name, b.Book_Name, b.author
FROM categories AS c
LEFT JOIN Books AS b
ON c.category_id = b.category_id
ORDER BY category_name;


/*RIGHT JOIN*/
SELECT c.category_name, b.Book_Name, b.author
FROM categories AS c
RIGHT JOIN Books AS b
ON c.category_id = b.category_id
ORDER BY category_name;



/*FULL OUTER JOIN*/
/*MySQL does not support FULL JOIN, so you have to combine JOIN, UNION and LEFT JOIN to get an equivalent.
 It gives the results of A union B. It returns all records from both tables.
*/
SELECT * FROM categories 
LEFT JOIN Books ON categories.category_id = Books.book_id
UNION
SELECT * FROM categories 
RIGHT JOIN Books ON categories.category_id = Books.book_id;


/*DATA FILTERING*/
SELECT Book_Name, Author FROM Books
WHERE author = 'Nicholas Sparks' OR Book_Name = 'The Alchemist';


SELECT store_name, county FROM bookstore
WHERE county = 'Kisumu';


SELECT store_name, county FROM bookstore
WHERE county = 'Kilifi'
AND store_name = 'Bookworms Haven';



SELECT SUM(quantity) as TOTAL_STOCK
FROM stock;



SELECT MIN(quantity) as MIN_STOCK
FROM stock;

SELECT COUNT(quantity) as COUNT_STOCK
FROM stock;


/**DATA TRANSFORMATION */
SELECT 
    categories.category_name,
    COUNT(books.book_id) AS total_books 
FROM 
    books 
    JOIN categories ON books.category_id = categories.category_id 
GROUP BY 
    categories.category_name



SELECT DISTINCT store_id, store_name
FROM bookstore;





SELECT *
FROM stock
WHERE stock_id IS NOT NULL AND book_id IS NOT NULL;


/**DATA CLEANING*/

ALTER TABLE BookStore MODIFY phone INT;