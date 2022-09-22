<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!-- <hr> -->
<div class="foot text-center">
  
<h5 class="foot-title">Copyright</h5>

<div class ="footmenu">
  <a class="copy_btn" href="/">
  <span>메인페이지</span></a>
  
  <span class ="copy_line">|</span>  
  <a class="copy_btn" href="/">
  <span>게시판</span></a>
  
  <span class ="copy_line">|</span>
  <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
  <a class="copy_btn" href="/mypage/mypageForm.do">  
  <span>마이페이지</span></a>
  </c:when>
   <c:otherwise>
  <a class="copy_btn" href="/member/loginForm.do">  
  <span>마이페이지</span></a>
  </c:otherwise>
  </c:choose>
</div>


   <a class="footertoTop" href="#" title="top">
   <button type="button" class="btn btn-light" style="border: 50px;">TOP</button></a>
    
   <div class="foot-text">Copyright &copy; 2022 All rights reserved</div>
  
  </div>
