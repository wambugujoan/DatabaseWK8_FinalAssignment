-- =============================================
-- Library Management System Database Schema
-- =============================================

-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- =============================================
-- Step 2: Drop existing tables (to avoid conflicts)
-- =============================================
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS BookAuthors;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;

-- =============================================
-- Step 3: Create tables
-- =============================================

-- 1. Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- 2. Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(50),
    published_year YEAR,
    UNIQUE(title, published_year) -- prevent duplicate books
);

-- 3. BookAuthors table (Many-to-Many)
CREATE TABLE BookAuthors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY(book_id, author_id),
    FOREIGN KEY(book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY(author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- 4. Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Loans table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    return_date DATE,
    FOREIGN KEY(book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY(member_id) REFERENCES Members(member_id) ON DELETE CASCADE
);

-- =============================================
-- Step 4: Insert sample data
-- =============================================

-- Authors
INSERT INTO Authors (name, bio) VALUES
('Mercy Masika', 'Author of Miracles Of God.'),
('George Wambugu', 'Author of Children Animal Park.'),
('Ngugi wa Thiong\'o', 'Kenyan writer of novels, plays, and essays.'),
('Chimamanda Ngozi Adichie', 'Nigerian writer of novels and short stories.');

-- Books
INSERT INTO Books (title, genre, published_year) VALUES
('Miracles Of God', 'Spiritual', 2024),
('Children Animal Park', 'Fiction', 2025),
('The River Between', 'Historical Fiction', 1965),
('Half of a Yellow Sun', 'Historical Fiction', 2006);

-- BookAuthors
INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Members
INSERT INTO Members (name, email) VALUES
('Joan Mugure', 'joan@example.com'),
('Ian Waweru', 'ian@example.com');

-- Loans
INSERT INTO Loans (book_id, member_id, loan_date) VALUES
(1, 1, '2025-09-17'),
(2, 2, '2025-09-15');

