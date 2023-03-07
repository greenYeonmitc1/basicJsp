package com.rentcar.test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentcar.test.rentcar.CarDAO;
import com.rentcar.test.rentcar.CarVO;

public class CarMainController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<CarVO> list = CarDAO.getInstance().getSelectCar();
		
		request.setAttribute("list", list);
		
		return "carReserveMain";
	}

}
