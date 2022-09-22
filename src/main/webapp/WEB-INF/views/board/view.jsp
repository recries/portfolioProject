<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1 solid black;
	width: "80%"
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#list").click(function(){
			history.go(-1);
		});
		
		$("#reply").click(function(){
			$("#frm").attr('action', 'write.do').submit();
		});
		
		$("#update").click(function(){
			if(${member.member_id == dto.member_id}||${member.member_type==1}){
			$("#frm").attr('action', 'update.do').submit();
		}else{
			alert("일반회원은 자신이 작성한 게시물만 수정할 수 있습니다.")
			console.log(dto.member_id);
		}
		});
		
		$("#delete").click(function(){
			if(${member.member_id == dto.member_id}||${member.member_type==1}){
			$("#frm").attr('action', 'delete.do').submit();
			}else{
				alert("일반회원은 자신이 작성한 게시물만 삭제할 수 있습니다.")
				console.log(dto.member_id);
			}
		});
	});
</script>
<style>
.table{
position:relative;
width: 50%;
left: 400px;
border: 1px solid black;
height: 200px;
}
#frm{
position:relative;
left:400px;
bottom:10px;
}
</style>
</head>
<body>
	<!-- Header start -->
	
    <%@ include file = "../common/header.jsp"%>
    <!-- Header end -->
          
   	<table class="table">

    <tr>

		<tr>
			<th width="20%">ID</th>
			<td>${dto.member_id}</td>
			<th width="20%">조회수</th>
			<td>${dto.readcount}</td>
		</tr>

		<tr>
			<th>제목</th>
			<td colspan="3">${dto.subject}</td>
		</tr>

		<tr>
			<th>이메일</th>
			<td colspan="3">${dto.member_email}</td>
		</tr>

		<tr>
			<th>내용</th>
			<td colspan="3">${dto.content}</td>
		</tr>

		<tr>
			<th>파일</th>
			<td colspan="3"><c:if test="${!empty dto.upload}">
					<a href="contentdownload.do?num=${dto.num}&&board_type=${dto.board_type}">
						${fn:substringAfter(dto.upload,"_")} </a>
				</c:if> <c:if test="${empty dto.upload }">
					<c:out value="첨부파일 없음" />
				</c:if>
				<input type="hidden" name="board_type" value="${dto.board_type}" />
				</td>
		</tr>
	</table>
	<form name="frm" id="frm" method="get">
		<input type="hidden" name="num" value="${dto.num}" />
		<input type="hidden" name="board_type" value="${dto.board_type}" />  
		<input type="hidden" name="currentPage"  value="${currentPage}" /> 
		<input type="hidden" name="ref"  value="${dto.ref}" /> 
		<input type="hidden" name="re_step"  value="${dto.re_step}" />
		<input type="hidden" name="re_level"  value="${dto.re_level}" />  
			<input type="button" id="list"	value="리스트" class="btn btn-primary"/> 
			<input type="button" id="reply" value="답변" class="btn btn-primary"/>
			<input type="button" id="update" value="수정" class="btn btn-primary"/> 
			<input type="button" id="delete" value="삭제" class="btn btn-primary"/>
	</form>
	    <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
</body>
</html>







