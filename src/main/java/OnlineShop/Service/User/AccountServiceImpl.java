package OnlineShop.Service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import OnlineShop.Dao.UserDao;
import OnlineShop.Entity.User;

@Service
public class AccountServiceImpl implements IAccountService {
	@Autowired
	private UserDao userDao;

	public int AddAccount(User user) {			
		
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(6)));
		return userDao.AddAccount(user);					
	}

	public User CheckAccount(User user) {
		String pass = user.getPassword();
		user = userDao.GetUserByAccount(user);
		if(user != null) {
			if(BCrypt.checkpw(pass, user.getPassword())) {
				return user;
			}
			else {
				return null;
			}			
		}	
		return null;
	}
}
