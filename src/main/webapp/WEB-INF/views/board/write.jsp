<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		$('#btnList').click(function() {
			history.go(-2);
		});

		$('#btnSave').click(function() {
			$('[name=content]').val().replace(/\n/gi, '<br/>');
			$('#frm').attr('action', 'write.do').submit();
		});
		
		$('#filepath').change(function(){
			if(this.files[0].size > 1000000000 ){
				alert('1GB 이하만 첨부할 수 있습니다.');
				$(this).val('');
				return false;
			}
			
		})
	});
</script>
<style type="text/css">
#frm{
	width: 40%;
	align: center;
	margin-left: 300px;
	border: 1px solid black;
}

#btnc{
	padding-bottom: 20px;
	padding-left: 20px;
}
#btnSave{
	position: relative;
	left: 30px;
}
</style>
</head>
<body>
	<!-- Header start -->
	
    <%@ include file = "../common/header.jsp"%>
    <!-- Header end -->

	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td width="20%" align="center">ID</td>
				<td><input type="text" name="member_id" size="10" maxlength="10" value="${member.member_id}" readonly="readonly"/></td>
			</tr>

			<tr>
				<td width="20%" align="center">Email</td>
				<td><input type="text" name="member_email" size="30" maxlength="30" value="${member.member_email}" readonly="readonly" /></td>
			</tr>

			<tr>
			<td width="20%" align="center">
				<c:choose>
				<c:when test="${dto==null}">
				제목
				</c:when>
				<c:otherwise>
           		답변 제목
         		</c:otherwise>
				</c:choose>
				</td>
				<td><input type="text" name="subject" size="40" /></td>
			</tr>

			<tr>
				<td width="20%" align="center">내용</td>
				<td><textarea name="content" rows="13" cols="40"></textarea></td>
			</tr>

			<tr>
				<td width="20%" align="center">첨부파일</td>
				<td><input type="file" name="filename" id="filepath" />
				<input type="hidden" name="board_type" value="${board_type}" />
				</td>
			</tr>
			
	
		</table>

		<!-- 답변글일때 -->
		<c:if test="${dto!=null}">
			<input type="hidden" name="num" value="${dto.num}" />
			<input type="hidden" name="board_type" value="${board_type}" />
			<input type="hidden" name="currentPage" value="${currentPage}" />
			<input type="hidden" name="ref" value="${dto.ref}" />
			<input type="hidden" name="re_step" value="${dto.re_step}" />
			<input type="hidden" name="re_level" value="${dto.re_level}" />
		</c:if>
		<div id="btnc" >
		<input type="button" id="btnList" value="리스트" class="btn btn-primary"/> 
		<input type="button" id="btnSave" value="저장" class="btn btn-primary"/>
		</div>
	</form>
	    <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
</body>
</html>










