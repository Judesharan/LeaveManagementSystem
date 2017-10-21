package com.judesharan.LeaveManagementSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.judesharan.LeaveManagementSystem.model.Student;
import com.judesharan.LeaveManagementSystem.repository.StudentRepository;

@Service
public class StudentService {

	@Autowired
	private StudentRepository studentRepository;

	public Student findByUserNameAndPassword(String username, String password) {
		return studentRepository.findByUserNameAndPassword(username, password);
	}

	public Student findByUserName(String username) {
		return studentRepository.findByUserName(username);
	}

	public Student register(Student student) {
		return studentRepository.save(student);
	}

	public List<Student> findByDepartmentId(int departmentId) {
		return studentRepository.findByDepartment(departmentId);
	}
	
	public int countByDepartmentId(int departmentId) {
		return studentRepository.countByDepartmentId(departmentId);
	}

}
