# 📚 Library Management System - SQL Project

## 📌 Project Overview

The **Library Management System** is a relational database project developed using MySQL.

The project is designed to manage books, authors, publishers, library branches, book copies, borrowers, and book loans.

It demonstrates practical SQL concepts such as:

- Database and table creation
- Primary Keys and Foreign Keys
- Relationships between tables
- INNER JOIN
- LEFT JOIN
- WHERE
- GROUP BY
- HAVING
- COUNT()
- Aggregate functions
- Filtering and retrieving relational data

---

## 🗂️ Database Structure

The database contains the following tables:

1. `tbl_publisher`
2. `tbl_book`
3. `tbl_book_authors`
4. `tbl_library_branch`
5. `tbl_book_copies`
6. `tbl_borrower`
7. `tbl_book_loans`

---

## 🛠️ Tech Stack

- Database: MySQL
- Tool: MySQL Workbench
- Language: SQL

---

## 🔍 Queries Solved

- Q1: Copies of "The Lost Tribe" in Sharpstown -> 5 Copies
- Q2: Copies of "The Lost Tribe" in each branch -> 4 Branches
- Q3: Borrowers with no books checked out -> Jane Smith
- Q4: Books due on 2/3/18 from Sharpstown -> Tom Li, 6 Books
- Q5: Total books loaned per branch -> 4 Branches
- Q6: Borrowers with more than 5 books checked out -> 2 Borrowers
- Q7: Stephen King books in Central branch -> It (5), The Green Mile (3)

---

## 💡 Key Problem Solved

Q4 initially returned 0 rows. Found that CSV date 2/3/18 was imported as 0002-03-18 in MySQL due to date-format mismatch. Fixed by filtering on actual stored value.

This shows real debugging and data cleaning experience.

---

## 🚀 How to Run

1. Open MySQL Workbench
2. Create a new database
3. Run the `library_management.sql` file
4. Run the queries to check results
