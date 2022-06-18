package OnlineShop.Service.User;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import OnlineShop.Dao.BillsDao;
import OnlineShop.Dto.CartDto;
import OnlineShop.Entity.BillDetail;
import OnlineShop.Entity.Bills;

@Service
public class BillsServiceImpl implements IBillsService{
	
	@Autowired
	private BillsDao billsDao;

	public int AddBills(Bills bills) {
		return billsDao.AddBills(bills);
	}

	public void AddBillsDetail(HashMap<Long, CartDto> carts) {
		long idBills = billsDao.GetIdLastBills();
		for(Map.Entry<Long, CartDto> itemCart : carts.entrySet()) {
			BillDetail billDetail = new BillDetail();
			billDetail.setId_bills(idBills);
			billDetail.setId_product(itemCart.getValue().getProduct().getId_product());
			billDetail.setQuanty(itemCart.getValue().getQuanty());
			billDetail.setTotal(itemCart.getValue().getTotalPrice());
			billsDao.AddBillsDetail(billDetail);
		}
	}

}
