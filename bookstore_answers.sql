# SQL Queries Exercise

# Exercise 1
SELECT isbn 
FROM editions AS e 
  JOIN publishers AS p ON (e.publisher_id = p.id) 
    WHERE p.name = 'Random House'
;

# Exercise 2
SELECT b.title, isbn 
FROM editions AS e 
  JOIN publishers AS p ON (e.publisher_id = p.id)
  JOIN books AS b ON (e.book_id = b.id) 
    WHERE p.name = 'Random House'
;

# Exercise 3
SELECT b.title, e.isbn, s.stock 
FROM editions AS e 
  JOIN publishers AS p ON (e.publisher_id = p.id)
  JOIN books AS b ON (e.book_id = b.id)
  JOIN stock AS s ON (e.isbn = s.isbn) 
    WHERE p.name = 'Random House'
;

# Exercise 4
SELECT b.title, e.isbn, s.stock 
FROM editions AS e 
  JOIN publishers AS p ON (e.publisher_id = p.id)
  JOIN books AS b ON (e.book_id = b.id)
  JOIN stock AS s ON (e.isbn = s.isbn) 
    WHERE p.name = 'Random House'
    AND s.stock > 0
;

# Exercise 5
SELECT b.title, e.isbn, s.stock,
  CASE 
    WHEN e.type = 'p' THEN 'Paperback'
    WHEN e.type = 'h' THEN 'Hardcover'
  ELSE e.type
    END AS "Type"
FROM editions AS e 
  JOIN publishers AS p ON (e.publisher_id = p.id)
  JOIN books AS b ON (e.book_id = b.id)
  JOIN stock AS s ON (e.isbn = s.isbn) 
    WHERE p.name = 'Random House'
    AND s.stock > 0
;

# Exercise 6
SELECT b.title, e.publication 
FROM books AS b
  LEFT OUTER JOIN editions AS e ON (b.id = e.book_id)
;

# Exercise 7
SELECT SUM(s.stock) 
FROM stock AS s
;

# Exercise 8 
SELECT AVG(s.cost) AS "Average Cost", 
  AVG(s.retail) AS "Average Retail",
  AVG(s.retail) - AVG(s.cost) AS "Average Profit"
FROM stock AS s
;

# Exercise 9
SELECT e.book_id
FROM editions AS e
  JOIN stock AS s ON (e.isbn = s.isbn)
ORDER BY s.stock DESC
LIMIT 1

# Exercise 10
SELECT a.id AS "ID", (a.first_name || ' ' || a.last_name) AS "Full name", COUNT(b.id) AS "Number of Books"
FROM authors AS a
  LEFT OUTER JOIN books AS b ON (a.id = b.author_id)
GROUP BY a.id

# Exercise 11
SELECT a.id AS "ID", (a.first_name || ' ' || a.last_name) AS "Full name", COUNT(b.id) AS "Number of Books"
FROM authors AS a
  LEFT OUTER JOIN books AS b ON (a.id = b.author_id)
GROUP BY a.id
ORDER BY "Number of Books" DESC

# Exercise 12
SELECT b.title
FROM editions AS e
  JOIN books AS b ON (e.book_id = b.id)
GROUP BY b.title
HAVING COUNT(DISTINCT e.type) > 1

# Exercise 13
SELECT p.name, AVG(s.retail), COUNT(e.book_id)
FROM publishers AS p
  LEFT OUTER JOIN editions AS e ON (p.id = e.publisher_id)
  LEFT OUTER JOIN stock AS s ON (e.isbn = s.isbn)
GROUP BY p.name
ORDER BY COUNT(e.book_id) DESC





