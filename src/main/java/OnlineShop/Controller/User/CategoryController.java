	package OnlineShop.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import OnlineShop.Dto.PaginatesDto;
import OnlineShop.Service.User.CategoryServiceImpl;
import OnlineShop.Service.User.PaginatesServiceImpl;

@Controller
public class CategoryController extends BaseController {
	@Autowired
	private CategoryServiceImpl category;
	@Autowired
	private PaginatesServiceImpl paginate;
	private int totalProductPage = 1;
	
	@RequestMapping(value = "/products/{id}")
	public ModelAndView Product(@PathVariable String id) {
		_mvShare.setViewName("user/products/category");		
		int totalData = category.GetDataProductsById(Integer.parseInt(id)).size();
		PaginatesDto paginatesInfo = paginate.GetInfoPaginates(totalData, totalProductPage, 1);
		_mvShare.addObject("idCategory", id);
		_mvShare.addObject("paginateInfo", paginatesInfo);
		_mvShare.addObject("productsPaginate", category.GetDataProductsPaginate(Integer.parseInt(id),paginatesInfo.getStart(), totalProductPage));
		return _mvShare;
	}
	
	@RequestMapping(value = "/products/{id}/{currentPage}")
	public ModelAndView Product(@PathVariable String id, @PathVariable String currentPage) {
		
		_mvShare.setViewName("user/products/category");		
		int totalData = category.GetDataProductsById(Integer.parseInt(id)).size();
		PaginatesDto paginatesInfo = paginate.GetInfoPaginates(totalData, totalProductPage, Integer.parseInt(currentPage));
		_mvShare.addObject("idCategory", id);
		_mvShare.addObject("paginateInfo", paginatesInfo);
		_mvShare.addObject("productsPaginate", category.GetDataProductsPaginate(Integer.parseInt(id),paginatesInfo.getStart(), totalProductPage));
		return _mvShare;
	}
}
