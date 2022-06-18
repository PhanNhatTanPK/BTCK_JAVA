package OnlineShop.Service.User;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import OnlineShop.Dto.CartDto;
import OnlineShop.Entity.Bills;

@Service
public interface IBillsService {
	public int AddBills(Bills bills);
	public void AddBillsDetail(HashMap<Long, CartDto> carts);
}
