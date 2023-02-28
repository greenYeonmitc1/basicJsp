package kr.basic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @ 어노테이션 : 특별한 기능(메서드)을 하는 기호 
// jsp -> java 
@WebServlet("/login.do")
public class LoginAction extends HttpServlet{

	// form method='get' method='post' url=~ > 'get'방식 
	
	// 서비스 -> get 방식 post방식 둘다 처리를 해주는 메서드 
	
	// 요청 -> 쓰레드가 만들어지고 main 쓰레드에서 request, respone 객체를 인자값으로 넘겨옴 
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String dbid="qwer";
		String dbpw="1234";

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String msg="";
		if(id.equals(dbid)&& pw.equals(dbpw)){
			msg="로그인 성공";
			
		}else{
			msg="로그인 실패";
		}

		System.out.println(msg);
		// request.getParameter("변수이름"); -> String 저장 : URL, form input data 
		
		// request.setAttribute -> Object 저장 : 업케스팅 : 우리가 원하는 어떤 데이터타입이든 
		// session.setAttribute 
		
		// java -> jsp 
		request.setAttribute("msg", msg);
		
		// 새로운 페이지 /08_mvc2login/loginPro.jsp 에서 이미 만들어진 request,response 객체를 넘겨줌 
		//  RequestDispatcher 클래스안에 forward 메서드 통해서  
		RequestDispatcher dis = request.getRequestDispatcher("/08_mvc2login/loginPro.jsp");
		dis.forward(request, response);
		
	}

	// 상속 -> 부모 메서드를 오버라이딩 
	
}
