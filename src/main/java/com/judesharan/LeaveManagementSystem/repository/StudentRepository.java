package com.judesharan.LeaveManagementSystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.judesharan.LeaveManagementSystem.model.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {

	@Query(value = "select * from student where username=?1 and password=?2", nativeQuery = true)
	public Student findByUserNameAndPassword(String username, String password);

	@Query(value = "select * from student where username=?1", nativeQuery = true)
	public Student findByUserName(String username);
	
	@Query(value = "select * from student where department_id=?1", nativeQuery = true)
	public List<Student> findByDepartment(int departmentId);

	@Query(value = "select count(id) from student where department_id=?1", nativeQuery = true)
	public int countByDepartmentId(int departmentId);
}
