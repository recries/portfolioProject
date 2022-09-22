package ezenproject.dto;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ListOrderDTO {

	private List<OrderDTO> orderDTO;
	
	public ListOrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public List<OrderDTO> getOrderDTO() {
		return orderDTO;
	}

	public void setOrderDTO(List<OrderDTO> orderDTO) {
		this.orderDTO = orderDTO;
	}
	
	
	
}
