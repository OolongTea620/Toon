<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- <a onclick="clickATag(3, 3);"> -->
<!-- test link  -->
<!-- 		<input name ="epNum" value="3" readonly="readonly"/> -->
<!-- 		<input name ="eachEpNum" value="3" readonly="readonly"/>		 -->
<!-- 	</a> -->

<div id="getTicketButton container">
<sec:authorize access="isAuthenticated()">
 	
 	<div class="ticketUI col">
		<div id="Tpoint" class="row"><p>포인트 &nbsp; ${memberVO.point} P</p> </div>
		<div id="Tstock" class="row">보유 소장권 갯수 &nbsp;  <span>${ticketBox.stock} 개 </span></div> 
	</div>
	<div class="col" id="TIcketform"> 
		<form id="goto-ticket" action="${pageContext.request.contextPath}/point/ticketCharge" method="post">
<!-- 			<span>stock</span> -->
			<input id="ticket-stock" name="stock" value="${ticketBox.stock}" readonly="readonly" hidden="hidden"/>
<!-- 			<span>유저이름</span> -->
			<input id="user-name" name="username" value="<sec:authentication property="principal.username"/>" hidden="hidden" readonly="readonly"/>
<!-- 			<br/><span>보유중 포인트</span> -->
			<!-- javaScript로 200P 미만인지 검사하고 그 값에 따라서 충전버튼 과 소장권 구매 버튼 활성화 다르게 하기 -->
			<input id="cur-point" name="point" value="${memberVO.point}" hidden="hidden" readonly="readonly"/>
<!-- 			<br/><span>toonNum</span> -->
			<input id="toon-num" name="toonNum" value="${toonVO.toonNum}" hidden="hidden" readonly="readonly"/>
<!-- 			<br/><span>toonTitle</span> -->
			<input id ="toon-Title" name="toonTitle" value="${toonVO.toonTitle}" hidden="hidden" readonly="readonly"/>
			<!-- point가 작은 경우 소장권 버튼 누르면 alert창 나오고 chargePoint페이지로 이동하기 -->
			<button id="chargeTicket" class="btn btn-outline-primary" type="submit">소장권 충전하기</button>		
		</form>
	</div>
</sec:authorize>	


</div>