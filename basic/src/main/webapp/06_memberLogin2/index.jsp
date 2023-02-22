
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 화면을 구현하는 페이지가 아니라 db 연동전에 session에다가 데이터저장 사용하는 용도
// init()

// sample 데이터 ==> db 역할 (세션 )

ArrayList<String> sampleId= new ArrayList<>(Arrays.asList("admin","qwer","abcd","hello"));
ArrayList<String> samplePw=new ArrayList<>(Arrays.asList("admin","1111","2222","3333"));
ArrayList<String> sampleName=new ArrayList<>(Arrays.asList("관리자","이만수","박영희","이수민"));
ArrayList<String> sampleGender=new ArrayList<>(Arrays.asList("남성","남성","여성","여성"));

session.setAttribute("idList",sampleId );
session.setAttribute("pwList",samplePw );
session.setAttribute("nameList",sampleName );
session.setAttribute("genderList",sampleGender );

// 내장객체(미리 톰켓(서블릿)안에 만들어진 객체)
// new 하지않고 바로 사용하는 객체 out, application , session, request, response 

// 세션 setAttribute  해주면 (세션값생성)  => 30분동안 서버에 저장된다 => 세션 삭제 

// reqeuest - response  => 매 요청(url 이동될때마다) 생성된다 => 요청이끝나면 => request, response 삭제

// 강제로 자바에서 페이지 이동 
 response.sendRedirect("02_main.jsp");

%>