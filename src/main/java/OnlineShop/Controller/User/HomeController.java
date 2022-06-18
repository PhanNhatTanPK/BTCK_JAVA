package OnlineShop.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController extends BaseController {
	
	@RequestMapping(value = { "/", "/home" })
	public ModelAndView Index() {
		_mvShare.addObject("slides", _homeService.GetDataSlides());
		_mvShare.addObject("categorys", _homeService.GetDataCategorys());
		_mvShare.addObject("newProducts", _homeService.GetDataNewProducts());
		_mvShare.addObject("highLightproducts", _homeService.GetDataHighLightProducts());
		_mvShare.setViewName("user/index");
		return _mvShare;
	}

}
