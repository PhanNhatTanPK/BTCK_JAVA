package OnlineShop.Dao;

import org.springframework.stereotype.Repository;

import OnlineShop.Entity.BillDetail;
import OnlineShop.Entity.Bills;

@Repository
public class BillsDao extends BaseDao{
	public int AddBills(Bills bills) {		
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT ");
		sql.append("INTO bills ( ");
		sql.append("quanty, username, phone, display_name, address, note, total ) ");
		sql.append("VALUES ( ");
		sql.append(" '"+bills.getQuanty()+"', '"+bills.getUsername()+"', '"+bills.getPhone()+"', ");
		sql.append(" '"+bills.getDisplay_name()+"', '"+bills.getAddress()+"', '"+bills.getNote()+"', '"+bills.getTotal()+"' )");
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public long GetIdLastBills() {
		String sql = "SELECT MAX(id) FROM bills";
		long id = _jdbcTemplate.queryForObject(sql, new Object[] {}, Long.class);
		return id;
	}
	
	public int AddBillsDetail(BillDetail billDetail) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT ");
		sql.append("INTO billdetail ( ");
		sql.append("id_product, quanty, total, id_bills ) ");
		sql.append("VALUES ( ");
		sql.append(" '"+billDetail.getId_product()+"', '"+billDetail.getQuanty()+"', '"+billDetail.getTotal()+"', '"+billDetail.getId_bills()+"' )");		
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
}
