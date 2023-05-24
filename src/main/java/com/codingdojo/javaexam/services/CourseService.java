package com.codingdojo.javaexam.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.javaexam.models.Course;
import com.codingdojo.javaexam.repositories.CourseRepo;


@Service
public class CourseService {
	@Autowired
	private CourseRepo courseRepo;

	public List<Course> allCourses(){
		return courseRepo.findAll();
	}

	public Course getByID(Long id) {
		return this.courseRepo.findById(id).orElse(null);
	}

	public Course createOrUpdate(Course course) {
		return courseRepo.save(course);
	}

	public void deleteCourse(Long id) {
		courseRepo.deleteById(id);
	}

}
