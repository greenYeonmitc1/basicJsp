package kr.basic.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;
import kr.basic.model.MemberVO;

public class MemberListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// POJO가 해야할 일의 범위
		// 1. Model 연동
		ArrayList<MemberVO> list=MemberDAO.getInstance().memberList();	
		// 2. 객체바인딩
		request.setAttribute("list", list);
		// member/memberList.jsp
		// 다음페이지는 
		// 3.다음페이지정보(View)
		return "memberList";

	}
}
