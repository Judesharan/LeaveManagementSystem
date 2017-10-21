CREATE TABLE professor
(
id INTEGER AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
username VARCHAR(30) NOT NULL,
password VARCHAR(15) UNIQUE NOT NULL,
gender CHAR(1),
mobile_number VARCHAR(10),
email_id VARCHAR(25),
department_id INTEGER(1),
CONSTRAINT id_pk PRIMARY KEY (id),
CONSTRAINT username_uq UNIQUE(username),
CONSTRAINT p_department_id_fk FOREIGN KEY (department_id) REFERENCES department(id),
CONSTRAINT p_department_id_cq CHECK ( department_id BETWEEN 1 AND 5)
);