package com.codingdojo.javaexam.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.javaexam.models.Course;
import com.codingdojo.javaexam.models.Instructor;
import com.codingdojo.javaexam.services.CourseService;
import com.codingdojo.javaexam.services.InstructorService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class CourseController {

	@Autowired
	private InstructorService instructorServ;

	@Autowired
	private CourseService courseServ;
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {

		if (session.getAttribute("instructorID") == null) {
			return "redirect:/";
		}

		Instructor thisInstructor = instructorServ.findInstructorById((Long) session.getAttribute("instructorID"));
		model.addAttribute("instructor", thisInstructor);

		model.addAttribute("courses", courseServ.allCourses());

		return "dashboard.jsp";
	}

	@GetMapping("/create")
	public String rCreate(HttpSession session, @ModelAttribute("newCourse") Course newCourse, Model model) {

		if (session.getAttribute("instructorID") == null) {
			return "redirect:/";
		}

		Instructor thisInstructor = instructorServ.findInstructorById((Long) session.getAttribute("instructorID"));
		model.addAttribute("instructor", thisInstructor);

		return "create.jsp";
	}

	@PostMapping("/create")
	public String sCreate(@Valid @ModelAttribute("newCourse") Course newCourse, BindingResult result, Model model,
			HttpSession session) {
		if (session.getAttribute("instructorID") == null) {
			return "redirect:/";
		}
		if (result.hasErrors()) {
			Instructor thisInstructor = instructorServ.findInstructorById((Long) session.getAttribute("instructorID"));
			model.addAttribute("instructor", thisInstructor);
			return "create.jsp";
		}

		courseServ.createOrUpdate(newCourse);
		return "redirect:/dashboard";
	}

	@GetMapping("/view/{id}")
	public String viewCourse(HttpSession session, @PathVariable("id") Long id, Model model) {
		if (session.getAttribute("instructorID") == null) {
			return "redirect:/";
		}

		Instructor thisInstructor = instructorServ.findInstructorById((Long) session.getAttribute("instructorID"));
		model.addAttribute("instructor", thisInstructor);

		model.addAttribute("course", courseServ.getByID(id));
		return "view.jsp";

	}

	@GetMapping("/edit/{id}")
	public String rEdit(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("instructorID") == null) {
			return "redirect:/";
		}

		Instructor thisInstructor = instructorServ.findInstructorById((Long) session.getAttribute("instructorID"));
		model.addAttribute("instructor", thisInstructor);

		model.addAttribute("editCourse", courseServ.getByID(id));
		model.addAttribute("infoCourse", courseServ.getByID(id));

		return "edit.jsp";
	}

	@PutMapping("/update/{id}")
	public String sEdit(@Valid @ModelAttribute("editCourse") Course editCourse, BindingResult result, Model model,
			@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("instructorID") == null) {
			return "redirect:/";
		}
		if (result.hasErrors()) {
			Instructor thisInstructor = instructorServ.findInstructorById((Long) session.getAttribute("instructorID"));
			model.addAttribute("instructor", thisInstructor);
			model.addAttribute("infoCourse", courseServ.getByID(id));
			return "edit.jsp";
		}

		courseServ.createOrUpdate(editCourse);
		return "redirect:/dashboard";
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteCourse(@PathVariable("id") Long id) {
		courseServ.deleteCourse(id);
		return "redirect:/dashboard";
	}

}
