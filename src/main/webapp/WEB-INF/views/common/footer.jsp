<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <hr> -->
<div class="foot text-center">
  
<h5 class="foot-title">Copyright</h5>

<div class ="footmenu">
  <a class="copy_btn" href="/">
  <span>메인페이지</span></a>
  
  <span class ="copy_line">|</span>  
  <a class="copy_btn" href="${contextPath}/board/boardForm.do">
  
  <span>게시판</span></a>
  
  <span class ="copy_line">|</span>
  <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
  <a class="copy_btn"  href="/mypage/mypageForm.do">  
  <span>마이페이지</span></a>
  </c:when>
   <c:otherwise>
  <a class="copy_btn" id="btnLoginFooter" type="button">  
  <span>마이페이지</span></a>
  </c:otherwise>
  </c:choose>
</div>
<script>
$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	});
</script>
<script type="text/javascript">
  
  $("#btnLogin, #btnLoginFooter").click(function(){
	   $("#myModal").modal("show");
	     $(".close").click(function(){
	         $("#myModal").modal("hide");
	         
	        
	      }); 
	
	     
  })
 
  </script>

   <a class="footertoTop" href="#" title="top">
   <button type="button" class="btn btn-light" style="border: 50px;">TOP</button></a>
    
   <div class="foot-text">Copyright &copy; 2022 All rights reserved</div>
  
  </div>
