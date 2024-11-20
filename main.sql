DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS publishers CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS book_reviews CASCADE;

CREATE TABLE IF NOT EXISTS authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    birth_day DATE DEFAULT CURRENT_DATE,
    country VARCHAR(400)
);

CREATE TABLE IF NOT EXISTS publishers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    founded_year DATE
);

CREATE TABLE IF NOT EXISTS books (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    author_id INT NOT NULL REFERENCES authors(id) ON DELETE CASCADE,
    publisher_id INT REFERENCES publishers(id) ON DELETE SET NULL,
    genre VARCHAR(50),
    published_date DATE DEFAULT CURRENT_DATE,
    price NUMERIC(7, 2) CHECK(price > 0)
);

CREATE TABLE IF NOT EXISTS book_reviews (
    id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(id) ON DELETE SET NULL,
    review_text VARCHAR(1000),
    grade INT CHECK(grade BETWEEN 1 AND 10),
    review_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO authors (name, birth_day, country) VALUES
    ('Tohir', '1985-07-24', 'Uzbekistan'),
    ('Sobir', '2000-03-20', 'Tajikistan'),
    ('Jalil', '1999-08-30', 'Turkmenistan'),
    ('Ali', '2001-05-14', 'Kazakhstan'),
    ('John', '1975-11-17', 'USA');

INSERT INTO publishers (name, city, founded_year) VALUES
    ('First Publisher', 'Ferghana', '1970-01-12'),
    ('Second Publisher', 'Tashkent', '1971-02-13'),
    ('Third Publisher', 'Andijan', '1972-03-14'),
    ('Fourth Publisher', 'Namangan', '1973-04-15'),
    ('Fifth Publisher', 'Khiva', '1974-05-16');

INSERT INTO books (name, author_id, publisher_id, genre, published_date, price) VALUES
    ('Past Days', 1, 5, 'Historical Novel', '2019-02-24', 65000),
    ('Starry Nights', 2, 4, 'Historical Novel', '2020-03-23', 75000),
    ('Last Flood', 3, 2, 'Novel', '2021-04-22', 85000),
    ('Following the Wolves', 4, 1, 'Detective Novel', '2022-01-21', 95000),
    ('Life’s Matters', 5, 3, 'Story', '2023-05-20', 55000),
    ('Riding the Yellow Giant', 5, 1, 'Adventure Novel', '2005-06-19', 45000),
    ('Step-Mother', 4, 2, 'Novel', '2017-08-18', 35000),
    ('Scorpion from the Sanctuary', 3, 5, 'Historical Novel', '2016-09-17', 25000),
    ('Era of Bliss', 2, 3, 'Historical Novel', '2024-10-16', 95000),
    ('21 Laws of Leadership', 1, 4, 'Novel', '2012-11-15', 29000);

INSERT INTO book_reviews (book_id, review_text, grade) VALUES
    (1, 'Great book, worth the price!', 8),
    (5, NULL, 9),
    (3, 'Highly recommend it!', 6),
    (9, 'The best book ever!', 10),
    (6, NULL, 7);

SELECT * FROM authors;

SELECT * FROM publishers ORDER BY city;

SELECT * FROM books WHERE price BETWEEN 50000 AND 100000;

SELECT SUM(price) AS total_price FROM books;
SELECT COUNT(*) AS publisher_count FROM publishers;
SELECT AVG(grade) AS average_grade FROM book_reviews;
SELECT MIN(price) AS cheapest_book FROM books;
SELECT MAX(price) AS most_expensive_book FROM books;
