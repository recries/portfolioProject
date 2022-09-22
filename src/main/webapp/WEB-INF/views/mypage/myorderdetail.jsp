<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
<link
      rel="short icon"
      href="../assets/img/favicon.png"
      type="image/x-icon"
    />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script  src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
<link rel="stylesheet"  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></link>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      defer
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <link href="../assets/css/style.css" rel="stylesheet" />
    
    
<script type="text/javascript">
function ordercancel(url){
	var result = confirm("주문을 취소하시겠습니까?");
	if(result){
		var form = document.createElement('form');
		  form.setAttribute('method', 'post');
		    form.setAttribute('action', url);
		      var hiddenField = document.createElement('input');
		      hiddenField.setAttribute('type', 'hidden');
		      hiddenField.setAttribute('name', 'num');
		      hiddenField.setAttribute('value', "${orderInfo.num}");
		      form.appendChild(hiddenField);
		    

		    document.body.appendChild(form);
		    form.submit();
		  }

	}
	
</script>

<style>
#orderdiv{
	position:relative;
	bottom:110px;
	width: 50%;

}


p {
    font-size: 14px;
    margin-bottom: 7px;
}

.container-fluid{
	
}

.cursor-pointer {
    cursor: pointer;
}

a{
    text-decoration: none !important;
    
}

.bold{
    font-weight: 600;
}

.small{
    font-size: 12px !important;
    letter-spacing: 0.5px !important;
}

small{
    font-size: 12px !important;
}

.a {
    justify-content: space-between !important;
}

.border-line {
    border-right: 1px solid rgb(226, 206, 226)
}

.card-footer img{
    opacity: 0.3;
}

.card-footer h5{
    font-size: 1.1em;
    color: #8C9EFF;
    cursor: pointer;
}

#bookcontet {
	padding-right:50px;
}
</style>
</head>
<body>

	<!-- mypage로 돌아가기 위한 path 변수 -->
 	<c:url var="path" value="/mypage/myorderlist.do">
		<c:param name="member_number" value="${orderInfo.member_number}" />
	</c:url>
	
	<!-- orderstatus로 이동하기 위한 path2 변수 -->
	 <c:url var="path2" value="/mypage/myorderstatus.do">
		<c:param name="onum" value="${orderInfo.num}" />
	</c:url>
	
	<!-- orderstatus 값 변경을위한 path3 변수 -->
	 <c:url var="path3" value="/mypage/myorderupdate.do">
		 <c:param name="order_number" value="${orderInfo.order_number}" />
		<c:param name="member_number" value="${orderInfo.member_number}" />
	</c:url>
	
	<!-- Header start -->
	
    <%@ include file = "../common/header.jsp"%>
    <!-- Header end -->
	
	
	  <!-- mypage menu start -->
<div class="container">
	<%@ include file = "mypagemenu.jsp"%>
  <!-- mypage menu end -->
  
  <!-- order detail start -->
<div class="container-fluid my-5 d-sm-flex justify-content-center" id="orderdiv">
    <div class="card px-2">
        <div class="card-header bg-white">
          <div class="row justify-content-between">
            <div class="col">
                <p class="text-muted"> 주문 번호 : <span class="font-weight-bold text-dark">${orderInfo.order_number}</span></p> 
                 <p class="text-muted"> 도서 ISBN : <span class=" text-dark">${orderInfo.ezenbooks.book_isbn}</span> </p></div>
          </div>
        </div>
        <div class="card-body">
            <div class="media flex-column flex-sm-row">
                <div class="media-body ">
                    <h5 class="bold">${orderInfo.ezenbooks.book_title}</h5>
                    
                    <p class="text-muted">주문수량 : ${orderInfo.book_qty}권</p>
                    <h4 class="mt-3 mb-4 bold">계산금액:<span class="mt-5"></span> ${orderInfo.order_cost}원 <span class="small text-muted"> (&#8361;) </span></h4>
                    <p class=" text-dark">작가명 : <span class=" text-muted"> ${orderInfo.ezenbooks.book_author}</span> </p>
					<p class=" text-dark">출판사 : <span class=" text-muted">${orderInfo.ezenbooks.book_publisher}</span></p>
					<p class=" text-dark">책소개</p>
                    
                </div>
                <c:url var="detail_path" value="/book/book_detail.do">
										
										<c:param name="num" value="${orderInfo.ezenbooks.num }" />
										<c:param name="currentPage" value="1" />
										
									</c:url>
                <a href="${detail_path }"> 
                <img class="align-self-center img-fluid" src="../assets/img/${orderInfo.ezenbooks.book_img}" width="180 " height="180">
                </a>
            </div>
        </div>
    
         <div class="card-footer  bg-white px-sm-3 pt-sm-4 px-0">
            <div class="row text-center  ">
                <div class="col my-auto  border-line " onclick="window.open('${path2}','window_name', 'width=1200, height=900, location=no, status=no, scrollbars=yes');"><h5 >배송확인</h5></div>
                <div class="col my-auto  border-line " ><h5 >구매확정</h5></div>
                <div class="col my-auto  border-line " onclick="ordercancel('${path3}')"><h5>구매취소</h5></div>
                <div class="col my-auto   border-line " onclick="location.href='${path}'"><h5>주문목록</h5></div>
            </div>
        </div>
    </div>
</div>
</div>
  <!-- order detail end -->
    <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
</body>
</html>