package com.judesharan.LeaveManagementSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.judesharan.LeaveManagementSystem.model.Professor;
import com.judesharan.LeaveManagementSystem.repository.ProfessorRepository;

@Service
public class ProfessorService {
	@Autowired
	private ProfessorRepository professorRepository;

	public Professor findByUserNameAndPassword(String username, String password) {
		return professorRepository.findByUserNameAndPassword(username, password);
	}

	public Professor findByUserName(String username) {
		return professorRepository.findByUserName(username);
	}

	public Professor register(Professor professor) {
		return professorRepository.save(professor);
	}

	public List<Professor> findAll() {
		return professorRepository.findAll();
	}

	public Professor findOne(int id) {
		return professorRepository.findOne(id);
	}

	public Professor updatePassword(Professor professor) {
		return professorRepository.save(professor);
	}
}
