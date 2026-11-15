-- Northwind customers lentelė

-- 1. Suskaičiuokite, kiek yra viso klientų lentelėje customers.
SELECT COUNT(*) AS klientu_kiekis
FROM northwind.customers;

-- 2. Išrinkite unikalių šalių (Country) skaičių lentelėje customers.
SELECT COUNT(DISTINCT country) AS Ssalys
FROM northwind.customers;

-- 3. Išrinkite, kiek klientų yra kiekvienoje šalyje.
SELECT country, COUNT(*) AS klientu_kiekis
FROM northwind.customers
GROUP BY country;

-- 4. Išrinkite, kiek klientų yra kiekvienoje šalyje, surikiuokite nuo daugiausia klientų turinčių iki mažiausiai, o tada – pagal šalį.
SELECT country, COUNT(*) AS klientu_kiekis
FROM northwind.customers
GROUP BY country
ORDER BY klientu_kiekis DESC, country ASC;

-- 5. TOP 5 šalys pagal klientų skaičių.
SELECT country, COUNT(*) AS klientu_kiekis
FROM northwind.customers
GROUP BY country
ORDER BY klientu_kiekis DESC
LIMIT 5;

-- 6. Šalys, kuriose > 5 klientų. Pateikite šalį ir klientų skaičių.
SELECT country, COUNT(*) AS klientu_kiekis
FROM northwind.customers
GROUP BY country
HAVING COUNT(*) > 5;

-- 7. Išrinkite miestus, kuriuose yra tarp 2 ir 5 klientų.
SELECT city, COUNT(*) AS klientu_kiekis
FROM northwind.customers
GROUP BY city
HAVING COUNT(*) BETWEEN 2 AND 5;

-- 8. Išrinkite miestus, kurių pavadinimas prasideda raide "B" ir kiek ten yra klientų.
SELECT city, COUNT(*) AS klientu_kiekis
FROM northwind.customers
WHERE city LIKE 'B%'
GROUP BY city;

-- 9. Išrinkite kiek klientų turi faksą (ne null ir ne tuščias), suskaičiuoti bendrą kiekį.
SELECT COUNT(*) AS klientusufaksu
FROM northwind.customers
WHERE fax IS NOT NULL
  AND fax <> '';

-- 10. Miestai, kur bent 2 klientai turi telefoną, prasidedantį „(1)“
SELECT city, COUNT(*) AS klientukiekis
FROM northwind.customers
WHERE phone LIKE '(1)%'
GROUP BY city
HAVING COUNT(*) >= 2;

-- 11. Šalys, kuriuose dirba klientai, kurių CompanyName turi žodį „Market“, ir jų skaičius
SELECT country, COUNT(*) AS klientu_kiekis
FROM northwind.customers
WHERE companyname LIKE '%Market%'
GROUP BY country;


