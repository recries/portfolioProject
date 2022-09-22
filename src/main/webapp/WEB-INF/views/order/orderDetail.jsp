<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
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

<link href="/assets/css/style.css" rel="stylesheet" />
<title>주문 상세</title>

<!-- 파비콘 -->
<link rel="short icon" href="../assets/img/favicon.png"
	type="image/x-icon" />
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Checkout example · Bootstrap v5.0</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/checkout/">



<!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.0/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
/*      .card_img{
      margin-left:45%; 
      padding-top:4%;
      padding-bottom:4%;
      } */
</style>

<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">


<script src="/docs/5.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<script src="form-validation.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#couponpricedirfrm').hide();
		 $('#couponpriceperfrm').hide();
		 
		
		$("#same-address").change(function() {
			if (this.checked) {
				$("#order_name").val("${member.member_name}");
				$("#order_phone").val("${member.member_phone}");
				$("#order_address").val("${member.member_address}");
			}
		})

		$("#btnOrder").click(function() {

			if($("#order_name").val()!=0 && $("#order_phone").val()!=0 && $("#order_address").val()!=0){
				alert("주문이 완료됐습니다.");
				$('#order_frm').attr("action", "/order/ordersave.do").submit();
			}else{
				alert("배송 정보를 확인해주세요.");
				return false;
			}
			

		})
		
		$("#btnCoupon").click(function(){			
				
			
			 var couponValue=$("#couponSelect").val(); // 
				var cnum = $("#couponSelect").find("option:selected").data("sub");
			 
			 if(couponValue<1 && couponValue>0){
				 $('#coupon_number').val(cnum);
				 $('#couponpricedirfrm').hide();
				 $('#couponpriceperfrm').show();
				  $('#couponpriceper').val(100-couponValue*100);
				  $('#order_cost').val(Math.round("${bdto.sellprice* book_qty}"*couponValue));
			 }
			 if(couponValue>=1){
				 $('#coupon_number').val(cnum);
				 $('#couponpriceperfrm').hide();
				 $('#couponpricedirfrm').show();
				 $('#couponpricedir').val(couponValue);
				 $('#order_cost').val("${bdto.sellprice * book_qty}"-couponValue);
			 }
			 if(couponValue==0){
				 $('#coupon_number').val(null);
				 $('#couponpricedirfrm').hide();
				 $('#couponpriceperfrm').hide();
				 $('#order_cost').val("${bdto.sellprice * book_qty}");
			 }
			 
			 
				
		})
		
		
	})
	
	
</script>


</head>
<body>
	<!-- Header Start -->
	<!-- Nabar start -->

	<%@ include file="../common/header.jsp"%>
	<!-- Header end -->

	<!-- card start -->


	<!-- card end -->

	<!-- body start -->
<body class="bg-light">
	<form class="needs-validation" novalidate name="order_frm"
		id="order_frm" method="post">

		<div class="container">
			<main>
				<div class="py-5 text-center">
					<!--    <img class="d-block mx-auto mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
					<h2>주문서</h2>
					<!--  <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p> -->
				</div>


				<div class="row g-5">
					<div class="col-md-5 col-lg-4 order-md-last">
						<h4 class="d-flex justify-content-between align-items-center mb-3">
							<span class="text-primary">Your cart</span> <span
								class="badge bg-primary rounded-pill">1</span>
						</h4>
						<ul class="list-group mb-3">
							<li class="list-group-item d-flex justify-content-between lh-sm">
								<div>
									<h6 class="my-0">상품명</h6>
									<small class="text-muted" name="book_title">${bdto.book_title}</small>
									<small class="text-muted" hidden="true"><input
										name="book_id" type="text" value="${bdto.book_id}" /></small>
								</div> <span class="text-muted" name="book_price">${bdto.book_price}원</span>
							</li>
							<li class="list-group-item d-flex justify-content-between lh-sm">
								<div>
									<h6 class="my-0">
										<p>상품 이미지</p>
									</h6>

									<div class="text-muted" id="img-responsive" name="book_img">
										<img src="/assets/img/${bdto.book_img}" height="300px"
											width="100%" class="img-responsive img-thumbnail"
											alt="${bdto.book_img}">
									</div>
									
									
								</div> <span class="text-muted"></span>
							</li>
							<li class="list-group-item d-flex justify-content-between lh-sm">
								<div>
									<h6 class="my-0">수량</h6>
									<small class="text-muted"></small>
									<input name="book_qty" value="${book_qty }" hidden="true">
								</div> <span class="text-muted">${book_qty }권</span>
							</li>
							<li class="list-group-item d-flex justify-content-between lh-sm">
								<div>
									<h6 class="my-0">배송비</h6>
									<small class="text-muted"></small>
								</div> <span class="text-muted">2500원</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between bg-light">
								<div class="text-success">
									<h6 class="my-0">판매가 적용</h6>
									<small>사이트 오픈 할인 </small>
								</div>
								 <span class="text-success">10% 할인</span>
							</li>
							
							
							<li
								class="list-group-item d-flex justify-content-between bg-light">
								<span> &nbsp&nbsp&nbsp&nbsp&nbsp</span>
								  <span class="text-success" id="couponpriceperfrm" >
								 
								 <input type="number" id="couponpriceper" style="color:green; border:none; background: transparent;text-align:right;" 
								 value="" readonly="readonly" 
								 />								 
								 % 쿠폰할인</span>
								 
								 <span class="text-success" id="couponpricedirfrm">	
								 
								  	<input type="number" id="couponpricedir" style="color:green; border:none; background: transparent;text-align:right;" 
								  	value="" readonly="readonly" />	
								 원 쿠폰할인</span>
								 
								 <input name="coupon_number" id="coupon_number" value="" type="hidden" />
							</li>
						
							
							
							<li class="list-group-item d-flex justify-content-between">
								<span>결제금액</span> 
								
								
								<input type="number" name="order_cost" id="order_cost" value="${bdto.sellprice * book_qty}" 
								style="font-weight:bold; border:none; background: transparent;text-align:right;" readonly="readonly"/> 
								<strong>원</strong>

							</li>
						</ul>

						<!--         <form class="card p-2">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Promo code">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
        </form> -->

					</div>

					<div class="col-md-7 col-lg-8">
						<h4 class="mb-3">배송 정보 입력</h4>

						<div class="col-5">
							<label for="id" class="form-label">주문자 아이디 <span
								class="text-muted"></span></label> <input type="id" class="form-control"
								id="member_id" name="member_id" value="${member.member_id}"
								readonly="readonly"> <input type="id"
								class="form-control" id="member_number" name="member_number"
								value="${member.member_number}" readonly="readonly"
								hidden="true">

						</div>


						<div class="row g-3">
							<div class="col-sm-6">
								<label for="firstName" class="form-label">주문자 이름</label> <input
									type="text" class="form-control" id="member_name"
									name="member_name" value="${member.member_name}"
									readonly="readonly">

							</div>

							<div class="col-sm-6">
								<label for="firstName" class="form-label">받으시는 분 이름</label> <input
									type="text" class="form-control" id="order_name"
									name="order_name" placeholder="이름을 입력해주세요" value="" required>
								<div class="invalid-feedback">받으시는 분 이름을 입력해주세요</div>
							</div>
							<div class="col-sm-6">
								<label for="firstName" class="form-label">주문자 연락처</label> <input
									type="text" class="form-control" id="member_phone"
									name="member_phone" value="${member.member_phone}" required>
								<div class="invalid-feedback">주문하시는 분 연락처를 입력해주세요</div>
							</div>

							<div class="col-sm-6">
								<label for="firstName" class="form-label">받으시는 분 연락처</label> <input
									type="text" class="form-control" id="order_phone"
									name="order_phone" placeholder="전화번호를 입력해주세요." value=""
									required>
								<div class="invalid-feedback">받으시는 분 연락처를 입력해주세요</div>
							</div>

							<div class="col-12">
								<label for="email" class="form-label">이메일 <span
									class="text-muted"></span></label> <input type="email"
									class="form-control" id="member_email"
									value="${member.member_email}">
								<div class="invalid-feedback">배송정보를 위해 이메일을 입력해주세요</div>
							</div>

							<div class="col-md-5">
								<label for="country" class="form-label">지역 </label> <select
									class="form-select" name="o_address_1" required>
									<option value="">선택해주세요</option>
									<option value="1">서울특별시</option>
									<option value="2">경기도</option>
								</select>
								<!-- <div class="invalid-feedback">
               지역을 입력해주세요 
              </div> -->
							</div>


							<div class="col-md-4">
								<label for="state" class="form-label">시/구</label> <select
									class="form-select" name="o_address_2" required>
									<option value="">선택해주세요</option>
									<option value="1">강남구</option>
									<option value="2">성남시</option>
								</select>
								<!--  <div class="invalid-feedback">
                 지역을 입력해주세요 
              </div> -->
							</div>

							<div class="col-md-3">
								<label for="state" class="form-label">구/동</label> <select
									class="form-select" name="o_address_3" required>
									<option value="">선택해주세요</option>
									<option value="1">역삼동</option>
									<option value="2">분당구</option>
								</select>
								<!--  <div class="invalid-feedback">
                 지역을 입력해주세요 
              </div> -->
							</div>

							<div class="col-12">
								<label for="address" class="form-label">상세주소</label> <input
									type="text" class="form-control" id="order_address"
									name="order_address" value="" placeholder="1234-1 행복하우스 101호 "
									required>
								<div class="invalid-feedback">상세주소를 입력해주세요</div>
							</div>


						</div>

						<hr class="my-4">

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="same-address">
							<label class="form-check-label" for="same-address">배송지
								정보와 주문자 정보가 일치합니다 </label>
						</div>

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="save-info">
							<label class="form-check-label" for="save-info"> 배송지 정보를
								저장합니다 </label>
						</div>

						<hr class="my-4">


						<label for="couponSelect" class="form-label">할인권 선택(할인권은 1개만 선택 가능합니다.)</label>

						<div class="row">
							<div class="col-md-4">
								<select class="form-select" aria-label="couponSelect" id="couponSelect" name="couponprice">
									<option value="0" >할인권 선택 안 함</option>
									<c:forEach items="${couponlist }" var="onecoupon">
									
									<c:if test="${onecoupon.coupon_type==1 }">
									<option value="${1-onecoupon.coupon_value/100 }" data-sub="${onecoupon.coupon_number}">
									${onecoupon.coupon_value}% 할인 </option>
									</c:if>
									<c:if test="${onecoupon.coupon_type==2 }">
									<option value="${onecoupon.coupon_value }" data-sub="${onecoupon.coupon_number}">
									${onecoupon.coupon_value } 원 할인
									</option>			
									</c:if>
									</c:forEach>
									
								</select>

							</div>
							<div class="col-md-4">
								<input type="button" class="btn btn-primary btn-sm" id="btnCoupon"
									value="할인권 적용" />
							</div>
						</div>
						
						<hr class="my-4">
						<h4 class="mb-3">결제</h4>

						<div class="my-3">
							<div class="form-check">
								<input id="credit" name="paymentMethod" type="radio"
									class="form-check-input" checked required> <label
									class="form-check-label" for="credit">신용카드</label>
							</div>
							<div class="form-check">
								<input id="debit" name="paymentMethod" type="radio"
									class="form-check-input" required> <label
									class="form-check-label" for="debit">무통장입금</label>
							</div>

							<br>
							<div class="row gy-3">
								<div class="col-md-6">
									<label for="cc-name" class="form-label">카드 이름 </label> <input
										type="text" class="form-control" id="cc-name" placeholder=""
										required> <small class="text-muted">예)우리카드,
										신한카드 ,카카오뱅크 </small>
									<div class="invalid-feedback">카드 정보를 입력해주세요</div>
								</div>

								<div class="col-md-6">
									<label for="cc-number" class="form-label">카드 번호 </label> <input
										type="text" class="form-control" id="cc-number" placeholder=""
										required>
									<div class="invalid-feedback">카드번호를 입력해주세요</div>
								</div>

								<div class="col-md-3">
									<label for="cc-expiration" class="form-label">Expiration</label>
									<input type="text" class="form-control" id="cc-expiration"
										placeholder="" required>
									<div class="invalid-feedback">Expiration date required</div>
								</div>

								<div class="col-md-3">
									<label for="cc-cvv" class="form-label">CVV</label> <input
										type="text" class="form-control" id="cc-cvv" placeholder=""
										required>
									<div class="invalid-feedback">Security code required</div>
								</div>
							</div>

							<hr class="my-4">

							<!--  <button class="w-100 btn btn-primary btn-lg" type="submit" id="btnOrder">주문하기</button> -->
							<input type="button" class="w-100 btn btn-primary btn-lg"
								id="btnOrder" value="주문하기" />
						</div>
					</div>
			</main>

		</div>
	</form>

	<!-- body end -->

	<!-- Footer Start -->
	<%@ include file="../common/footer.jsp"%>
	<!-- Footer end -->
</body>
</html>