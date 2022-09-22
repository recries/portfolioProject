<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script defer
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>		
	
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css" />
<title>장바구니</title>
<link rel="short icon" href="${pageContext.request.contextPath}/assets/img/favicon.png"
	type="image/x-icon" />
</head>
<body>
	<!-- Header Start -->
	<!-- Nabar start -->

	<%@ include file="../common/header.jsp"%>
	<!-- Header end -->

	<!-- breadclumb start -->
	<section class="bread">
		<div class="container">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="../../index.do">메인페이지</a></li>
					<li class="breadcrumb-item active" aria-current="page">장바구니</li>
				</ol>
			</nav>
		</div>
	</section>
	<!-- breadclumb end -->
	<!-- head end -->
	<!-- ///////////장바구니 리스트 페이지 시작////////////////////////////// -->
	<!-- 다시 책 페이지로 돌아가기 위함 -->
	<c:url var="path" value="/book/book_detail.do">
		<c:param name="currentPage" value="${pv.currentPage }" />
		<c:param name="num" value="${dto.num }" />
	</c:url>
				<c:choose>
				<c:when test="${clist[0].book_title == null }"><div class="cart_null">장바구니가 비어있습니다.</div></c:when>
				<c:otherwise>
			<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장바구니</h4>
				<div class="white_space">
			<div class="all_check_input_div" style="margin-left:110px " >
			<input type="checkbox" class="all_check_input input_size_20" checked="checked" style="width: 20px; height: 20px; vertical-align: middle;"><span class="all_chcek_span" style="vertical-align:top; font-size: 18px; padding-top: 0px">&nbsp;모두선택</span>
			</div>	
				<div class="cart_div_container">
				<div class="row" id="product_bezel">
				<c:forEach items="${clist}" var="cdto">
				<div class="cart_img_area" style="background-color: #f5f5f5;">
				<img src="/assets/img/${cdto.book_img}" height="160px" width="100px" alt="${cdto.book_img } " style="margin: 10px auto 10px auto; display: flex; justify-content: space-between;">
				</div>
				<div class="cart_product_area">
				<table class="cart_area1" style="margin-top: 10%">
					<tbody>
						<tr>
							<th class="cart_title">${cdto.book_title}</th>
						</tr>
						<tr><td></td></tr>
						<tr class="cart_sub">
							<td>${cdto.book_publisher} | ${cdto.book_author }</td>
						</tr>
						<tr><td></td></tr>
						<tr>
							<td class="cart_sub">
							<c:if test="${cdto.book_category == 1}">시</c:if>
				<c:if test="${cdto.book_category == 2}">역사소설</c:if>
				<c:if test="${cdto.book_category == 3}">과학소설(SF)</c:if>
				<c:if test="${cdto.book_category == 4}">추리/미스터리 소설</c:if>
				<c:if test="${cdto.book_category == 5}">판타지/환상문학</c:if>
				<c:if test="${cdto.book_category == 6}">희곡</c:if>
				<c:if test="${cdto.book_category == 7}">교양인문학</c:if>
				<c:if test="${cdto.book_category == 8}">인문에세이</c:if>
				<c:if test="${cdto.book_category == 9}">철학</c:if>
				<c:if test="${cdto.book_category == 10}">심리/정신분석학</c:if>
				<c:if test="${cdto.book_category == 11}">신화/종교학</c:if>
				<c:if test="${cdto.book_category == 12}">문화/문화이론</c:if>
				<c:if test="${cdto.book_category == 13}">비평/칼럼</c:if>
				<c:if test="${cdto.book_category == 14}">사회문제</c:if>
				<c:if test="${cdto.book_category == 15}">환경/생태문제</c:if>
				<c:if test="${cdto.book_category == 16}">사회운동</c:if>
				<c:if test="${cdto.book_category == 17}">언론/미디어</c:if>
				<c:if test="${cdto.book_category == 18}">법과 생활</c:if>
				<c:if test="${cdto.book_category == 19}">동양사일반</c:if>
				<c:if test="${cdto.book_category == 20}">역사학</c:if>
				<c:if test="${cdto.book_category == 21}">한국고대~고려시대</c:if>
				<c:if test="${cdto.book_category == 22}">조선사</c:if>
				<c:if test="${cdto.book_category == 23}">서양사</c:if>
				<c:if test="${cdto.book_category == 24}">전쟁/분쟁사</c:if>
				<c:if test="${cdto.book_category == 25}">컬러링북</c:if>
				<c:if test="${cdto.book_category == 26}">예술/대중문화의 이해</c:if>
				<c:if test="${cdto.book_category == 27}">미술</c:if>
				<c:if test="${cdto.book_category == 28}">음악</c:if>
				<c:if test="${cdto.book_category == 29}">건축</c:if>
				<c:if test="${cdto.book_category == 30}">무용</c:if>
				<c:if test="${cdto.book_category == 31}">기초과학/교양과학</c:if>
				<c:if test="${cdto.book_category == 32}">과학사회학</c:if>
				<c:if test="${cdto.book_category == 33}">생명과학</c:if>
				<c:if test="${cdto.book_category == 34}">의학</c:if>
				<c:if test="${cdto.book_category == 35}">천문학</c:if>
				<c:if test="${cdto.book_category == 36}">화학</c:if>
				<c:if test="${cdto.book_category == 37}">경제학/경제일반</c:if>
				<c:if test="${cdto.book_category == 38}">기업/경영</c:if>
				<c:if test="${cdto.book_category == 39}">마케팅/세일즈</c:if>
				<c:if test="${cdto.book_category == 40}">트렌드/미래전망</c:if>
				<c:if test="${cdto.book_category == 41}">재테크/투자</c:if>
				<c:if test="${cdto.book_category == 42}">창업/취업/은퇴</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div class="cart_quantity1">
					<div class="quantity_div2">
						<div class="quantity_div">
						<button class="quantity_btn minus_btn" id="cart_minus_btn">-</button>
						<button class="quantity_btn plus_btn" id="cart_plus_btn">+</button>
						<input style="width: 88px;" type="text" value="${cdto.cart_amount}" class="quantity_input" readonly="readonly">
						</div>
						<a class="quantity_modify_btn" id="quantity_modify_btn" data-num="${cdto.num}">변경</a>
				
					</div>
				</div>
			<div class="cart_quantity2">
					<table>
						<tbody>
							<tr style="vertical-align: top">
								<td class="cart_info_td" colspan="2">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" style="width: 20px; height: 20px; vertical-align: bottom;" checked="checked">
									<input type="hidden" class="individual_book_price_input" value="${cdto.book_price}">
									<input type="hidden" class="individual_saleprice_input" value="${cdto.saleprice}">
									<input type="hidden" class="individual_cart_amount_input" value="${cdto.cart_amount}">
									<input type="hidden" class="individual_totalPrice_input" value="${cdto.saleprice * cdto.cart_amount}">
									<input type="hidden" class="individual_point_input" value="${cdto.point}">
									<input type="hidden" class="individual_totalPoint_input" value="${cdto.totalPoint}">
									<input type="hidden" class="individual_book_id_input" value="${cdto.book_id}">								
								</td>
								<td colspan="2" class="td_width_4 table_text_align_center">
										<button class="delete_btn" data-num="${cdto.num}"><img alt="delete_btn" src="/assets/img/delete_btn.png" width="20px" height="20px"></button>
								</td>
								</tr>
								<tr>
									<td class="list_price" colspan="2">정가 : </td>
									<td class="list_price" style="text-align: right;" colspan="2"><fmt:formatNumber value="${cdto.book_price}" pattern="#,###원" /></td>
								</tr>
								<tr>
								<td class="sell_price" colspan="2">판매가 : </td>
									<td class="sell_price" colspan="2" style="text-align: right;"><fmt:formatNumber value="${cdto.saleprice}" pattern="#,###원"/></td>
								</tr>
									<tr>
										<td colspan="100%" style="width: 200px">
											&nbsp;
										</td>
									</tr>
								<tr>
								</tr>
								<tr>
									<td height="7px"></td>
								</tr>
								<tr>
									<th  colspan="4" style="text-align: right;">
										<fmt:formatNumber value="${cdto.saleprice * cdto.cart_amount}" pattern="#,###원" />
									</th>
								</tr>
					</tbody>
				</table>
				<!-- 수량조절 form -->
				<form action="/cart/list/update" method="post" class="quantity_update_form">
					<input type="hidden" name="num" class="update_num">
					<input type="hidden" name="cart_amount" class="update_cart_amount">
					<input type="hidden" name="member_number" value="${member.member_number}">
				</form>	
				<!-- 삭제 form -->
				<form action="/cart/list/delete" method="post" class="quantity_delete_form">
					<input type="hidden" name="num" class="delete_num">
					<input type="hidden" name="member_number" value="${member.member_number}">
				</form>		
				<table class="list_table">
				</table>
			</div>
	</c:forEach>
		</div>
		</div>
		
		<!-- 오른쪽 구매 영역 -->
		<div class="row" style="height:; ;">
		<div class="cart_buy_area">
		<div class="cart_buy">
			<table class="cart_table">
			<tbody>
				<tr>
					<th style="font-size: 16px; color: black; vertical-align : top; ">배송지 확인</th>
				</tr>
				<tr>
					<td style="font-size: 11px; font-weight:lighter; color: gray; word-break: break-all; vertical-align : top; height: 30%;" >기본 배송지 : ${member.member_address }</td>
				</tr>
				<tr>
					<td style="height: 30%"></td>
				</tr>
			</tbody>
			</table>
			<table class="cart_table2">
			<tbody>
				<tr style="vertical-align : top;"height="15px; ">
					<td style="text-align: left; font-size: 12px; ">전체 상품 : </td>
					<td style="text-align: right; font-size: 12px"><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>권</td>
				</tr>
				<tr style="vertical-align : top;"height="15px">
					<td style="text-align: left; font-size: 12px; ">주문 금액 : </td>
					<td style="text-align: right;font-size: 12px">
					<span class="totalPrice_span">${totalPrice}</span> 원	
					</td>
				</tr>
				<tr style="vertical-align: bottom; font-size: 14px; ">
					<th style="text-align: left; height:50px" >결제 예상 금액 : </th>
					<th style="text-align: right;"><span class="totalPrice_span">${totalPrice}</span>원</th>
				</tr>
				<tr>
					<th colspan="2"><input class="cart_order" type="button" value="주문하기" onclick="window.open('/order/orderCartDetail/${member.member_number}')"></th>
				</tr>
			</tbody>
			</table>
		</div>
		<div class="dead_area">
		</div>
		</div>
		</div>
		</div>	
	</c:otherwise>
			</c:choose>
	<!-- ///////////장바구니 리스트 페이지 끝////////////////////////////// -->
	<!-- Footer Start -->
	
	<%@ include file="../common/footer.jsp"%>
	<!-- Footer end -->
	
</body>
	<script>
$(document).ready(function(){
		//장바구니 스크립트//
	
	setTotalInfo();	
		
$(".individual_cart_checkbox").on("change", function(){
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));
});

/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){

	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	} else{
		$(".individual_cart_checkbox").attr("checked", false);
	}
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));	
	
	
	
});

/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_cart_amount_input").val());
			// 총 종류
			totalKind += 1;
		}

	});
	
		finalTotalPrice = totalPrice /* - totalCoupon */;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 총 종류
	$(".totalKind_span").text(totalKind);
}});
	
	/* 수량 버튼 */	
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});

	/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function(){
	let num = $(this).data("num");
	let cart_amount = $(this).parent("div").find("input").val();
	$(".update_num").val(num);
	$(".update_cart_amount").val(cart_amount);
	$(".quantity_update_form").submit();
	
});

/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	const num = $(this).data("num");
	$(".delete_num").val(num);
	$(".quantity_delete_form").submit();
});


	</script>
</html>