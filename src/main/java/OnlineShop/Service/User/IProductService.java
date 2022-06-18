package OnlineShop.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import OnlineShop.Dto.ProductsDto;

@Service
public interface IProductService {
	public ProductsDto GetProductById(long id);
	public List<ProductsDto> GetProductsByIdCategory(int id);
}
