<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>


<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="../assets/css/login.css" rel="stylesheet" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>

<body>
	<!-- <main id="main" > -->
<div id ="wrap">
<div class ="container" style="min-width: 1300px;">
	<!-- Banner Start-->
	
	<div class="container"  style="min-width: 1300px;" >
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel" style="margin-bottom: 50px">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>


		<div class="carousel-inner"  >
		<div class="carousel-item active">
		
	<div class ="first_slide" >
	 	<div class="event_banner"  >

		<img src="/assets/img/요즘이책.jpg" class="first_img" alt="요즘이책 이미지">
		
		<a class="link_book"
		href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&amp;ejkGb=KOR&amp;barcode=9791164844326&amp;orderClick=41a"
		target="_blank"> 
		<img src="http://image.kyobobook.co.kr/images/book/large/326/l9791164844326.jpg"
		 alt="">
		<strong class="title">It Works</strong> 
		<span class="info">꿈을 실현시키는 세가지 시스템을 작동시켜라!</span>
		</a> 
	
		<a class="link_book"
		href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&amp;ejkGb=KOR&amp;barcode=9791170222446&amp;orderClick=41b"
		target="_blank"> 
		<img src="http://image.kyobobook.co.kr/images/book/large/446/l9791170222446.jpg"
		 alt="">
		<strong class="title">대전환</strong> 
		<span class="info">세계를 이끌어 온 5가지 위대한 대전환에 주목하라! 빌게이츠 추천!</span>
		</a> 
	
		<a class="link_book"
		href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&amp;ejkGb=KOR&amp;barcode=9791139706642&amp;orderClick=41c"
		target="_blank"> 
		<img src="http://image.kyobobook.co.kr/images/book/large/642/l9791139706642.jpg"
		alt="" >
		<strong class="title">미식가를 위한 식물 사전</strong> 
		<span class="info">미식의 정점에는 식물이 있다! 기막힌 맛의 세계가 한 상 가득 펼쳐지는
			식물 백과사전!</span>
		</a>
	</div>
	
	
</div> <!-- end first slide -->

</div> 
			<div class="carousel-item">
				<img src="/assets/img/배너2.jpg" class="d-block"  alt="..." >
			</div>
			<div class="carousel-item">
				<img src="/assets/img/배너3.jpg" class="d-block "
					alt="...">
			</div>
		</div>
		
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	
</div>

</div><!-- slide container End -->

	

<div class="container" style="min-width:1300px;">
		<div class="row g-5" style="flex-wrap:nowrap; ">
		<div class="col-lg-4" style="width:400px;">
	<div class="post-entry-1 lg" >
		<a href="/book/allBooklist.do">
		<img src="../../assets/img/recommended-book1.jpg" alt="" class="img-fluid"></a>
		<div class="post-meta">
			<span class="date">이 달의 MD 추천</span> <span class="mx-1">&bullet;</span>
			<span>2022.08</span>
		</div>
		<h4>
			<a href="single-post.html">매일을 헤엄치는 법 </a>
		</h4>
		<p class="mb-4">80여만 구독자에게 주체적인 삶의 태도와 자세를 전해온 독보적인
			미술 크리에이터 이연의 그림 에세이 《매일을 헤엄치는 법》이 도서출판 푸른숲에서 출간되었다. 2018년, 제 삶을
			되찾기 위해 퇴사를 감행한 스물일곱 살 이연의 자전적인 이야기로, 이연의 오리지널 캐릭터로 그려낸 첫 번째
			책이다. 지금의 이연을 만들어준 인생에서 가장 어둡고 찬란했던 1년을 담아낸, 그 어디서도 공개된 적 없는
			이야기가 두 버전의 만화와 에세이로 펼쳐진다. 흑백 만화에서는 퇴사 이후 가난과 외로움 속에서 진정 자신을 위한
			삶을 찾아가는 과정이 사계절 흐름에 따라 전개되며, 블루 만화에서는 건강을 되찾으려 찾은 수영장에서 발견한 빛나는
			삶의 태도와 성찰이 서서히 드러난다. 그리고 못 다한 이야기를 보다 긴 에세이들로 자세히 풀어냈다.</p>

	</div>
	<div class="post-entry-1 lg" >
		<a href="/book/allBooklist.do">
		<img src="../../assets/img/recommended-book2.jpg" alt="" class="img-fluid"></a>
		<div class="post-meta">
			<span class="date">이 달의 출판사 추천</span> <span class="mx-1">&bullet;</span>
			<span>2022.08</span>
		</div>
		<h4>
			<a href="single-post.html">세상의 마지막 기차역</a>
		</h4>
		<p class="mb-4">봄이 시작되는 3월, 급행열차 한 대가 탈선해 절벽 아래로
			떨어졌다. 수많은 중상자를 낸 이 대형 사고 때문에 유가족은 순식간에 사랑하는 가족, 연인을 잃었다. 그렇게 두
			달이 흘렀을까. 사람들 사이에서 이상한 소문이 돌기 시작하는데…. 역에서 가장 가까운 역인 ‘니시유이가하마 역’에
			가면 유령이 나타나 사고가 일어난 그날의 열차에 오르도록 도와준다는 것. 단 유령이 제시한 네 가지 규칙을 반드시
			지켜야만 한다. 그렇지 않으면 자신도 죽게 된다. 이를 알고도 유가족은 한 치의 망설임도 없이 역으로 향한다.
			과연 유령 열차가 완전히 하늘로 올라가 사라지기 전, 사람들은 무사히 열차에 올라 사랑하는 이의 마지막을 함께할
			수 있을까</p>
	</div>
</div><!-- col-lg-4"의 끝 -->
<%@ include file = "mainCategory.jsp"%>


</div><!--	"row-g-5"의 끝 -->	


</div><!-- end container -->	
</div><!-- end wrap -->

	<!-- </main> -->
	</div>
	</body>
	</html>	