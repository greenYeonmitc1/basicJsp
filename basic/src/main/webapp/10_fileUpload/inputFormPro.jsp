<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

String saveFolder = application.getRealPath("/filestorage") ;
String encType = "utf-8";
int maxSize = 5 * 1024 * 1024;

File isDir = new File(saveFolder);

if(!isDir.isDirectory()){
	System.out.println("디렉토리가 없습니다. 디렉토리를 새로 생성합니다.");
	isDir.mkdir();
}

try {
    MultipartRequest multi = null;
    multi = new MultipartRequest(request, saveFolder, maxSize,
            encType, new DefaultFileRenamePolicy());
    String user = multi.getParameter("user");
    String title = multi.getParameter("title");
    out.println("파일  " + user + "<br/>");
    out.println("user: " + user + "<br/>");
    out.println("title: " + title + "<br/>");
    out.println("<hr>");
    
    String fileName = multi.getFilesystemName("uploadFile");
    String original = multi.getOriginalFileName("uploadFile");
    String type = multi.getContentType("uploadFile");
    File f = multi.getFile("uploadFile");
    out.println("저장된 파일 경로 : " + saveFolder + "<br/>");
    out.println("저장된 파일 이름 : " + fileName + "<br/>");
    out.println("실제 파일 이름 : " + original + "<br/>");
    out.println("파일 타입 : " + type + "<br/>");
    if (f != null) {
        out.println("크기 : " + f.length()+"바이트");
        out.println("<br/>");
    }
} catch (IOException ioe) {
    System.out.println(ioe);
} catch (Exception ex) {
    System.out.println(ex);
}
%>
   
   



</body>
</html>