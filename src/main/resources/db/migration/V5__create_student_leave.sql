CREATE TABLE student_leave
(
id INTEGER AUTO_INCREMENT,
leave_details_id int,
no_of_days INTEGER(3),
student_id INTEGER,
professor_id INTEGER,
status VARCHAR(15),
CONSTRAINT id_pk PRIMARY KEY (id),
CONSTRAINT leave_details_id_fk FOREIGN KEY (leave_details_id) REFERENCES leave_details(id),
CONSTRAINT student_id_fk FOREIGN KEY (student_id) REFERENCES student(id),
CONSTRAINT professor_id_fk FOREIGN KEY (professor_id) REFERENCES professor(id)
);