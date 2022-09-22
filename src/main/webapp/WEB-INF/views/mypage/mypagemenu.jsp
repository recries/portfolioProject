<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 
 
 <div class="row">
 <div class="col-md-2" style="width: 200px;">
 
  <div class="list-group" id="quickmenu" align='center' >
  <input type="text" id="mymenu" readonly="readonly"  class="list-group-item list-group-item-action active list-group-item-dark"
    value="사용자 My Menu" style="border-left-color: black; border-right-color: black; border-top-color: black;"/>
  
  <button id="member" onclick="location.href='http://localhost:8090/mypage/memberdetail.do?num=${member.num}'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black;">회원정보 수정</button>
  <button id="order" onclick="location.href='http://localhost:8090/mypage/myorderlist.do?member_number=${member.member_number}'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black;">주문확인 / 취소</button>
  <button id="order" onclick="location.href='http://localhost:8090/cart/list/${member.member_number}'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black;">장바구니</button>
 <button id="coupon" onclick="location.href='http://localhost:8090/mypage/mycoupon.do?member_number=${member.member_number}'" class="list-group-item list-group-item-action"
 style="border-left-color: black; border-right-color: black; ">쿠폰조회</button>
 <button id="board" onclick="location.href='http://localhost:8090/mypage/myboardlist.do?member_number=${member.member_number}&&member_id=${member.member_id}&&board_type=0'" class="list-group-item list-group-item-action"
 style="border-left-color: black; border-right-color: black; border-bottom-color: black;">내가 쓴 글</button>
</div>
</div>
</div>
