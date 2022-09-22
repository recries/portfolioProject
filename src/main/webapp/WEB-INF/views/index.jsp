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

    <link href="./assets/css/style.css" rel="stylesheet" />
    <title>메인 페이지</title>

    <!-- 파비콘 -->
    <link
      rel="short icon"
      href="./assets/img/favicon.png"
      type="image/x-icon"
    />
  </head>
  <body>
    <!-- Header Start -->
    <!-- Nabar start -->

    <%@ include file = "./common/header.jsp"%>
    <!-- Header end -->

   

    <!-- body start -->
    
<%@ include file = "./main/main.jsp"%> 
    <!-- body end -->

    <!-- Footer Start -->
    <%@ include file = "./common/footer.jsp"%>
    <!-- Footer end -->
  </body>
</html>
