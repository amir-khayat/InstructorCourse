package com.codingdojo.javaexam.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.javaexam.models.Instructor;


@Repository
public interface InstructorRepo extends CrudRepository<Instructor, Long> {

	List<Instructor> findAll();

	Optional<Instructor> findByEmail(String email);
	
}
