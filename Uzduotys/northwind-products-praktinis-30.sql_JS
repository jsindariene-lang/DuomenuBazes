-- Northwind products lentelė

-- 1. Išveskite visus produktus iš lentelės Products.
SELECT * 
FROM products;

-- 2. Išveskite produktus, kurių kaina (UnitPrice) didesnė nei 50.
SELECT *
FROM products
WHERE unitprice > 50;

-- 3. Išveskite produktus, kurie yra nebeparduodami (Discontinued).
SELECT *
FROM products
WHERE discontinued = 1;

-- 4. Išveskite produktus, kurių pavadinime yra žodis "dried".
SELECT *
FROM products
WHERE productname LIKE '%dried%';

-- 5. Išveskite produktus, kurie yra nebegaminami (Discontinued) bet dar yra pardavime (in stock).
SELECT *
FROM products
WHERE discontinued = 1
AND unitsinstock > 0;

-- 6. Išveskite produktus, kurių kaina yra tarp 20 ir 40.
SELECT *
FROM products
WHERE unitprice BETWEEN 20 AND 40;

-- 7. Išveskite produktus, kurie yra arba neparduodami, arba jų kaina mažesnė nei 10.
SELECT *
FROM products
WHERE discontinued = 1 OR unitprice < 10;

-- 8. Išveskite visus produktus, kurių kategorijos ID yra 1, 2 arba 3 (naudojant IN).
SELECT *
FROM products
WHERE categoryid IN (1, 2, 3);

-- 9. Išveskite produktus, kurie neturi nurodyto tiekėjo (ar NULL, 0 rezultatų).
SELECT *
FROM products
WHERE supplierid IS NULL
OR supplierid = 0;

-- 10. Išveskite 5 brangiausius produktus pagal UnitPrice.
SELECT *
FROM products
ORDER BY unitprice DESC
LIMIT 5;

-- 11. Išveskite mažiausią ir didžiausią produkto kainą.
SELECT MIN(unitprice) AS maziausia_kaina,
MAX(unitprice) AS didziausia_kaina
FROM products;

-- 12. Suskaičiuokite, kiek yra neparduodamų produktų.
SELECT  COUNT(*) AS discontinued_products
FROM products
WHERE discontinued = 1;

-- 13. Išveskite vidutinę produkto kainą tarp visų produktų.
SELECT  AVG(unitprice) AS average_price
FROM products;

-- 14. Suskaičiuokite, kiek yra produktų kiekvienoje kategorijoje.
SELECT categoryid, COUNT(*) AS product_count
FROM products
GROUP BY categoryid;

-- 15. Išveskite kategorijas, kuriose yra daugiau nei 10 produktų.
SELECT categoryid, COUNT(*) AS product_count
FROM products
GROUP BY categoryid
HAVING COUNT(*) > 10;

-- 16. Išveskite kategorijas, kurių vidutinė produkto kaina didesnė nei 30.
SELECT categoryid, AVG(unitprice) AS average_price
FROM products
GROUP BY categoryid
HAVING AVG (unitprice) > 30;

-- 17. Išveskite tiekėjus (SupplierID), kurių produktų kiekis sandėlyje viršija 200 vnt. (bendras kiekis per visus jų produktus).
SELECT supplierid, SUM(unitsinstock) AS total_stock
FROM products
GROUP BY supplierid
HAVING SUM(unitsinstock) > 200;

-- 18. Išveskite produktus, kurie yra pigesni nei vidutinė visų produktų kaina.
SELECT *
FROM products
WHERE unitprice < (SELECT AVG(UnitPrice) FROM products); 

-- 19. Išveskite kiekvienos kategorijos ID ir didžiausią produkto kainą toje kategorijoje (naudojant GROUP BY ir MAX).
SELECT categoryid, MAX(unitprice) AS max_price
FROM products
GROUP BY categoryid;

-- 20. Išveskite produktus, kurių tiekimo kiekis (UnitsOnOrder) yra didžiausias.
SELECT *
FROM products
WHERE unitsonorder = (SELECT MAX(unitsonorder) FROM products);

-- 21. Išveskite produktus, kurių sandėlyje yra mažiau nei užsakytų vienetų (unitsinstock < unitsonorder).
SELECT *
FROM products
WHERE unitsinstock < unitsonorder;

-- 22. Išveskite kategorijos ID, kuriai priklauso daugiausiai produktų.
SELECT categoryid, COUNT(*) AS product_count
FROM products
GROUP BY categoryid
ORDER BY product_count DESC
LIMIT 1;

-- 23. Išveskite tiekėjų ID, kurie tiekia tik produktus, kurių kaina mažesnė nei visų produktų vidutinė kaina.
SELECT supplierid
FROM products
GROUP BY supplierid
HAVING MAX(UnitPrice) < (SELECT AVG(UnitPrice)FROM products);

-- 24. Išveskite 5 tiekėjus, kurių produktų kainų vidurkis yra didžiausias. Rodykite tik tuos tiekėjus, kurie tiekia bent 3 produktus.
SELECT supplierid, AVG(UnitPrice) AS avg_price, COUNT(*) AS product_count
FROM products
GROUP BY supplierid
HAVING COUNT(*) >= 3
ORDER BY avg_price DESC
LIMIT 5;

-- 25. Įterpkite naują produktą pavadinimu "Organic Honey", kainuojantį 15.50, kuris priklauso kategorijai 2,
--     turi 100 vnt. sandėlyje, 20 vnt. užsakyta ir tiekėją su ID 5.
INSERT INTO products (productname, unitprice, categoryid, unitsinstock, unitsonorder, supplierid)
VALUES ('Organic Honey', 15.50, 2, 100, 20, 5);

-- 26. Atlikite kainos pakeitimą visiems produktams, kurių tiekėjas yra 3 – padidinkite kainą 10%.
UPDATE products
SET unitprice = unitprice * 1.10
WHERE supplierid = 3;

-- 27. Nustatykite, kad visi produktai, kurių sandėlio likutis yra 0, būtų pažymėti kaip discontinued.
UPDATE products
SET Discontinued = 1
WHERE UnitsInStock = 0;

-- 28. Pašalinkite visus produktus, kurių kaina yra mažesnė nei 1 ir jie neturi sandėlio likučio bei nėra užsakyti. 
DELETE FROM products
WHERE unitprice < 1
  AND unitsinstock = 0
  AND unitsonorder = 0;
  
-- 29. Įterpkite 3 naujus testinius produktus  su skirtingomis kategorijomis ir kainomis,
--     kurie būtų naudojami testavimui (žodis Test pavadinime), ir pažymėkite juos kaip neparduodamus.
INSERT INTO products (
    productname,
    unitprice,
    categoryid,
    unitsinstock,
    unitsonorder,
    supplierid,
    discontinued)
VALUES 
('Test Product A', 9.99, 1, 50, 0, 1, 1),
('Test Product B', 19.99, 2, 30, 0, 2, 1),
('Test Product C', 29.99, 3, 20, 0, 3, 1);

-- 30. Pašalinkite visus produktus, kurių pavadinime yra žodis "Test".
SET SQL_SAFE_UPDATES = 0;
DELETE FROM products WHERE productname LIKE '%Test%';
SET SQL_SAFE_UPDATES = 1;


