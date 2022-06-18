package OnlineShop.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import OnlineShop.Dto.ProductsDto;
import OnlineShop.Dto.ProductsDtoMapper;

@Repository
public class ProductsDao extends BaseDao {
	private StringBuffer SqlString() {
		StringBuffer  sql = new StringBuffer();
		sql.append("SELECT p.id AS id_product, p.id_category, p.ram, p.name, p.price, p.sale, p.title, p.highlight, p.new_product, p.details, c.id AS id_color, c.name AS name_color, c.code AS code_color, c.img, p.created_at, p.updated_at ");
		sql.append("FROM products AS p ");
		sql.append("INNER JOIN colors AS c ON p.id = c.id_product ");
		
		return sql;
	}
	
	public String SqlProduct(boolean highlight, boolean new_product) {
		StringBuffer sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		if(highlight) {
			sql.append("AND p.highlight = true ");
		}
		if(new_product) {
			sql.append("AND p.new_product = true ");
		}	
		sql.append("GROUP BY p.id, c.id_product ");
		sql.append("ORDER BY RAND() ");
		if(highlight) {
			sql.append("LIMIT 9 ");
		}
		if(new_product) {
			sql.append("LIMIT 8 ");
		}			
		return sql.toString();
	}
	
	public StringBuffer SqlProductsById(int id) {
		StringBuffer sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND id_category = " + id + " ");			
		return sql;
	}
	
	public String SqlProductsPaginate(int id, int start, int totalPage) {
		StringBuffer sql = SqlProductsById(id);
		sql.append("LIMIT "+ start +", "+ totalPage);		
		return sql.toString();
	}
		
	public String SqlProductById(long id) {
		StringBuffer sql = SqlString();
		sql.append("WHERE 1 = 1 ");
		sql.append("AND p.id = " + id + " ");
		sql.append("LIMIT 1");
		return sql.toString();
	}
	
	public List<ProductsDto> GetDataHighLightProducts() {
		String sql = SqlProduct(true, false );
		List<ProductsDto > list = _jdbcTemplate.query(sql, new ProductsDtoMapper()); 
		return list;
	}
	
	public List<ProductsDto> GetDataNewProducts() {
		String sql = SqlProduct(false, true );
		List<ProductsDto > list = _jdbcTemplate.query(sql, new ProductsDtoMapper()); 
		return list;
	}
	
	public List<ProductsDto> GetDataProductsById(int id) {
		String sql = SqlProductsById(id).toString();
		List<ProductsDto> list = _jdbcTemplate.query(sql, new ProductsDtoMapper()); 
		return list;
	}
	
	public List<ProductsDto> GetDataProductsPaginate(int id, int start, int totalPage) {				
			String sql = SqlProductsPaginate(id, start, totalPage);
			List<ProductsDto> list =_jdbcTemplate.query(sql, new ProductsDtoMapper()); 
			
		return list;
	}
	
	public List<ProductsDto> GetProductById(long id) {
		String sql = SqlProductById(id).toString();
		List<ProductsDto> list = _jdbcTemplate.query(sql, new ProductsDtoMapper()); 
		return list;
	}
	
	public ProductsDto FindProductById(long id) {
		String sql = SqlProductById(id).toString();
		ProductsDto product = _jdbcTemplate.queryForObject(sql, new ProductsDtoMapper()); 
		return product;
	}
}
