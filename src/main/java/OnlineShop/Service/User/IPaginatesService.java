package OnlineShop.Service.User;

import org.springframework.stereotype.Service;

import OnlineShop.Dto.PaginatesDto;

@Service
public interface IPaginatesService {
	public PaginatesDto GetInfoPaginates(int totalPage, int limit, int currentPage);
		
}
