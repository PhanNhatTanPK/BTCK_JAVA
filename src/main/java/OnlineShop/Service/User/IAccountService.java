package OnlineShop.Service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import OnlineShop.Entity.User;

@Service
public interface IAccountService {
	
	public int AddAccount(User user);
	public User CheckAccount(User user);
}
