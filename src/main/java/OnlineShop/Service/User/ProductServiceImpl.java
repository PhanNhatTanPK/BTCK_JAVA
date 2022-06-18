package OnlineShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import OnlineShop.Dao.ProductsDao;
import OnlineShop.Dto.ProductsDto;

@Service
public class ProductServiceImpl implements IProductService{
	@Autowired
	ProductsDao productsDao;
	public ProductsDto GetProductById(long id) {
		List<ProductsDto> list = productsDao.GetProductById(id);
		return list.get(0);
	}
	public List<ProductsDto> GetProductsByIdCategory(int id) {		
		return productsDao.GetDataProductsById(id);
	}

}
