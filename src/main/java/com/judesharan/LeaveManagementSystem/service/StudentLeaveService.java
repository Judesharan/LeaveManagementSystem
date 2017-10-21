package com.judesharan.LeaveManagementSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.judesharan.LeaveManagementSystem.model.StudentLeave;
import com.judesharan.LeaveManagementSystem.repository.StudentLeaveRepository;



@Service
public class StudentLeaveService {
	@Autowired
	private StudentLeaveRepository studentLeaveRepository;
	
	public StudentLeave register(StudentLeave leavedetails) {
		return studentLeaveRepository.save(leavedetails);
	}
	
	public List<StudentLeave> findByStatus(String status) {
		return studentLeaveRepository.findByStatus(status);
	}
	
	public StudentLeave findById(int id) {
		return studentLeaveRepository.findById(id);
	}
	
	public List<StudentLeave> findByStudent(int studentId) {
		return studentLeaveRepository.findByStudent(studentId);
	}
	
	public int findNoOfDaysAbsent(int studentId) {
		return studentLeaveRepository.findNoOfDaysAbsent(studentId);
	}
}
