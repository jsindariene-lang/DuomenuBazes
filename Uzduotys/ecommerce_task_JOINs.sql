
-- 1. Parodykite paprastą dviejų lentelių jungimą senuoju būdu:
--    naudokite FROM table1, table2 ir WHERE sąlygą.
--    Parodykite produktų pavadinimus ir kategorijų pavadinimus. (rezultatas 10 eilučių)
SELECT category_name, product_name
FROM categories c, products p
WHERE c.category_id = p.category_id;

-- 2. Parodykite produktų pavadinimus ir jų kategorijų pavadinimus naudodami JOIN. (10 eil.)

-- 3. Parodykite produktų pavadinimus ir tiekėjų pavadinimus naudodami INNER JOIN. (8 eil.)

-- 4. Parodykite klientų vardus, pavardes ir jų užsakymų datas. (6 eil.)

-- 5. Parodykite užsakymo ID, kliento vardą ir pavardę, produkto pavadinimą, kiekį ir vieneto kainą. (12 eil.)

-- 6. Naudodami lentelių ir stulpelių pseudonimus parodykite produkto pavadinimą, kategoriją ir tiekėją. (8 eil.)

-- 7. Parodykite tik tuos produktus, kurie priklauso kategorijai 'Electronics'. (4 eil.)

-- 8. Parodykite Vilniaus klientų užsakymus. Rezultatą surikiuokite pagal užsakymo datą. (3 eil.)

-- 9. Parodykite visus klientus ir jų užsakymus. (7 eil.)
--    Klientai be užsakymų taip pat turi būti rodomi.

-- 10. Parodykite visas kategorijas ir jų produktus naudodami. (11 eil.)
--     Kategorijos be produktų taip pat turi būti rodomos.

-- 11. Parodykite visus produktus ir jų tiekėjus naudodami. (10 eil.)
--     Produktai be tiekėjų taip pat turi būti rodomi.

-- 12. Parodykite visus tiekėjus ir jų produktus naudodami RIGHT JOIN. (9 eil.)
--     Tiekėjai be produktų taip pat turi būti rodomi.

-- 13. Raskite klientus, kurie neturi jokių užsakymų. (1 eil.)
--     Naudokite LEFT JOIN ir IS NULL.

-- 14. Raskite produktus, kurie niekada nebuvo užsakyti. (2 eil.)
--     Naudokite LEFT JOIN ir IS NULL.

-- 15. Parodykite kiekvieno užsakymo bendrą sumą. (6 eil.)
--     Naudokite SUM(quantity * unit_price) ir GROUP BY.

-- 16. Parodykite kiekvieno kliento bendrą išleistą sumą. (6 eil.)
--     Rezultatą surikiuokite nuo didžiausios sumos iki mažiausios.

-- 17. Parodykite kategorijas ir jų produktų skaičių. (1 eil.)
--     Palikite tik tas kategorijas, kurios turi ne daugiau kaip 2 produktus.
--     Naudokite HAVING.

-- 18. Naudodami UNION sujunkite klientų miestus ir tiekėjų šalis į vieną stulpelį (location). (9 eil.)
