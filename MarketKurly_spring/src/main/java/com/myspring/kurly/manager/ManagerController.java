package com.myspring.kurly.manager;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.kurly.buy.BuyDTO;
import com.myspring.kurly.item.ItemDAO;
import com.myspring.kurly.item.ItemDTO;

@Controller
public class ManagerController {

	@Autowired
	ManagerDAO managerDAO;
	@Autowired
	ItemDAO itemDAO;
	
	@ModelAttribute("contextPath")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	@RequestMapping(value = "/index.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String index(Model model) {
		
		/*
		 * type변수는 관리자와 사용자를 구분하기 위한 변수
		 * . 관리자	type = 0
		 * . 사용자 	type = 1
		 */
		model.addAttribute("type", 1);
		
		model.addAttribute("cont", "00_shopMain.jsp");
		
		return "00_index";
	}
	
	@RequestMapping(value = "/managerMain.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String managerMain(Model model) {
		
		int memberCnt = managerDAO.getCustomerCnt();
		int itemCnt = managerDAO.getItemCnt();
		int buyCnt = managerDAO.getOrderCnt();
		
		model.addAttribute("memberCnt", memberCnt);
		model.addAttribute("itemCnt", itemCnt);
		model.addAttribute("buyCnt", buyCnt);
		
		// 관리자(0)
		model.addAttribute("type", 0);	
		
		model.addAttribute("cont", "01_managerMain.jsp");
		
		return "00_index";
	}
	
	@RequestMapping(value = "/managerLogin.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String managerLogin(Model model) {
		
		// 관리자(0)
		model.addAttribute("type", 0);	
		
		model.addAttribute("cont", "02_managerLogin.jsp");
		
		return "00_index";
	}
	
	@RequestMapping(value = "/managerLoginPro.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String managerLoginPro(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		 
		int check = managerDAO.checkManager(id, pw);
		
		model.addAttribute("check", check);
		model.addAttribute("id", id);
		
		model.addAttribute("cont", "03_managerLoginPro.jsp");
		
		return "00_index";
	}
	
	@RequestMapping(value = "/managerLogout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String managerLogout(Model model) {
		
		// 관리자(0)
		model.addAttribute("type", 0);
		
		model.addAttribute("cont", "04_managerLogout.jsp");
		
		return "00_index";
	}
	
	@RequestMapping(value = "/addNewItem.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String addNewItem(Model model) {
		
		// 관리자(0)
		model.addAttribute("type", 0);
		
		model.addAttribute("cont", "05_addNewItem.jsp");		
		
		return "00_index";
	}
	
	@RequestMapping(value = "/addNewItemPro.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String addNewItemPro(MultipartHttpServletRequest mRequest, Model model) {
		
		ServletContext context = mRequest.getSession().getServletContext();
		String saveFolder = "/resources/file/";
		String uploadPath = context.getRealPath(saveFolder);
		System.out.println("uploadPath="+uploadPath);
		
		// # getFileNames() : form태그에서 type=file로 지정한 태그의 name값 불러오기
		Iterator<String> iterator = mRequest.getFileNames();
		
		String saveFileName = "";
		while(iterator.hasNext()){
			String fileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(fileName);
			String originFileName = mFile.getOriginalFilename();
			saveFileName = originFileName;
			
		}	
		
		String item_name = mRequest.getParameter("item_name");
		String item_category = mRequest.getParameter("item_category");
		String item_price = mRequest.getParameter("item_price");
		String item_stock = mRequest.getParameter("item_stock");
		String item_info = mRequest.getParameter("item_info");
		String discount_rate = mRequest.getParameter("discount_rate");
		
		ItemDTO dto = new ItemDTO();
		dto.setItem_name(item_name);
		dto.setItem_category(item_category);
		dto.setItem_price(Integer.parseInt(item_price));
		dto.setItem_stock(Integer.parseInt(item_stock));
		dto.setItem_info(item_info);
		dto.setDiscount_rate(Integer.parseInt(discount_rate));
		
		dto.setItem_image(saveFileName);
		
		managerDAO.insertNewItem(dto);
		
		// 관리자(0)
		model.addAttribute("type", 0);
		
		model.addAttribute("cont", "06_addNewItemPro.jsp");
		
		return "00_index";
	}
	
	@RequestMapping(value = "/updateItem.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateItem(HttpServletRequest request, Model model) {
		
		int item_number = Integer.parseInt(request.getParameter("item_number"));
		
		ArrayList<ItemDTO> itemList = managerDAO.getOneItem(item_number);
		
		request.setAttribute("itemList", itemList);
		
		// 관리자(0)
		request.setAttribute("type", 0);
		
		model.addAttribute("cont", "07_updateItem.jsp");
		
		return "00_index";
	}
	
	@RequestMapping(value = "/updateItemPro.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateItemPro(MultipartHttpServletRequest mRequest, Model model) {
		
		ServletContext context = mRequest.getSession().getServletContext();
		String saveFolder = "/resources/file/";
		String uploadPath = context.getRealPath(saveFolder);
		System.out.println("uploadPath="+uploadPath);
		
		int item_number = Integer.parseInt(mRequest.getParameter("item_number"));
		String item_name = mRequest.getParameter("item_name");
		String item_category = mRequest.getParameter("item_category");
		String item_price = mRequest.getParameter("item_price");
		String item_stock = mRequest.getParameter("item_stock");
		String item_info = mRequest.getParameter("item_info");
		String discount_rate = mRequest.getParameter("discount_rate");
		
		ItemDTO dto = new ItemDTO();
		dto.setItem_category(item_category);
		dto.setItem_number(item_number);
		dto.setItem_name(item_name);
		dto.setItem_price(Integer.parseInt(item_price));
		dto.setItem_stock(Integer.parseInt(item_stock));
		dto.setItem_info(item_info);
		dto.setDiscount_rate(Integer.parseInt(discount_rate));		
		
		// # getFileNames() : form태그에서 type=file로 지정한 태그의 name값 불러오기
		Iterator<String> iterator = mRequest.getFileNames();
		
		String saveFileName = "";
		while(iterator.hasNext()){
			String fileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(fileName);
			String originFileName = mFile.getOriginalFilename();
			saveFileName = originFileName;
			
			// 파일을 선택하지 않으면
			if(saveFileName == null || saveFileName.equals("")){
				saveFileName = managerDAO.getItemImage(item_number);
			}
			
			dto.setItem_image(saveFileName);
			
			try {
				// 파일 업로드
				mFile.transferTo(new File(uploadPath+saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			} 	
			
		}			
		
		managerDAO.updateItem(dto);
		
		// 관리자(0)
		model.addAttribute("type", 0);
		
		model.addAttribute("cont", "08_updateItemPro.jsp");
		
		return "00_index";
	}
	
	@RequestMapping(value = "/deleteItemPro.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteItemPro(HttpServletRequest request, Model model) {
		
		int item_number = Integer.parseInt(request.getParameter("item_number"));
		
		managerDAO.deleteItem(item_number);
		
		// 관리자(0)
		model.addAttribute("type", 0);
		
		model.addAttribute("cont", "09_deleteItemPro.jsp");		
		
		return "00_index";
	}
	
	@RequestMapping(value = "/checkOrderList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String checkOrderList(HttpServletRequest request, Model model) {
		
		ArrayList<BuyDTO> orderList = managerDAO.getAllOrderList();
		
		request.setAttribute("orderList", orderList);
		
		// 관리자(0)
		model.addAttribute("type", 0);	
		
		model.addAttribute("cont", "10_checkOrderList.jsp");	
		
		return "00_index";
	}
	
	@RequestMapping(value = "/itemListForManager.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String itemListForManager(HttpServletRequest request, Model model) {
		
		ArrayList<ItemDTO> registeredItemList = itemDAO.getAllItemList();
		int cnt = registeredItemList.size();
		
		if(cnt > 0) {
			model.addAttribute("registeredItemList", registeredItemList);
		}
		
		model.addAttribute("cnt", cnt);		
		
		// 관리자(0)
		model.addAttribute("type", 0);
		
		model.addAttribute("cont", "11_itemListForManager.jsp");		
		
		return "00_index";
	}
	
}
