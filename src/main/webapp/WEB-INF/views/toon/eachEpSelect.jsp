<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../fragments/bootstrap.jsp"/>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/eachEp/star.css">
<style>
#left-box {
    width: 100px;
/*   	background-color: red; */
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
<c:import url="../fragments/header.jsp"/>


    <div id='left-box'>
		
	</div>    
    <div id='right-box'>
    
    </div>
  

    <div id='center-box'>


    <table width="70%">
    <tr>
    	<td rowspan="4" align="right">
    		<div class="thumb">
       		  <a href="/toon/eachEpList?toonNum=${toonVO.toonNum}">
         	   <img src="${toonVO.titleImg}" width=260px height=230px>
        	    <span class="mask"></span>
        	  </a>
     	 	</div> 
      	</td>
      	
    	<td><h2>${toonVO.toonTitle} / <span class="wrt_nm">${toonVO.nickname}</span> </h2></td>
    </tr>
    
    <tr>
    	<td><h4> ${toonVO.toonSum} </h4></td>

    </tr>
    
     <tr>
    	<td><h4>장르 : ${toonVO.genre}</h4></td>
    </tr>
  
  	 <tr>
    	<td>
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
			<a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=1&epNum=1" title="첫회보기" class="first"><button class="btn-outline-primary">첫회보기</button></a>
			<a href="/toon/eachEpList?toonNum=${toonVO.toonNum}" title="목록보기" class="backToTheList"><button class="btn-outline-secondary">목록보기</button></a>
		 </td>
    </tr>
  	
    </table><br>
    	
     <!-- 웹툰 소개 -->
	<div style="width:1010px; height:50px; text-align: center; ">
		<h3 style="color: black">${toonVO.eachEpVO['0'].epTitle}</h3>
	</div>
	
	<div style="width:1010px; height:50px;">
		회별 별점 :  <span class="star"><em style="width: 98%">평점</em></span> 
                  <span id="topPointTotalNumber"><strong><fmt:formatNumber value="${toonVO.eachEpVO['0'].epRatingSum/toonVO.eachEpVO['0'].epRatingPerson}" pattern=".00"/></strong></span> 
                  <span class="pointTotalPerson">(참여 <em>${toonVO.eachEpVO['0'].epRatingPerson}</em>)</span>
         
        등록일 : ${toonVO.eachEpVO['0'].epDate}  

            <c:if test="${toonVO.eachEpVO['0'].eachEpNum!=1}">
               <button class="btn-outline-primary">
               <span class="pre"> 
               <a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${toonVO.eachEpVO['0'].eachEpNum-1}&epNum=${toonVO.eachEpVO['0'].epNum-1}">이전화</a>
               </span></button>
            </c:if>
            <c:if test="${toonVO.eachEpVO['0'].eachEpNum<pager.maxEp}">
            	<button class="btn-outline-primary">
               <span class="next"> 
               <a href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${toonVO.eachEpVO['0'].eachEpNum+1}&epNum=${toonVO.eachEpVO['0'].epNum+1}">다음화</a>
               </span></button>
            </c:if>
         </div>        
	

   <div class="tit_area">
   <!-- content Img  -->
   <div class="wt_viewer" style="background: #FFFFFF">
   <img src="${toonVO.eachEpVO['0'].epContentImg}" alt="comic content" id="content_image_0" oncontextmenu="return false" ondragstart="return false">
   </div> <br><br>

   </div>

   <!-- 리뷰,별점 -->
   
   <table>
      <tr>
        <th><h3>별점</h3></th>
        <th></th>
        <th><div id="rating" class="rating">
         <div class="startRadio">
              <c:forEach begin="1" end="10" var="i">
              <label class="startRadio__box">
             <input type="radio" name="star" id="star${i}" value="${i}">
             <span class="startRadio__img"><span class="blind">${i}</span></span>
              </label>
              </c:forEach>
         </div>
      </div></th>
      	<th></th>
      

      </tr>
      <tr>
        <td><h3>댓글</h3></td>
        <td></td>
        <td> <div class="review_contents">
         <textarea rows="2" id="comments" class="review_textarea" style="width: 500px" placeholder="별점과 댓글 모두 입력해주세요."></textarea>
      </div></td>
      	<td><input type="button" id="save" value="등록"></td>
      </tr>
      
    </table>

   <!-- 댓글 리스트 -->   

  <div id="review_page">
   <table class="table table-hover reviewList">
      <c:forEach items="${toonVO.eachEpVO['0'].reviewVO}" var="reviewVO1">
         <tbody>
            <tr>
               <td>${reviewVO1.username}</td>
               <td>${reviewVO1.commentDate}</td>
               <td>${reviewVO1.rating}점</td>
            </tr>
            <tr>
               <td colspan="2" id="revComment${reviewVO1.revNum}">${reviewVO1.comments}</td>
               
               <sec:authorize access="isAnonymous()">
                  <td> </td>
               </sec:authorize>
               
               <sec:authorize access="isAuthenticated()">
               <sec:authentication property="principal.username" var="loginUser"/>
                  <c:if test="${reviewVO1.username == loginUser}">
                     <td>
                        <button class="updateReview btn-outline-primary" title="${reviewVO1.revNum}" value="${reviewVO1.revNum}"
                           data-toggle='modal' data-target='#modifyModal'>수정</button>
                        <button class="delReview btn-outline-success" title="${reviewVO1.revNum}" value="${reviewVO1.revNum}">삭제</button>
                     </td>
                  </c:if>
               </sec:authorize>
            </tr>
         </tbody>
      </c:forEach>
      
   </table>

   <c:if test="${toonVO.eachEpVO['0'].reviewVO['0']!=null}">
      <div class="paginate">
          <ul class="pagination">
     
           <c:if test="${pager.pre}">   
             <li class="page-item"><a class="page-link p" href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${toonVO.eachEpVO['0'].eachEpNum}
             &epNum=${toonVO.eachEpVO['0'].epNum}&curPage=${pager.curPage-1}" title="${pager.startNum-1}">Previous</a></li>
            </c:if>
      
           <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
      
            <li class="page-item"><a class="page-link p" href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${toonVO.eachEpVO['0'].eachEpNum}
            &epNum=${toonVO.eachEpVO['0'].epNum}&curPage=${i}" title="${i}">${i}</a></li>
            </c:forEach>
      
             <c:if test="${pager.next}">
             <li class="page-item"><a class="page-link p" href="/toon/eachEpSelect?toonNum=${toonVO.toonNum}&eachEpNum=${toonVO.eachEpVO['0'].eachEpNum}
             &epNum=${toonVO.eachEpVO['0'].epNum}&curPage=${pager.curPage+1}" title="${pager.lastNum+1}">Next</a></li>
             </c:if>
           </ul>
      </div>
   </c:if>
   
   </div>   
   
   <div class="modal fade" id="modifyModal" role="dialog">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header"> <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h4 class="modal-title">댓글 수정</h4>
         </div>
         <div class="modal-body">
           <div class="form-group">
            <label for="reply_no">댓글 번호</label> <input class="form-control" id="reply_no" name="reply_no" readonly> </div>
           <div class="form-group">
            <label for="reply_text">댓글 내용</label> <input class="form-control" id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요."> </div>
           <div class="form-group">
            <label for="reply_writer">댓글 작성자</label> <input class="form-control" id="reply_writer" name="reply_writer" readonly> </div>
         </div>
         <div class="modal-footer"> 
            <button type="button" class="btn btn-success modalModBtn">수정</button>
            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button> 
         </div>
       </div>
     </div>
   </div>
   
   <input type="hidden" id="toonNum" value="${toonVO.toonNum}">
   <input type="hidden" id="epNum" value="${toonVO.eachEpVO['0'].epNum}">
   <input type="hidden" id="eachEpNum" value="${toonVO.eachEpVO['0'].eachEpNum}">
   <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.username" var="loginUser"/>
        <input type="hidden" id="username" value="${loginUser}">
   </sec:authorize>

   <script type="text/javascript" src="../js/toon/favoriteToon.js"></script>
   <script type="text/javascript" src="../js/toon/reviews.js"></script>
   
</body>
</html> 