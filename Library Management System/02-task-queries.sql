USE library_db;

-- Sample Data
INSERT INTO authors VALUES (1, 'Chetan Bhagat', 'India'), (2, 'J.K. Rowling', 'UK');
INSERT INTO publishers VALUES (1, 'Penguin', 'Delhi'), (2, 'Bloomsbury', 'London');
INSERT INTO books VALUES (1, 'Two States', 1, 1, 250.00, 10), (2, 'Harry Potter', 2, 2, 500.00, 5);
INSERT INTO members VALUES (1, 'Pooja', 'pooja@gmail.com', '2024-01-10'), (2, 'Rahul', 'rahul@gmail.com', '2024-02-15');
INSERT INTO staff VALUES (1, 'Anitha', 'Librarian'), (2, 'Kiran', 'Assistant');
INSERT INTO loans VALUES (1, 1, 1, '2024-03-01', '2024-03-15'), (2, 2, 2, '2024-03-05', NULL);
INSERT INTO fines VALUES (1, 1, 50.00, FALSE);

-- Q1: All Books with Author Name
SELECT b.title, a.name AS author_name, b.price FROM books b JOIN authors a ON b.author_id = a.author_id;

-- Q2: Books Price > 300
SELECT * FROM books WHERE price > 300;

-- Q3: Members Joined After 2024-02-01
SELECT * FROM members WHERE join_date > '2024-02-01';

-- Q4: Count Books by Publisher
SELECT p.name, COUNT(b.book_id) AS total_books FROM publishers p JOIN books b ON p.publisher_id = b.publisher_id GROUP BY p.name;

-- Q5: Books Not Returned Yet
SELECT m.name, b.title, l.loan_date FROM loans l JOIN members m ON l.member_id = m.member_id JOIN books b ON l.book_id = b.book_id WHERE l.return_date IS NULL;

-- Q6: Total Fine Amount Unpaid
SELECT SUM(amount) AS total_unpaid FROM fines WHERE paid = FALSE;

-- Q7: Update Stock After Loan
UPDATE books SET stock = stock - 1 WHERE book_id = 1;
