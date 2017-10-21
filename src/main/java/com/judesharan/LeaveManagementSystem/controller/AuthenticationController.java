package com.judesharan.LeaveManagementSystem.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.judesharan.LeaveManagementSystem.model.Department;
import com.judesharan.LeaveManagementSystem.model.Professor;
import com.judesharan.LeaveManagementSystem.model.Student;
import com.judesharan.LeaveManagementSystem.service.ProfessorService;
import com.judesharan.LeaveManagementSystem.service.StudentService;

@Controller
@RequestMapping("auth")
public class AuthenticationController {

	private static final Logger LOGGER = Logger.getLogger(AuthenticationController.class);

	@Autowired
	private StudentService studentService;

	@Autowired
	private ProfessorService professorService;

	@PostMapping("/login")
	public String login(@RequestParam("role") int role, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession session) {

		LOGGER.info("Entering Login " + username + "-" + password);
		if (role == 1) {
			Student student = studentService.findByUserNameAndPassword(username, password);
			LOGGER.info("Student: " + student);
			if (student != null) {
				session.setAttribute("STUDENT_LOGGED", student);
				LOGGER.info("Login Success");
				return "redirect:../leave/leavePercentage";
			} else {
				LOGGER.error("Login Failure");
				return "home";
			}
		} else {
			Professor professor = professorService.findByUserNameAndPassword(username, password);
			LOGGER.info("Professor: " + professor);
			if (professor != null) {
				session.setAttribute("PROFESSOR_LOGGED", professor);
				LOGGER.info("Login Success");
				return "redirect:../professor/count";
			} else {
				LOGGER.error("Login Failure");
				return "home";
			}
		}
	}

	@GetMapping("/register")
	public String register() {
		return "register";
	}

	@PostMapping("/register")
	public String register(@RequestParam("name") String name, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("gender") char gender,
			@RequestParam("mobileNumber") String mobileNumber, @RequestParam("emailId") String emailId,
			@RequestParam("departmentId") int departmentId, @RequestParam("role") int role) {

		Department department = new Department();
		department.setId(departmentId);

		if (role == 1) {
			Student student = new Student();
			student.setName(name);
			student.setUsername(username);
			student.setPassword(password);
			student.setGender(gender);
			student.setMobileNumber(mobileNumber);
			student.setEmailId(emailId);
			student.setDepartment(department);
			studentService.register(student);
		} else {
			Professor professor = new Professor();
			department.setId(departmentId);
			professor.setName(name);
			professor.setUsername(username);
			professor.setPassword(password);
			professor.setGender(gender);
			professor.setMobileNumber(mobileNumber);
			professor.setEmailId(emailId);
			professor.setDepartment(department);
			professorService.register(professor);
		}
		return "redirect:../";

	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}