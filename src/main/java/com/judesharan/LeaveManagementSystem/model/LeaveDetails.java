package com.judesharan.LeaveManagementSystem.model;

import java.time.LocalDate;

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
@Table(name = "leave_details")
public class LeaveDetails {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	
	@Column(name = "leave_type")
	private String leaveType;

	@Column(name = "leave_reason")
	private String leaveReason;

	@Column(name = "no_of_days")
	private int noOfDays;

	@Column(name = "leave_from")
	private LocalDate leaveFrom;

	@Column(name = "leave_to")
	private LocalDate leaveTo;
}
