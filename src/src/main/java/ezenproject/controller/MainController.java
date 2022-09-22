package ezenproject.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezenproject.dto.BookDTO;
import ezenproject.dto.CartDTO;
import ezenproject.dto.CouponDTO;
import ezenproject.dto.ListOrderDTO;
import ezenproject.dto.MemberDTO;
import ezenproject.dto.OrderDTO;
import ezenproject.dto.PageDTO;
import ezenproject.service.BookService;
import ezenproject.service.CartService;
import ezenproject.service.CouponService;
import ezenproject.service.MemberService;
import ezenproject.service.OrderService;

// http://localhost:8090/

@CrossOrigin("*")
@Controller
public class MainController {

	@Autowired
	private BookService bservice;

	@Autowired
	private MemberService mservice;

	@Autowired
	private OrderService oservice;
	
	@Autowired
	private CouponService couponservice;
	
	@Autowired
	private CartService cservice;
	
	private BookDTO bdto;
	private MemberDTO mdto;
	private OrderDTO odto;
	private PageDTO pdto;
	private CartDTO cdto;
	
	private int currentPage;

	public MainController() {
		// TODO Auto-generated constructor stub
	}

	@Value("${spring.servlet.multipart.location}")
	private String filepath;

//////////////////////여기서부터 메인페이지 관련 //////////////////	
	
//	메인 페이지 연결
	// http://localhost:8090/
	@RequestMapping(value =  {"/","/index.do" } , method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, ModelAndView mav) {
		int totalRecord = bservice.countProcess();
		String viewname = (String) request.getAttribute("viewName");
		if (viewname == null) {
			viewname = "/index";
		}
		
		pdto = new PageDTO(1, totalRecord);
		List<BookDTO> alist = bservice.allBookListProcess(pdto);
		mav.addObject("alist", alist);
		
		mav.setViewName(viewname);

		return mav;
	}

	
//	////////////////////여기까지 메인페이지 관련 ////////////////////////////////////////////////
	
//	Form으로 끝나는 친구들 연결 시키는거(result = false)
	@RequestMapping(value = "/*/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

//	/////////////////////////////// 여기서부터 로그인& 로그아웃 & 회원가입/////////////////////////////////////////////////
//	로그인 하는 행위
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView memberLoginMethod(@ModelAttribute("member") MemberDTO dto, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mdto = mservice.memberLogin(dto);
		if (mdto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", mdto);
			session.setAttribute("isLogOn", true);

			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			if (action != null) {
				mav.setViewName("redirect:" + action);
			} else {
				mav.setViewName("redirect:/");
			}
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}

		return mav;
	}

//	로그아웃 하는 행위
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogin");

		return "redirect:/";
	}

//	회원가입하는 행위 
	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberDTO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		int result = 0;
		mservice.addMemberNumberProcess(member);
		result = mservice.addMemberProcess(member);
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}

//	///////////////////////////////////여기까지 로그인 & 로그아웃 & 회원가입/////////////////////////////////////
	
//	///////////////////////////여기서부터 마이 페이지////////////////////////////////////////

	//회원정보 출력
		@RequestMapping(value = "/mypage/memberdetail.do", method = RequestMethod.GET)
		public ModelAndView memberInformationMethod(ModelAndView mav, int num)
				throws Exception {
			mdto = mservice.selectOneProcess(num);
			mav.addObject("memberInfo", mdto);
			mav.setViewName("/mypage/memberdetail");
//			System.out.println(mdto);
			return mav;
		}
	
	
		//회원탈퇴
		@RequestMapping(value = "/mypage/memberdelete.do", method = RequestMethod.POST)
		public String memberLeaveMethod(int num, HttpServletRequest request)	throws Exception {
			mservice.statusChangeOffProcess(num);
			logout(request);
			return "redirect:/";
		}
		
		
		//회원정보 수정
		@RequestMapping(value = "/mypage/update.do", method = RequestMethod.POST)
		public String updateMethod(MemberDTO mdto) throws Exception {
			mservice.updateInformation(mdto);
			return "redirect:/mypage/mypageForm.do";
		}
		
		
		//주문 목록
		@RequestMapping(value = "/mypage/myorderlist.do", method = RequestMethod.GET)
		public ModelAndView orderListMethod(ModelAndView mav, String member_number) {	 
			 
			 List<OrderDTO> aList = oservice.myOrderListProcess(member_number);
			
			 mav.addObject("aList", aList); 
			mav.setViewName("/mypage/myorderlist");
			return mav;
		} 
		
		
		//주문 뷰페이지
		@RequestMapping(value = "/mypage/myorderdetail.do", method = RequestMethod.GET)
		public ModelAndView orderInformationMethod(ModelAndView mav, int num)
				throws Exception {
			odto = oservice.orderInformationProcess(num);
			mav.addObject("orderInfo", odto);
			mav.setViewName("/mypage/myorderdetail");
			//System.out.println(obdto.getBdto().getBook_content());
			return mav;
		}
		
		
		
		//배송 확인
		@RequestMapping(value="/mypage/myorderstatus.do", method = RequestMethod.GET)
		public ModelAndView orderStatusMethod(String order_number, ModelAndView mav) throws Exception {
			odto = oservice.orderStatusProcess(order_number);
			mav.addObject("orderstatus", odto);
			mav.setViewName("/mypage/myorderstatus");
			
			return mav;
		}
		
		
		//주문 취소(시스템상 내용은 주문 수정)
		@RequestMapping(value = "/mypage/myorderupdate.do", method = RequestMethod.POST)
		public String orderupdateMethod(OrderDTO dto, String member_number) throws Exception {
			
			oservice.updateOrderProcess(dto);

			return "redirect:/mypage/myorderlist.do?member_number="+member_number;
		}
		
		
		//할인권 출력
				@RequestMapping(value = "/mypage/mycoupon.do", method = RequestMethod.GET)
				public ModelAndView myCouponlist(ModelAndView mav, String member_number) {	 
					 
					 List<CouponDTO> aList = couponservice.listProcess(member_number);
					
					 mav.addObject("aList", aList); 
					// System.out.println(aList);
					mav.setViewName("/mypage/mycoupon");
					return mav;
				} 
		
		
	
//	///////////////////////////여기까지 마이페이지//////////////////////////////////////////////
	
	
	
	
	
//////////////////////////////여기서부터 도서 리스트/////////////////////////////////////////////////////	
	
	
//	모든 종류 도서 리스트(신작 도서리스트)
	@RequestMapping(value = "/book/*Booklist.do")
	public ModelAndView listAllBookMethod(HttpServletRequest request, PageDTO pv, ModelAndView mav) {
		int totalRecord = bservice.countProcess();
		String viewName = (String) request.getAttribute("viewName");
		if (totalRecord != 0) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			List<BookDTO> alist = bservice.allBookListProcess(pdto);
			List<BookDTO> newList = bservice.newBookListProcess(pdto);
			mav.addObject("newList", newList);
			mav.addObject("alist", alist);
			mav.addObject("pv", pdto);

		}
		mav.setViewName(viewName);

		return mav;
	}

//	카테고리별 책 리스트
	@RequestMapping(value = "/book/*Categorylist.do", method = RequestMethod.GET)
	public ModelAndView listCategoryBookMethod(HttpServletRequest request, PageDTO pv, ModelAndView mav,
			int book_category, String categoryName) {
		int totalRecord = bservice.countCategoryProcess(book_category);
		String viewName = (String) request.getAttribute("viewName");
		if (totalRecord != 0) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			List<BookDTO> alist = bservice.categoryBookListProcess(pdto, book_category);
			mav.addObject("categoryName", categoryName);
			mav.addObject("alist", alist);
			mav.addObject("pv", pdto);

		}
		mav.setViewName(viewName);

		return mav;
	}

//	검색한 책 리스트
	@RequestMapping(value = "/book/searchlist.do", method = RequestMethod.GET)
	public ModelAndView listSearchMethod(HttpServletRequest request, PageDTO pv, ModelAndView mav, String searchWord) {
		int totalRecord = bservice.countSearchProcess(searchWord);
		String viewName = (String) request.getAttribute("viewName");
		if (totalRecord != 0) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);

			pdto.setSearchWord(searchWord);

			List<BookDTO> alist = bservice.searchListProcess(pdto);

			mav.addObject("alist", alist);
			mav.addObject("pv", pdto);

		}
		mav.setViewName(viewName);

		return mav;
	}

	
//	///////////////////////////여기까지 도서 리스트////////////////////////////////////////////
	
///////////////////////////여기서부터 도서 상세 페이지//////////////////////////////////////	
	
//	도서 상세 페이지 들어가기
	@RequestMapping(value = "/book/book_detail.do")
	public ModelAndView viewMethod(HttpServletRequest request, int currentPage, int num, ModelAndView mav) {
		String viewName = (String)request.getAttribute("viewName");
		List<BookDTO> alist = bservice.listProcess();
		mav.addObject("alist", alist);
		
		try {
			if(bservice.contentProcess(num).getNum()==num) {
					mav.addObject("dto", bservice.contentProcess(num));
					
					mav.addObject("currentPage", currentPage);
					mav.setViewName(viewName);
		}
			
		}catch (Exception e) {
			viewName = "/erroralert";
			mav.setViewName(viewName);
		}
		
		return mav;
		
	}
	
	
//	////////////////////////////여기까지 도서 상세 페이지./////////////////////////////////////////
	
	
	
//////////////////여기서부터 주문페이지 ////////////////////////////////////////////////////////////



//	주문 페이지 들어가기
	@RequestMapping("/order/orderDetail.do")
	public ModelAndView viewMethod(HttpServletRequest request, int num, ModelAndView mav, String member_number) {
 bdto= bservice.contentProcess(num);
List<CouponDTO> couponlist = couponservice.listProcess(member_number);
		String viewName = (String) request.getAttribute("viewName");

		mav.addObject("bdto", bdto);
		mav.addObject("couponlist", couponlist);
		mav.setViewName(viewName);
		
		return mav;

	}


	
	
//	주문하는 행위
	@RequestMapping(value = "/order/ordersave.do", method = RequestMethod.POST)
	public String newOrderMethod(OrderDTO dto, HttpServletRequest request, String coupon_number) {
		oservice.newOrderNumberProcess(dto);
		oservice.newOrderSaveProcess(dto);
		couponservice.usedCouponProcess(coupon_number);
		
		return "redirect:/";
	}
	
	
//	장바구니 페이지 주문하는 행위
	@RequestMapping(value = "/order/cartordersave.do", method = RequestMethod.POST)
	public String newCartOrderMethod(ListOrderDTO listorder, HttpServletRequest request, String coupon_number,
			int order_cost, String member_number, String order_phone, String order_name, String order_address) {
		
		OrderDTO standarddto=listorder.getOrderDTO().get(0);
				oservice.newOrderNumberProcess(standarddto);
				String standardcode = standarddto.getOrder_number();
				
				
		for(int i=0; i< listorder.getOrderDTO().size(); i++ ) {
			OrderDTO alist= listorder.getOrderDTO().get(i);
			alist.setOrder_number(standardcode);
			alist.setOrder_cost(order_cost);
			alist.setMember_number(member_number);
			alist.setOrder_phone(order_phone);
			alist.setOrder_name(order_name);
			alist.setOrder_address(order_address);
			
			oservice.newOrderSaveProcess(alist);
		}
		
		

//		oservice.newOrderSaveProcess(dto);
		couponservice.usedCouponProcess(coupon_number);
		
		return "redirect:/";
	}
	
	
	
	
//	////////////////////////////여기까지 주문 페이지///////////////////////////////////////
	
	
	
////////////////////////////////장바구니 메소드 시작//////////////////////////////////////

/* 장바구니 추가 */
/**
* 0: 등록 실패
* 1: 등록 성공
* 2: 등록된 데이터 존재
*/


@ResponseBody
@RequestMapping(value = "/cart/list/add")
public String addCartPOST(CartDTO dto, HttpServletRequest request) {

int result = cservice.addCartProcess(dto);
return result + "";	
}

/* 장바구니 페이지 이동 */	

@RequestMapping(value ="/cart/list/{member_number}" , method = RequestMethod.GET)
public String cartPageGET(@PathVariable("member_number") String member_number, Model model) {
model.addAttribute("clist", cservice.getCartProcess(member_number));

return "/cart/list";
}	
/* 장바구니 수량 수정 */
@RequestMapping(value = "/cart/list/update" , method = RequestMethod.POST)
public String updateCartPOST(CartDTO dto) {
cservice.modifyCountProcess(dto);
return "redirect:/cart/list/" + dto.getMember_number();

}	
/* 장바구니 제거 */
@RequestMapping(value = "/cart/list/delete" , method = RequestMethod.POST)
public String deleteCartDELETE(CartDTO dto) {
cservice.deleteCartProcess(dto.getNum());
return "redirect:/cart/list/" + dto.getMember_number();
}		

/* 장바구니 주문 페이지 */
@RequestMapping(value ="/order/orderCartDetail/{member_number}" , method = RequestMethod.GET)
public String cartOrderGET(@PathVariable("member_number") String member_number, Model model) {
model.addAttribute("clist", cservice.getCartProcess(member_number));
model.addAttribute("couponlist", couponservice.listProcess(member_number));

return "/order/orderCartDetail";
}	

/* 주문페이지 장바구니 수량 수정 */
@ResponseBody
@RequestMapping(value = "/order/orderCartDetail/update" , method = RequestMethod.PUT)
public void updateOrderCartPOST(CartDTO dto) {
cservice.modifyCountProcess(dto);
}	
/* 주문페이지 장바구니 제거 */
@ResponseBody
@RequestMapping(value = "/order/orderCartDetail/delete" , method = RequestMethod.DELETE)
public void deleteOrderCartDELETE(CartDTO dto, int num) {
cservice.deleteCartProcess(num);
}	



////////////////////장바구니 페이지 끝////////////////////////////////
	

////////////////////////////////////////////////////여기부터 관리자 페이지 메소드입니다.////////////////////

//	관리자 페이지 제품 리스트 출력
	@ResponseBody
	@RequestMapping(value = "/books/list")
	public Map<String, Object> listBookMethod(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<BookDTO> alist = bservice.listProcess();

//		System.out.println(alist.get(0).getBook_title());
		map.put("alist", alist);

		return map;
	}

//	판매 유무 변경
	@ResponseBody
	@RequestMapping(value = "/books/statuschange/{num}", method = RequestMethod.PUT)
	public void statusBookChangeMethod(@PathVariable("num") int num) {

		bservice.statusCheckProcess(num);

	}

//	재고 유무 변경
	@ResponseBody
	@RequestMapping(value = "/books/stockchange/{num}", method = RequestMethod.PUT)
	public void stockBookChangeMethod(@PathVariable("num") int num) {

		bservice.stockCheckProcess(num);

	}

//	새로운 제품 등록
	@ResponseBody
	@RequestMapping(value = "/books/newbooksave", method = RequestMethod.POST)
	public void newBookMethod(BookDTO dto) {
		MultipartFile file = dto.getFilename();
		if (file != null && !file.isEmpty()) {
			UUID ran = saveCopyFile(file);
			dto.setBook_img(ran + "_" + file.getOriginalFilename());
		}

		bservice.newBookIDProcess(dto);
		bservice.newBookProcess(dto);

	}

//	책 표지 등록
	private UUID saveCopyFile(MultipartFile file) {
		String filename = file.getOriginalFilename();

		// 중복 파일명을 처리하기 위해 난수 발생
		UUID ran = UUID.randomUUID();

		File fe = new File(filepath); // 경로가 없으면 만들어라
		if (!fe.exists()) {
			fe.mkdirs();
		}

		File ff = new File(filepath, ran + "_" + filename);

		try {
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//				System.out.println("파일 경로:  "+filepath);
		return ran;

	}

//	도서 제품 데이터 영구 삭제
	@ResponseBody
	@RequestMapping(value = "/books/deletedata/{num}", method = RequestMethod.DELETE)
	public void deleteBookDataMethod(@PathVariable("num") int num) {
		bservice.deleteDataProcess(num, filepath);
	}

//	도서 정보 수정 행위
	@ResponseBody
	@RequestMapping(value = "/books/updatebook", method = RequestMethod.PUT)
	public void updateBookMethod(BookDTO dto) {
		MultipartFile file = dto.getFilename();
		System.out.println(dto.getBook_title());
		if (file != null && !file.isEmpty()) {
			UUID ran = saveCopyFile(file);
			dto.setBook_img(ran + "_" + file.getOriginalFilename());
		}

		bservice.updateBookProcess(dto, filepath);

	}

	@ResponseBody
	@RequestMapping(value = "/books/selectone/{num}", method = RequestMethod.GET)
	public BookDTO selectOneBookMethod(@PathVariable("num") int num) {

		return bservice.selectOneProcess(num);
	}

//	관리자 페이지 회원 리스트 출력
	@ResponseBody
	@RequestMapping(value = "/members/list")
	public Map<String, Object> listMemberMethod(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<MemberDTO> alist = mservice.listProcess();

//		System.out.println(alist.get(0).getMember_id());
		map.put("alist", alist);

		return map;
	}

//	계정 상태 변경
	@ResponseBody
	@RequestMapping(value = "/members/statuschange/{num}", method = RequestMethod.PUT)
	public void statusMemberChangeMethod(@PathVariable("num") int num) {

		mservice.statusCheckProcess(num);

	}

//	계정 유형 변경
	@ResponseBody
	@RequestMapping(value = "/members/typechange/{num}", method = RequestMethod.PUT)
	public void typeMemberChangeMethod(@PathVariable("num") int num) {

		mservice.typeCheckProcess(num);

	}

//	회원 데이터 영구 삭제
	@ResponseBody
	@RequestMapping(value = "/members/deletedata/{num}", method = RequestMethod.DELETE)
	public void deleteMemberDataMethod(@PathVariable("num") int num) {
		mservice.deleteDataProcess(num);
	}

//	관리자 페이지 주문 리스트 출력
	@ResponseBody
	@RequestMapping(value = "/orders/list")
	public Map<String, Object> listOrderMethod(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<OrderDTO> alist = oservice.listProcess();

		map.put("alist", alist);

		return map;
	}

//	주문 상태 변경
	@ResponseBody
	@RequestMapping(value = "/orders/statuschange", method = RequestMethod.PUT)
	public void changeOrderStatusMethod(OrderDTO dto) {

		oservice.statusChangeProcess(dto);

	}

//	주문 데이터 영구 삭제
	@ResponseBody
	@RequestMapping(value = "/orders/deletedata/{num}", method = RequestMethod.DELETE)
	public void deleteOrderDataMethod(@PathVariable("num") int num) {
		oservice.deleteDataProcess(num);
	}
	
	
//	회원에게 할인권 부여
	@ResponseBody
	@RequestMapping(value = "/members/newcouponsave", method = RequestMethod.POST)
	public void newCouponMethod(CouponDTO dto) {
		

		couponservice.newCouponCodeProcess(dto);
		couponservice.saveNewCouponProcess(dto);
	}
	
//	관리자 페이지 회원 관리 페이지 쿠폰 출력
	@ResponseBody
	@RequestMapping(value = "/members/couponlist/{member_number}")
	public Map<String, Object> listCouponMethod(HttpServletRequest request, 
			@PathVariable("member_number") String member_number) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<CouponDTO> alist = couponservice.listProcess(member_number);


		map.put("alist", alist);

		return map;
	}

	
	
//	할인권 삭제
	@ResponseBody
	@RequestMapping(value = "/members/deletecoupon/{num}", method = RequestMethod.DELETE)
	public void deleteCouponMethod(@PathVariable("num") int num) {
		couponservice.deleteCouponProcess(num);
	}

//////////////////////////////////////////////////////여기까지 관리자 페이지 메소드입니다.///////////////	

}
