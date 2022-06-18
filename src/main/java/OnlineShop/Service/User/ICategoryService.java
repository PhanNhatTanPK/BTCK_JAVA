package OnlineShop.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import OnlineShop.Dto.ProductsDto;
@Service
public interface ICategoryService {
	public List<ProductsDto> GetDataProductsPaginate(int id,int start, int totalPage);
	public List<ProductsDto> GetDataProductsById(int id);
}
