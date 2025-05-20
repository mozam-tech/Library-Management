-- LIBRARY MANAGEMENT SYSTEM
-- A simple but complete MySQL database for a library

-- Create database (uncomment if needed)
-- CREATE DATABASE library;
-- USE library;

-- 1. AUTHORS TABLE (1-M relationship with Books)
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- 2. BOOKS TABLE (1-M with Authors, 1-M with Loans)
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    author_id INT NOT NULL,
    published_year INT,
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    CONSTRAINT copies_check CHECK (available_copies <= total_copies)
);

-- 3. MEMBERS TABLE (1-M relationship with Loans)
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- 4. LOANS TABLE (Connects Books and Members)
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    due_date DATE NOT NULL DEFAULT (DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY)),
    returned BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT date_check CHECK (due_date > loan_date)
);

-- 5. CATEGORIES TABLE (Optional M-M relationship)
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- 6. BOOK_CATEGORIES (Junction table for M-M relationship)
CREATE TABLE book_categories (
    book_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

-- SAMPLE DATA (Optional)
INSERT INTO authors (full_name, bio) VALUES 
('J.K. Rowling', 'Author of Harry Potter series'),
('George Orwell', 'Author of 1984 and Animal Farm');

INSERT INTO books (title, isbn, author_id, published_year, total_copies, available_copies) VALUES
('Harry Potter and the Philosopher''s Stone', '9780747532743', 1, 1997, 5, 5),
('1984', '9780451524935', 2, 1949, 3, 3);

INSERT INTO members (full_name, email) VALUES
('John Doe', 'john@example.com'),
('Jane Smith', 'jane@example.com');