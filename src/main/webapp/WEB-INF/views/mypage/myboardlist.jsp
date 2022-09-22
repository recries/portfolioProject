<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성글 조회</title>
    <link
      rel="short icon"
      href="../assets/img/favicon.png"
      type="image/x-icon"
    />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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


    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="../assets/css/board.css" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function(){
	if(${aList[0].board_type == null}){
		alert('작성한 게시판글이 없습니다.');
		history.go(-1);
	}	

});
</script>      
</head>
<body>
	<!-- Header start -->
	
    <%@ include file = "../common/header.jsp"%>
    <!-- Header end -->
    
  <!-- mypage menu start -->
<div class="container">  
	<%@ include file = "mypagemenu.jsp"%>
  <!-- mypage menu end -->
  	
  	
<div id="bodywrap">
<c:choose>
<c:when test="${aList[0].board_type==0}">
<h2 align="center">본인작성 자유게시판</h2>
</c:when>
<c:when test="${aList[0].board_type==1}">
<h2 align="center">본인작성 리뷰게시판</h2>
</c:when>
<c:otherwise>
<h2 align="center">본인작성 Q&A게시판</h2>
</c:otherwise>
</c:choose>
<hr />
	<table class='table table-dark table-striped'>
	<tr  style="text-align: center;">
	<th width="5%" >번호</th>
	<th width="20%">제목</th>
	<th width="15%">아이디</th>
	<th width="15%">조회수</th>
	<th width="10%">글종류</th>
	</tr>
	<c:forEach items="${aList}" var="dto">
	<tr>
	<td  style="text-align: center;">${dto.num}</td>
	<td >
	<c:url var="path" value="boardview.do">
		<c:param name="currentPage" value="${pv.currentPage}" />
		<c:param name="num" value="${dto.num}" />
		<c:param name="board_type" value="${dto.board_type}" />
	</c:url>
	<a href="${path}" >${dto.subject}</a>
	</td>
	<td  style="text-align: center;">${dto.member_id}</td>
	<td  style="text-align: center;">${dto.readcount}</td>
	<c:choose>
	<c:when test="${dto.re_step==0}">
	<td  style="text-align: center;">게시글</td>
	</c:when>
	<c:otherwise>
	<td  style="text-align: center;">답글</td>
	</c:otherwise>
	</c:choose>
	</tr>
	</c:forEach>
	</table>
	<hr />
	<div class="pagelist">
	<!-- 이전 출력 시작 -->
	<ul class="pagination">
	<c:if test="${pv.startPage>1}">
	<li class="page-item"><a class="page-link" href="myboardlist.do?currentPage=${pv.startPage-pv.blockPage}">Previous</a></li>
	</c:if>

	<!-- 이전 출력 시작 -->
	
	 <!-- 페이지 출력 시작 --> 	 
	 <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}" >
	 	 <c:url var="currPage" value="myboardlist.do">
	 	<c:param name="currentPage" value="${i}"/>
	 	<c:param name="member_id" value="${aList[0].member_id}"/>
	 	<c:param name="board_type" value="${aList[0].board_type}"/>
	 </c:url>
	 <c:choose>
	 	<c:when test="${i==pv.currentPage}">
	 	<li class="page-item active"><a class="page-link" href="${currPage}">${i}</a></li>
	 	</c:when>
	 	<c:otherwise>
	 	<li class="page-item"><a class="page-link" href="${currPage}">${i}</a></li>
	 	</c:otherwise>
	 </c:choose>
		 </c:forEach>
	 <c:if test="${pv.endPage<pv.totalPage}">
	<li class="page-item"><a class="page-link" href="myboardlist.do?currentPage=${pv.startPage+pv.blockPage}">Next</a></li>
	</c:if>

	 </ul>
	 <div id="boardBtn">
	 <Button class="btn btn-secondary" onclick="location.href='http://localhost:8090/mypage/myboardlist.do?currentPage=1&&member_id=${member.member_id}&&board_type=0'">자유게시판</Button>
	 <Button class="btn btn-secondary" onclick="location.href='http://localhost:8090/mypage/myboardlist.do?currentPage=1&&member_id=${member.member_id}&&board_type=1'">리뷰게시판</Button>
	 <Button class="btn btn-secondary" onclick="location.href='http://localhost:8090/mypage/myboardlist.do?currentPage=1&&member_id=${member.member_id}&&board_type=2'">Q&A게시판</Button>
	 </div>
	</div>

</div>
</div>


    <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
</body>
</html>