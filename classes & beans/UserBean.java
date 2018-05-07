package iPlaceKenya;

public class UserBean {

	protected int user_id;
	protected String user_email;
	protected String user_name;
	protected String user_password;
	protected String iExpenseName;
	protected long imei_no;
	protected float iExpensePrice;

	public UserBean() {
	}

	public UserBean(int user_id) {
		this.user_id = user_id;

	}
	
	public UserBean(long imei_no) {
		this.imei_no=imei_no;
	}

	public UserBean(int user_id, String user_email, String user_name, String user_password) {
		this.user_id = user_id;
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_password = user_password;
	}
	
	public UserBean(long imei_no, String iExpenseName, float iExpensePrice) {
		this.imei_no=imei_no;
		this.iExpenseName=iExpenseName;
		this.iExpensePrice=iExpensePrice; 
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	
	public void setImei_no(long imei_no) {
		this.imei_no=imei_no;
	}
	
	public void setIExpenseName(String iExpenseName) {
		this.iExpenseName=iExpenseName;
	}
	
	public void setIExpensePrice(float iExpensePrice) {
		this.iExpensePrice=iExpensePrice;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public String getUser_name() {
		return user_name;
	}

	public String getUser_password() {
		return user_password;
	}
	
	public long getImei_no() {
		return imei_no;
	}
	
	public String getIExpenseName() {
		return iExpenseName;
	}
	
	public float getIExpensePrice() {
		return iExpensePrice;
	}
}
