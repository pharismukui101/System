package iPlaceKenya;

import java.text.SimpleDateFormat;

public class Validate {
	public static String validateEmail(String email) {
		String error = "";
		if (email.isEmpty()) {
			error = "This field is required";
		} else if (email.length() > 32) {
			error = "This field cannot exceed the length of 32.";
		} else if (!email.matches("^(\\w+(\\.\\w+)*@\\w+\\.\\w{2,4})$"))// email validation
		{
			error = "Invalid e-mail";
		}
		return error;
	}

	public static String validatePassword(String password) {
		String error = "";
		if (password.isEmpty()) {
			error = "This field is required";
		} else if (password.length() > 24) {
			error = "This field can not exceed length of 24";
		}
		return error;
	}

	public static String validateDate(String birthday) {
		String error = "";
		if (birthday.isEmpty()) {
			error = "This field is required";
		} else if (birthday.matches("^(\\d(2)/\\d(2)\\/d(4))$")) {
			error = "Invalid date format. Expected: mm/dd/yyyy ";
		} else {
			try {
				java.util.Date d = new SimpleDateFormat("MM/dd/yyyy").parse(birthday);
				if (d.after(new java.util.Date())) {
					error = "Invalid Date.";
				}
			} catch (Exception e) {
				error = "Invalid Date.";
			}
		}
		return error;
	}
	

	public static String validateIMEI(int imei_no) {
		String error = "";
		//int length = String.valueOf(imei).length();
		if (imei_no==0) {
			error = "This field is required";
		} else if (String.valueOf(imei_no).length() > 16) {
			error = "This field can not exceed length of 16";
		}else {
			error="Invalid format";
		}
		return error;
	}
	
	public static String validatePhoneName(String phone_name) {
		String error = "";
		//int length = String.valueOf(imei).length();
		if (phone_name.isEmpty()) {
			error = "This field is required";
		} 
		return error;
	}
	
	public static String validatePhoneStorage(String phone_storage) {
		String error = "";
		//int length = String.valueOf(imei).length();
		if (phone_storage.isEmpty()) {
			error = "This field is required";
		} 
		return error;
	}
	
	public static String validatePhoneColor(String phone_color) {
		String error = "";
		//int length = String.valueOf(imei).length();
		if (phone_color.isEmpty()) {
			error = "This field is required";
		} 
		return error;
	}
	
	public static String validatePhoneBuyingPrice(float phone_buyingprice) {
		String error = "";
		//int length = String.valueOf(imei).length();
		if (phone_buyingprice==0) {
			error = "This field is required";
		} else if (String.valueOf(phone_buyingprice).length() > 16) {
			error = "This field can not exceed length of 16";
		}
		else {
			error="Invalid format";
					}
		return error;
	}

}
