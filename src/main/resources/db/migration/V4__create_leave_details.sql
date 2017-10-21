CREATE TABLE leave_details
(
id INTEGER AUTO_INCREMENT,
student_id INTEGER,
leave_type VARCHAR(7) NOT NULL,
leave_reason VARCHAR(200) NOT NULL,
no_of_days INTEGER(3),
leave_from DATE,
leave_to DATE,
CONSTRAINT id_pk PRIMARY KEY(id),
CONSTRAINT student_id_fky FOREIGN KEY (student_id) REFERENCES student(id)
);
