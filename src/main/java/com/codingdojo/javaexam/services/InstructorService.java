package com.codingdojo.javaexam.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.javaexam.models.Instructor;
import com.codingdojo.javaexam.models.LoginInstructor;
import com.codingdojo.javaexam.repositories.InstructorRepo;

@Service
public class InstructorService {

	@Autowired
	private InstructorRepo instructorRepo;

	public List<Instructor> allItems() {
		return instructorRepo.findAll();
	}

	public Instructor createOrUpdate(Instructor Instructor) {
		return instructorRepo.save(Instructor);
	}

	public Instructor findInstructorById(long id) {
		return instructorRepo.findById(id).orElse(null);
	}

	public void deleteItem(Long id) {
		instructorRepo.deleteById(id);
	}

	public Instructor register(Instructor newInstructor, BindingResult result) {

		Optional<Instructor> potentialInstructor = instructorRepo.findByEmail(newInstructor.getEmail());

		if (potentialInstructor.isPresent()) {
			result.rejectValue("email", "Matches", "Email already exists");
		}

		if (!newInstructor.getPassword().equals(newInstructor.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password");
		}

		if (result.hasErrors()) {
			return null;
		}

		String hashed = BCrypt.hashpw(newInstructor.getPassword(), BCrypt.gensalt());
		newInstructor.setPassword(hashed);

		return createOrUpdate(newInstructor);
	}

	public Instructor login(LoginInstructor newLogin, BindingResult result) {

		Optional<Instructor> potentialInstructor = instructorRepo.findByEmail(newLogin.getEmail());

		if (!potentialInstructor.isPresent()) {
			result.rejectValue("email", "Matches", "Invalid Email/Password");
			return null;
		}

		Instructor thisInstructor = potentialInstructor.get();

		if (!BCrypt.checkpw(newLogin.getPassword(), thisInstructor.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Email/Password");
		}

		if (result.hasErrors()) {
			return null;
		}

		return thisInstructor;
	}
}
