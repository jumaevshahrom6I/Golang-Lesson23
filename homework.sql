drop table if exists courses;
drop table if exists students;

-- 1
create table students (
    id         serial primary key,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    age        int check(age > 18 and age < 100)
);

-- 2
create table courses (
    id          serial primary key,
    student_id  int not null,
    course_name varchar(100) not null,
    price       numeric(10,2) not null,
    duration    int not null, 
    foreign key (student_id) references students(id)
);

insert into students (first_name, last_name, age) values
('Рустам',   'Саидов',    22),
('Фарангис', 'Рахимова',  20),
('Далер',    'Исмоилов',  24),
('Зарина',   'Назарова',  21),
('Бахтиёр',  'Шарипов',   26),
('Мадина',   'Холова',    19);

insert into courses (student_id, course_name, price, duration) values
(1, 'Go',         600, 3),
(1, 'PostgreSQL', 400, 2),
(1, 'C#',         700, 4),
(2, 'Go',         600, 3),
(2, 'Python',     500, 3),
(3, 'C#',         700, 4),
(3, 'Go',         600, 3),
(3, 'JavaScript', 450, 3),
(4, 'Python',     500, 3),
(5, 'PostgreSQL', 400, 2),
(5, 'Go',         600, 3),
(6, 'JavaScript', 450, 3);

-- 3
select s.first_name, s.last_name, c.course_name
from students s
join courses c on c.student_id = s.id;

-- 4
select s.first_name, s.last_name, c.course_name, c.price
from students s
join courses c on c.student_id = s.id;

-- 5
select s.first_name, s.last_name
from students s
join courses c on c.student_id = s.id
where c.course_name = 'Go';

-- 6
select course_name, count(*) as students_count
from courses
group by course_name;

-- 7
select course_name, sum(price) as total_sum
from courses
group by course_name;

-- 8
select course_name, count(*) as students_count
from courses
group by course_name
having count(*) > 1;

-- 9
select course_name, avg(price) as avg_price
from courses
group by course_name;

-- 10
select s.first_name, s.last_name, count(c.id) as courses_count
from students s
left join courses c on c.student_id = s.id
group by s.id, s.first_name, s.last_name;

-- 11
select s.first_name, s.last_name, count(c.id) as courses_count
from students s
join courses c on c.student_id = s.id
group by s.id, s.first_name, s.last_name
having count(c.id) > 1;

-- 12
select s.first_name, s.last_name, sum(c.price) as total_sum
from students s
join courses c on c.student_id = s.id
group by s.id, s.first_name, s.last_name;

-- 13
select course_name, sum(price) as total_profit
from courses
group by course_name
order by total_profit desc
limit 1;

-- 14
select s.first_name, s.last_name, sum(c.price) as total_sum
from students s
join courses c on c.student_id = s.id
group by s.id, s.first_name, s.last_name
having sum(c.price) > 500;

-- 15
select s.first_name,
       s.last_name,
       count(c.id)  as courses_count,
       sum(c.price) as total_sum,
       avg(c.price) as avg_price
from students s
join courses c on c.student_id = s.id
group by s.id, s.first_name, s.last_name
order by total_sum desc;




drop table if exists courses;
drop table if exists students;

insert into students (first_name, last_name, age) values
('Шохрух', 'Давлатов',  23),
('Нигина', 'Сатторова', 20),
('Фируз',  'Курбонов',  25),
('Парвина','Мирзоева',  22),
('Умед',   'Азизов',    27);


insert into courses (student_id, course_name, price, duration) values
(7,  'Go',         600, 3),
(7,  'Python',     500, 3),
(8,  'C#',         700, 4),
(8,  'Go',         600, 3),
(9,  'PostgreSQL', 400, 2),
(9,  'JavaScript', 450, 3),
(10, 'Python',     500, 3),
(10, 'C#',         700, 4),
(11, 'Go',         600, 3),
(11, 'PostgreSQL', 400, 2);


select (select count(*) from students) as students_total,
       (select count(*) from courses)  as courses_total;


select s.first_name,
       s.last_name,
       count(c.id)  as courses_count,
       sum(c.price) as total_sum,
       avg(c.price) as avg_price
from students s
join courses c on c.student_id = s.id
group by s.id, s.first_name, s.last_name
order by total_sum desc;