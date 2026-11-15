CREATE DATABASE IF NOT EXISTS LibraryDB
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE LibraryDB;


DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Publishers;


CREATE TABLE Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  country VARCHAR(50)
) ENGINE=InnoDB;


CREATE TABLE Publishers (
  publisher_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  country VARCHAR(50)
) ENGINE=InnoDB;


CREATE TABLE Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  author_id INT NULL,
  publisher_id INT NULL,
  year_published INT,
  shelf_code VARCHAR(20),
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    ON UPDATE RESTRICT ON DELETE SET NULL,
  CONSTRAINT fk_books_publisher
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
    ON UPDATE RESTRICT ON DELETE SET NULL
) ENGINE=InnoDB;


CREATE TABLE Members (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  city VARCHAR(50)
) ENGINE=InnoDB;


CREATE TABLE Loans (
  loan_id INT AUTO_INCREMENT PRIMARY KEY,
  member_id INT NOT NULL,
  book_id INT NOT NULL,
  loan_date DATE NOT NULL,
  return_date DATE NULL,
  CONSTRAINT fk_loans_member
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_loans_book
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB;


INSERT INTO Authors (name, country) VALUES
  ('J. K. Rowling',            'United Kingdom'),  
  ('George R. R. Martin',      'United States'),   
  ('Jonas Biliūnas',           'Lithuania'),       
  ('Haruki Murakami',          'Japan'),           
  ('Author With No Books',     'Nowhere');         


INSERT INTO Publishers (name, country) VALUES
  ('Bloomsbury',               'United Kingdom'),  
  ('Bantam',                   'United States'),   
  ('Lithuanian Classics Press','Lithuania'),       
  ('Shinchosha',               'Japan'),           
  ('Empty House Publishing',   'N/A');            


INSERT INTO Books (title, author_id, publisher_id, year_published, shelf_code) VALUES
  ('Harry Potter and the Philosopher''s Stone', 1, 1, 1997, 'FAN-ROW-01'),
  ('Harry Potter and the Chamber of Secrets',   1, 1, 1998, 'FAN-ROW-02'),
  ('A Game of Thrones',                         2, 2, 1996, 'FAN-GRM-01'),
  ('A Clash of Kings',                          2, 2, 1998, 'FAN-GRM-02'),
  ('Liūdna pasaka',                             3, 3, 1907, 'CLA-BIL-01'),
  ('Kafka on the Shore',                        4, 4, 2002, 'FIC-MUR-01'),
  ('Norwegian Wood',                            4, 4, 1987, 'FIC-MUR-02'),
  ('Orphaned Manuscript',                       NULL, 2, 2010, 'MYS-UNK-01'), 
  ('Unpublished Notes',                         1,   NULL, 2005, 'MISC-ROW-99'); 


INSERT INTO Members (full_name, city) VALUES
  ('Tomas Petrauskas',     'Vilnius'),  
  ('Agnė Jankauskaitė',    'Kaunas'),   
  ('Member With No Loans', 'Klaipėda'); 


INSERT INTO Loans (member_id, book_id, loan_date, return_date) VALUES
  (1, 1, '2025-10-01', '2025-10-10'),
  (1, 3, '2025-10-05', NULL),
  (2, 2, '2025-09-28', '2025-10-02');
