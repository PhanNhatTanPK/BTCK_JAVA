package OnlineShop.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import OnlineShop.Entity.MapperUser;
import OnlineShop.Entity.User;

@Repository
public class UserDao extends BaseDao{
	public int AddAccount(User user) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT ");
		sql.append("INTO users ( ");
		sql.append("username, password, display_name, address ) ");
		sql.append("VALUES ( ");
		sql.append(" '"+user.getUsername()+"', '"+user.getPassword()+"', '"+user.getDisplay_name()+"', '"+user.getAddress()+"' )");
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	
	public User GetUserByAccount(User user) {
		String sql = "SELECT * FROM users WHERE username = '"+user.getUsername()+"'";	
		User userDb = _jdbcTemplate.queryForObject(sql.toString(), new MapperUser()); 
		return userDb;
	}
	
	
}
