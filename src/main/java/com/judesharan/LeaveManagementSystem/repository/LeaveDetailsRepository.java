package com.judesharan.LeaveManagementSystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.judesharan.LeaveManagementSystem.model.LeaveDetails;

public interface LeaveDetailsRepository extends JpaRepository<LeaveDetails, Integer> {

}
