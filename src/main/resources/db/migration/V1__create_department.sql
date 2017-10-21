CREATE TABLE department
(
id INTEGER(5) AUTO_INCREMENT,
name VARCHAR(10) NOT NULL,
CONSTRAINT id_pk PRIMARY KEY ( id ),
CONSTRAINT name_cq CHECK ( name IN ('civil', 'cse', 'ece', 'eee' , 'mech'))
);

INSERT INTO department(id, name) VALUES
(
1,
'civil'
);

INSERT INTO department(id, name) VALUES
(
2,
'cse'
);

INSERT INTO department(id, name) VALUES
(
3,
'ece'	
);

INSERT INTO department(id, name) VALUES
(
4,
'eee'
);

INSERT INTO department(id, name) VALUES
(
5,
'mech'
);