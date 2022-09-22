<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>쿠폰조회</title>
	    <link
      rel="short icon"
      href="../assets/img/favicon.png"
      type="image/x-icon"
    />
	<link href="../assets/css/style.css" rel="stylesheet" />
    <script
      defer
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    
</head>

<style >
body {width:100%; height:100%; margin:0; padding:0; overflow-y:scroll; position:relative;} 
/* html {width:100%; height:100%; margin:0; padding:0; overflow:hidden;} */
 #coupontable{
    position:relative;
   	bottom:120px;	
    left:300px;
    width:70%;
    
    }
</style>
<body>

     <!-- Header start -->
    <%@ include file = "../common/header.jsp"%>
    <!-- Header end -->

  <!-- mypage menu start -->
  
 <div class="container"> 
  <%@ include file = "mypagemenu.jsp"%>
  <!-- mypage menu end --> 
 
   <!-- mycoupon detail start -->
 <table id='coupontable' class="table caption-top " style="border-color: gray;">
 	<caption>쿠폰확인</caption>
   <thead>
    <tr >
      <th scope="col">쿠폰번호</th>
      <th scope="col">할인유형</th>
    </tr>
  </thead>
  <tbody >
  <c:forEach items="${aList}" var="myCoupon">
  
  
	<tr >		
   		<td>${myCoupon.coupon_number}</td>
   		<c:if test="${myCoupon.coupon_type==1 }">
  			<td>${myCoupon.coupon_value}% 할인 </td> 
 		</c:if>
   		<c:if test="${myCoupon.coupon_type==2 }">
  			<td>${myCoupon.coupon_value}원 할인 </td> 
 		</c:if>  
 	</tr> 
</c:forEach>
</tbody>
</table>
</div>

 <!-- coupon detail end -->

  

  <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
  </body>
</html>