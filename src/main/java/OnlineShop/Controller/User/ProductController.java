package OnlineShop.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import OnlineShop.Service.User.ProductServiceImpl;

@Controller
public class ProductController extends BaseController{
	@Autowired
	ProductServiceImpl _productService;
	@RequestMapping(value = { "productDetail/{id}" })
	public ModelAndView Index(@PathVariable long id) {	
		_mvShare.setViewName("user/products/product");
		_mvShare.addObject("product", _productService.GetProductById(id));
		_mvShare.addObject("categorys", _homeService.GetDataCategorys());
		int idCategory = _productService.GetProductById(id).getId_category();
		_mvShare.addObject("productByIdCategory", _productService.GetProductsByIdCategory(idCategory));
		return _mvShare;
	}
}
