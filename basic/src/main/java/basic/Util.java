package basic;

public class Util {

 public boolean isNumValue(String str) {
	 for(int i =0; i < str.length(); i++) {
		 if(!Character.isDigit(str.charAt(i))) {
			 return false;
		 }
	 }
	 return true;
 }

}
