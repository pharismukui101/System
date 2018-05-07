package iPlaceKenya;

public class Template {
	public static final String[] SHOWN = new String[] { "<img src=\"jquery/images/Home.png\"  alt=\"Home\">",
			"Inventory", "Sales", "Sales Report","Faulty Phones","Personal Expenditures" };

	public static final String[] LINK = new String[] { "index.jsp", "Inventory.jsp", "Sales.jsp", "listSalesReport","FaultyPhones.jsp","PersonalExpenditures.jsp"};

	public static String getNavigationBar() {
		String s = "";
		for (int i = 0; i < SHOWN.length; i++) {
			s += "<a href=\"" + LINK[i] + "\">" + SHOWN[i] + "</a> ";
		}
		return s;
	}

	public static String getAccountLinks(Object user_id) {
		if (user_id == null) {
			return "<a href=\"index.jsp\">Log In</a> / <a href=\"SignUp.jsp\">Sign Up</a> ";
		} else {
			return "<a href=\"accountSettings\">Account</a> / <a href=\"logout.jsp\">Log Out</a> ";
		}
	}

	public static String getFooter() {

		return "&copy; 2018 iPlace Kenya -> Developed By:Mukui Pharis (0722-832-586) & Gitau Lewis (0702-353-830)";

	}

	public static final String USER_ID = "user_id";
	// public static final String USER_NAME="user_name";
	/*
	 * public static String getUSER_NAME() { return USER_NAME; }
	 */
}
