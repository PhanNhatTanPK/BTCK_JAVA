package OnlineShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import OnlineShop.Dao.CategorysDao;
import OnlineShop.Dao.MenuDao;
import OnlineShop.Dao.ProductsDao;
import OnlineShop.Dao.SildesDao;
import OnlineShop.Dto.ProductsDto;
import OnlineShop.Entity.Categorys;
import OnlineShop.Entity.Menu;
import OnlineShop.Entity.Slides;

@Service
public class HomeServiceImpl implements IHomeService {
	@Autowired
	private SildesDao slidesDao;
	@Autowired
	private CategorysDao categorysDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private ProductsDao productsDao;
	

	public List<Slides> GetDataSlides() {

		return slidesDao.GetDataSlide();
	}

	public List<Categorys> GetDataCategorys() {

		return categorysDao.GetDataCategorys();
	}

	public List<Menu> GetDataMenu() {

		return menuDao.GetDataMenu();
	}
	
	public List<ProductsDto> GetDataHighLightProducts() {

		return productsDao.GetDataHighLightProducts();
	}
	
	public List<ProductsDto> GetDataNewProducts() {

		return productsDao.GetDataNewProducts();
	}
	
	


}
