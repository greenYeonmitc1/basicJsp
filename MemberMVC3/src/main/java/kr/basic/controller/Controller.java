package kr.basic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	 // 모든  POJO가 가지고 있어야되는 메서드
	  //      ?->String(다음페이지 정보) -> frontColler에게 리턴값으로 알려줌 
	  public String requestHandler(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException;
}
