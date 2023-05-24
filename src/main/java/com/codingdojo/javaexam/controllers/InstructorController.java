package com.codingdojo.javaexam.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.javaexam.models.Instructor;
import com.codingdojo.javaexam.models.LoginInstructor;
import com.codingdojo.javaexam.services.InstructorService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class InstructorController {

	@Autowired
	private InstructorService instructorServ;

//	DONE
	
	@GetMapping("/")
	public String rPage(@ModelAttribute("newInstructor") Instructor newInstructor, @ModelAttribute("newLogin") LoginInstructor newLogin) {
		return "loginRegistration.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newInstructor") Instructor newInstructor, BindingResult result, Model model,
			HttpSession session) {

		Instructor thisInstructor = instructorServ.register(newInstructor, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginInstructor());
			return "loginRegistration.jsp";
		}

		session.setAttribute("instructorID", thisInstructor.getId());
		return "redirect:/dashboard";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginInstructor newLogin, BindingResult result, Model model,
			HttpSession session) {

		Instructor thisInstructor = instructorServ.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newInstructor", new Instructor());
			return "loginRegistration.jsp";
		}

		session.setAttribute("instructorID", thisInstructor.getId());

		return "redirect:/dashboard";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
