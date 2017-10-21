package com.judesharan.LeaveManagementSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.judesharan.LeaveManagementSystem.model.Professor;
import com.judesharan.LeaveManagementSystem.model.Student;
import com.judesharan.LeaveManagementSystem.model.StudentLeave;
import com.judesharan.LeaveManagementSystem.service.StudentLeaveService;

@Controller
@RequestMapping("/leave")
public class LeaveController {

	@Autowired
	private StudentLeaveService studentLeaveService;

	@GetMapping
	public String showLeave(HttpSession session, ModelMap modelMap) {
		
		Student student = (Student) session.getAttribute("STUDENT_LOGGED");
		List<StudentLeave> myLeave = studentLeaveService.findByStudent(student.getId());
		
		modelMap.addAttribute("MY_LEAVE_LIST", myLeave);
		return "leave";
	}

	@GetMapping("/leavePercentage")
	public String getLeavePercentage(HttpSession session, ModelMap modelMap){
		Student student = (Student) session.getAttribute("STUDENT_LOGGED");
		
		int noOfDaysAbsent = studentLeaveService.findNoOfDaysAbsent(student.getId());
		
		int totalNoOfDays = 45;
		int leavePercentage = (((totalNoOfDays - noOfDaysAbsent) * 100) / totalNoOfDays);

		session.setAttribute("MY_LEAVE_PERCENTAGE", leavePercentage);
		return "redirect:../dashboard";
	}
	
	@PostMapping("/approval")
	public String updateStatus(@RequestParam("id") int id, @RequestParam("status") String status, HttpSession session)
	{
		
		Professor professor = (Professor) session.getAttribute("PROFESSOR_LOGGED");
		StudentLeave studentLeave = studentLeaveService.findById(id);
		studentLeave.setProfessor(professor);
		studentLeave.setStatus(status);
		
		studentLeaveService.register(studentLeave);
		
		return "dashboard";
	}
}