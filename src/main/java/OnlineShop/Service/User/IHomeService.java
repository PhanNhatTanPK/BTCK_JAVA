package OnlineShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import OnlineShop.Dto.ProductsDto;
import OnlineShop.Entity.Categorys;
import OnlineShop.Entity.Menu;
import OnlineShop.Entity.Slides;
@Service
public interface IHomeService {
	@Autowired
	public List<Slides> GetDataSlides();
	public List<Categorys> GetDataCategorys();
	public List<Menu> GetDataMenu();
	public List<ProductsDto> GetDataHighLightProducts();
	public List<ProductsDto> GetDataNewProducts();	
}
