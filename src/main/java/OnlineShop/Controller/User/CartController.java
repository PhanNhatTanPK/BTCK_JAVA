package OnlineShop.Controller.User;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import OnlineShop.Dto.CartDto;
import OnlineShop.Entity.Bills;
import OnlineShop.Entity.User;
import OnlineShop.Service.User.BillsServiceImpl;
import OnlineShop.Service.User.CartServiceImpl;

@Controller
public class CartController extends BaseController {
	@Autowired
	private CartServiceImpl cartService;
	@Autowired
	private BillsServiceImpl billsService;
	
	@RequestMapping(value = "listCart")
	public ModelAndView Index() {
		_mvShare.addObject("slides", _homeService.GetDataSlides());		
		_mvShare.setViewName("user/cart/listCart");
		return _mvShare;
	}

	@RequestMapping(value = "AddCart/{id}")
	public String AddCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.AddCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("totalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("totalPriceCart", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = "EditCart/{id}/{quanty}")
	public String EditCart(HttpServletRequest request, HttpSession session, @PathVariable long id,@PathVariable int quanty) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.EditCart(id, quanty, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("totalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("totalPriceCart", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "DeleteCart/{id}")
	public String DeleteCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
		if (cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cart = cartService.DeleteCart(id, cart);
		session.setAttribute("Cart", cart);
		session.setAttribute("totalQuantyCart", cartService.TotalQuanty(cart));
		session.setAttribute("totalPriceCart", cartService.TotalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public ModelAndView CheckOut(HttpServletRequest request, HttpSession session) {
		_mvShare.setViewName("user/bill/checkout");
		_mvShare.addObject("categorys", _homeService.GetDataCategorys());
		Bills bills = new Bills();
		User userInfo = (User) session.getAttribute("UserInfo");
		if(userInfo != null) {
			bills.setUsername(userInfo.getUsername());
			bills.setDisplay_name(userInfo.getDisplay_name());
			bills.setAddress(userInfo.getAddress());
		}
		_mvShare.addObject("bills" ,bills);
		return _mvShare;
	}
	
	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String CheckOutBill(HttpServletRequest request, HttpSession session, @ModelAttribute("bills") Bills bill) {		
		int totalQuanty =  (Integer) session.getAttribute("totalQuantyCart");
		bill.setQuanty(totalQuanty);
		bill.setTotal((Double) session.getAttribute("totalPriceCart"));
		
		if(billsService.AddBills(bill) > 0) {
		
			HashMap<Long, CartDto> carts = (HashMap<Long, CartDto>)session.getAttribute("Cart");
		}
		session.removeAttribute("Cart");
		return "redirect:listCart" ;
	}

}
