<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
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

<script type="text/javascript">
	$(document).ready(function() {
		$("#update").click(function(){
			var result = confirm("회원 정보를 수정하시겠습니까?");
			if(result){
				$("#frm").attr('action', '/mypage/update.do').submit();
				alert("회원정보가 수정되었습니다.")
			}
			
		});
		
		$("#delete").click(function(){
			var result = confirm("정말로 탈퇴하시겠습니까?\n탈퇴 처리된 계정의 복구는 관리자에게 문의해야 합니다.");
			if(result){
			$("#frm").attr('action', '/mypage/memberdelete.do').submit();
			}
		});
		
		
		$("button[value='pass_change']").click(function(){	
			var pattern=/\s/g;
			
			if($("#current_pass").val()!=("${memberInfo.member_pass}")){
				alert("기존 비밀번호가 틀립니다.");
			return false;
			}
			if($("#new_pass").val()==""||pattern.test($("#new_pass").val())){
				alert("새로운 비밀번호를 입력해주세요.\n비밀번호에는 공백이 허용되지 않습니다.")
				return false;
			}
			if($("#new_pass").val()!=$("#new_pass_check").val()){
				alert("새로운 비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			$("#member_pass").val($("#new_pass").val());
			alert("비밀번호가 변경되었습니다.")
			
			$("#pass_change").modal("hide");
			
			
		})
		
	});
</script>

<style>
   #frm{
   position:relative;
     bottom:210px;
    left:380px;
    width:70%;
    }
</style>

</head>
<body>

    <!-- Header start -->
    <%@ include file = "../common/header.jsp"%>
    <!-- Header end -->
   

  <!-- mypage menu start -->
<div class="container">
	<%@ include file = "mypagemenu.jsp"%>
  <!-- mypage menu end -->
  
  
  <!-- member detail start -->
	
<form class="row g-3" id="frm" method="post" name="frm" style="margin-left: -100px;">
  <div class="col-md-11" style="text-align: center; font-size: 30px; font-weight: bold;" >
	회원 정보
  </div>
  <div class="col-mde-12"></div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">회원번호</label>
   <input type="text" class="form-control" readonly="readonly" name="member_number"value="${memberInfo.member_number}">
  </div>
   <div class="col-md-3">
    <label for="inputState" class="form-label">회원이름</label>
   <input type="text" class="form-control" readonly="readonly" name="member_name"value="${memberInfo.member_name}">
  </div>
  <div class="col-md-4">
    <label for="inputEmail4" class="form-label">아이디</label>
    <input type="text" class="form-control" name="member_id" readonly="readonly" value="${memberInfo.member_id}">
  </div>
  <div class="col-md-1">
  </div>
  <div class="col-4">
    <label for="inputAddress" class="form-label">이메일</label>
    <input type="text" class="form-control" name="member_email" value="${memberInfo.member_email}">
  </div>
   <div class="col-md-7">
    <label for="inputPassword4" class="form-label">비밀번호</label></br>
    <input style=" width: 41%; float: left;" type="password" class="form-control" name="member_pass" id="member_pass" value="${memberInfo.member_pass }" readonly="readonly">
      <button style="width:56%; float: right;" type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#pass_change">
  	비밀번호 변경하기
	</button>
      </div>
      <!-- 비밀번호 변경 버튼 -->
<!-- Modal -->
<div class="modal fade" id="pass_change" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-group mb-3">
        <label  class="col-form-label"><strong>기존 비밀번호</strong></label>
						<input type="password" class="form-control" name="current_pass" id="current_pass" placeholder="기존 비밀번호" required="required">		
					</div>
					<div class="form-group mb-3">
					<label  class="col-form-label"><strong>새로운 비밀번호</strong></label>
						<input type="password" class="form-control" name="new_pass" id="new_pass" placeholder="새로운 비밀번호" required="required">	
					</div>  
					<div class="form-group mb-3">
					<label  class="col-form-label"><strong>새로운 비밀번호 확인</strong></label>
						<input type="password" class="form-control" name="new_pass_check" id="new_pass_check" placeholder="비밀번호 확인" required="required">	
					</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="pass_change" value="pass_change" 
        data-bs-target="#member_pass" >변경하기</button>
      </div>
    </div>
  </div>
</div>
  <div class="col-7">
    <label for="inputAddress2" class="form-label">주소</label>
    <input type="text" class="form-control" name="member_address" value="${memberInfo.member_address}">
  </div>
  <div class="col-md-4">
    <label for="inputCity" class="form-label">전화번호</label>
    <input type="tel" class="form-control" name="member_phone"value="${memberInfo.member_phone}">
  </div>
  <div class="col-12"><br><br></div>
  <div class="col-md-4"	></div>
  <div class="col-md-4" style="margin-left: 20px; ">
  <input type="hidden" name="num" value="${memberInfo.num}"/>
  <input style="" type="button" id="update" class="btn btn-dark" value="수정" />
  <input type="button" id="delete" class="btn btn-danger" value="회원 탈퇴" />
  </div>
</form>
</div>

  <!-- member detail end -->
  
   <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
  
</body>
</html>