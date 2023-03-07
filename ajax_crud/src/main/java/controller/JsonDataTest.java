package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.MemberDAO;
import member.MemberVO;

@WebServlet("/jsonDataTest.do")
public class JsonDataTest extends HttpServlet {
	//ajax가 실행되고 서블릿으로 요청이 온다.
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		 //text/html는 응답데이터가 html일때를 말한다.application/json으로 바꿔준다.
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson(); // 자바 형식 -> json 형식으로 만들어주는 외부 jar 

		String choice = request.getParameter("choice");
		
		// 처리한 데이터를 JSON문자열 데이터로 변환한 후 저장할 변수
		String jsonData = null; // '{"str":"안녕하세요",.. }';
		
		switch(choice) {
		
		case "string" : String str = "안녕하세요"; // 처리된 결과 데이터
		// 자바의 객체나 데이터를 JSON문자열로 변환한다.
		jsonData = gson.toJson(str);
		break;
		
		case "array" : int[] arr = new int[] {100,200,300,400};
		jsonData = gson.toJson(arr);
		break;
		
		case "object" : 
			MemberVO member = MemberDAO.getInstance().getMember("test3", "1234");
			jsonData = gson.toJson(member);
			break;
			
		case "list":
			ArrayList<MemberVO> memList = MemberDAO.getInstance().memberList();
            // 배열처럼 변환 
			jsonData = gson.toJson(memList);
			break;
			
		case "map":
			HashMap<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("name", "홍길동");
			resultMap.put("age", "30");
			resultMap.put("tel", "010-1234-1235");
			resultMap.put("addr", "서울");
			jsonData = gson.toJson(resultMap);
			break;
		}
		
		out.write(jsonData);
		response.flushBuffer(); // 버퍼에 남은 데이터를 강제로 출력한다.
		
	}



}
