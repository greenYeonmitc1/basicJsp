package com.rentcar.test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentcar.test.rentcar.CarDAO;
import com.rentcar.test.rentcar.CarVO;

public class CarReserveInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("no"));

		CarVO vo = CarDAO.getInstance().getOneCar(no);

		int category = vo.getCategory();
		String kind = "";
		if (category == 1)
			kind = "소형";
		else if (category == 2)
			kind = "중형";
		else if (category == 3)
			kind = "대형";
		
		request.setAttribute("vo", vo);
		request.setAttribute("kind", kind);
		
		return "carReserveInfo";
	}

}
