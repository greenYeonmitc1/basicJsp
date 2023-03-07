package com.rentcar.test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rentcar.test.frontController.ViewResolver;

public class MainController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String center ="main";
		if(request.getParameter("center")!= null) {
			    center = request.getParameter("center");   
		}

		return center; 
	}

}
