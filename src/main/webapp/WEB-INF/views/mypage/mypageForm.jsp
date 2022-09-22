<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      crossorigin="anonymous"
    />
    <script
      defer
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>

    <link href="../assets/css/style.css" rel="stylesheet" />

    <title>마이페이지</title>
    <link
      rel="short icon"
      href="../assets/img/favicon.png"
      type="image/x-icon"
    />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var currentPosition = parseInt($("#quickmenu").css("top"));
    	$(window).scroll(function()
    	{       var position = $(window).scrollTop();
    	       $("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
    	 });
    	
    	$("#member").click(function(){
    		var url = document.getElementsById("memurl")
    		console.log(url);
    	});
    	
    	  });
    </script>
    
    
    
    
  </head>
  <body>
  
   <!-- Nabar start -->

    <%@ include file = "../common/header.jsp"%>
    <!-- Header end -->

  <!-- breadclumb end -->
  <!-- head end -->

  <!-- detail start -->
  <div class="container" style="margin-bottom: 5%;">
  <div class="row justify-content-md-center">
  <div class="col col-lg-3" >
<div class="list-group" id="quickmenu-main" align='center' >
  <input type="text" id="mymenu" readonly="readonly"  class="list-group-item list-group-item-action active list-group-item-dark"
    value="사용자 My Menu" style="border-left-color: black; border-right-color: black; border-top-color: black;"/>
  
  <button id="member" onclick="location.href='http://localhost:8090/mypage/memberdetail.do?num=${member.num}'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black;">회원정보 수정</button>
  <button id="order" onclick="location.href='http://localhost:8090/mypage/myorderlist.do?member_number=${member.member_number}'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black;">주문확인 / 취소</button>
  <button id="order" onclick="location.href='http://localhost:8090/cart/list/${member.member_number}'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black;">장바구니</button>
 <button id="coupon" onclick="location.href='http://localhost:8090/mypage/mycoupon.do?member_number=${member.member_number}'" class="list-group-item list-group-item-action"
 style="border-left-color: black; border-right-color: black; ">쿠폰조회</button>
  <button id="board" onclick="location.href='http://localhost:8090/mypage/myboardlist.do?member_number=${member.member_number}&&member_id=${member.member_id}&&board_type=0'" class="list-group-item list-group-item-action"
 style="border-left-color: black; border-right-color: black; border-bottom-color: black;">내가 쓴 글</button>
</div>
  </div>
  </div>
  </div>
  <!-- detail end -->

  <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
</html>
