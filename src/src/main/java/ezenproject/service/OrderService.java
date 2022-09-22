package ezenproject.service;

import java.util.List;

import ezenproject.dto.OrderDTO;

public interface OrderService {

	
	
	////////////여기서부터 관리자 페이지 서비스입니다.///////////
	
	public List<OrderDTO> listProcess();
	
	
public void statusChangeProcess(OrderDTO dto);
	
public void deleteDataProcess(int num);
	
	
	////////////여기까지 관리자 페이지 서비스입니다.////////////
	
public void newOrderNumberProcess(OrderDTO dto);
public void newOrderSaveProcess(OrderDTO dto);

public List<OrderDTO> myOrderListProcess(String memnumber);
public OrderDTO orderInformationProcess(int ordernum);
public OrderDTO orderStatusProcess(String order_number);

public void updateOrderProcess(OrderDTO dto);
}
