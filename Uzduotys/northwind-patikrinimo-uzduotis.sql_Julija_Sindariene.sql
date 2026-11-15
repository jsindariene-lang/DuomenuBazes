-- 1. Išrinkite visus duomenis iš lentelės "ORDERS"
SELECT * FROM orders;

-- 2. Išrinkite duomenis, kiek iš viso buvo įvykdyta užsakymų
SELECT COUNT(*) AS viso_uzsakymu
FROM orders;

-- 3. Išrinkite duomenis (užsakymo datą ir laivo vardą) apie visus krovinius į Prancūziją
SELECT orderdate, shipname
FROM orders
WHERE shipcountry = 'France';

-- 4. Išrinkite užsakymus (užsakymo ID, užsakymo datą ir šalį) apie visus krovinius, išsiųstus į šalis, prasidedančias raidėmis G, B arba A
SELECT orderid, orderdate, shipcountry
FROM orders
WHERE shipcountry LIKE 'G%'
   OR shipcountry LIKE 'B%'
   OR shipcountry LIKE 'A%';
   
-- 5. Išrinkite duomenis (adresas, laivo vardas, šalis) apie užsakymus, kurių ORDERID yra nuo 10248 iki 10300
SELECT shipaddress, shipname, shipcountry
FROM orders
WHERE orderid BETWEEN 10248 AND 10300;

-- 6. Išrinkite visus duomenis apie užsakymus, kurių numeriai yra 10250, 10260, 10270 (operatorius IN)
SELECT *
FROM orders
WHERE orderid IN (10250, 10260, 10270);

-- 7. Išrinkite visus duomenis apie užsakymus ir išrikiuokite duomenis pagal užsakymo datą nuo seniausios iki naujausios
SELECT *
FROM orders
ORDER BY orderdate ASC;

-- 8. Išveskite stulpelio FREIGHT vidurkį
SELECT AVG(freight) AS vidurkis
FROM orders;

-- 9. Išrinkite duomenis (šalis ir skaičius), kiek krovinių buvo išplukdyta į kiekvieną šalį
SELECT shipcountry, COUNT(*) AS kroviniu_skaicius
FROM orders
GROUP BY shipcountry;

-- 10. Išrinkite duomenis (šalis ir skaičius), kiek produktų buvo išplukdyta į kiekvieną šalį (produktai lentelėje ORDER_DETAILS)
SELECT o.shipcountry, COUNT(od.productid) AS produktu_skaicius
FROM orders o
JOIN order_details od ON o.orderid = od.orderid
GROUP BY o.shipcountry;


-- 11. #9 punkto užklausą pataisykite taip, kad rodytų tik tas šalis, į kurias buvo išplukdyta daugiau nei 20 krovinių
SELECT shipcountry, COUNT(*) AS kroviniu_skaicius
FROM orders
GROUP BY shipcountry
HAVING COUNT(*) > 20;

-- 12. Įterpkite į lentelę PRODUCTS naują įrašą, užpildydami visus laukus, skirdami ID=1000, bei priskirkite produktą 'Seafood' kategorijai (lentelė CATEGORIES)
SELECT categoryid
FROM categories
WHERE categoryname = 'Seafood';

DESCRIBE products;

INSERT INTO products 
(productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued)
VALUES 
(1000, 'Seafood', 1, 8, '1 box', 10.00, 50, 0, 10, 'n');

-- 13. Atnaujinkite duomenis apie produktą, priskirdami jį 'Beverages' kategorijai, kurio ID yra 23
SELECT categoryid 
FROM categories
WHERE categoryname = 'Beverages';

UPDATE products
SET categoryid = 1
WHERE productid = 23;

-- 14. Išrinkite duomenis (produkto pavadinimas, vieneto kaina, užsakymo numeris ir aptarnavęs darbuotojas), kokie produktai buvo užsakyti bei apie tuos, kurių niekas neužsakė
SELECT p.productname, p.unitprice, o.orderid, CONCAT(e.firstname, ' ', e.lastname) AS employee
FROM products p
JOIN order_details od 
ON p.productid = od.productid
JOIN orders o 
ON od.orderid = o.orderid
JOIN employees e 
ON o.employeeid = e.employeeid
ORDER BY p.productname;

SELECT p.productname, p.unitprice
FROM products p
LEFT JOIN order_details od 
ON p.productid = od.productid
WHERE od.productid IS NULL
ORDER BY p.productname;

-- 15. Ištrinkite iš lentelės PRODUCTS įrašą, kurį sukūrėte #12 užklausoje
DELETE FROM products
WHERE productid = 1000;

-- PAPILDOMAI: Sujunkite visas NORTHWIND duomenų bazės lenteles į vieną naudojant JOIN (išskyrus CUSTOMERCUSTOMERDEMO, CUSTOMERDEMOGRAPHICS, USSTATES lenteles)
SELECT p.productid, p.productname, p.unitprice, c.categoryname, s.companyname AS supplier, od.orderid, od.quantity, o.orderdate, o.requireddate, o.shippeddate, sh.companyname AS shipper,
    CONCAT(e.firstname, ' ', e.lastname) AS employee,
    cu.companyname AS customer
FROM products p
LEFT JOIN categories c 
    ON p.categoryid = c.categoryid
LEFT JOIN suppliers s 
    ON p.supplierid = s.supplierid
LEFT JOIN order_details od 
    ON p.productid = od.productid
LEFT JOIN orders o 
    ON od.orderid = o.orderid
LEFT JOIN employees e 
    ON o.employeeid = e.employeeid
LEFT JOIN shippers sh 
    ON o.shipvia = sh.shipperid
LEFT JOIN customers cu 
    ON o.customerid = cu.customerid
ORDER BY p.productid, od.orderid;

