package iPlaceKenya;

//import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQL {
	// setting up connection function to the database
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public MySQL(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}

	public static Connection connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://localhost:3307/shop", "root", "root");
		} catch (Exception e) {
			return null;
		}
	}

	// Setting up closing function to database
	public static boolean close(Connection c) {
		try {
			c.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static long InsertUser(Connection c, String email, String password, String name, String role) {
		long id = -1;
		try {
			PreparedStatement ps = c.prepareStatement(
					"Insert into user (user_email,user_password,user_name,user_role) values (?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, email);
			ps.setString(2, password);
			// java.sql.Date d = new java.sql.Date(new
			// SimpleDateFormat("MM/dd/yyyy").parse(birthday).getTime());
			// ps.setDate(3, d);
			ps.setString(3, name);
			ps.setString(4, role);
			ps.execute();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getLong(1);
			}
			rs.close();
			ps.close();
		} catch (Exception e) {
		}
		return id;
	}

	public static long selectUser(Connection c, String email, String password) {
		long id = -1;
		try {
			PreparedStatement ps = c
					.prepareStatement("Select user_id from user where user_email=? and user_password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getLong("user_id");
			}
			rs.close();
			ps.close();
		} catch (Exception e) {
		}
		return id;
	}

	public static List<UserBean> listAllUsers(Connection c) throws SQLException {
		List<UserBean> listAllUsers = new ArrayList<>();

		String sql = "SELECT * FROM user";

		connect();

		Statement statement = c.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {

			int user_id = resultSet.getInt("user_id");
			String user_email = resultSet.getString("user_email");
			String user_name = resultSet.getString("user_name");
			String user_password = resultSet.getString("user_password");

			UserBean user = new UserBean(user_id, user_email, user_name, user_password);
			listAllUsers.add(user);
		}

		resultSet.close();
		statement.close();

		return listAllUsers;
	}

	public static boolean deleteUser(Connection c, UserBean user) throws SQLException {
		String sql = "DELETE FROM user where user_id = ?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, user.getUser_id());

		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		return rowDeleted;
	}

	public static boolean insertInventory(Connection c, PhoneBean phone) throws SQLException {

		connect();
		PreparedStatement ps = c.prepareStatement(
				"Insert into inventory (imei_no, phone_name,phone_storage,phone_color,phone_buyingprice) values (?,?,?,?,?)");

		ps.setLong(1, phone.getImei_no());
		ps.setString(2, phone.getPhone_name());
		// java.sql.Date d = new java.sql.Date(new
		// SimpleDateFormat("MM/dd/yyyy").parse(birthday).getTime());
		// ps.setDate(3, d);
		ps.setString(3, phone.getPhone_storage());
		ps.setString(4, phone.getPhone_color());
		ps.setFloat(5, phone.getPhone_buyingprice());
		boolean rowInserted = ps.executeUpdate() > 0;
		System.out.println("Inventory successfully stored!!!");
		ps.close();
		return rowInserted;

	}

	// public static final String INV_ID="inventory_id";

	public static List<PhoneBean> listAllPhones(Connection c) throws SQLException {
		List<PhoneBean> listPhone = new ArrayList<>();

		String sql = "SELECT * FROM Inventory";

		connect();

		Statement statement = c.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {

			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			float phone_buyingprice = resultSet.getFloat("phone_buyingprice");

			PhoneBean phone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_buyingprice);
			listPhone.add(phone);
		}

		resultSet.close();
		statement.close();

		return listPhone;
	}

	public static List<PhoneBean> listSalesReport(Connection c) throws SQLException {
		List<PhoneBean> listSalesReport = new ArrayList<>();

		String sql = "SELECT  distinct * FROM sales_report order by phone_sellingdate desc";

		connect();

		Statement statement = c.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {

			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			String phone_sellingdate = resultSet.getString("phone_sellingdate");
			float phone_sellingprice = resultSet.getFloat("phone_sellingprice");
			float phone_buyingprice = resultSet.getFloat("phone_buyingprice");
			float accessory_total = resultSet.getFloat("accessory_total");
			float phone_expense_total = resultSet.getFloat("phone_expense_total");
			float sales_total = resultSet.getFloat("sales_total");
			float phone_profitmargin = resultSet.getFloat("phone_profitmargin");
			float sales_influx = resultSet.getFloat("sales_influx");
			float expense_incurred_total = resultSet.getFloat("expense_incurred_total");

			PhoneBean phone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_sellingdate,
					phone_sellingprice, phone_buyingprice, accessory_total, phone_expense_total, sales_total,
					phone_profitmargin, expense_incurred_total, sales_influx);
			listSalesReport.add(phone);
		}

		resultSet.close();
		statement.close();

		return listSalesReport;
	}

	public static boolean insertFaults(Connection c, PhoneBean phone) throws SQLException {

		connect();
		PreparedStatement ps = c.prepareStatement(
				"Insert into faulty_phones (client_no,imei_no,fault_description,fault_datereported ) values (?,?,?,?)");

		ps.setLong(1, phone.getClient_no());
		ps.setLong(2, phone.getImei_no());
		ps.setString(3, phone.getFault_description());
		ps.setString(4, phone.getFault_datereported());

		boolean rowInserted = ps.executeUpdate() > 0;
		System.out.println("Faulty Phone successfully stored!!!");
		ps.close();
		return rowInserted;

	}

	public static boolean deletePhone(Connection c, PhoneBean phone) throws SQLException {
		String sql = "DELETE FROM inventory where imei_no = ?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phone.getImei_no());

		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		return rowDeleted;
	}

	public static PhoneBean getPhone(Connection c, long imei_no) throws SQLException {
		PhoneBean phone = null;

		String sql = "SELECT * FROM inventory where imei_no=?";
		connect();

		PreparedStatement ps = c.prepareStatement(sql);
		ps.setLong(1, imei_no);

		ResultSet resultSet = ps.executeQuery();
		if (resultSet.next()) {

			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			float phone_buyingprice = resultSet.getFloat("phone_buyingprice");

			phone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_buyingprice);

		}

		resultSet.close();

		return phone;
	}

	public static boolean updatePhone(Connection c, PhoneBean phone) throws SQLException {
		String sql = "Update inventory set imei_no=?, phone_name=?,phone_storage=?,phone_color=?,phone_buyingprice=?";
		sql += "where imei_no=?";

		connect();
		PreparedStatement ps = c.prepareStatement(sql);

		ps.setLong(1, phone.getImei_no());
		ps.setString(2, phone.getPhone_name());
		ps.setString(3, phone.getPhone_storage());
		ps.setString(4, phone.getPhone_color());
		ps.setFloat(5, phone.getPhone_buyingprice());
		ps.setLong(6, phone.getImei_no());
		boolean rowUpdated = ps.executeUpdate() > 0;
		System.out.println("Inventory successfully stored!!!");
		ps.close();
		return rowUpdated;

	}

	public static List<PhoneBean> listFaultyPhones(Connection c) throws SQLException {
		List<PhoneBean> listFaultyPhones = new ArrayList<>();

		String sql = "select * from faulty_phones_view";

		connect();

		Statement statement = c.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {
			int client_no = resultSet.getInt("client_no");
			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			String fault_description = resultSet.getString("fault_description");
			String fault_datereported = resultSet.getString("fault_datereported");

			PhoneBean phone = new PhoneBean(client_no, imei_no, phone_name, phone_storage, phone_color,
					fault_description, fault_datereported);
			listFaultyPhones.add(phone);
		}

		resultSet.close();

		return listFaultyPhones;
	}

	public static boolean salesInput(Connection c, PhoneBean phone) throws SQLException {
		connect();
		String sql = "INSERT INTO sales (imei_no,phone_sellingprice,phone_sellingdate,phone_warrantydate,phone_soldBy, phone_platform, phone_platformName) VALUES (?,?,?,?,?,?,?)";

		PreparedStatement ps = c.prepareStatement(sql);
		ps.setLong(1, phone.getImei_no());
		ps.setFloat(2, phone.getPhone_sellingprice());
		ps.setString(3, phone.getPhone_sellingdate());
		ps.setString(4, phone.getPhone_warrantydate());
		ps.setString(5, phone.getPhone_soldBy());
		ps.setString(6, phone.getPhone_platform());
		ps.setString(7, phone.getPhone_platformName());

		boolean salesInput = ps.executeUpdate() > 0;
		ps.close();
		return salesInput;
	}

	public static List<PhoneBean> listSales(Connection c) throws SQLException {
		List<PhoneBean> listSales = new ArrayList<>();

		String sql = "SELECT distinct * from sales_total_view order by phone_sellingdate desc";

		connect();

		Statement statement = c.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {
			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			float phone_sellingprice = resultSet.getFloat("phone_sellingprice");
			String phone_sellingdate = resultSet.getString("phone_sellingdate");
			String phone_warrantydate = resultSet.getString("phone_warrantydate");
			String phone_soldBy = resultSet.getString("phone_soldBy");
			float accessory_total = resultSet.getFloat("accessory_total");
			float phone_expense_total = resultSet.getFloat("phone_expense_total");
			float sales_total = resultSet.getFloat("sales_total");

			PhoneBean phone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_sellingprice,
					phone_sellingdate, phone_warrantydate, phone_soldBy, accessory_total, phone_expense_total,
					sales_total);
			listSales.add(phone);
		}

		resultSet.close();

		return listSales;
	}

	public static boolean deleteFaultyPhone(Connection c, PhoneBean phone) throws SQLException {
		String sql = "DELETE FROM faulty_phones where imei_no = ?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phone.getImei_no());

		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		return rowDeleted;
	}

	public static boolean deleteSoldPhone(Connection c, PhoneBean phone) throws SQLException {
		String sql = "DELETE FROM sales where imei_no = ?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phone.getImei_no());

		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		return rowDeleted;
	}

	public static List<PhoneBean> searchSalesReport(Connection c, PhoneBean phones) throws SQLException {
		List<PhoneBean> listSalesReport = new ArrayList<>();
		String sql = "SELECT * FROM sales_report where imei_no = ?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phones.getImei_no());
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {

			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			String phone_sellingdate = resultSet.getString("phone_sellingdate");
			float phone_sellingprice = resultSet.getFloat("phone_sellingprice");
			float phone_buyingprice = resultSet.getFloat("phone_buyingprice");
			float accessory_total = resultSet.getFloat("accessory_total");
			float phone_expense_total = resultSet.getFloat("phone_expense_total");
			float sales_total = resultSet.getFloat(" sales_total");
			float phone_profitmargin = resultSet.getFloat("phone_profitmargin");
			float sales_influx = resultSet.getFloat("sales_influx");
			float expense_incurred_total = resultSet.getFloat("expense_incurred_total");

			PhoneBean phone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_sellingdate,
					phone_sellingprice, phone_buyingprice, accessory_total, phone_expense_total, sales_total,
					phone_profitmargin, expense_incurred_total, sales_influx);
			listSalesReport.add(phone);
		}

		resultSet.close();
		statement.close();

		return listSalesReport;
	}

	public static List<PhoneBean> filterSalesReport(Connection c, PhoneBean phones) throws SQLException {
		List<PhoneBean> listSalesReport = new ArrayList<>();
		String sql = "SELECT * FROM sales_report where phone_sellingdate between ? and ?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setString(1, phones.getStartSearchDate());
		statement.setString(2, phones.getEndSearchDate());
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {

			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			String phone_sellingdate = resultSet.getString("phone_sellingdate");
			float phone_sellingprice = resultSet.getFloat("phone_sellingprice");
			float phone_buyingprice = resultSet.getFloat("phone_buyingprice");
			float accessory_total = resultSet.getFloat("accessory_total");
			float phone_expense_total = resultSet.getFloat("phone_expense_total");
			float sales_total = resultSet.getFloat(" sales_total");
			float phone_profitmargin = resultSet.getFloat("phone_profitmargin");
			float sales_influx = resultSet.getFloat("sales_influx");
			float expense_incurred_total = resultSet.getFloat("expense_incurred_total");

			PhoneBean phone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_sellingdate,
					phone_sellingprice, phone_buyingprice, accessory_total, phone_expense_total, sales_total,
					phone_profitmargin, expense_incurred_total, sales_influx);
			listSalesReport.add(phone);
		}

		resultSet.close();
		statement.close();

		return listSalesReport;
	}

	public static List<PhoneBean> searchSales(Connection c, PhoneBean phones) throws SQLException {
		List<PhoneBean> listSales = new ArrayList<>();

		String sql = "SELECT * from sales_total_view where imei_no = ?";

		connect();
		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phones.getImei_no());
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			float phone_sellingprice = resultSet.getFloat("phone_sellingprice");
			String phone_sellingdate = resultSet.getString("phone_sellingdate");
			String phone_warrantydate = resultSet.getString("phone_warrantydate");
			String phone_soldBy = resultSet.getString("phone_soldBy");
			float accessory_total = resultSet.getFloat("accessory_total");
			float phone_expense_total = resultSet.getFloat("phone_expense_total");
			float sales_total = resultSet.getFloat("sales_total");

			PhoneBean phone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_sellingprice,
					phone_sellingdate, phone_warrantydate, phone_soldBy, accessory_total, phone_expense_total,
					sales_total);
			listSales.add(phone);
		}

		resultSet.close();

		return listSales;
	}

	public static List<PhoneBean> searchFaultyPhones(Connection c, PhoneBean phones) throws SQLException {
		List<PhoneBean> listFaultyPhones = new ArrayList<>();

		String sql = "select * from faulty_phones_view where imei_no=?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phones.getImei_no());
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			int client_no = resultSet.getInt("client_no");
			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			String fault_description = resultSet.getString("fault_description");
			String fault_datereported = resultSet.getString("fault_datereported");

			PhoneBean phone = new PhoneBean(client_no, imei_no, phone_name, phone_storage, phone_color,
					fault_description, fault_datereported);
			listFaultyPhones.add(phone);
		}

		resultSet.close();

		return listFaultyPhones;
	}

	public static List<PhoneBean> searchInventory(Connection c, PhoneBean phones) throws SQLException {
		List<PhoneBean> listPhone = new ArrayList<>();

		String sql = "SELECT * FROM Inventory where imei_no=?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phones.getImei_no());
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {

			long imei_no = resultSet.getLong("imei_no");
			String phone_name = resultSet.getString("phone_name");
			String phone_storage = resultSet.getString("phone_storage");
			String phone_color = resultSet.getString("phone_color");
			float phone_buyingprice = resultSet.getFloat("phone_buyingprice");

			PhoneBean phone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_buyingprice);
			listPhone.add(phone);
		}

		resultSet.close();
		statement.close();

		return listPhone;
	}

	public static boolean accessoryInput(Connection c, PhoneBean phone) throws SQLException {
		connect();
		String sql = "INSERT INTO accessory (imei_no,accessory_name,accessory_price) VALUES (?,?,?)";

		PreparedStatement ps = c.prepareStatement(sql);
		ps.setLong(1, phone.getImei_no());
		ps.setString(2, phone.getAccessory_name());
		ps.setFloat(3, phone.getAccessory_price());

		boolean accessoryInput = ps.executeUpdate() > 0;
		ps.close();
		return accessoryInput;
	}

	public static boolean phoneExpenseInput(Connection c, PhoneBean phone) throws SQLException {
		connect();
		String sql = "INSERT INTO phone_expense (imei_no,phone_expense_name,phone_expense_price) VALUES (?,?,?)";

		PreparedStatement ps = c.prepareStatement(sql);
		ps.setLong(1, phone.getImei_no());
		ps.setString(2, phone.getPhone_expense_name());
		ps.setFloat(3, phone.getPhone_expense_price());

		boolean phoneExpenseInput = ps.executeUpdate() > 0;
		ps.close();
		return phoneExpenseInput;
	}

	public static List<PhoneBean> listAccessory(Connection c, PhoneBean phones) throws SQLException {
		List<PhoneBean> listAccessory = new ArrayList<>();

		String sql = "select * from accessory where imei_no=?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phones.getImei_no());
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			long imei_no = resultSet.getLong("imei_no");
			String accessory_name = resultSet.getString("accessory_name");
			float accessory_price = Float.parseFloat(resultSet.getString("accessory_price"));

			PhoneBean phone = new PhoneBean(imei_no, accessory_name, accessory_price);
			listAccessory.add(phone);
		}

		resultSet.close();

		return listAccessory;
	}

	public static List<PhoneBean> listPhoneExpense(Connection c, PhoneBean phones) throws SQLException {
		List<PhoneBean> listPhoneExpense = new ArrayList<>();

		String sql = "select * from phone_expense where imei_no=?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, phones.getImei_no());
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			long imei_no = resultSet.getLong("imei_no");
			String phone_expense_name = resultSet.getString("phone_expense_name");
			float phone_expense_price = Float.parseFloat(resultSet.getString("phone_expense_price"));

			PhoneBean phone = new PhoneBean(imei_no, phone_expense_price, phone_expense_name);
			listPhoneExpense.add(phone);
		}

		resultSet.close();

		return listPhoneExpense;
	}

	public static List<UserBean> listIncurredExpense(Connection c, UserBean iExpenses) throws SQLException {
		List<UserBean> listExpenseIncurred = new ArrayList<>();

		String sql = "select * from expense_incurred where imei_no=?";

		connect();

		PreparedStatement statement = c.prepareStatement(sql);
		statement.setLong(1, iExpenses.getImei_no());
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			long imei_no = resultSet.getLong("imei_no");
			String iExpenseName = resultSet.getString("expense_name");
			float iExpensePrice = Float.parseFloat(resultSet.getString("expense_price"));

			UserBean iExpense = new UserBean(imei_no, iExpenseName, iExpensePrice);
			listExpenseIncurred.add(iExpense);
		}

		resultSet.close();

		return listExpenseIncurred;
	}

	public static boolean incurredExpenseInput(Connection c, UserBean phone) throws SQLException {
		connect();
		String sql = "INSERT INTO expense_incurred (imei_no,expense_name,expense_price) VALUES (?,?,?)";

		PreparedStatement ps = c.prepareStatement(sql);
		ps.setLong(1, phone.getImei_no());
		ps.setString(2, phone.getIExpenseName());
		ps.setFloat(3, phone.getIExpensePrice());

		boolean incurredExpenseInput = ps.executeUpdate() > 0;
		ps.close();
		return incurredExpenseInput;
	}

	public static List<PhoneBean> listProfitReport(Connection c) throws SQLException {
		List<PhoneBean> listProfitReport = new ArrayList<>();

		String sql = "SELECT * from profit_report";

		connect();

		Statement statement = c.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {
			int year_sold = resultSet.getInt("year_sold");
			float jan_sales = resultSet.getFloat("jan_sales");
			float feb_sales = resultSet.getFloat("feb_sales");
			float mar_sales = resultSet.getFloat("mar_sales");
			float apr_sales = resultSet.getFloat("apr_sales");
			float may_sales = resultSet.getFloat("may_sales");
			float jun_sales = resultSet.getFloat("jun_sales");
			float jul_sales = resultSet.getFloat("jul_sales");
			float aug_sales = resultSet.getFloat("aug_sales");
			float sep_sales = resultSet.getFloat("sep_sales");
			float oct_sales = resultSet.getFloat("oct_sales");
			float nov_sales = resultSet.getFloat("nov_sales");
			float dec_sales = resultSet.getFloat("dec_sales");
			float year_totals = resultSet.getFloat("year_totals");

			PhoneBean phone = new PhoneBean(year_sold, jan_sales, feb_sales, mar_sales, apr_sales, may_sales, jun_sales,
					jul_sales, aug_sales, sep_sales, oct_sales, nov_sales, dec_sales, year_totals);
			listProfitReport.add(phone);
		}

		resultSet.close();

		return listProfitReport;
	}
	
	public static boolean personalExpenditureInput(Connection c,PhoneBean phone) throws SQLException {
		connect();
		String sql = "INSERT INTO personal_expenditure (expenditure_name,expenditure_price,expenditure_date) VALUES (?,?,?)";

		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, phone.getPExpenditureName());
		ps.setFloat(2, phone.getPExpenditurePrice());
		ps.setString(3, phone.getPExpenditureDate());

		boolean personalExpenditureInput = ps.executeUpdate() > 0;
		ps.close();
		return personalExpenditureInput;
	}


}
