package com.judesharan.LeaveManagementSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class HomeController {
	@GetMapping
	public String showHomePage() {
		return "home";
	}
	
	@GetMapping("/dashboard")
	public String showDashboard(){
		return "dashboard";
	}
}
