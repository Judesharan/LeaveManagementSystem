package com.judesharan.LeaveManagementSystem.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.judesharan.LeaveManagementSystem.model.LeaveDetails;
import com.judesharan.LeaveManagementSystem.model.Student;
import com.judesharan.LeaveManagementSystem.model.StudentLeave;
import com.judesharan.LeaveManagementSystem.service.LeaveDetailsService;
import com.judesharan.LeaveManagementSystem.service.StudentLeaveService;

@Controller
@RequestMapping("/leaveDetails")
public class LeaveDetailsController {
	
	private static final Logger LOGGER = Logger.getLogger(LeaveDetailsController.class);
	
	@Autowired
	private LeaveDetailsService leaveDetailsService;
	
	@Autowired
	private StudentLeaveService studentLeaveService;
	
	@PostMapping("/applyLeave")
	public String leaveDetails(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("leave-type") String leaveType, @RequestParam("leave-reason") String leaveReason,
			@RequestParam("no-of-days") int noOfDays, @RequestParam("leave-from") String leaveFrom,
			@RequestParam("leave-to") String leaveTo, HttpSession session) {

		Student student = (Student) session.getAttribute("STUDENT_LOGGED");
		LeaveDetails leaveDetails = new LeaveDetails();
		leaveDetails.setStudent(student);
		leaveDetails.setNoOfDays(noOfDays);
		leaveDetails.setLeaveFrom(LocalDate.parse(leaveFrom));
		leaveDetails.setLeaveReason(leaveReason);
		leaveDetails.setLeaveTo(LocalDate.parse(leaveTo));
		leaveDetails.setLeaveType(leaveType);

		leaveDetails = leaveDetailsService.register(leaveDetails);
		LOGGER.info("Leave Details: " + leaveDetails.toString());

		StudentLeave studentLeave = new StudentLeave();
		studentLeave.setLeaveDetails(leaveDetails);
		studentLeave.setNoOfDays(noOfDays);
		studentLeave.setStudent(student);
		studentLeave.setStatus("PENDING");

		studentLeave = studentLeaveService.register(studentLeave);
		LOGGER.info("Student Leave: " + studentLeave.toString());

		return "/dashboard";
	}
}
