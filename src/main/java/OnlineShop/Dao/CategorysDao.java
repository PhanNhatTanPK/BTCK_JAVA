package OnlineShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import OnlineShop.Entity.Categorys;
import OnlineShop.Entity.MapperCategorys;

@Repository
public class CategorysDao extends BaseDao {
	
	public List<Categorys> GetDataCategorys() {
		List<Categorys> list = new ArrayList<Categorys>();
		String sql = "SELECT * FROM categorys";
		list = _jdbcTemplate.query(sql, new MapperCategorys());
		return list;
	}
	
}
