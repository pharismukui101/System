package iPlaceKenya;

public class PhoneBean {

	protected int client_no;
	protected long imei_no;
	protected String phone_name;
	protected String phone_storage;
	protected String phone_color;
	protected float phone_buyingprice;
	protected String fault_description;
	protected float phone_sellingprice;
	protected String phone_sellingdate;
	protected String phone_warrantydate;
	protected float phone_profitmargin;
	protected String startSearchDate;
	protected String endSearchDate;
	protected String phone_soldBy;
	protected String phone_platform;
	protected String phone_platformName;
	protected String fault_datereported;
	protected String accessory_name;
	protected float accessory_price;
	protected String phone_expense_name;
	protected float phone_expense_price;
	protected float accessory_total;
	protected float phone_expense_total;
	protected float sales_total;
	protected float expense_incurred_total;
	protected float sales_influx;
	protected int year_sold;
	protected float jan_sales;
	protected float feb_sales;
	protected float mar_sales;
	protected float apr_sales;
	protected float may_sales;
	protected float jun_sales;
	protected float jul_sales;
	protected float aug_sales;
	protected float sep_sales;
	protected float oct_sales;
	protected float nov_sales;
	protected float dec_sales;
	protected float year_totals;
	protected String pExpenditureName;
	protected float pExpenditurePrice;
	protected String pExpenditureDate;

	public PhoneBean() {
	}

	// retrieve IMEI constructor
	public PhoneBean(long imei_no) {
		this.imei_no = imei_no;
	}

	// retrieve search dates
	public PhoneBean(String startSearchDate, String endSearchDate) {
		this.startSearchDate = startSearchDate;
		this.endSearchDate = endSearchDate;
	}

	// inventory transaction
	public PhoneBean(long imei_no, String phone_name, String phone_storage, String phone_color,
			float phone_buyingprice) {
		this.imei_no = imei_no;
		this.phone_name = phone_name;
		this.phone_storage = phone_storage;
		this.phone_color = phone_color;
		this.phone_buyingprice = phone_buyingprice;

	}

	// post faulty phone to database
	public PhoneBean(int client_no, long imei_no, String fault_description, String fault_datereported) {
		this.client_no = client_no;
		this.imei_no = imei_no;
		this.fault_description = fault_description;
		this.fault_datereported = fault_datereported;
	}

	// retrieve faulty phone view details from database
	public PhoneBean(int client_no, long imei_no, String phone_name, String phone_storage, String phone_color,
			String fault_description, String fault_datereported) {
		this.client_no = client_no;
		this.imei_no = imei_no;
		this.phone_name = phone_name;
		this.phone_storage = phone_storage;
		this.phone_color = phone_color;
		this.fault_description = fault_description;
		this.fault_datereported = fault_datereported;
	}

	// retrieve / send sales to database
	public PhoneBean(long imei_no, float phone_sellingprice, String phone_sellingdate, String phone_warrantydate,
			String phone_soldBy, String phone_platform, String phone_platformName) {
		this.imei_no = imei_no;
		this.phone_sellingprice = phone_sellingprice;
		this.phone_sellingdate = phone_sellingdate;
		this.phone_warrantydate = phone_warrantydate;
		this.phone_soldBy = phone_soldBy;
		this.phone_platform = phone_platform;
		this.phone_platformName = phone_platformName;
	}

	// list
	// sales from sales_view
	// view------------------------------------------------------------------------------------------------------------------>
	public PhoneBean(long imei_no, String phone_name, String phone_storage, String phone_color,
			float phone_sellingprice, String phone_sellingdate, String phone_warrantydate, String phone_soldBy,
			float accessory_total, float phone_expense_total, float sales_total) {
		this.imei_no = imei_no;
		this.phone_name = phone_name;
		this.phone_storage = phone_storage;
		this.phone_color = phone_color;
		this.phone_sellingprice = phone_sellingprice;
		this.phone_sellingdate = phone_sellingdate;
		this.phone_warrantydate = phone_warrantydate;
		this.phone_soldBy = phone_soldBy;
		this.accessory_total = accessory_total;
		this.phone_expense_total = phone_expense_total;
		this.sales_total = sales_total;
	}

	// retrieve information for sales
	// report------------------------------------------------------------------------------------------>
	public PhoneBean(long imei_no, String phone_name, String phone_storage, String phone_color,
			String phone_sellingdate, float phone_sellingprice, float phone_buyingprice, float accessory_total,
			float phone_expense_total, float sales_total, float phone_profitmargin, float expense_incurred_total,
			float sales_influx) {
		this.imei_no = imei_no;
		this.phone_name = phone_name;
		this.phone_storage = phone_storage;
		this.phone_color = phone_color;
		this.phone_sellingdate = phone_sellingdate;
		this.phone_buyingprice = phone_buyingprice;
		this.phone_sellingprice = phone_sellingprice;
		this.phone_profitmargin = phone_profitmargin;
		this.accessory_total = accessory_total;
		this.phone_expense_total = phone_expense_total;
		this.sales_total = sales_total;
		this.expense_incurred_total = expense_incurred_total;
		this.sales_influx = sales_influx;

	}

	// input/retrieve accessory details in
	// database--------------------------------------------------------------------------------------->
	public PhoneBean(long imei_no, String accessory_name, float accessory_price) {
		this.imei_no = imei_no;
		this.accessory_name = accessory_name;
		this.accessory_price = accessory_price;
	}

	// input or retrieve phone expense details in
	// database--------------------------------------------------------------------------------------->
	public PhoneBean(long imei_no, float phone_expense_price, String phone_expense_name) {
		this.imei_no = imei_no;
		this.phone_expense_name = phone_expense_name;
		this.phone_expense_price = phone_expense_price;
	}

	// retreieve profit report from
	// database---------------------------------------------------------------->
	public PhoneBean(int year_sold, float jan_sales, float feb_sales, float mar_sales, float apr_sales, float may_sales,
			float jun_sales, float jul_sales, float aug_sales, float sep_sales, float oct_sales, float nov_sales,
			float dec_sales, float year_totals) {
		this.year_sold = year_sold;
		this.jan_sales = jan_sales;
		this.feb_sales = feb_sales;
		this.mar_sales = mar_sales;
		this.apr_sales = apr_sales;
		this.may_sales = may_sales;
		this.jun_sales = jun_sales;
		this.jul_sales = jul_sales;
		this.aug_sales = aug_sales;
		this.sep_sales = sep_sales;
		this.oct_sales = oct_sales;
		this.nov_sales = nov_sales;
		this.dec_sales = dec_sales;
		this.year_totals = year_totals;
	}
	
	//inputting personal expenditures into database------------------------------------------------------------------>
	public PhoneBean(String pExpenditureName,float pExpenditurePrice, String pExpenditureDate) {
		this.pExpenditureName=pExpenditureName;
		this.pExpenditurePrice=pExpenditurePrice;
		this.pExpenditureDate=pExpenditureDate;
	}

	// set
	// functions-------------------------------------------------------------------------------------------->
	public void setClientNo(int client_no) {
		this.client_no = client_no;
	}

	public void setImeiNo(long imei_no) {
		this.imei_no = imei_no;
	}

	public void setPhoneName(String phone_name) {
		this.phone_name = phone_name;
	}

	public void setPhoneStorage(String phone_storage) {
		this.phone_storage = phone_storage;
	}

	public void setPhoneColor(String phone_color) {
		this.phone_color = phone_color;
	}

	public void setPhoneBuyingPrice(float phone_buyingprice) {
		this.phone_buyingprice = phone_buyingprice;
	}

	public void setFaultDescription(String fault_description) {
		this.fault_description = fault_description;
	}

	public void setPhoneSellingPrice(float phone_sellingprice) {
		this.phone_sellingprice = phone_sellingprice;
	}

	public void setPhoneSellingDate(String phone_sellingdate) {
		this.phone_sellingdate = phone_sellingdate;
	}

	public void setPhoneWarrantyDate(String phone_warrantydate) {
		this.phone_warrantydate = phone_warrantydate;
	}

	public void setPhoneProfitMargin(float phone_profitmargin) {
		this.phone_profitmargin = phone_profitmargin;
	}

	public void setStartSearchDate(String startSearchDate) {
		this.startSearchDate = startSearchDate;
	}

	public void setEndSearchDate(String endSearchDate) {
		this.endSearchDate = endSearchDate;
	}

	public void setPhone_soldBy(String phone_soldBy) {
		this.phone_soldBy = phone_soldBy;
	}

	public void setPhone_platform(String phone_platform) {
		this.phone_platform = phone_platform;
	}

	public void setPhone_platformName(String phone_platformName) {
		this.phone_platformName = phone_platformName;
	}

	public void setFault_datereported(String fault_datereported) {
		this.fault_datereported = fault_datereported;
	}

	public void setAccessory_name(String accessory_name) {
		this.accessory_name = accessory_name;
	}

	public void setAccessory_price(float accessory_price) {
		this.accessory_price = accessory_price;
	}

	public void setPhone_expense_name(String phone_expense_name) {
		this.phone_expense_name = phone_expense_name;
	}

	public void setPhone_expense_price(float phone_expense_price) {
		this.phone_expense_price = phone_expense_price;
	}

	// get
	// functions----------------------------------------------------------------------------->
	public int getClient_no() {
		return client_no;
	}

	public long getImei_no() {
		return imei_no;
	}

	public String getPhone_name() {
		return phone_name;
	}

	public String getPhone_storage() {
		return phone_storage;
	}

	public String getPhone_color() {
		return phone_color;
	}

	public float getPhone_buyingprice() {
		return phone_buyingprice;
	}

	public String getFault_description() {
		return fault_description;
	}

	public float getPhone_sellingprice() {
		return phone_sellingprice;
	}

	public String getPhone_sellingdate() {
		return phone_sellingdate;
	}

	public String getPhone_warrantydate() {
		return phone_warrantydate;
	}

	public float getPhone_profitmargin() {
		return phone_profitmargin;
	}

	public String getStartSearchDate() {
		return startSearchDate;
	}

	public String getEndSearchDate() {
		return endSearchDate;
	}

	public String getPhone_soldBy() {
		return phone_soldBy;
	}

	public String getPhone_platform() {
		return phone_platform;
	}

	public String getPhone_platformName() {
		return phone_platformName;
	}

	public String getFault_datereported() {
		return fault_datereported;
	}

	public String getAccessory_name() {
		return accessory_name;
	}

	public float getAccessory_price() {
		return accessory_price;
	}

	public String getPhone_expense_name() {
		return phone_expense_name;
	}

	public float getPhone_expense_price() {
		return phone_expense_price;
	}

	public float getAccessory_total() {
		return accessory_total;
	}

	public float getPhone_expense_total() {
		return phone_expense_total;
	}

	public float getSales_total() {
		return sales_total;
	}

	public float getSales_influx() {
		return sales_influx;
	}

	public float getExpense_incurred_total() {
		return expense_incurred_total;
	}

	public int getYear_sold() {
		return year_sold;
	}

	public float getJan_sales() {
		return jan_sales;
	}

	public float getFeb_sales() {
		return feb_sales;
	}

	public float getMar_sales() {
		return mar_sales;
	}

	public float getApr_sales() {
		return apr_sales;
	}

	public float getMay_sales() {
		return may_sales;
	}

	public float getJun_sales() {
		return jun_sales;
	}

	public float getJul_sales() {
		return jul_sales;
	}

	public float getAug_sales() {
		return aug_sales;
	}

	public float getSep_sales() {
		return sep_sales;
	}

	public float getOct_sales() {
		return oct_sales;
	}

	public float getNov_sales() {
		return nov_sales;
	}

	public float getDec_sales() {
		return dec_sales;
	}

	public float getYear_totals() {
		return year_totals;
	}
	
	public String getPExpenditureName() {
		return pExpenditureName;
	}
	
	public float getPExpenditurePrice() {
		return pExpenditurePrice;
	}
	
	public String getPExpenditureDate() {
		return pExpenditureDate;
	}
}
