Create database OPAC;
use OPAC;
/*
Create tables for the library management database for WSU Main Library, Natural Science Library And Social Science Library
*/

CREATE TABLE location (
  id int,
  location_name VARCHAR(100),
  CONSTRAINT pk_location PRIMARY KEY (id)
);
CREATE TABLE book (
  id INT,
  title VARCHAR(500),
  location_id INT,
  publication_date DATE,
  copies_owned INT,
  CONSTRAINT pk_book PRIMARY KEY (id),
  CONSTRAINT fk_book_location FOREIGN KEY (location_id) REFERENCES location(id)
);
CREATE TABLE author (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  CONSTRAINT pk_author PRIMARY KEY (id)
);
CREATE TABLE book_author (
  book_id INT,
  author_id INT,
  CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES author(id)
);
CREATE TABLE reservation_status (
  id INT,
  status_value VARCHAR(50),
  CONSTRAINT pk_res_status PRIMARY KEY (id)
);
CREATE TABLE member_status (
  id INT,
  status_value VARCHAR(50),
  CONSTRAINT pk_memberstatus PRIMARY KEY (id)
);
CREATE TABLE member (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  active_status_id INT,
  CONSTRAINT pk_member PRIMARY KEY (id),
  CONSTRAINT fk_member_status FOREIGN KEY (active_status_id) REFERENCES member_status(id)
);
CREATE TABLE reservation (
  id INT,
  book_id INT,
  member_id INT,
  reservation_date_time DATETIME,
  reservation_status_id INT,
  CONSTRAINT pk_reservation PRIMARY KEY (id),
  CONSTRAINT fk_res_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_res_member FOREIGN KEY (member_id) REFERENCES member(id)
);
CREATE TABLE fine_penality (
  id INT,
  member_id INT,
  penality_date DATE,
  CONSTRAINT pk_fine_penality PRIMARY KEY (id),
  CONSTRAINT fk_finepen_member FOREIGN KEY (member_id) REFERENCES member(id)
);
CREATE TABLE loan (
  id INT,
  book_id INT,
  member_id INT,
  loan_date_time DATETIME,
  returned_date_time DATETIME,
  CONSTRAINT pk_loan PRIMARY KEY (id),
  CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES member(id)
);
CREATE TABLE fine (
  id INT,
  book_id INT,
  loan_id INT,
  fine_date DATE,
  CONSTRAINT pk_fine PRIMARY KEY (id),
  CONSTRAINT fk_fine_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_fine_loan FOREIGN KEY (loan_id) REFERENCES loan(id)
);
insert into location(id, location_name)
values(1, 'Main Library');
insert into location(id, location_name)
values(2, 'Natural Science Library');
insert into location(id, location_name)
values(3, 'Social Science Library');
INSERT INTO `OPAC`.`member_status` (`id`, `status_value`) 
VALUES ('0', 'Inactive');
INSERT INTO `OPAC`.`member_status` (`id`, `status_value`) 
VALUES ('1', 'Active');
INSERT INTO `OPAC`.`member_status` (`id`, `status_value`) 
VALUES ('2', 'Suspended');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('109', 'Matiwos', 'Desalegn', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('427', 'Cherinet', 'Somano', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('637', 'Ehitnesh', 'Cheklu', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('428', 'Emebet', 'Bezabih', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('716', 'Aster', 'Kiros', '0');
INSERT INTO `library`.`reservation_status` (`id`, `status_value`) 
VALUES ('0', 'Not Reserved');
INSERT INTO `library`.`reservation_status` (`id`, `status_value`) 
VALUES ('1', 'Reserved');
insert into book(id, title, category_id, publication_date, copies_owned)
values();
insert into author(id, first_name, last_name)
values();
insert into book_author(book_id, author_id)
values();