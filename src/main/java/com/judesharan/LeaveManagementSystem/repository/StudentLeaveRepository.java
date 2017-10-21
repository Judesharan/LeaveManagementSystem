package com.judesharan.LeaveManagementSystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.judesharan.LeaveManagementSystem.model.StudentLeave;

public interface StudentLeaveRepository extends JpaRepository<StudentLeave, Integer> {
	
	@Query(value = "select * from student_leave where status=?1", nativeQuery = true)
	public List<StudentLeave> findByStatus(String status);
	
	@Query(value = "select * from student_leave where id=?1", nativeQuery = true)
	public StudentLeave findById(int id);
	
	@Query(value = "select * from student_leave where student_id=?1", nativeQuery = true)
	public List<StudentLeave> findByStudent(int studentId);
	
	@Query(value = "select sum(no_of_days) from student_leave where student_id=?1 and status='APPROVED'", nativeQuery = true)
	public int findNoOfDaysAbsent(int studentId);
}
