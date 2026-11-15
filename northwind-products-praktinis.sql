-- Northwind products lentelė

-- 1. Išveskite visus produktus iš lentelės Products.
SELECT * FROM northwind.products;

-- 2. Išveskite produktus, kurių kaina (UnitPrice) didesnė nei 50.
SELECT * 
FROM northwind.products
WHERE unitprice >= 50;

-- 3. Išveskite produktus, kurie yra nebeparduodami (Discontinued).
SELECT *
FROM northwind.products
WHERE Discontinued = 1;

-- 4. Išveskite produktus, kurių pavadinime yra žodis "dried".
SELECT *
FROM northwind.products
WHERE productname LIKE '%dried%';

-- 5. Išveskite produktus, kurie yra nebegaminami (Discontinued) bet dar yra pardavime (in stock).
SELECT *
FROM northwind.products
WHERE discontinued = 1 AND unitsinstock > 0;

-- 6. Išveskite produktus, kurių kaina yra tarp 20 ir 40.
SELECT *
FROM northwind.products
WHERE unitprice BETWEEN 20 AND 40;

-- 7. Išveskite produktus, kurie yra arba neparduodami, arba jų kaina mažesnė nei 10.
SELECT *
FROM northwind.products
WHERE Discontinued = 1
   OR unitprice <= 10;
   
-- 8. Išveskite visus produktus, kurių kategorijos ID yra 1, 2 arba 3 (naudojant IN).
SELECT *
FROM northwind.products
WHERE productID IN (1, 2, 3);

-- 9. Išveskite produktus, kurie neturi nurodyto (NULL) tiekėjo (tokių nėra, todėl 0 rezultatų).
SELECT *
FROM northwind.products
WHERE SupplierID IS NULL;

-- 10. Išveskite 5 brangiausius produktus pagal UnitPrice.
SELECT *
FROM northwind.products
ORDER BY UnitPrice DESC
LIMIT 5;

-- 11. Išveskite mažiausią ir didžiausią produkto kainą.
SELECT 
    MIN(UnitPrice) AS MaziausiaKaina,
    MAX(UnitPrice) AS DidziausiaKaina
FROM northwind.products;

-- 12. Suskaičiuokite, kiek yra neparduodamų produktų.
SELECT COUNT(*) AS NeparduodamuProduktuKiekis
FROM northwind.products
WHERE Discontinued = 1;

-- 13. Išveskite vidutinę produkto kainą tarp visų produktų.
SELECT AVG(unitprice) AS vidutine_kaina
FROM northwind.products;

-- 14. Suskaičiuokite, kiek yra produktų kiekvienoje kategorijoje.
SELECT categoryID, COUNT(*) AS produktu_kiekis
FROM northwind.products
GROUP BY categoryID;

-- 15. Išveskite kategorijas, kuriose yra daugiau nei 10 produktų.
SELECT categoryID, COUNT(*) AS produktu_kiekis
FROM northwind.products
GROUP BY categoryID
HAVING COUNT(*) > 10;

-- 16. Išveskite kategorijas, kurių vidutinė produkto kaina didesnė nei 30.
SELECT categoryID, AVG(unitprice) AS vidutine_kaina
FROM northwind.products
GROUP BY categoryID
HAVING AVG(unitprice) > 30;

-- 17. Išveskite tiekėjus (SupplierID), kurių produktų kiekis sandėlyje viršija 200 vnt. (bendras kiekis per visus jų produktus).
SELECT supplierID, SUM(unitsinstock) AS bendras_kiekis
FROM northwind.products
GROUP BY supplierID
HAVING SUM(unitsinstock) > 200;

-- 18. Išveskite produktus, kurie yra pigesni nei vidutinė visų produktų kaina.
SELECT *
FROM northwind.products
WHERE unitprice < (
    SELECT AVG(unitprice)
    FROM northwind.products);

-- 19. Išveskite brangiausio produkto kainą kiekvienoje kategorijoje (naudojant GROUP BY ir MAX).
SELECT categoryID, MAX(unitprice) AS brangiausia_kaina
FROM northwind.products
GROUP BY categoryID;

-- 20. Išveskite produktus, kurių tiekimo kiekis (UnitsOnOrder) yra didžiausias.
SELECT *
FROM northwind.products
WHERE unitsonorder = (
    SELECT MAX(unitsonorder)
    FROM northwind.products);

-- 21. Išveskite produktus, kurių sandėlyje yra mažiau nei užsakytų vienetų (unitsinstock < unitsonorder).
SELECT *
FROM northwind.products
WHERE unitsinstock < unitsonorder;

-- 22. Išveskite kategorijos ID, kuriai priklauso daugiausiai produktų.
SELECT categoryID, COUNT(*) AS produktu_kiekis
FROM northwind.products
GROUP BY categoryID
ORDER BY produktu_kiekis DESC
LIMIT 1;

-- 23. Išveskite tiekėjų ID, kurie tiekia tik produktus, kurių kaina mažesnė nei visų produktų vidutinė kaina.
SELECT supplierID
FROM northwind.products
GROUP BY supplierID
HAVING MAX(unitprice) < (
    SELECT AVG(unitprice)
    FROM northwind.products);

-- 24. Išveskite 5 tiekėjus, kurių produktų kainų vidurkis yra aukščiausias, tačiau rodykite tik tiekėjus,
--     kurių visi produktai yra aktyvūs (discontinued = 'n') ir kurie tiekia bent 3 produktus.
SELECT supplierID,
       AVG(unitprice) AS vidutine_kaina,
       COUNT(*) AS produktu_kiekis
FROM northwind.products
GROUP BY supplierID
HAVING COUNT(*) >= 3
   AND MAX(discontinued) = 'n'
ORDER BY vidutine_kaina DESC
LIMIT 5;

-- 25. Įterpkite naują produktą pavadinimu "Organic Honey", kainuojantį 15.50, kuris priklauso kategorijai 2,
--     turi 100 vnt. sandėlyje, 20 vnt. užsakyta ir tiekėją su ID 5.
INSERT INTO northwind.products (
    productname,
    unitprice,
    categoryID,
    unitsinstock,
    unitsonorder,
    supplierID
)
VALUES (
    'Organic Honey',
    15.50,
    2,
    100,
    20,
    5);
    
-- 26. Atlikite kainos pakeitimą visiems produktams, kurių tiekėjas yra 3 – padidinkite kainą 10%.
UPDATE northwind.products
SET unitprice = unitprice * 1.10
WHERE supplierID = 3;

-- 27. Nustatykite, kad visi produktai, kurių sandėlio likutis yra 0, būtų pažymėti kaip discontinued.
UPDATE northwind.products
SET discontinued = 1
WHERE unitsinstock = 0;

-- 28. Pašalinkite visus produktus, kurių kaina yra mažesnė nei 1 ir jie neturi sandėlio likučio bei nėra užsakyti. 
DELETE FROM northwind.products
WHERE unitprice < 1
  AND unitsinstock = 0
  AND unitsonorder = 0;
  
-- 29. Įterpkite 3 naujus testinius produktus  su skirtingomis kategorijomis ir kainomis,
--     kurie būtų naudojami testavimui (žodis Test pavadinime), ir pažymėkite juos kaip neparduodamus.
INSERT INTO northwind.products (productname, unitprice, categoryID, unitsinstock, unitsonorder, supplierID, discontinued)
VALUES 
('Test Product 1', 5.00, 1, 10, 0, 1, 1),
('Test Product 2', 12.50, 2, 20, 0, 2, 1),
('Test Product 3', 25.00, 3, 30, 0, 3, 1);

-- 30. Pašalinkite visus produktus, kurių pavadinime yra žodis "Test".
DELETE FROM northwind.products
WHERE productname LIKE '%Test%';


