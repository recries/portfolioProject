<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	 if(${result=='loginFailed' }){
		  
		  window.onload=function(){
		      alert("아이디나 비밀번호가 유효하지 않습니다.\n 다시 로그인하세요!");
		      history.go(-1);
		    }
		
	  }
})

</script>
</head>
<body>

</body>
</html>