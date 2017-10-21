package com.judesharan.LeaveManagementSystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.judesharan.LeaveManagementSystem.model.LeaveDetails;
import com.judesharan.LeaveManagementSystem.repository.LeaveDetailsRepository;

@Service
public class LeaveDetailsService {
	@Autowired
	private LeaveDetailsRepository leaveDetailsRepository;
	
	public LeaveDetails register(LeaveDetails leavedetails) {
		return leaveDetailsRepository.save(leavedetails);
	}
}