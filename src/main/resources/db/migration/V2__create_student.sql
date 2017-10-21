CREATE TABLE student
(
id INTEGER(5) AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
username VARCHAR(20) NOT NULL,
password VARCHAR(15) NOT NULL,
gender CHAR(1),
mobile_number VARCHAR(10),
email_id VARCHAR(25),
department_id INTEGER(1),
CONSTRAINT id_pk PRIMARY KEY (id),
CONSTRAINT username_uq UNIQUE(username),
CONSTRAINT department_id_fk FOREIGN KEY (department_id) REFERENCES department(id),
CONSTRAINT department_id_cq check (department_id BETWEEN 1 AND 5)
);