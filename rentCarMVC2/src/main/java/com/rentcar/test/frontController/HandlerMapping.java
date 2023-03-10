package com.rentcar.test.frontController;

import java.util.HashMap;
import com.rentcar.test.controller.CarMainController;
import com.rentcar.test.controller.CarReserveInfoController;
import com.rentcar.test.controller.Controller;
import com.rentcar.test.controller.InsertCarController;
import com.rentcar.test.controller.LoginController;
import com.rentcar.test.controller.MainController;
import com.rentcar.test.controller.UploadCarImgController;





public class HandlerMapping {
  private HashMap<String, Controller> mappings;
  public HandlerMapping() {
	  mappings=new HashMap<String, Controller>();
	  mappings.put("/main.do", new MainController());
	  mappings.put("/login.do", new LoginController());
	  mappings.put("/carMain.do", new CarMainController());
	  mappings.put("/insertCar.do", new InsertCarController());
	  mappings.put("/uploadCarImg.do", new UploadCarImgController());
	  mappings.put("/insertCar.do", new InsertCarController());
	  mappings.put("/carReserveInfo.do", new CarReserveInfoController());

  }
  public Controller getController(String key) { 
	  return mappings.get(key);
  }
}
