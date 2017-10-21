package com.judesharan.LeaveManagementSystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.judesharan.LeaveManagementSystem.model.Professor;

public interface ProfessorRepository extends JpaRepository<Professor, Integer> {
	@Query(value = "select * from professor where username=?1 and password=?2", nativeQuery = true)
	public Professor findByUserNameAndPassword(String username, String password);

	@Query(value = "select * from professor where username=?1", nativeQuery = true)
	public Professor findByUserName(String username);

}
