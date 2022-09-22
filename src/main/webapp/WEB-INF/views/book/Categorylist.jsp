<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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

<!-- today -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="now" value="<%=new java.util.Date() %>"/>
<fmt:formatDate value="${now}" pattern="Y" var="year" />
<fmt:formatDate value="${now}" pattern="E" var="day" />
<fmt:formatDate value="${now}" pattern="M" var="month" />
<fmt:formatDate value="${now}" pattern="d" var="date" />
<!-- //today  -->

<!-- tomorrow  -->
<c:set var="tomorrow" value="<%=new java.util.Date(new java.util.Date().getTime()+60*60*24*1000)%>"/>
<fmt:formatDate value="${tomorrow}" pattern="E" var="tomorrowday" />
<fmt:formatDate value="${tomorrow}" pattern="M" var="tomorrowmonth" />
<fmt:formatDate value="${tomorrow}" pattern="d" var="tomorrowdate" />
<!-- //tomorrow  -->

 <link href="../assets/css/style.css" rel="stylesheet" /> 
 <link href="../assets/css/book.css" rel="stylesheet" />
<title>장르별 도서</title>
<link rel="short icon" href="../assets/img/favicon.png"
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
					<li class="breadcrumb-item"><a href="/">메인페이지</a></li>
					<li class="breadcrumb-item"><a href="/book/allBooklist.do">모든 도서</a></li>
					<li class="breadcrumb-item active" aria-current="page">${categoryName }</li>
				</ol>
			</nav>
		</div>
	</section>

	<!-- breadclumb end -->
	<!-- head end -->

	<!-- booklist start -->



<div id="wrap">
<div class="wrapper">

<div class="list_header">
	<h5 class="title_best_basic">
		분야 종합 
	<small>(집계기준 : 2022.7.20 ~ ${year}.${month}.${date})</small>
	

	</h5>
	</div>
	<c:forEach items="${alist}" var="book">
	
	
	
<ul class="list_type01">
<li>
<div class="cover">

<c:url var="detail_path" value="book_detail.do">
	<c:param name="currentPage" value="${pv.currentPage }" />
	<c:param name="num" value="${book.num }" />
</c:url>
<a href="${detail_path }">
<img src="../assets/img/${book.book_img }" alt="..."></a>

</div>


<div class="detail">


	<div class="booklist_title">
	 <strong>${book.book_title}</strong>
	</div>
	
	<div class="author">${book.book_author}
    
		<small class="text-muted">[${categoryName }]</small>
	
	
	
    
    <span class="line">|</span> ${book.book_publisher}
    <span class="line">|</span> 2022년 05월 30일
    
	</div>
    
	<div class="review">
	    <img src="http://image.kyobobook.co.kr/ink/images/common/img_starating_a5.gif" alt="5점 만점에 5점">
	    <a href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&amp;ejkGb=KOR&amp;barcode=9788901260716#review">(18개의 리뷰가 있습니다)</a>
	</div>

	<div class="price">

        도서
	 <strong class="book_price">${book.book_price}원</strong>
	  <span class="dc_rate">[<strong>10</strong>%↓ + <strong>5</strong>% 적립]</span>
	  <a href="javascript:goDetailProductNotAge('EBK','150109','4808901260716','0 ', 'N')" target="_self">
	 <span class="line">|</span> eBook <strong class="ebook_price">12,300원</strong>
	   </a>
	    </div>
	    
    <div class="info">
    지금 주문하면  <strong class="blue">내일(${tomorrowmonth}월 ${tomorrowdate}일 ${tomorrowday}요일)</strong><strong class="blue"> 도착 예정</strong> 입니다
    
    </div>
    <br>
 
</div>

<div class="book_add">
<c:choose>
	<c:when test="${book.book_stock==1}">
		<c:choose>
			<c:when test="${isLogOn == true  && member!= null}">
		
		<a href="${contextPath}/order/orderDetail.do?num=${book.num }
		&member_number=${member.member_number}&book_qty=1"class="btn_medium btn_blue">바로 구매하기</a>
		
		<input id="cartInId" value="${book.book_id }" hidden="true">
		<input class="list_cart_btn btn_blue2" id="cart_btn" type="button" value="장바구니에 담기">
	<br>
		
			</c:when>
	
	<c:otherwise>
		<a id="btnLoginList" type="button" class="btn_medium btn_blue"> 바로 구매하기 </a>
		<a id="btnLoginList" type="button" class="btn_medium  btn_blue2">
		장바구니에 담기
		
		</a>
	<br>
		
	</c:otherwise>
		</c:choose>				
		
	
	</c:when>
	
	<c:otherwise>
			
			<a class="btn_medium btn_blue_zero" > 일시품절 </a>
		</c:otherwise>
	</c:choose>

</div>

</li>
</ul>
<!-- ////////////////테스트 똑같은거 붙여봄 /////////////////////////////////// -->

<!-- //////////////////////////////////////////////// -->
</c:forEach>
</div>
</div>
	


<!-- pagination start-->

<div class="row">
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center pagination-lg">

<!-- 이전 시작 -->
	<li class="page-item"><c:if test="${pv.startPage>1}">
		<a class="page-link"
			href="/book/novelCategorylist.do?book_category=${book_category }&categoryName=${categoryName}&currentPage=${pv.startPage-pv.blockPage}"
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
		</a>
		</c:if></li>
<!-- 이전 끝 -->

<!-- 게시판 목록 이동 시작 -->
	<c:forEach var="i" begin="${pv.startPage }" end="${pv.endPage }">
		<c:url var="currPage" value="Categorylist.do">
			
			<c:param name="book_category" value="${book_category }" />
			<c:param name="categoryName" value="${categoryName }"/>
			<c:param name="currentPage" value="${i}" />
		</c:url>
	<c:choose>
		<c:when test="${i==pv.currentPage }">
			<li class="page-item active">
			<span> 
			<a href="${currPage }" class="page-link">${i}</a>
			</span>
			</li>
		</c:when>

		<c:otherwise>
			<li class="page-item">
			<span> 
			<a href="${currPage }"class="page-link">${i}
			</a>
			</span>
			</li>
		</c:otherwise>
	</c:choose>
	</c:forEach>

<!-- 게시판 목록 이동 끝 -->

<!-- 다음 시작 -->
	<li class="page-item">
	<c:if test="${pv.endPage<pv.totalPage}">
			<a class="page-link" 
				href="/book/Categorylist.do?book_category=${book_category }&categoryName=${categoryName}&currentPage=${pv.startPage+pv.blockPage}"
				aria-label="Next"> 
				<span aria-hidden="true">&raquo;</span>
			</a>
		</c:if>
		</li>
<!-- 다음 끝 -->
		</ul>
	</nav>
</div>
<!-- pagination end -->
	
<!-- board end -->

<!-- Footer Start -->
<%@ include file="../common/footer.jsp"%>
<!-- Footer end -->
	 </body>
	 
	 <script type="text/javascript">
	//서버 전송용 데이터
	const form = {
		member_number : '${member.member_number}',
		book_id : '',
		cart_amount : ''
}
	
	$(".list_cart_btn").on("click", function(e){
			form.cart_amount = 1;
			form.book_id =$(this).parent("div").find("#cartInId").val();
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
  
  $("#btnLogin, #btnLoginList").click(function(){
	   $("#myModal").modal("show");
	     $(".close").click(function(){
	         $("#myModal").modal("hide");
	         
	        
	      }); 
	
	     
  })
  
 
 
  
  </script>
	 
</html>