package OnlineShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import OnlineShop.Entity.MapperMenu;
import OnlineShop.Entity.Menu;

@Repository
public class MenuDao extends BaseDao {
	public List<Menu> GetDataMenu() {
		List<Menu> list = new ArrayList<Menu>();
		String sql = "SELECT * FROM menus";
		list = _jdbcTemplate.query(sql, new MapperMenu());
		return list;
	}
}
