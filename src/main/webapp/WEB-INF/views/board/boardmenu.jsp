<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <div class="row">
 <div class="col-md-2" style="width: 200px;">

  <div class="list-group" id="boardquickmenu" align='center' >
  <input type="text" id="boardmenu" readonly="readonly"  class="list-group-item list-group-item-action active list-group-item-dark"
    value="Board Menu" />
  
  <button id="free" onclick="location.href='http://localhost:8090/board/boardForm.do?currentPage=1&&board_type=0'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black; ">자유게시판</button>
  <button id="qna" onclick="location.href='http://localhost:8090/board/reviewboard.do?currentPage=1&&board_type=1'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black; ">리뷰게시판</button>
  <button id="review" onclick="location.href='http://localhost:8090/board/qnaboard.do?currentPage=1&&board_type=2'" class="list-group-item list-group-item-action"
  style="border-left-color: black; border-right-color: black; border-bottom-color: black;">Q&A게시판</button>
</div>
</div>
</div>