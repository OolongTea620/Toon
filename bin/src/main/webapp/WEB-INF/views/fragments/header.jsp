<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <!--================ Start header Top Area =================-->
    <section class="header-top">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-6 col-lg-4">
                    <div class="float-left">
                        <ul class="header_social">
<!--                             <li><a href="#"><i class="ti-facebook"></i></a></li> -->
<!--                             <li><a href="#"><i class="ti-twitter"></i></a></li> -->
<!--                             <li><a href="#"><i class="ti-instagram"></i></a></li> -->
<!--                             <li><a href="#"><i class="ti-skype"></i></a></li> -->
<!--                             <li><a href="#"><i class="ti-vimeo"></i></a></li> -->

                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                            
                            <li><a href="${pageContext.request.contextPath}/admin/adminPage">ADMIN PAGE</a></li>
                           
                            </sec:authorize>
                        </ul>   
                    </div>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 logo-wrapper">
<!--                     <a href="index.html" class="logo"> -->
<!--                         <img src="images/logo.png" alt=""> -->
<!--                     </a> -->
                  <a class="navbar-brand" href="${pageContext.request.contextPath}/"><h2>WEBTOON PAGE</h2></a>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 search-trigger">
                    <div class="right-button">
                        <ul>
<%--                            <c:if test="${empty member}">         --%>
                     <sec:authorize access="!isAuthenticated()">
                            <li><a href="/member/login">Login</a></li>
                            <li><a href="/member/memberJoinCheck">Join</a></li>
                            </sec:authorize>
<%--                             </c:if> --%>
                            
<%--                             <c:if test="${not empty member}"> --%>
                     <sec:authorize access="hasRole('ROLE_MEMBER')">
                     
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop"data-toggle="dropdown">  <sec:authentication property="principal.name"/>님 </a>
                           <div class="dropdown-menu">
                              <a class="dropdown-item" href="${pageContext.request.contextPath}/point/charge">포인트 충전</a> 
                           </div>
                        </li>
                            <li><a href="/member/myPage">MY PAGE</a></li>
                            <li><a href="/member/logout" onclick="if(!confirm('정말 로그아웃 하시겠습니까?')){return false;}">LOGOUT</a></li>
                            </sec:authorize>
<%--                             </c:if> --%>
                        </ul>
                        

                    </div>
                </div>
            </div>
        </div>
    <div class="search_input" id="search_input_box"> <div class="container "> 
    <form action="/toon/toonSearch" method="get" class="d-flex justify-content-between search-inner"> 
    <input type="text" class="form-control" name="search" id="search" value=""	 placeholder="Search Here"> 
    <input class="btn btn-search" type="submit" value="검색"> </form> </div> </div>
    </section>
    
    <!--================ End header top Area =================-->
    
     <!-- Start header Menu Area -->
     <header id="header" class="header_area">
        <div class="main_menu">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                            <li class="nav-item active"><a class="nav-link" href="/">Home</a></li> 
                            <li class="nav-item"><a class="nav-link" href="/toon/toonDay/toonDay">요일</a></li> 
                            <li class="nav-item"><a class="nav-link" href="/toon/genre/genre">장르</a></li>    
                         	<li class="nav-item"><a class="nav-link" href="/toon/ranking/ranking">랭킹</a></li>
                           	<li class="nav-item"><a class="nav-link" href="/toon/end/endRe">완결</a></li>                           	
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- End header MEnu Area -->