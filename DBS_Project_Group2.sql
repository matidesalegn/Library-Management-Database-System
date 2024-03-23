CREATE DATABASE OPAC;
USE OPAC;
/*
WOLAITA SODO UNIVERSITY LIBRARY - ONLINE PUBLIC ACCESS CATALOG (OPAC)
Create tables for the library management database for WSU Main Library, Natural Science Library And Social Science Library
*/

CREATE TABLE location (
  id INT,
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

CREATE TABLE reservation_status (
  id INT,
  status_value VARCHAR(50),
  CONSTRAINT pk_res_status PRIMARY KEY (id)
);

CREATE TABLE reservation (
  id INT,
  book_id INT,
  member_id INT,
  reservation_date_TIME DATETIME,
  reservation_status_id INT,
  CONSTRAINT pk_reservation PRIMARY KEY (id),
  CONSTRAINT fk_res_book FOREIGN KEY (reservation_status_id) REFERENCES reservation_status(id),
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

/*
Insertion of location tell the user which library is the book is avialable.
*/
insert into location(id, location_name)
values(1, 'Main Library');
insert into location(id, location_name)
values(2, 'Natural Science Library');
insert into location(id, location_name)
values(3, 'Social Science Library');

/*
Insertion of member status tell the librarian the status of the member.
*/
INSERT INTO `OPAC`.`member_status` (`id`, `status_value`) 
VALUES ('0', 'Inactive');
INSERT INTO `OPAC`.`member_status` (`id`, `status_value`) 
VALUES ('1', 'Active');
INSERT INTO `OPAC`.`member_status` (`id`, `status_value`) 
VALUES ('2', 'Suspended');

/*
Insertion of member can help librarian to identify if the member is legal to use the library.
*/
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('109', 'Matiwos', 'Desalegn', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('427', 'Cherinet', 'Somano', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('637', 'Ehitnesh', 'Cheklu', '0');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('428', 'Emebet', 'Bezabih', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('716', 'Aster', 'Kiros', '0');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('666', 'Samual', 'Shegnaw', '2');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('1072', 'Michael', 'Fanta', '2');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('355', 'Amanuel', 'Abebe', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('290', 'Dinksira', 'Tekle', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('232', 'Eleni', 'Asres', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('378', 'Getachew', 'Birlew', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('442', 'Gelebo', 'Gelgelo', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('445', 'Fikrab', 'Samuel', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('1058', 'Muluken', 'Tegegn', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('114', 'Naol', 'Abera', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('127', 'Tekalign', 'Fikru', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('469', 'Samual', 'Abera', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('397', 'Natnael', 'Biramo', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('1073', 'Tsegaw', 'Molla', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('410', 'Yaregal', 'Getachew', '1');
INSERT INTO `OPAC`.`member` (`id`, `first_name`, `last_name`, `active_status_id`) 
VALUES ('204', 'Yohannis', 'Mitikkee', '1');

/*
Insertion of reservation status tell the librarian if the book is reserved or not.
*/
INSERT INTO `OPAC`.`reservation_status` (`id`, `status_value`) 
VALUES ('0', 'Not Reserved');
INSERT INTO `OPAC`.`reservation_status` (`id`, `status_value`) 
VALUES ('1', 'Reserved');

/*
Insertion of the book avialable to the user by thier ISBN, titile, publication date
Insertion of copies avialable
*/
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0072485558', 'Using information technology', '1', '2003-01-27', '6');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0203935845', 'Advanced soil mechanics', '1', '2008-11-19', '11');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1133608426', 'Data structures and algorithms in C++', '1', '2013-05-11', '10');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0471720704', 'Partial differential equations and the finite element method', '1', '2006-08-27', '10');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0471915335', 'Statistical Physics', '1', '1993-01-17', '2');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('817488344', 'FUNDAMENTALS OF OPTICS', '1', '1996-12-11', '1');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('15667063', 'Environmental Chemistry ', '1', '2005-03-19', '8');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('817622194', 'Dairy farm business management', '1', '2008-02-08', '9');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('813180062', 'principles of Biotechnology  ', '1', '2007-11-29', '1');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('817473359', 'Strategic management', '1', '2006-01-13', '9');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0072865512', '	Object-oriented and classical software engineering', '2', '2005-05-23', '11');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('812652451', '	Highway Engineering', '2', '2004-12-21', '10');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0070598541', 'Design of Concrete structure', '2', '2005-05-17', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0072472413', 'Microsoft Excel 2002', '2', '2002-09-03', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0471720705', 'Introduction to UNIX  ', '2', '2003-07-24', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0262031418', 'Introduction to algorithms', '2', '1990-05-11', '3');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0072230975', 'Introduction to Windows Server 2003  ', '2', '2005-11-07', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('812031912', 'INTRODUCTION TO COMPUTER  ', '2', '2003-02-19', '7');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0072930543', 'College keyboarding and document processing for windows  ', '2', '2005-01-27', '5');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0321210263', 'Software engineering', '2', '2004-12-11', '1');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1584883723', 'Handbook of Computational Group Theory', '2', '2005-05-17', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('812031902', '	RENEWABLE ENERGY SOURCES AND THEIR ENVIRONMENTAL IMPACT', '3', '2001-08-09', '1');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('813150386', 'Introduction to Health Psychology', '3', '2007-06-25', '14');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('812030709', 'Handbook of Materials Management  ', '3', '1994-11-03', '4');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0205523668', 'Creating literacy instruction for all students', '3', '2008-04-29', '10');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0631220038', 'Economic development and the division of labor', '3', '2003-03-21', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0761919716', 'Qualitative research and evaluation methods', '3', '2002-09-16', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1569020507', 'Constitution for a nation of nations', '3', '1997-01-11', '2');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('818785341', 'Total Wealth', '3', '0000-00-00', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0072830085', 'Cost management', '3', '2006-10-12', '1');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0262031411', 'Mentoring-coaching', '3', '2007-12-17', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0766801799', 'Electrical wiring', '1', '1999-11-27', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1435483820', 'Careers as an electrician', '1', '1993-07-24', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('143548382', 'Heavy duty truck systems', '1', '2011-01-11', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1578088054', 'Artificial intelligence in power system optimization', '1', '2013-11-21', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0852243774', 'Advanced computer Chess 2', '1', '1980-05-27', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('039082366', 'Electrical and Computer Engineering', '1', '2008-12-23', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1121086144', 'Electrical circuits', '1', '2013-11-19', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('812653613', 'Basic Electrical Engineering', '1', '2013-11-19', '2');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0849392632', 'Introduction to materials science and engineering', '1', '2007-07-08', '5');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('935014068', 'Fundamentals of electrical engineering', '1', '2010-01-29', '1');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('818845814', 'Electrical machines', '1', '2011-01-13', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('813175456', 'Basic Electrical and Electronics Engineering', '1', '2012-06-18', '7');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('007248555', 'Using information technology', '1', '2003-04-13', '6');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('11336084', 'Data structures and algorithms in C++', '1', '2013-02-12', '10');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0619217588', 'A+ guide to managing and maintaining your PC', '1', '2007-12-03', '6');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('007282350', 'Database design, application development, and administration', '1', '2004-01-30', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1118504224', 'Big data for dummies', '1', '2003-11-20', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1111969604', 'Database systems', '1', '2013-07-12', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('1598632124', 'SQL power', '1', '2007-04-07', '0');
INSERT INTO `opac`.`book` (`id`, `title`, `location_id`, `publication_date`, `copies_owned`) 
VALUES ('0672313081', '	SAMS teach yourself database programming with Visual Basic 6 in 21 days', '1', '1999-08-31', '0');

/*
Insertion of author of the book to help user search book by author name.
*/
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('1', 'Williams', ',Brian');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('2', 'Das', ', Braja M');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('3', 'Drozdek', ', Adam');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('4', 'Šolin', ', Pavel');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('5', 'Mandl', ', E.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('6', 'ANMOL ', ', .');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('7', 'Manahan ', ', Stanley E.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('8', 'Rao. .', 'Venkateshwara P');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('9', 'none', 'none');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('10', 'Singh', ', S.P');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('11', 'Schach.', ', Stephen R');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('12', 'Wright', ', Paul H.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('13', 'Nilson.', ', Arthur H');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('14', 'none', 'none');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('15', 'Cormen.', ', Thomas H');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('16', 'none', 'none');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('17', 'Mc Graw', ' Hil');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('18', 'ZIMMERIY', 'none');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('19', ' Sommerville', ', Ian.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('20', 'Holt.', ', Derek F');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('21', 'Abbasi', ', S.A.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('22', 'Brannon', ', Linda');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('23', 'PHL', '.plc');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('24', 'Gunning.', ', Thomas G');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('25', 'Yang.', ', Xiaokai');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('26', ' Patton, Michael ', 'Quinn.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('27', 'Nahum', ', Fasil.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('28', 'Mukerji\'s', ' sanjoy.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('29', 'Hilton', ', Ronald W.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('30', 'Pask', ', Roger.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('31', 'Mullin', ', Ray C.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('32', 'Lytle,', 'Elizabeth Stewart');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('33', 'Bennett', ', Sean.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('34', 'Ongsakul', ', Weerakorn.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('35', 'Clarke,', 'M.R.B.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('36', 'Cathey', ', Jim');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('37', 'Hanson', ', George');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('38', 'Jena,', ' Debashisha');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('39', 'Chung,', ' Yip-wah,');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('40', 'Singh', ', Tarlok');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('41', 'Gupta,', 'J.B.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('42', 'Bhattacharya,', 'S.K.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('43', ' Williams,', 'Brian K.,');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('44', ' Drozdek,', ' Adam.,');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('45', 'Andrews,', 'Jean');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('46', 'Mannino,', 'Michael V.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('47', 'Hurwitz,', 'Judith.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('48', 'Coronel,', ' Carlos');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('49', 'Hess', 'Kenneth.');
INSERT INTO `opac`.`author` (`id`, `first_name`, `last_name`) 
VALUES ('50', 'Smith,', 'Curtis');

/*
Insertion of reservation help the user to reserve book.
*/
INSERT INTO `opac`.`reservation` (`id`, `book_id`, `member_id`, `reservation_date_time`, `reservation_status_id`) 
VALUES ('1', '0471915335', '427', '2022-08-02 22:30:00', '1');
INSERT INTO `opac`.`reservation` (`id`, `book_id`, `member_id`, `reservation_date_time`, `reservation_status_id`) 
VALUES ('2', '1598632124', '109', '2022-02-13 22:30:00', '1');
INSERT INTO `opac`.`reservation` (`id`, `book_id`, `member_id`, `reservation_date_time`, `reservation_status_id`) 
VALUES ('3', '1111969604', '637', '2022-02-14 23:30:00', '1');

/*
Insertion of loan help the user to loan book for sometime.
*/
INSERT INTO `opac`.`loan` (`id`, `book_id`, `member_id`, `loan_date_time`, `returned_date_time`) 
VALUES ('1', '471720704', '716', '2022-08-02 20:00:00', '2022-02-12 21:00:00');
INSERT INTO `opac`.`loan` (`id`, `book_id`, `member_id`, `loan_date_time`, `returned_date_time`) 
VALUES ('2', '0471720704', '109', '2022-08-02 20:00:00', '2022-02-12 21:00:00');
INSERT INTO `opac`.`loan` (`id`, `book_id`, `member_id`, `loan_date_time`, `returned_date_time`) 
VALUES ('3', '1598632124', '637', '2022-02-13 20:30:00', '2022-02-13 21:30:00');
INSERT INTO `opac`.`loan` (`id`, `book_id`, `member_id`, `loan_date_time`, `returned_date_time`) 
VALUES ('4', '1111969604', '109', '2022-02-15 22:30:00', '2022-02-15 23:30:00');

/*
Insertion of fine help to fine user that did not return the book on time.
*/
INSERT INTO `opac`.`fine` (`id`, `book_id`, `loan_id`, `fine_date`) 
VALUES ('1', '471720704', '1', '2022-02-15');
INSERT INTO `opac`.`fine` (`id`, `book_id`, `loan_id`, `fine_date`) 
VALUES ('2', '0471720704', '2', '2022-02-15');
INSERT INTO `opac`.`fine` (`id`, `book_id`, `loan_id`, `fine_date`) 
VALUES ('3', '1598632124', '3', '2022-02-16');
INSERT INTO `opac`.`fine` (`id`, `book_id`, `loan_id`, `fine_date`) 
VALUES ('4', '1111969604', '4', '2022-02-18');

/*
Insertion of fine_penality help to fine user that did not return the book on time for three days.
*/
INSERT INTO `opac`.`fine_penality` (`id`, `member_id`, `penality_date`) 
VALUES ('1', '716', '2022-02-15');
INSERT INTO `opac`.`fine_penality` (`id`, `member_id`, `penality_date`) 
VALUES ('2', '109', '2022-02-15');
INSERT INTO `opac`.`fine_penality` (`id`, `member_id`, `penality_date`) 
VALUES ('3', '637', '2022-02-16');
INSERT INTO `opac`.`fine_penality` (`id`, `member_id`, `penality_date`) 
VALUES ('4', '109', '2022-02-18');
SHOW TABLES;
DESCRIBE book_author;
SELECT * FROM opac.book;
SELECT * FROM opac.author;
SELECT * FROM opac.book_author;
SELECT * FROM opac.fine;
SELECT * FROM opac.fine_penality;
SELECT * FROM opac.loan;
SELECT * FROM opac.location;
SELECT * FROM opac.member;
SELECT * FROM opac.member_status;
SELECT * FROM opac.reservation;
SELECT * FROM opac.reservation_status;
SELECT title,publication_date FROM opac.book;
SELECT first_name,last_name FROM opac.author;
SELECT * FROM opac.author
where first_name='Williams';
SELECT * FROM opac.location
where location_name='Natural Science library';
SELECT * FROM opac.book
where title='Statistical Physics';
SELECT * FROM opac.book
where publication_date='2003-04-13';
SELECT * FROM opac.book
where id='7248555';
SELECT * FROM opac.book
where location_id='2';