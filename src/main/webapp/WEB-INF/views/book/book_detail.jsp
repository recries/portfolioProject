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
	
	
<link href="../assets/css/style.css" rel="stylesheet" />
<title>${dto.book_title }</title>
<link rel="short icon" href="../assets/img/favicon.png"
	type="image/x-icon" />
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	<!-- navbar end -->


	<!-- breadclumb start -->
	<section class="bread">
		<div class="container">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="../index.do">메인페이지</a></li>
					
					<li class="breadcrumb-item active" aria-current="page">도서 상세
						보기</li>
				</ol>
			</nav>
		</div>
	</section>
	<!-- breadclumb end -->
	<!-- head end -->
	<div id="wrap">
	<!-- detail start -->
<div class="container" style="min-width:1000px; display:flex; margin-top:10px;">
			
				<div id="card_img" style="float:left">
					<img src="/assets/img/${dto.book_img}" class="card_img"
						 alt="${dto.book_img }">
				</div>
			
			<div id="detail_main" style="float:left">
				<p class="book_title">${dto.book_title } </p>
				<p class="book_sub"style="border-bottom: 1px solid black;">저자 :
					${dto.book_author } | ${dto.book_publisher} | 
				<c:if test="${dto.book_category == 1}">시</c:if>
				<c:if test="${dto.book_category == 2}">역사소설</c:if>
				<c:if test="${dto.book_category == 3}">과학소설(SF)</c:if>
				<c:if test="${dto.book_category == 4}">추리/미스터리 소설</c:if>
				<c:if test="${dto.book_category == 5}">판타지/환상문학</c:if>
				<c:if test="${dto.book_category == 6}">희곡</c:if>
				<c:if test="${dto.book_category == 7}">교양인문학</c:if>
				<c:if test="${dto.book_category == 8}">인문에세이</c:if>
				<c:if test="${dto.book_category == 9}">철학</c:if>
				<c:if test="${dto.book_category == 10}">심리/정신분석학</c:if>
				<c:if test="${dto.book_category == 11}">신화/종교학</c:if>
				<c:if test="${dto.book_category == 12}">문화/문화이론</c:if>
				<c:if test="${dto.book_category == 13}">비평/칼럼</c:if>
				<c:if test="${dto.book_category == 14}">사회문제</c:if>
				<c:if test="${dto.book_category == 15}">환경/생태문제</c:if>
				<c:if test="${dto.book_category == 16}">사회운동</c:if>
				<c:if test="${dto.book_category == 17}">언론/미디어</c:if>
				<c:if test="${dto.book_category == 18}">법과 생활</c:if>
				<c:if test="${dto.book_category == 19}">동양사일반</c:if>
				<c:if test="${dto.book_category == 20}">역사학</c:if>
				<c:if test="${dto.book_category == 21}">한국고대~고려시대</c:if>
				<c:if test="${dto.book_category == 22}">조선사</c:if>
				<c:if test="${dto.book_category == 23}">서양사</c:if>
				<c:if test="${dto.book_category == 24}">전쟁/분쟁사</c:if>
				<c:if test="${dto.book_category == 25}">컬러링북</c:if>
				<c:if test="${dto.book_category == 26}">예술/대중문화의 이해</c:if>
				<c:if test="${dto.book_category == 27}">미술</c:if>
				<c:if test="${dto.book_category == 28}">음악</c:if>
				<c:if test="${dto.book_category == 29}">건축</c:if>
				<c:if test="${dto.book_category == 30}">무용</c:if>
				<c:if test="${dto.book_category == 31}">기초과학/교양과학</c:if>
				<c:if test="${dto.book_category == 32}">과학사회학</c:if>
				<c:if test="${dto.book_category == 33}">생명과학</c:if>
				<c:if test="${dto.book_category == 34}">의학</c:if>
				<c:if test="${dto.book_category == 35}">천문학</c:if>
				<c:if test="${dto.book_category == 36}">화학</c:if>
				<c:if test="${dto.book_category == 37}">경제학/경제일반</c:if>
				<c:if test="${dto.book_category == 38}">기업/경영</c:if>
				<c:if test="${dto.book_category == 39}">마케팅/세일즈</c:if>
				<c:if test="${dto.book_category == 40}">트렌드/미래전망</c:if>
				<c:if test="${dto.book_category == 41}">재테크/투자</c:if>
				<c:if test="${dto.book_category == 42}">창업/취업/은퇴</c:if>
				 | ISBN코드 : ${dto.book_isbn }
					</p>
					
				<table>
					<colgroup>
						<col width="150">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th class="list_price1">정가</th>
							<td class="list_price2">${dto.book_price}원</td>
						</tr>
						<tr style="border-bottom: 1px solid black;">
							<th class="sell_price1">판매가</th>
							<th class="sell_price2">
							<!-- 소수점제거 -->
							
							${dto.sellprice }원
							</th>
						</tr>
						<tr>
						<th><p style="margin-top: 10px">책 소개</p></th>
						</tr>
						<tr>
							<td colspan="2" class="book_story">${dto.book_content}</td>
						</tr>
					</tbody>
				</table>
				

			</div>
				<!--////////// 구매관련 ///////////// -->

				<!-- // ////// 재고 및 배송 시작 /////////  -->

		<!-- 	<div class="col-md-3" > -->
			<div class="buy_box" style="float:right;"  >
				<p style="margin-top: 10px; color: gray; 
				font-size: 13px; text-align: center;">
				<c:if test="${dto.book_stock == 1}">구매가능</c:if>
				<c:if test="${dto.book_stock == 0}">재고없음</c:if>
				</p>
				<div class="buy_area1">
				<div style=" border-bottom : 1px solid gray; margin-bottom: 5px">
				<span style="color: gray;">● 배송비 :</span>
					  <span style= "color: gary;">2500원</span></br></br>
				<span>● 배송일정 : 서울시 서초구 서초동 기준</span></bar>
				<p style="color: red;">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				다음날 출고 예정</p>
				<span>● 매장에서 받기 원하신다면 </span></br>
				<span style="color: blue;">&nbsp&nbsp&nbsp&nbsp서울시 서초구 서초동에서 수령하세요</span>
				<p></p>
				 </div>
				</div>
				
				<!-- // ////// 재고 및 배송 시작 /////////  -->
				
					<!-- //////수량 선택 /////////-->
					<table class="buy_area2">
						<tbody>
							<tr>
								<th>수량 선택&nbsp&nbsp</th>
								
								<td>
									<input class="count_btn1" type="button" value="-" id="minus_btn">
								</td>
								<td>
									<input type="text" name="cart_amount" id="quantity_input" class="count_total" value="1">					
								</td>
								<td>
									<input class="count_btn2" type="button" value="+" id="plus_btn">
								</td>
								
								</tr>
								<tr>
								<th>
								구매 가격
								</th>
								<td colspan="3">	
									<input type="hidden" value="-" id="minus_btn">
									
									<%-- <input  name="total_price" value="${dto.sellprice}"> --%>
									<p class="cart_count_total_price"><span class="totalPrice_span">
									<fmt:formatNumber value="5000" pattern="#,###원" /></span> 원</p>
									<input type="hidden" value="+" id="plus_btn">
								</td>
							</tr>
						</tbody>
					</table>
								
				
					<!-- //////// 수량 끝 //////// -->
					
					
					<!-- ////// 구매 버튼 목록 시작 /////// -->
					<!-- //구매 버튼 링크들// -->
					<c:url var="order_link" value="/order/orderDetail.do">
					<c:param name="num" value="${dto.num }"/>
					<c:param name="member_number" value="${member.member_number }"/>
					
					</c:url>
					<c:url var="pickup_link" value="/order/pickup.do">
					<c:param name="num" value="${dto.num }"/>
					</c:url>
					<c:url var="cart_link" value="/cart/list.do">
					<c:param name="num" value="${dto.num }"/>
					<c:param name="member_number" value="${member.member_number}"/>
					</c:url>
					<!-- //구매 버튼 링크// -->
					
				
				
					
					
					<!-- 재고 유무에 따라 재고가 없을시에 알림창 -->
					<div style="margin-top: 15px;">
					<!-- 로그인이 되어있고 재고가 있을때 -->
					<c:choose>
					<c:when test="${dto.book_stock==1 && isLogOn == true && member!= null}">
					<input class="cart_btn" id="cart_btn" type="button" value="장바구니 추가">
					<input class="buy_button1" type="button" value="장바구니 확인" onclick="window.open('/cart/list/${member.member_number}')"/>
					<input class="buy_button2" type="button" value="매장구매" onclick="window.open('${pickup_link}')">
					<input class="buy_button3" type="button" value="바로구매" onclick="order_link()">
					</c:when>
					<c:when test="${dto.book_stock==0 && isLogOn == true && member!= null}">
					<input class="buy_button1" type="button" value="장바구니 추가" onclick="noStock()">
					<input class="buy_button1" type="button" value="장바구니 확인" onclick="noStock()" >
					<input class="buy_button2" type="button" value="매장구매" onclick="noStock()">
					<input class="buy_button3" type="button" value="바로구매" onclick="noStock()">
					</c:when>
					<c:otherwise>
					<input class="buy_button1" type="button" value="장바구니 추가" id="btnLoginBookDetail" onclick="nologin()">
					<input class="buy_button1" type="button" value="장바구니 확인" id="btnLoginBookDetail" onclick="nologin()" >
					<input class="buy_button2" type="button" value="매장구매" id="btnLoginBookDetail" onclick="nologin()">
					<input class="buy_button3" type="button" value="바로구매" id="btnLoginBookDetail" onclick="nologin()">
					</c:otherwise>
					</c:choose>
					</div>
					
<!-- ////// 구매 버튼 목록 끝 /////// -->
				</div>

			
	<!-- /////////// 구매 관련 끝 /////////////////// -->

	
	
</div><!-- end container -->
	</div><!-- end wrap -->
	<div id="new_books">
	<span>다른 매력적인 책들을 만나보세요 </span>	
	</div>
	<!-- detail end -->
	
	<!-- 추가 도서 목록 (후에 이미지로 대체) 시작 -->
	
	<div class="row" id="row_area">
	
	<div class="slider">
<div class="image-box">
<div id="random_book_img">
<c:forEach items="${alist}" var="list">
<c:url var="detail_path" value="book_detail.do">
										<c:param name="currentPage" value="1" />
										<c:param name="num" value="${list.num }" />
									</c:url>
	<a href="${detail_path }">								
	<img src="../assets/img/${list.book_img }" width="140" height="210" ></a>
</c:forEach>
  	</div>
  	</div>	
   </div>
</div>

	<!-- 추가 도서 목록 (후에 이미지로 대체) 끝-->
	

	<!-- Footer Start -->
	
	
	<%@ include file="../common/footer.jsp"%>
	<!-- Footer end -->
	
	

	</body>
	
	
	<script type="text/javascript">
		//장바구니 스크립트//
	$(document).ready(function(){
	let count = 1;
	let quantity = $("#quantity_input").val();
	Price = 0;
	totalPrice= ${dto.sellprice};
	Price +=  ${dto.sellprice};
	
	$("#plus_btn").on("click", function(){
		$("#quantity_input").val(++quantity);
		count += 1;
		totalPrice = count * Price ;
		$(".totalPrice_span").text(totalPrice.toLocaleString());
	});
	$("#minus_btn").on("click", function(){
		if(quantity > 1){
			$("#quantity_input").val(--quantity);
			count -= 1;
			totalPrice = count * Price ;
			$(".totalPrice_span").text(totalPrice.toLocaleString());
		}
	})
	
	totalPrice = parseInt(totalPrice);
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	
	
	});
		
			
	
	//서버 전송용 데이터
	
	function order_link(){
		var link="/order/orderDetail.do?num="+${dto.num }+"&member_number="+'${member.member_number }'+"&book_qty="+$("#quantity_input").val();


window.open(link);
	}
	
	const form = {
		member_number : '${member.member_number}',
		book_id : '${dto.book_id}',
		cart_amount : ''
}
	
	$(".cart_btn").on("click", function(e){
			form.cart_amount =  $("#quantity_input").val();
			$.ajax({
				url: '/cart/list/add',
				type: 'POST',
				data: form,
				success: function(result){
					cartAlert(result);
				}
			})
			});
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		}
	}
		
	
	
	
	</script>
		<script type="text/javascript">
	function noStock(){
		alert('재고가 없습니다.')
	};
	function nologin(){
		alert('로그인이 필요한 서비스입니다.')
	};
	</script>
	
	<script type="text/javascript">
  
  $("#btnLogin, #btnLoginBookDetail").click(function(){
	   $("#myModal").modal("show");
	     $(".close").click(function(){
	         $("#myModal").modal("hide");
	         
	        
	      }); 
	
	     
  })
  
  </script>
	
	
</html>