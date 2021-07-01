<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<c:import url="../fragments/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
<c:import url="../fragments/header.jsp"></c:import>
   <br><br>
<div id="content" class="webtoon">

   <!-- 웹툰 소개 -->
   <div class="comicinfo">
      <div class="thumb">
         <a href="/toon/eachEpList?toonNum=${toonVO.toonNum}">
            <img src="${toonVO.titleImg}">
            <span class="mask"></span>
            </a>
      </div>
      <div class="detail">
         <h2>${toonVO.toonTitle}
         <span class="wrt_nm">${toonVO.nickname}</span>
         </h2>
         <p><h2>${toonVO.toonSum}</h2></p>
      <p class="detail_info"><span class="genre">장르 : ${toonVO.genre}</span>
      <span class="totalRating">웹툰별점 : <fmt:formatNumber value="${toonVO.ratingSum/toonVO.ratingPerson}" pattern=".00"/></span></p>
      
      <ul class="btn_group">
      
      <li><a href="#" title="관심웹툰" class="book_maker on" id="check_favorite">
         <c:choose>
            <c:when test="${empty favorToon}">
               <span class="like">관심웹툰등록</span>
            </c:when>
            <c:otherwise>
               <span class="like">관심웹툰해제</span>
            </c:otherwise>
         </c:choose>
      </a></li>
      
      <li><a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=1&epNum=1" title="첫회보기" class="first"><span>첫회보기</span></a></li>
      </ul>
      </div>
   </div>
   <!-- 소장 -->
   <c:import url="./buyTicketForm.jsp"></c:import>
   <!-- 리스트 -->

      <table cellpadding="0" cellspacing="0" class="viewList">
      <%-- <caption><span class="blind">회차별 목록</span></caption> --%>
      <col width="99"><col width="*"><col width="141"><col width="76">
      <thead>
      <tr>
         <th scope="col">이미지</th>
         <th scope="col">제목</th>
         <th scope="col">별점</th>
         <th scope="col">등록일</th>
         <th scope="col"></th>
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
               
            ${eachEpVO.eachEpNum}화</a>
            </td>
            <td>
               <div class="rating_type">
                  <span class="star"><em>평점</em></span>
                  <strong><fmt:formatNumber value="${eachEpVO.epRatingSum/eachEpVO.epRatingPerson}" pattern=".00"/></strong>
               </div>
            </td>
            <td class="num"><span>${eachEpVO.epDate}</span></td>
           <td><button class="btn btn-primary" type="button" onclick="clickATag(${eachEpVO.epNum},${eachEpVO.eachEpNum});">보러가기</button></td>
         </tr>
         
         
      </c:forEach>
      </tbody>
      </table>
      
      <div class="paginate">
          <ul class="pagination">
     
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

</body>
</html>