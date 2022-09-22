<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
     <link href="../../../assets/css/style.css" rel="stylesheet" />
<script type="text/javascript">
	$(document).ready(function() {
		$('#update').bind('click', updateRun);
		$('#cancel').bind('click', cancelRun);
		$("#back").bind('click',backRun);
		$('[name=content]').val($('[name=content]').val().trim());
		$('[name=content]').val(
				$('[name=content]').val().replace(/<br\s?\/?>/g, "\n"));
		
	});

	function updateRun() {
		$('[name=content]').val(
				$('[name=content]').val().replace(/\n/gi, '<br/>'));
		$('#frm').attr('action', 'update.do').submit();
		
	}

	function cancelRun() {
		$('#subject').val('${dto.subject}');
		$('#member_email').val('${dto.member_email}');
		$('#content').val('${dto.content}');
		$('[name=content]').val($('[name=content]').val().trim());
		$('[name=content]').val(
				$('[name=content]').val().replace(/<br\s?\/?>/g, "\n"));
	}
	
	function backRun(){
		//history.back();
		history.go(-1);
	}
</script>
<style type="text/css">
.table {
	width: 50%;
	margin-left: auto;
	margin-right: auto;
}
#btn{
	margin-left: 350px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<!-- Header start -->
	
    <%@ include file = "../common/header.jsp"%>
    <!-- Header end -->
    
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table border="1" class="table">
			<tr>
				<th width="20%">글쓴이</th>
				<td>${dto.member_id}</td>
				<th width="20%">등록일</th>
				<td>${dto.reg_date}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="4"><input type="text" name="subject" id="subject"
					value="${dto.subject}" /></td>
			</tr>

			<tr>
				<th>메일</th>
				<td colspan="3">${dto.member_email}</td>
			</tr>

			<tr>
				<th>내용</th>
				<td colspan="3">
				<textarea name="content"
						id="content" rows="13" cols="40">
						${dto.content}
				</textarea></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan="3"><input class="form-control form-control-sm" id="formFileSm" type="file" name="filename" /> <span>${fn:substringAfter(dto.upload, "_") }</span>
				</td>
			</tr>
		</table>
		<div id="btn" >
		<input type="hidden" name="num" value="${dto.num}" /> 
		<input type="hidden" name="currentPage" value="${currentPage}" class="btn btn-primary"/>
		<input type="hidden" name="board_type" value="${dto.board_type}" /> 
		<input type="button" id="update" value="수정" class="btn btn-primary"/>
		<input type="button" id="cancel" value="취소"class="btn btn-primary" />
		<input type="button" id="back" value="뒤로" class="btn btn-primary" />
		</div>
	</form>
  <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
</body>
</html>









