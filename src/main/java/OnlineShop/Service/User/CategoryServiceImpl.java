package OnlineShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import OnlineShop.Dao.ProductsDao;
import OnlineShop.Dto.ProductsDto;

@Service
public class CategoryServiceImpl implements ICategoryService {
	@Autowired
	private ProductsDao productsDao;
	
	public List<ProductsDto> GetDataProductsPaginate(int id,int start, int totalPage) {
		
		return productsDao.GetDataProductsPaginate(id, start, totalPage);
	}
	
	public List<ProductsDto> GetDataProductsById(int id) {

		return productsDao.GetDataProductsById(id);
	}
}
