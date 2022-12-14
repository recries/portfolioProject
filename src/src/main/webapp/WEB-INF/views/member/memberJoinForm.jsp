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
  </style>   
  
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  
 

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


    <link href="../assets/css/style.css" rel="stylesheet" />
    <title>????????????</title>
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
        <h4 class="mb-3">????????????</h4>
        <form class="validation-form" method="post" action="/member_join" novalidate >
       
      
           <div class="row">
              
          <div class="mb-3">
              <label for="nickname">?????????</label>
              <input type="text" class="form-control" name="member_id" placeholder="" value="" required>
              <div class="invalid-feedback">
                ???????????? ??????????????????.
              </div>
            </div>
          </div>
          
           <div class="mb-3">
              <label for="name">??????</label>
              <input type="text" class="form-control" name="member_name" placeholder="" value="" required>
              <div class="invalid-feedback">
                ????????? ??????????????????.
              </div>
            </div>  
          
          
          <div class="mb-3">
            <label for="email">????????????</label>
            <input type="password"  class="form-control" name="member_pass" placeholder="" required>
            <div class="invalid-feedback">
              ??????????????? ??????????????????.
            </div>
          </div>    
                
          <div class="mb-3">
            <label for="email">????????? ??????</label>
            <input type="text" class="form-control" name="member_phone" placeholder="" required>
            <div class="invalid-feedback">
              ????????? ????????? ??????????????????.
            </div>
          </div>
          <div class="mb-3">
            <label for="email">?????????</label>
            <input type="text" class="form-control" name="member_email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              ???????????? ??????????????????.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">??????</label>
            <input type="text" class="form-control" name="member_address" placeholder="??????????????? ?????????" required>
            <div class="invalid-feedback">
              ????????? ??????????????????.
            </div>
          </div>

          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">???????????? ?????? ??? ????????? ???????????????.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="submit">?????? ??????</button>
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