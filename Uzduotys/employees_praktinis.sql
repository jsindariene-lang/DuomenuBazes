-- 1. Išrinkite visus duomenis iš lentelės “EMPLOYEES”.
SELECT *
FROM employees;

-- 2. Išrinkite visus duomenis iš stulpelio “EMPLOYEEID” - lentelėje “EMPLOYEES”.
SELECT employeeid
FROM employees;

-- 3. Išrinkite visus duomenis iš stulpelių “LASTNAME”,”FIRSTNAME”, “TITLE” - lentelėje “EMPLOYEES”.
SELECT lastname, firstname, title
FROM employees;

-- 4. Išrinkite skirtingas reikšmes iš stulpelio “CITY” - lentelėje “EMPLOYEES”. 
SELECT DISTINCT city
FROM employees; 

-- 5. Išrinkite visus duomenis apie darbuotojus, kurie dirba Mieste Seattle.
SELECT *
FROM employees
WHERE city = 'Seattle';

-- 6. Išrinkite duomenis, kokias pareigas užima Andrew.
SELECT title
FROM employees
WHERE firstname = 'Andrew';

-- 7. Išrinkite visus duomenis apie darbuotojus, kurių gimimo data – 1963-07-02.
SELECT *
FROM employees
WHERE birthdate = '1963-07-02 00:00:00';

-- 8. Išrinkite darbuotojų vardus, kurių pavardės yra Leverling.
SELECT firstname
FROM employees
WHERE lastname = 'Leverling';

-- 9. Išrinkite visus duomenis apie darbuotojus, kurių pavardė prasideda raide 'D'.
SELECT *
FROM employees
WHERE lastname LIKE 'D%';

-- 10. Išrinkite duomenis (vardą ir pavardę) darbuotojų, kurių vardo antroji raidė yra 'a'.
SELECT firstname, lastname
FROM employees
WHERE firstname LIKE '_a%';

-- 11. Išrinkite duomenis (vardą ir pavardę) apie pardavimų atstovus iš Jungtinių Amerikos Valstijų.
SELECT firstname, lastname
FROM employees
WHERE title = 'Sales Representative'
  AND country = 'USA';
  
-- 12. Išrinkite visus duomenis apie darbuotojus, kurie dirba Londone arba Seattle. Išrikiuokite pagal pavardę.
SELECT *
FROM employees
WHERE city = 'London'
   OR city = 'Seattle'
ORDER BY lastname;

-- 13. Suskaičiuokite, kiek įmonėje dirba pardavimų atstovų.
SELECT COUNT(*) AS 'Sales Representative'
FROM employees
WHERE title = 'Sales Representative';

-- 14. Suraskite vyriausio darbuotojo gimimo datą
SELECT MIN(birthdate) AS oldest_birth_date
FROM employees;

-- 15. Išrinkite visus duomenis apie 3 jauniausius darbuotojus.
SELECT *
FROM employees
ORDER BY birthdate DESC
LIMIT 3;