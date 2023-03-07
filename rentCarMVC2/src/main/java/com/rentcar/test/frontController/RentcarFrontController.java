package com.rentcar.test.frontController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentcar.test.controller.Controller;


@WebServlet("*.do")
public class RentcarFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String url=request.getRequestURI();
		System.out.println("url=" + url); 
		String ctx=request.getContextPath();
		String command=url.substring(ctx.length());
		System.out.println("command=" + command); 
		Controller controller=null;
		String nextPage=null;
	    HandlerMapping mapping=new HandlerMapping();
	    controller=mapping.getController(command);
	    
	    nextPage=controller.requestHandler(request, response);

	
		if(nextPage!=null) {
			if(nextPage.indexOf("redirect:")!=-1) {
				response.sendRedirect(nextPage.split(":")[1]); 
			}else {
				RequestDispatcher rd=request.getRequestDispatcher(ViewResolver.makeView(nextPage)); 
				rd.forward(request, response);
			}
		}		
	}
}
