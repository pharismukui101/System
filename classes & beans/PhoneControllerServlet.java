package iPlaceKenya;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import iPlaceKenya.MySQL;
import iPlaceKenya.PhoneBean;

/**
 * Servlet implementation class PhoneControllerServlet
 */
@WebServlet("/PhoneControllerServlet")
public class PhoneControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MySQL SQL;
	Connection c = MySQL.connect();

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		SQL = new MySQL(jdbcURL, jdbcUsername, jdbcPassword);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		try {
			switch (action) {
			case"/personalExpenditureInput":
				personalExpenditureInput(request, response);
				break;
			case "/deleteUser":
				deleteUser(request, response);
				break;
			case "/accountSettings":
				listAllUsers(request, response);
				break;

			case "/inputAccessory":
				inputAccessory(request, response);
				break;
			case "/listAccessory":
				listAccessory(request, response);
				break;
			case "/insertInventory":
				insertInventory(request, response);
				break;
			case "/inputPhoneExpense":
				inputPhoneExpense(request, response);
				break;
			case "/listPhoneExpense":
				listPhoneExpense(request, response);
				break;
			case "/inputExpenseIncurred":
				inputExpenseIncurred(request, response);
				break;
			case "/listIncurredExpense":
				listIncurredExpense(request, response);
				break;
			case "/faulty":
				insertFaults(request, response);
				break;
			case "/listInventory":
				listPhone(request, response);
				break;
			case "/inventory":
				inventoryDispatch(response);
				break;

			case "/showPhoneEditForm":
				showPhoneEditForm(request, response);
				break;
			case "/editPhone":
				updatePhone(request, response);
				break;
			case "/listFaultyPhones":
				listFaultyPhones(request, response);
				break;
			case "/salesInput":
				salesInput(request, response);
				break;
			case "/listSales":
				listSales(request, response);
				break;
			case "/deleteFaultyPhone":
				deleteFaultyPhone(request, response);
				break;
			case "/deletePhone":
				deletePhone(request, response);
				break;
			case "/deleteSoldPhone":
				deleteSoldPhone(request, response);
				break;
			case "/listSalesReport":
				listSalesReport(request, response);
				break;
			case "/searchSalesReport":
				searchSalesReport(request, response);
				break;
			case "/searchFaultyPhones":
				searchFaultyPhones(request, response);
				break;
			case "/searchSales":
				searchSales(request, response);
				break;
			case "/searchInventory":
				searchInventory(request, response);
				break;
			case "/filterSalesReport":
				filterSalesReport(request, response);
				break;
			case "/printReceipt":
				printReceipt(request, response);
				break;
			case "/printInvoice":
				printInvoice(request, response);
				break;
			default:
				String message = "<h2>Under Constuction!!!! Coming Soon!!!</h2>";
				response.setContentType("text/html");
				PrintWriter writer = response.getWriter();
				writer.println(message);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void listAllUsers(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<UserBean> listAllUsers = MySQL.listAllUsers(c);
		request.setAttribute("listAllUsers", listAllUsers);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Account.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int user_id = Integer.parseInt(request.getParameter("user_id"));

		UserBean user = new UserBean(user_id);
		MySQL.deleteUser(c, user);
		response.sendRedirect("accountSettings");
	}

	private void insertInventory(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		String phone_name = request.getParameter("phone_name");
		String phone_color = request.getParameter("phone_color");
		String phone_storage = request.getParameter("phone_storage");
		float phone_buyingprice = Float.parseFloat(request.getParameter("phone_buyingprice"));

		PhoneBean newPhone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_buyingprice);
		MySQL.insertInventory(c, newPhone);
		response.sendRedirect("Inventory.jsp");
		// String message = "<h4>Input Successful!!!!</h4>";
		// response.setContentType("text/html");
		// PrintWriter writer = response.getWriter();

		// writer.println(message);
	}

	private void insertFaults(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		int client_no = Integer.parseInt(request.getParameter("client_no"));
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		String fault_description = request.getParameter("fault_description");
		String fault_datereported = request.getParameter("fault_datereported");
		PhoneBean newPhone = new PhoneBean(client_no, imei_no, fault_description, fault_datereported);
		MySQL.insertFaults(c, newPhone);
		response.sendRedirect("FaultyPhones.jsp");
	}

	private void listPhone(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<PhoneBean> listPhone = MySQL.listAllPhones(c);
		request.setAttribute("listPhone", listPhone);
		RequestDispatcher dispatcher = request.getRequestDispatcher("inventoryList.jsp");
		dispatcher.forward(request, response);
	}

	private void inventoryDispatch(HttpServletResponse response) throws SQLException, IOException, ServletException {
		response.sendRedirect("Inventory.jsp");
	}

	private void deletePhone(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));

		PhoneBean phone = new PhoneBean(imei_no);
		MySQL.deletePhone(c, phone);
		response.sendRedirect("listInventory");

	}

	private void deleteFaultyPhone(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));

		PhoneBean phone = new PhoneBean(imei_no);
		MySQL.deleteFaultyPhone(c, phone);
		response.sendRedirect("listFaultyPhones");

	}

	private void deleteSoldPhone(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));

		PhoneBean phone = new PhoneBean(imei_no);
		MySQL.deleteSoldPhone(c, phone);
		response.sendRedirect("listSales");

	}

	private void showPhoneEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		PhoneBean existingPhone = MySQL.getPhone(c, imei_no);
		RequestDispatcher dispatcher = request.getRequestDispatcher("InventoryEditForm.jsp");
		request.setAttribute("phone", existingPhone);
		dispatcher.forward(request, response);

	}

	private void filterSalesReport(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String startSearchDate = request.getParameter("startSearchDate");
		String endSearchDate = request.getParameter("endSearchDate");
		PhoneBean phone = new PhoneBean(startSearchDate, endSearchDate);
		List<PhoneBean> searchSalesReport = MySQL.filterSalesReport(c, phone);
		request.setAttribute("listSalesReport", searchSalesReport);
		RequestDispatcher dispatcher = request.getRequestDispatcher("salesReport.jsp");
		dispatcher.forward(request, response);
	}

	private void searchSalesReport(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("searchSalesReportByImei"));
		PhoneBean phone = new PhoneBean(imei_no);
		List<PhoneBean> searchSalesReport = MySQL.searchSalesReport(c, phone);
		request.setAttribute("listSalesReport", searchSalesReport);
		RequestDispatcher dispatcher = request.getRequestDispatcher("salesReport.jsp");
		dispatcher.forward(request, response);
	}

	private void searchFaultyPhones(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("searchByImei"));
		PhoneBean phone = new PhoneBean(imei_no);
		List<PhoneBean> listFaultyPhones = MySQL.searchFaultyPhones(c, phone);
		request.setAttribute("listFaultyPhones", listFaultyPhones);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FaultyList.jsp");
		dispatcher.forward(request, response);
	}

	private void searchSales(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("searchByImei"));
		PhoneBean phone = new PhoneBean(imei_no);
		List<PhoneBean> listSales = MySQL.searchSales(c, phone);
		request.setAttribute("listSales", listSales);
		RequestDispatcher dispatcher = request.getRequestDispatcher("SalesList.jsp");
		dispatcher.forward(request, response);
	}

	private void searchInventory(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("searchByImei"));
		PhoneBean phone = new PhoneBean(imei_no);
		List<PhoneBean> listPhone = MySQL.searchInventory(c, phone);
		request.setAttribute("listPhone", listPhone);
		RequestDispatcher dispatcher = request.getRequestDispatcher("inventoryList.jsp");
		dispatcher.forward(request, response);
	}

	private void updatePhone(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		String phone_name = request.getParameter("phone_name");
		String phone_color = request.getParameter("phone_color");
		String phone_storage = request.getParameter("phone_storage");
		float phone_buyingprice = Float.parseFloat(request.getParameter("phone_buyingprice"));

		PhoneBean newPhone = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_buyingprice);
		MySQL.updatePhone(c, newPhone);
		response.sendRedirect("listInventory");
	}

	private void listFaultyPhones(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<PhoneBean> listFaultyPhones = MySQL.listFaultyPhones(c);
		request.setAttribute("listFaultyPhones", listFaultyPhones);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FaultyList.jsp");
		dispatcher.forward(request, response);
	}

	private void listSales(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<PhoneBean> listSales = MySQL.listSales(c);
		request.setAttribute("listSales", listSales);
		RequestDispatcher dispatcher = request.getRequestDispatcher("SalesList.jsp");
		dispatcher.forward(request, response);
	}

	private void listSalesReport(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<PhoneBean> listSalesReport = MySQL.listSalesReport(c);
		List<PhoneBean> listProfitReport = MySQL.listProfitReport(c);
		request.setAttribute("listSalesReport", listSalesReport);
		request.setAttribute("listProfitReport", listProfitReport);
		RequestDispatcher dispatcher = request.getRequestDispatcher("salesReport.jsp");
		dispatcher.forward(request, response);
	}

	private void salesInput(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		float phone_sellingprice = Float.parseFloat(request.getParameter("phone_sellingprice"));
		String phone_sellingdate = request.getParameter("phone_sellingdate");
		String phone_warrantydate = request.getParameter("phone_warrantydate");
		String phone_platform = request.getParameter("phone_platform");
		String phone_platformName = request.getParameter("phone_platformName");
		String phone_soldBy = request.getParameter("phone_soldBy");
		PhoneBean sellPhone = new PhoneBean(imei_no, phone_sellingprice, phone_sellingdate, phone_warrantydate,
				phone_soldBy, phone_platform, phone_platformName);
		MySQL.salesInput(c, sellPhone);
		response.sendRedirect("Accessories.jsp");
	}

	private void printReceipt(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		String phone_name = request.getParameter("phone_name");
		String phone_color = request.getParameter("phone_color");
		String phone_storage = request.getParameter("phone_storage");
		float phone_sellingprice = Float.parseFloat(request.getParameter("phone_sellingprice"));
		String phone_sellingdate = request.getParameter("phone_sellingdate");
		String phone_warrantydate = request.getParameter("phone_warrantydate");
		String phone_soldBy = request.getParameter("phone_soldBy");
		float accessory_total = Float.parseFloat(request.getParameter("accessory_total"));
		float phone_expense_total = Float.parseFloat(request.getParameter("phone_expense_total"));
		float sales_total = Float.parseFloat(request.getParameter("sales_total"));

		PhoneBean receiptDetails = new PhoneBean(imei_no, phone_name, phone_storage, phone_color, phone_sellingprice,
				phone_sellingdate, phone_warrantydate, phone_soldBy, accessory_total, phone_expense_total, sales_total);
		request.setAttribute("receiptDetails", receiptDetails);

		PhoneBean phone = new PhoneBean(imei_no);
		List<PhoneBean> listAccessory = MySQL.listAccessory(c, phone);
		request.setAttribute("listAccessory", listAccessory);

		List<PhoneBean> listPhoneExpense = MySQL.listPhoneExpense(c, phone);
		request.setAttribute("listPhoneExpense", listPhoneExpense);

		RequestDispatcher dispatcher = request.getRequestDispatcher("printReceipt.jsp");
		dispatcher.forward(request, response);
	}

	private void forwardIMEI(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));

		PhoneBean phone = new PhoneBean(imei_no);
		request.setAttribute("phone", phone);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Accessories.jsp");
		RequestDispatcher dispatcher2 = request.getRequestDispatcher("Expenses.jsp");
		dispatcher.forward(request, response);
		dispatcher2.forward(request, response);
	}

	private void printInvoice(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		String phone_name = request.getParameter("phone_name");
		String phone_storage = request.getParameter("phone_storage");
		String phone_color = request.getParameter("phone_color");
		int client_no = Integer.parseInt(request.getParameter("client_no"));
		String fault_description = request.getParameter("fault_description");
		String fault_datereported = request.getParameter("fault_datereported");

		PhoneBean phone = new PhoneBean(client_no, imei_no, phone_name, phone_storage, phone_color, fault_description,
				fault_datereported);
		request.setAttribute("phone", phone);
		RequestDispatcher dispatcher = request.getRequestDispatcher("printInvoice.jsp");
		dispatcher.forward(request, response);
	}

	private void inputAccessory(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		String accessory_name = request.getParameter("accessory_name");
		float accessory_price = Float.parseFloat(request.getParameter("accessory_price"));

		PhoneBean phone = new PhoneBean(imei_no, accessory_name, accessory_price);
		MySQL.accessoryInput(c, phone);
		response.sendRedirect("Accessories.jsp");
	}

	private void inputPhoneExpense(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		String phone_expense_name = request.getParameter("phone_expense_name");
		float phone_expense_price = Float.parseFloat(request.getParameter("phone_expense_price"));

		PhoneBean phone = new PhoneBean(imei_no, phone_expense_price, phone_expense_name);
		MySQL.phoneExpenseInput(c, phone);
		response.sendRedirect("Expenses.jsp");
	}

	private void inputExpenseIncurred(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		String iExpenseName = request.getParameter("iExpenseName");
		float iExpensePrice = Float.parseFloat(request.getParameter("iExpensePrice"));

		UserBean iExpense = new UserBean(imei_no, iExpenseName, iExpensePrice);
		MySQL.incurredExpenseInput(c, iExpense);
		response.sendRedirect("IncurredExpense.jsp");
	}

	private void listAccessory(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		PhoneBean phone = new PhoneBean(imei_no);
		List<PhoneBean> listAccessory = MySQL.listAccessory(c, phone);
		request.setAttribute("listAccessory", listAccessory);
		RequestDispatcher dispatcher = request.getRequestDispatcher("AccessoryList.jsp");
		dispatcher.forward(request, response);
	}

	private void listPhoneExpense(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		PhoneBean phone = new PhoneBean(imei_no);
		List<PhoneBean> listPhoneExpense = MySQL.listPhoneExpense(c, phone);
		request.setAttribute("listPhoneExpense", listPhoneExpense);
		RequestDispatcher dispatcher = request.getRequestDispatcher("PhoneExpenseList.jsp");
		dispatcher.forward(request, response);
	}

	private void listIncurredExpense(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		long imei_no = Long.parseLong(request.getParameter("imei_no"));
		UserBean phone = new UserBean(imei_no);
		List<UserBean> listIncurredExpense = MySQL.listIncurredExpense(c, phone);
		request.setAttribute("listIncurredExpense", listIncurredExpense);
		RequestDispatcher dispatcher = request.getRequestDispatcher("IncurredExpenseList.jsp");
		dispatcher.forward(request, response);
	}

	private void personalExpenditureInput(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		String pExpenditureName = request.getParameter("pExpenditureName");
		String pExpenditureDate = request.getParameter("pExpenditureDate");
		float pExpenditurePrice = Float.parseFloat(request.getParameter("pExpenditurePrice"));

		PhoneBean pExpenditure = new PhoneBean(pExpenditureName, pExpenditurePrice, pExpenditureDate);
		MySQL.personalExpenditureInput(c, pExpenditure);
		response.sendRedirect("PersonalExpenditures.jsp");
	}

}
