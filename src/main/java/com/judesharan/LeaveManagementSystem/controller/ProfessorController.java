package com.judesharan.LeaveManagementSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.judesharan.LeaveManagementSystem.model.Professor;
import com.judesharan.LeaveManagementSystem.model.Student;
import com.judesharan.LeaveManagementSystem.model.StudentLeave;
import com.judesharan.LeaveManagementSystem.service.StudentLeaveService;
import com.judesharan.LeaveManagementSystem.service.StudentService;


@Controller
@RequestMapping("/professor")
public class ProfessorController {
	private static final Logger LOGGER = Logger.getLogger(ProfessorController.class);

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private StudentLeaveService studentLeaveService;
	
	@GetMapping("/count")
	public String coutOfStudents(HttpSession session, ModelMap modelmap) {
		Professor professor = (Professor) session.getAttribute("PROFESSOR_LOGGED");
		int countOfStudents = studentService.countByDepartmentId(professor.getDepartment().getId());
		
		session.setAttribute("COUNT_OF_STUDENTS", countOfStudents);
		return "redirect:../dashboard";
	}
	
	@GetMapping("/student-list")
	public String list(HttpSession session, ModelMap modelmap) {

		Professor professor = (Professor) session.getAttribute("PROFESSOR_LOGGED");
		LOGGER.info("Entering list");
		List<Student> students = null;
		students = studentService.findByDepartmentId(professor.getDepartment().getId());
		modelmap.addAttribute("STUDENTS_LIST", students);
		
		List<StudentLeave> studentLeave = null;
		studentLeave = studentLeaveService.findByStatus("PENDING");
		modelmap.addAttribute("STUDENTS_LEAVE_LIST", studentLeave);
				
		return "students";

	}
}
