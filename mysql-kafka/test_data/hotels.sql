create table countries (id int primary key, name varchar(50) not null);
create table cities (id int primary key, name varchar(50) not null, country_id int not null);
create table hotel_chains (id int primary key, name varchar(50) not null);
create table hotels (id int primary key, name varchar(50) not null, city_id int not null, chain_id int not null, rating int default 0);

insert ignore into countries values
  (1, 'USA'),
  (2, 'France'),
  (3, 'Italy'),
  (4, 'Spain'),
  (5, 'Israel');

insert ignore into hotel_chains values
  (0, 'Independent'),
  (1, 'Hilton'),
  (2, 'Extended Stay'),
  (3, 'NH Group'),
  (4, 'Itaca'),
  (5, 'Rimonim');

insert ignore into cities values
  (1, 'Brookfield', 1),
  (2, 'Cordoba', 4),
  (3, 'Milan', 3),
  (4, 'Paris', 2),
  (5, 'Madrid', 4),
  (6, 'Jerusalem', 5);

insert ignore into hotels values
  (1, 'Extended Stay America', 1, 2, 2),
  (2, 'Itaca Colon', 2, 4, 3),
  (3, 'N&H Milano', 3, 3, 4),
  (4, 'Opera Lafaytte', 4, 0, 3),
  (5, 'Shalom Rimonim', 6, 5, 3),
  (6, 'One Shot Prado', 5, 0, 4);
