<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"></link>

<style>
body{
	color: #000;
	overflow-x: hidden;
	height: 100%;
	background-color: #2ecc71;
	background-repeat: no-repeat
}

.card{
	z-index: 0;
	background-color: #ECEFF1;
	padding-bottom: 20px;
	margin-top: 90px;
	margin-bottom: 90px;
	border-radius: 10px
}

.top{
	padding-top: 40px;
	padding-left: 13% !important;
	padding-right: 13% !important
}

#progressbar{
	margin-bottom: 30px;
	overflow: hidden;
	color: #455A64;
	padding-left: 0px;
	margin-top: 30px
}

#progressbar li{
	list-style-type: none;
	font-size: 13px;
	width: 20%;
	float: left;
	position: relative;
	font-weight: 400
}

#progressbar .step0:before{
	font-family: FontAwesome;
	content: "\f10c";
	color: #fff
}

#progressbar li:before{
	width: 40px;
	height: 40px;
	line-height: 45px;
	display: block;
	font-size: 20px;
	background: #C5CAE9;
	border-radius: 50%;
	margin: auto;
	padding: 0px}

#progressbar li:after{
	content: '';
	width: 100%;
	height: 12px;
	background: #C5CAE9;
	position: absolute;
	left: 0;
	top: 16px;
	z-index: -1
}

#progressbar li:last-child:after{
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	position: absolute;left: -50%
}

#progressbar li:nth-child(2):after, #progressbar li:nth-child(3):after , #progressbar li:nth-child(4):after{
	left: -50%
}

#progressbar li:first-child:after{
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	position: absolute;
	left: 50%
}

#progressbar li:last-child:after{
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px
}

#progressbar li:first-child:after{
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px
}

#progressbar li.active:before, #progressbar li.active:after{
	background: #651FFF
}

#progressbar li.active:before{
	font-family: FontAwesome;
	content: "\f00c"
}

.icon{
	width: 60px;
	height: 60px;
	margin-right: 15px
}

.icon-content{
	padding-bottom: 20px
}

@media screen and (max-width: 992px){
	.icon-content{
	width: 50%
}}
	
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	
 const progressnum = ${orderstatus.order_status};
 var i = 0;
 
if(progressnum > 1){
 for(i;i<progressnum;i++){
	 document.getElementById('progressbar').children[i].className = 'active step0';
 }
 
}
 
});
</script>
</head>
<body>
<div class="container px-1 px-md-4 py-5 mx-auto">
    <div class="card">
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex">
                <h5>ORDER <span class="text-primary font-weight-bold"># ${orderstatus.order_number}</span></h5>
            </div>
            <div class="d-flex flex-column text-sm-right">
                <p class="mb-0 font-weight-bold">주문고객 :<span> ${orderstatus.ezenmembers.member_name}</span></p>
                <p class="font-weight-bold">연락처 :<span class="font-weight-bold"> ${orderstatus.ezenmembers.member_phone}</span></p>
            </div>
        </div> <!-- Add class 'active' to progress -->
        <div class="row d-flex justify-content-center">
            <div class="col-12">
                <ul id="progressbar" class="text-center">
                    <li class="active step0"></li>
                    <li class="step0"></li>
                    <li class="step0"></li>
                    <li class="step0"></li>
                    <li class="step0"></li>
                </ul>
            </div>
        </div>
        <div class="row justify-content-between top">
            <div class="row d-flex icon-content"> <img class="icon" src="https://i.imgur.com/9nnc9Et.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">주문<br>접수</p>
                </div>
            </div>
            <div class="row d-flex icon-content"> <img class="icon" src="https://i.imgur.com/GiWFtVu.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">상품<br>준비</p>
                </div>
            </div>
            <div class="row d-flex icon-content"> <img class="icon" src="https://i.imgur.com/u1AzR7w.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">배송<br>준비</p>
                </div>
            </div>
            <div class="row d-flex icon-content"> <img class="icon" src="https://i.imgur.com/TkPm63y.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">배송중<br></p>
                </div>
            </div>
            <div class="row d-flex icon-content"> <img class="icon" src="https://i.imgur.com/HdsziHP.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">배송<br>완료</p>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex">
                <h6><span class="text-primary font-weight-bold">받으시는 분
                    </span>${orderstatus.order_name}</h6>
            </div>
        </div>
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex">
                <h6><span class="text-primary font-weight-bold">배송주소
                    </span>${orderstatus.order_address}</h6>
            </div>
        </div>
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex">
                <h6><span class="text-primary font-weight-bold">연락처
                    </span>${orderstatus.order_phone}</h6>
            </div>
        </div>
    </div>
</div>
</body>
</html>