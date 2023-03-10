package com.rentcar.test.controller;

import java.io.File;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadCarImgController implements Controller {
 
	
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
// 파일 업로드 -> 서버 공간 저장 : 저장 폴더 지정 
//가장 일반적인 사용방법으로 현재 서비스가 돌아가고 있는 서블릿의 경로를 가져온다.
// 파일 구분자 : 윈도우는 \ , 리눅스와 맥은 / 로 말이다.

		String UPLOAD_DIR="img";                               
		String saveFolder=request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		File isDir = new File(saveFolder);  // 이미 있는 img 경로 받아오기 

		if(!isDir.isDirectory()){
			System.out.println("디렉토리가 없습니다. 디렉토리를 새로 생성합니다.");
			isDir.mkdir();
		}

		   int maxSize =  1024*1024*5;  // 5mb 
		   String encType="utf-8";
		   MultipartRequest multi = null;
		   
		   //  DefaultFileRenamePolicy() => 파일이름 중복 해결 클래스 :이미 해당이름으로 파일이 업로드 되면 + 1 2 중복되지 않게 숫자를 뒤에 붙여준다 
		   try{
			   multi = new MultipartRequest(request,saveFolder, maxSize , encType, new DefaultFileRenamePolicy());

     
			   String fileName = multi.getFilesystemName("uploadFile");// 실제 서버에 올라간 파일이름
			   String orginFileName = multi.getOriginalFileName("uploadFile"); // 우리가 업로드한 파일이름 
			   String fileType = multi.getContentType("uploadFile"); // 파일의 타입 .txt , jpg , .png 
			   System.out.println(" 파일 저장된 정보 = " + saveFolder);
			   System.out.println("실제 파일명 = "+ fileName);
			   System.out.println("저장 파일명 = "+ orginFileName);
			   System. out.println("파일 종류  = "+ fileType);
		
			   
			   response.setCharacterEncoding("utf-8"); //응답 스프링에 한글 파일 이름 있으면 깨짐 방지
				File file = multi.getFile("uploadFile"); 
				if(file != null){

						response.getWriter().print(fileName);
				}else {
					
					response.getWriter().print("fail");
				}
				
			
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   
		return null;
		   
	}

}
