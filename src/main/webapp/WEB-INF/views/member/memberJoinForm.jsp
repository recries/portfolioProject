<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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



<style>
    body {
      min-height: 100vh;
		background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
    /*   background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    

}
    
  </style>   
  
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  
 

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


    <link href="../assets/css/style.css" rel="stylesheet" />
    <title>회원가입</title>
    <link
      rel="short icon"
      href="../assets/img/favicon.png"
      type="image/x-icon"
    />
  
 
  </head>
  
  <body>
  
  <!-- Nabar start -->
    <%@ include file = "../common/header.jsp"%>
  <!-- Header end -->
  <!-- breadclumb end -->
  <!-- head end -->

  <!-- detail start -->
 <!-- Bootstrap CSS -->

<body>
  <div class="container">
     <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" method="post" action="/member_join" novalidate >
       
      
           <div class="row">
              
          <div class="mb-3">
              <label for="nickname">아이디</label>
              <input type="text" class="form-control" name="member_id" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
          </div>
          
           <div class="mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="member_name" 
              pattern="[가-힣]{3,7}" placeholder="예) 홍길동 " required>
              <div class="invalid-feedback">
                이름을 형식에 맞게 입력해주세요.(한글 3~7자)
              </div>
            </div>  
          
          
          <div class="mb-3">
            <label for="pass">비밀번호</label>
            <input type="password"  class="form-control" name="member_pass" 
            pattern="[a-zA-Z0-9]{8,15}"  placeholder="영문,숫자 8~15자" required>
            <div class="invalid-feedback">
              비밀번호를 형식에 맞게 입력해주세요.
            </div>
          </div>    

          
<!--           <div class="mb-3">
            <label for="passChk">비밀번호 재입력</label>
            <input type="text"  class="form-control" name="member_passChk" 
            pattern="[a-zA-Z0-9]{8,15}" placeholder="영문,숫자 8~15자" required>
           <div class="invalid-feedback">
              비밀번호가 일치하지 않습니다.
            </div> 
          </div>  -->
                
          <div class="mb-3">
            <label for="email">휴대폰 번호</label>
            <input type="text" class="form-control" name="member_phone"  pattern="^010[0-9]{8}$" placeholder="예)01012345678" required>
            <div class="invalid-feedback">
              휴대폰 번호를 형식에 맞게 입력해주세요.
            </div>
          </div>
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="text" class="form-control" name="member_email" 
            		pattern="[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}"
            		placeholder="예) you@example.com" required>
            <div class="invalid-feedback">
              이메일을 형식에 맞게 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" name="member_address" placeholder="예) 서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="submit">가입 완료</button>
      </form>
      </div>
    </div>
    <footer class="my-5 text-center text-small">
      
    </footer> 
    </div>
  </body>
  
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);


    
  </script>
  
  <!-- detail end -->

  <!-- Footer Start -->
 <%@ include file = "../common/footer.jsp"%>
  <!-- Footer end -->
  
  
</html>