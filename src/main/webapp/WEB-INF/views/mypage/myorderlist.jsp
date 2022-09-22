<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문 목록</title>
<link
      rel="short icon"
      href="../assets/img/favicon.png"
      type="image/x-icon"
    />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
<link href="/assets/css/style.css" rel="stylesheet" />
<link href="/assets/css/myorderlist.css" rel="stylesheet" />
<script type="text/javascript">

function orderstatus(status,path){
	
	if(status!=0){
	location.href='http://localhost:8090/'+path;
		
	}else{
		alert("주문취소된 결재건입니다.");
	}
}
</script>
<style >
/* body {width:100%; height:100%; margin:0; padding:0; overflow-y:scroll; position:relative;} 
html {width:100%; height:100%; margin:0; padding:0; overflow:hidden;} */
 #ordertable{
    position:relative;
    top:-193px;
    left:230px;
    width:78%;
    }
</style>
</head>
<body >

     <!-- Header start -->

    <%@ include file = "../common/header.jsp"%>

    <!-- Header end -->
    
  <!-- mypage menu start -->
  <div class="container">
	<%@ include file = "mypagemenu.jsp"%>
  <!-- mypage menu end -->
    
  <!-- order detail start -->

  
<table id='ordertable' class="body" >
    <c:forEach items="${orderNumbers}" var="orderNumbers">
  
   <thead>
   <tr><td style="border-bottom: 3px solid black; height: 50px; vertical-align: bottom;" colspan="5"> 주문 번호 : <c:out value="${orderNumbers }"/></td></tr>
    <tr style="height: 50px; vertical-align: top; ">
      <th scope="col">도서 표지</th>
      <th scope="col">도서 제목</th>
      <th scope="col" class="text_r">주문수량</th>
      <th scope="col" class="text_r">총 결제금액</th>
      <th scope="col" class="text_r">배송현황</th>
    </tr>
  </thead>
  
  <tbody class="inner">
  <c:forEach items="${aList}" var="dto">
 <c:if test="${dto.order_number == orderNumbers }">
  	<c:url var="path" value="mypage/myorderdetail.do">
		<c:param name="num" value="${dto.num}" />
		<c:param name="member_number" value="${dto.member_number}" />
	</c:url>
    	<tr onclick="orderstatus('${dto.order_status}','${path}')"> 
	  <td><img alt="${dto.ezenbooks.book_img}" src="../assets/img/${dto.ezenbooks.book_img}" height="130px" width="85px" style="border-radius: 5px;"></td>
      <td>${dto.ezenbooks.book_title}</td>
     
      <td class="text_r">${dto.book_qty}권</td>
      <td class="text_r">${dto.order_cost}원</td>
      <c:set var="status" value="${dto.order_status}"  scope="session"/>
      <c:choose>
      <c:when test="${status == 0}"  >
      <td style="color: red "class="text_r" >주문취소</td>
      </c:when>
      <c:when test="${status == 1}">
      <td class="text_r">주문접수</td>
      </c:when>
      <c:when test="${status == 2}">
      <td class="text_r">상품준비</td>
      </c:when>
      <c:when test="${status == 3}">
      <td class="text_r">배송준비</td>
      </c:when>
      <c:when test="${status == 4}">
      <td class="text_r">배송중</td>
      </c:when>
      <c:when test="${status == 5}">
      <td class="text_r">배송완료</td>
      </c:when>
      </c:choose>
    </tr>
    </c:if>
 </c:forEach>
 <tr style="height: 30px;"></tr>
</tbody>
  </c:forEach>
  
  
 
</table>
  </div>
  <!-- order detail end -->
  
    <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
  
</body>
</html>