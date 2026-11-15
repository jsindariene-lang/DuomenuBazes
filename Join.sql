SELECT * FROM LibraryDB.Books;

select title, name
from Books
join Publishers
on Books.publisher_id = Publishers.publisher_id;

-- knyga, ledykla, autorius --
select b.title as book_title,
p.name as publisher, 
a.name as author
from Books b
join Publishers p
on b.publisher_id = p.publisher_id
join Authors a
on a.author_id = b.author_id;

select b.*, p.name, a.name
from Books b
join Publishers p
on b.publisher_id = p.publisher_id
join Authors a
on a.author_id = b.author_id;

-- loan_id, loan_date, member full_name --
select l.loan_id, l.loan_date, m.full_name
from Loans l
join Members m
on l.member_id = m.member_id;
