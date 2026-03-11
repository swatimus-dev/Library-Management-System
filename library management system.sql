CREATE DATABASE library_management;
USE library_management;

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    publisher VARCHAR(100),
    year INT,
    copies INT
);

CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    join_date DATE
);

CREATE TABLE issue_book (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

INSERT INTO books (title, author, publisher, year, copies)
VALUES
('Java Programming', 'James Gosling', 'Sun Microsystems', 2015, 5),
('Database Systems', 'Elmasri', 'Pearson', 2017, 3),
('Computer Networks', 'Andrew Tanenbaum', 'Pearson', 2016, 4);

INSERT INTO members (name, email, phone, join_date)
VALUES
('Rahul Sharma','rahul@gmail.com','9876543210','2024-01-10'),
('Anita Patel','anita@gmail.com','9876543211','2024-02-12');

INSERT INTO issue_book (book_id, member_id, issue_date, return_date)
VALUES (1, 1, CURDATE(), '2026-03-20');

SELECT * FROM books;

SELECT members.name, books.title, issue_book.issue_date, issue_book.return_date
FROM issue_book
JOIN members ON issue_book.member_id = members.member_id
JOIN books ON issue_book.book_id = books.book_id;


UPDATE issue_book
SET return_date = CURDATE()
WHERE issue_id = 1;

DELETE FROM members
WHERE member_id = 2;

SELECT * FROM books
WHERE title LIKE '%Java%';



