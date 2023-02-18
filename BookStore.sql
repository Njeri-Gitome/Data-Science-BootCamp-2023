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
 

 CREATE TABLE

/*SQL JOINS*/


""
""











