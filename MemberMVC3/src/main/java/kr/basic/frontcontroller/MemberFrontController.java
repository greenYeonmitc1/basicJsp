package kr.basic.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.controller.Controller;


@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String url=request.getRequestURI();	// 실제 사용자가 요청한 경로 
		String ctx=request.getContextPath(); // 프로젝트 이름: sever -> server.xml <Context> path="여기이름"
		// 실제로 요청한 명령이 무엇이지 파악
		System.out.println("URL : " + url); // /MemberMVC3/memberList.do
		String command=url.substring(ctx.length());
		System.out.println("command:" + command); // /memberInsert.do --> HashMap : key값 
		Controller controller=null;
		String nextPage=null;
		// 핸들러매핑->HandlerMapping
	    HandlerMapping mapping=new HandlerMapping();
	    controller=mapping.getController(command);
	    nextPage=controller.requestHandler(request, response); // pojo 에서 기능처리가 끝나면 다음페이지 정보 리턴 
		// forward, redirect
	    
		if(nextPage!=null) {
			if(nextPage.indexOf("redirect:")!=-1) {
				//            redirect:/MemberMVC3/memberList.do
				response.sendRedirect(nextPage.split(":")[1]); // /MemberMVC3/memberList.do
			}else {
				RequestDispatcher rd=request.getRequestDispatcher(ViewResolver.makeView(nextPage)); // forward
				rd.forward(request, response);
			}
		}		
	}
}
