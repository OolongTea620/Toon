<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ajax 사용하기 위한 것 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<c:import url="../fragments/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
<style>
#left-box {
    width: 100px;
/*      background-color: red; */
    float: left;
}
#center-box {
    text-align: center;
/*     background-color: yellow; */
    margin: 0 auto;
}
#right-box {
    width: 100px;
/*     background-color: blue; */
    float: right;
    text-align: right;
}
</style>

</head>
<body>
<c:import url="../fragments/header.jsp"></c:import>

  <div id='left-box'>
      
   </div>    
    <div id='right-box'>
    
    </div>
  

    <div id='center-box'>

	<table width="100%">
    <tr>
       <td rowspan="4" align="right">
          <div class="thumb">
               <a href="/toon/eachEpList?toonNum=${toonVO.toonNum}">
               <img src="${toonVO.titleImg}" width=260px height=230px>
               
             </a>
            </div> 
         </td>
         
       <td align="left"><h2>&emsp;${toonVO.toonTitle} / <span class="wrt_nm">${toonVO.nickname}</span> </h2></td>
    </tr>
    
    <tr>
       <td align="left"><h4>&emsp;&emsp;  ${toonVO.toonSum} </h4></td>

    </tr>
    
     <tr>
       <td align="left"><h4>&emsp; 장르 : ${toonVO.genre} / <span class="totalRating">웹툰별점 : <fmt:formatNumber value="${toonVO.ratingSum/toonVO.ratingPerson}" pattern=".00"/></span></h4></td>
    </tr>
  
      <tr>
       <td align="left">
       &emsp;
       <a href="#" title="관심웹툰" class="book_maker on" id="check_favorite">
            <c:choose>
               <c:when test="${empty favorToon}">
                  <button class="like btn-outline-info">관심웹툰등록</button>
               </c:when>
               <c:otherwise>
                  <button class="like btn-info">관심웹툰해제</button>
               </c:otherwise>
           </c:choose>
       </a> 
       
      <a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=1&epNum=${toonVO.eachEpVO['0'].epNum}" title="첫회보기" class="first"><button class="btn-outline-primary">첫회보기</button></a>
       
       </td>
    </tr>
     
    </table><br>

     <c:import url="./buyTicketForm.jsp"></c:import>
   <!-- 리스트 -->

      <table class="table table-borderless viewList">
      <%-- <caption><span class="blind">회차별 목록</span></caption> --%>
      <thead>
      <tr>
         <th scope="col">이미지</th>
         <th scope="col">제목</th>
         <th scope="col">별점</th>
         <th scope="col">등록일</th>
      </tr>         
      </thead>
      
      <tbody>
      <c:forEach items="${toonVO.eachEpVO}" var="eachEpVO">
     
         <tr>
            <td class="imgalign">
               <sec:authorize access="isAnonymous()">
                  <a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${eachEpVO.eachEpNum}&epNum=${eachEpVO.epNum}" >
               </sec:authorize>
         
               <sec:authorize access="isAuthenticated()">
                  <a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${eachEpVO.eachEpNum}&epNum=${eachEpVO.epNum}&username=<sec:authentication property="principal.username"/>" >
               </sec:authorize>
               
               <img src="${eachEpVO.epSumImg}"
                  title="${eachEpVO.eachEpNum}화" alt="${eachEpVO.eachEpNum}화" width="71" height="41">
                  <span class="mask"></span>
               </a>
            </td>
            
            <td class="title">
            
               <sec:authorize access="isAnonymous()">
                  <a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${eachEpVO.eachEpNum}&epNum=${eachEpVO.epNum}" >
               </sec:authorize>
         
               <sec:authorize access="isAuthenticated()">
                  <a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${eachEpVO.eachEpNum}&epNum=${eachEpVO.epNum}&username=<sec:authentication property="principal.username"/>" >
               </sec:authorize>
               
            ${eachEpVO.epTitle}</a>
            </td>
            <td>
               <div class="rating_type">
                  <span class="star"><em>평점</em></span>
                  <strong><fmt:formatNumber value="${eachEpVO.epRatingSum/eachEpVO.epRatingPerson}" pattern=".00"/></strong>
               </div>
            </td>
            <td class="num"><span>${eachEpVO.epDate}</span></td>
         </tr>
        </a>
      </c:forEach>
      </tbody>
      </table>
      
      <div class="paginate"  style="margin:0 auto;">
          <ul class="pagination justify-content-center">
     
           <c:if test="${pager.pre}">   
             <li class="page-item"><a class="page-link p" href="#" title="${pager.startNum-1}">Previous</a></li>
            </c:if>
      
           <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
      
             <li class="page-item"><a class="page-link p" href="/toon/eachEpList?toonNum=${toonVO.toonNum}&curPage=${i}" title="${i}">${i}</a></li>
            </c:forEach>
      
             <c:if test="${pager.next}">
             <li class="page-item"><a class="page-link p" href="#" title="${pager.lastNum+1}">Next</a></li>
             </c:if>
           </ul>
      </div>
      
      <input type="hidden" id="toonNum" value="${toonVO.toonNum}">
      <sec:authorize access="isAuthenticated()">
         <sec:authentication property="principal.username" var="loginUser"/>
         <input type="hidden" id="username" value="${loginUser}">
      </sec:authorize>

<script type="text/javascript" src="../js/toon/favoriteToon.js"></script>
<script type="text/javascript" src="../js/pay/useTicket.js"></script>
</div>
  </div>   
 
</body>
</html>