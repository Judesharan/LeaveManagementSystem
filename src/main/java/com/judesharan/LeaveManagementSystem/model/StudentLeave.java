package com.judesharan.LeaveManagementSystem.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "student_leave")
public class StudentLeave {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@ManyToOne
	@JoinColumn(name="leave_details_id")
	private LeaveDetails leaveDetails;
	
	@Column(name = "no_of_days")
	private int noOfDays;

	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	
	@ManyToOne
	@JoinColumn(name = "professor_id")
	private Professor professor;
	
	@Column(name = "status")
	private String status;
	
}
