CREATE DATABASE library_db;
USE library_db;

CREATE TABLE authors (
  author_id INT PRIMARY KEY,
  name VARCHAR(100),
  country VARCHAR(50)
);

CREATE TABLE publishers (
  publisher_id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(50)
);

CREATE TABLE books (
  book_id INT PRIMARY KEY,
  title VARCHAR(150),
  author_id INT,
  publisher_id INT,
  price DECIMAL(8,2),
  stock INT,
  FOREIGN KEY (author_id) REFERENCES authors(author_id),
  FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

CREATE TABLE members (
  member_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  join_date DATE
);

CREATE TABLE staff (
  staff_id INT PRIMARY KEY,
  name VARCHAR(100),
  role VARCHAR(50)
);

CREATE TABLE loans (
  loan_id INT PRIMARY KEY,
  book_id INT,
  member_id INT,
  loan_date DATE,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE fines (
  fine_id INT PRIMARY KEY,
  loan_id INT,
  amount DECIMAL(8,2),
  paid BOOLEAN,
  FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);
