package com.rentcar.test.frontController;
public class ViewResolver {
   public static String makeView(String nextPage) {

	   return "/WEB-INF/view/"+nextPage+".jsp";
   }
}
