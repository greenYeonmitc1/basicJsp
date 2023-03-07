<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("cartDeleteNumber");

	int cartDeleteNumber = 0;
	if(str != null) {
		cartDeleteNumber = Integer.parseInt(str);
	}
	
	System.out.println("cartDeleteNumber = " + cartDeleteNumber);
	
	int[] numberList = (int[])session.getAttribute("numberList");
	String[] imageList = (String[])session.getAttribute("imageList");
	String[] nameList = (String[])session.getAttribute("nameList");
	int[] priceList = (int[])session.getAttribute("priceList");
	int[] countList = (int[])session.getAttribute("countList");
	int count = (int)session.getAttribute("count");
	
	int delIndex = -1;
	for(int i=0; i<count; i++) {
		if(numberList[i] == cartDeleteNumber) {
			delIndex = i;
			break;
		}
	}

	for(int i=delIndex; i<count-1; i++) {
		numberList[i] = numberList[i + 1];
		imageList[i] = imageList[i + 1];
		nameList[i] = nameList[i + 1];
		priceList[i] = priceList[i + 1];
		countList[i] = countList[i + 1];
	}
	count -= 1;
	session.setAttribute("count", count);

	String data = "";
	for(int i=0; i<count; i++) {
		data += numberList[i];
		data += ",";
		data += imageList[i];
		data += ",";
		data += nameList[i];
		data += ",";
		data += priceList[i];
		data += ",";
		data += countList[i];
		data += "/";
	}
	
	if(data.equals("")) {
		data = "0";
	} else {
		data = data.substring(0, data.length() - 1);
	}
	System.out.println(data);
%>
<p id="data"><%= data %>











