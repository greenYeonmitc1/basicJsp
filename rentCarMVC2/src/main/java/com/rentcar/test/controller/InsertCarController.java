package com.rentcar.test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentcar.test.rentcar.CarDAO;
import com.rentcar.test.rentcar.CarVO;

public class InsertCarController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		String img = request.getParameter("img");
		System.out.println("img=" + img);
		String name =request.getParameter("name");
		int category =Integer.parseInt(request.getParameter("category"));
		int price = Integer.parseInt(request.getParameter("price"));
		String company =request.getParameter("company");
		String info =request.getParameter("info");
		
		CarVO vo = new CarVO();
	
		vo.setImg(img);
		vo.setName(name);
		vo.setCategory(category);
		vo.setPrice(price);
		vo.setCompany(company);
		vo.setInfo(info);
		
		int check = CarDAO.getInstance().addCar(vo);
		
		if(check == 1) {
			return "redirect:/main.do";
		}else {
			System.out.println("추가 실패");
			return "carReserveMain";
		}

	}

}
