<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="../assets/css/login.css" rel="stylesheet" />


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
 <link href="../assets/css/style.css" rel="stylesheet" />

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
  <div class="container">
    <a class="navbar-brand" href="/"> <img src="../assets/img/로고.png" alt="로고이미지" class="img-fluid"></a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#"
            id="navbarDropdown"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            >분야별 도서</a
          >
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/book/allBooklist.do">모든 도서</a></li>
            <li><hr class="dropdown-divider" /></li>
            
            
            <li class="dropdown-submenu">
  <button type="button" class="btn ">소설/시/희곡</button>  
  <ul class="dropdown-menu" >
    <!-- Dropdown menu links -->
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=1&categoryName=시">시</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=2&categoryName=역사소설">역사소설</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=3&categoryName=과학소설(SF)">과학소설(SF)</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=4&categoryName=추리/미스터리 소설">추리/미스터리 소설</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=5&categoryName=판타지/환상문학">판타지/환상문학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=6&categoryName=희곡">희곡</a></li>
  </ul>
</li>
<li class="dropdown-submenu">
  <button type="button" class="btn ">인문학</button>  
  <ul class="dropdown-menu" >
    <!-- Dropdown menu links -->
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=7&categoryName=교양인문학">교양인문학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=8&categoryName=인문에세이">인문에세이</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=9&categoryName=철학">철학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=10&categoryName=심리/정신분석학">심리/정신분석학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=11&categoryName=신화/종교학">신화/종교학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=12&categoryName=문화/문화이론">문화/문화이론</a></li>
  </ul>
</li>
<li class="dropdown-submenu">
  <button type="button" class="btn ">사회과학</button>  
  <ul class="dropdown-menu" >
    <!-- Dropdown menu links -->
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=13&categoryName=비평/칼럼">비평/칼럼</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=14&categoryName=사회문제">사회문제</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=15&categoryName=환경/생태문제">환경/생태문제</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=16&categoryName=사회운동">사회운동</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=17&categoryName=언론/미디어">언론/미디어</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=18&categoryName=법과 생활">법과 생활</a></li>
  </ul>
</li>
<li class="dropdown-submenu">
  <button type="button" class="btn ">역사</button>  
  <ul class="dropdown-menu" >
    <!-- Dropdown menu links -->
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=19&categoryName=동양사일반">동양사일반</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=20&categoryName=역사학">역사학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=21&categoryName=한국고대~고려시대">한국고대~고려시대</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=22&categoryName=조선사">조선사</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=23&categoryName=서양사">서양사</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=24&categoryName=전쟁/분쟁사">전쟁/분쟁사</a></li>
  </ul>
</li>
<li class="dropdown-submenu">
  <button type="button" class="btn ">예술/대중문화</button>  
  <ul class="dropdown-menu" >
    <!-- Dropdown menu links -->
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=25&categoryName=컬러링북">컬러링북</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=26&categoryName=예술/대중문화의 이해">예술/대중문화의 이해</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=27&categoryName=미술">미술</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=28&categoryName=음악">음악</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=29&categoryName=건축">건축</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=30&categoryName=무용">무용</a></li>
  </ul>
</li>
<li class="dropdown-submenu">
  <button type="button" class="btn ">과학</button>  
  <ul class="dropdown-menu" >
    <!-- Dropdown menu links -->
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=31&categoryName=기초과학/교양과학">기초과학/교양과학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=32&categoryName=과학사회학">과학사회학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=33&categoryName=생명과학">생명과학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=34&categoryName=의학">의학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=35&categoryName=천문학">천문학</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=36&categoryName=화학">화학</a></li>
  </ul>
</li>
<li class="dropdown-submenu">
  <button type="button" class="btn ">경제/경영</button>  
  <ul class="dropdown-menu" >
    <!-- Dropdown menu links -->
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=37&categoryName=경제학/경제일반">경제학/경제일반</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=38&categoryName=기업 경영">기업 경영</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=39&categoryName=마케팅/세일즈">마케팅/세일즈</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=40&categoryName=트렌드/미래전망">트렌드/미래전망</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=41&categoryName=재테크/투자">재테크/투자</a></li>
    <li><a class="dropdown-item" href="/book/Categorylist.do?book_category=42&categoryName=창업/취업/은퇴">창업/취업/은퇴</a></li>
  </ul>
</li>
            
           
            
            
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/book/newBooklist.do">신작 도서</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">추천 도서</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/board/boardForm.do">게시판</a>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            href="#"
            id="navbarDropdown"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            회원 메뉴
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <!-- <li><a class="dropdown-item" href="member/loginForm.do">로그인</a></li> -->
         
         
            <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
            <li><a class="dropdown-item" href="${contextPath}/member/logout.do">로그아웃</a></li>
             <li><a class="dropdown-item" href="${contextPath}/mypage/mypageForm.do">My Page</a></li>
          </c:when>
          <c:otherwise>
	       <li><a type="button" class="dropdown-item" id="btnLogin">로그인</a></li>
	        <li><a class="dropdown-item" href="${contextPath}/member/memberJoinForm.do">회원 가입</a></li>
	       
	      </c:otherwise>
	   </c:choose>  
	   
           
           
           
          </ul>
        </li>
        <li class="nav-item">
        <c:choose>
        <c:when test="${isLogOn == true  && member!= null}">
          <a class="nav-link disabled">${member.member_name }님 환영합니다</a>
          </c:when>
          <c:otherwise>
          <a class="nav-link disabled"> 환영합니다</a>
           </c:otherwise>
          </c:choose>
        </li>
      </ul>
      
        <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
      <c:choose>
      <c:when test="${member.member_type==1 }">
      <a href="http://localhost:3000">
      <button
          class="btn btn-outline-success btn-lg me-2"
          type="submit"
          style="color: yellow; border-color: yellow;"
        >관리자 페이지</button>
      </a>
      </c:when>
      
      </c:choose>
      
       </c:when>
       </c:choose> 
        
        
        
        
         <script type="text/javascript">
      function checkForm(){
    	  
    	  var pattern=/\s/g;
    	  
    	  if(document.searchForm.searchWord.value.length==0 || document.searchForm.searchWord.value.match(pattern)){
    		  alert("검색어를 입력하세요.")
    		  return false;
    	  }
    	  return true;
      }
      
      </script> 
      <form class="d-flex" name="searchForm" action="/book/searchlist.do" onsubmit="return checkForm()" >
      
        <input
          class="form-control me-2"
          type="search"
          placeholder="도서 검색"
          aria-label="Search"
          name="searchWord"
        />
        <a >
         <button
          class="btn btn-outline-success btn-lg"
          type="submit"
          style="color: white; border-color: white;"
        >search</button>
        </a>
       
      
      </form>
      
      
   
    </div>
  </div>
  
  
  <script type="text/javascript">
  
  $("#btnLogin").click(function(){
	   $("#myModal").modal("show");
	     $(".close").click(function(){
	         $("#myModal").modal("hide");
	         
	        
	      }); 
	
	     
  })
  
 
 
  
  </script>
  
  <div id="myModal" class="modal fade">
	 <div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<div class="avatar">
					<img src="../assets/img/avatar.png" alt="Avatar">
				</div>				
				<h4 class="modal-title">Member Login</h4>	
                <button type="button" class="close" >&times;</button>
			</div>
			<div class="modal-body">
				<form name="login" method="post"  action="/member/login.do">
					<div class="form-group" style="text-align:center; margin-top:20px; margin-bottom:0px;">
						<input type="text" class="form-control" name="member_id" placeholder="ID" required="required">		
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="member_pass" placeholder="Password" required="required">	
					</div>        
					<div class="form-group">
						<button type="submit" class="btn btn-dark btn-lg btn-block login-btn" >Login</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="/member/memberJoinForm.do">회원가입</a>
			</div>
		</div>
	</div> 
</div>  
  
</nav>
<br />



