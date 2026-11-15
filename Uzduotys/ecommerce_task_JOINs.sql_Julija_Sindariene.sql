
-- 1. Parodykite paprastą dviejų lentelių jungimą senuoju būdu:
--    naudokite FROM table1, table2 ir WHERE sąlygą.
--    Parodykite produktų pavadinimus ir kategorijų pavadinimus. (rezultatas 10 eilučių)
SELECT category_name, product_name
FROM categories c, products p
WHERE c.category_id = p.category_id;

-- 2. Parodykite produktų pavadinimus ir jų kategorijų pavadinimus naudodami JOIN. (10 eil.)
SELECT category_name, product_name
FROM categories c
JOIN products p
ON c.category_id = p.category_id;

-- 3. Parodykite produktų pavadinimus ir tiekėjų pavadinimus naudodami INNER JOIN. (8 eil.)
SELECT product_name, supplier_name
FROM products p
INNER JOIN suppliers s
ON p.supplier_id = s.supplier_id;

-- 4. Parodykite klientų vardus, pavardes ir jų užsakymų datas. (6 eil.)
SELECT first_name, last_name, order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- 5. Parodykite užsakymo ID, kliento vardą ir pavardę, produkto pavadinimą, kiekį ir vieneto kainą. (12 eil.)
SELECT o.order_id, c.first_name, c.last_name, p.product_name, oi.quantity, oi.unit_price
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- 6. Naudodami lentelių ir stulpelių pseudonimus parodykite produkto pavadinimą, kategoriją ir tiekėją. (8 eil.)
SELECT p.product_name AS Produktas,
c.category_name AS Kategorija,
s.supplier_name AS Tiekejas
FROM products p
JOIN categories c
ON p.category_id = c.category_id
JOIN suppliers s
ON p.supplier_id = s.supplier_id
ORDER BY p.product_name;

-- 7. Parodykite tik tuos produktus, kurie priklauso kategorijai 'Electronics'. (4 eil.)
SELECT p.product_name, c.category_name
FROM products p
JOIN categories c
ON p.category_id = c.category_id
WHERE c.category_name = 'Electronics'
ORDER BY p.product_name;

-- 8. Parodykite Vilniaus klientų užsakymus. Rezultatą surikiuokite pagal užsakymo datą. (3 eil.)
SELECT o.order_id, c.first_name, c.last_name, o.order_date
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.city = 'Vilnius'
ORDER BY o.order_date;

-- 9. Parodykite visus klientus ir jų užsakymus. (7 eil.)
--    Klientai be užsakymų taip pat turi būti rodomi.
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id; 
 
-- 10. Parodykite visas kategorijas ir jų produktus naudodami. (11 eil.)
--     Kategorijos be produktų taip pat turi būti rodomos.
SELECT c.category_name, product_name
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
ORDER BY c.category_name;

-- 11. Parodykite visus produktus ir jų tiekėjus naudodami. (10 eil.)
--     Produktai be tiekėjų taip pat turi būti rodomi.
SELECT p.product_name, s.supplier_name
FROM products p
LEFT JOIN suppliers s
ON p.supplier_id = s.supplier_id
ORDER BY p.product_name;

-- 12. Parodykite visus tiekėjus ir jų produktus naudodami RIGHT JOIN. (9 eil.)
--     Tiekėjai be produktų taip pat turi būti rodomi.
SELECT s.supplier_name,  p.product_name
FROM products p
RIGHT JOIN suppliers s
ON p.supplier_id = s.supplier_id
ORDER BY s.supplier_name;

-- 13. Raskite klientus, kurie neturi jokių užsakymų. (1 eil.)
--     Naudokite LEFT JOIN ir IS NULL.
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

-- 14. Raskite produktus, kurie niekada nebuvo užsakyti. (2 eil.)
--     Naudokite LEFT JOIN ir IS NULL.
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL
ORDER BY p.product_id;

-- 15. Parodykite kiekvieno užsakymo bendrą sumą. (6 eil.)
--     Naudokite SUM(quantity * unit_price) ir GROUP BY.
SELECT o.order_id, SUM(oi.quantity * oi.unit_price) AS total_amount
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY o.order_id;

-- 16. Parodykite kiekvieno kliento bendrą išleistą sumą. (6 eil.)
--     Rezultatą surikiuokite nuo didžiausios sumos iki mažiausios.
SELECT c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

-- 17. Parodykite kategorijas ir jų produktų skaičių. (1 eil.)
--     Palikite tik tas kategorijas, kurios turi ne daugiau kaip 2 produktus.
--     Naudokite HAVING.
SELECT c.category_name, COUNT(p.supplier_id) AS product_count
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING COUNT(p.supplier_id) < 2
ORDER BY c.category_name;

-- 18. Naudodami UNION sujunkite klientų miestus ir tiekėjų šalis į vieną stulpelį (location). (9 eil.)
SELECT city AS location
FROM customers
WHERE city IS NOT NULL
UNION
SELECT country AS location
FROM suppliers
WHERE country IS NOT NULL
ORDER BY location;
