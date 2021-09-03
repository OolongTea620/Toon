<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import = "java.util.Calendar" %>
<%Calendar cal = Calendar.getInstance();%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:import url="./fragments/bootstrap.jsp"></c:import>  
<link rel="stylesheet" href="../css/header.css">

<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>
<c:import url="./fragments/header.jsp"></c:import>
  
  <div class="row">
                <div class="area-heading">
                    <h3>이번주 인기 웹툰</h3>
                    <p>올 여름을 강타할 짜릿짜릿한 에어컨같은 웹툰들을 만나보아요:)</p>
                </div>
            </div>
    <!--================Fullwidth block Area =================-->

    <section class="fullwidth-block area-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-lg-6 col-xl-5">
                    <div class="single-blog">
                        <div class="thumb">
                            <a href="/toon/eachEpList?toonNum=1">
                            <img width=770px height=780px src="images/indeximage/sinsin.jpg" alt="">
                            </a>
                        </div>
                        <div class="short_details">
                            <div class="meta-top d-flex">
                                <a href="#" style="font-size:20px;">인기웹툰<1></a>
                            </div>
                            <a class="d-block" href="single-blog.html">
                                <h4>신의탑</h4>
                            </a>
                            <div class="meta-bottom d-flex" >
                                <a href="/toon/eachEpList?toonNum=1""></a>
                                <a class="dark_font" href="#">SIU</a>
                            </div>
                        </div>
                    </div>    
                </div>

                <div class="col-md-6 col-lg-6 col-xl-4">
                    <div class="single-blog style_two">
                        <div class="thumb">
                        <a href="/toon/eachEpList?toonNum=13">
                            <img width=552px height=780px src="images/indeximage/여신강림.jpg" alt="">
                            </a>
                        </div>
                        <div class="short_details text-center ">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                            <div class="meta-top d-flex justify-content-center">
                                <a href="#">인기웹툰<2></a>
                            </div>
                            <a class="d-block" href="single-blog.html">
                                <h4>여신강림</h4>
                            </a>
                            <div class="meta-bottom d-flex justify-content-center">
                                <a href="#"></a>
                                <a href="#">야옹이</a>
                            </div>
                        </div>
                    </div>    
                </div>

                <div class="col-lg-12 col-xl-3">
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-6 col-xl-12">
                            <div class="single-blog style-three m_b_30">
                                <div class="thumb">
                                <a href="/toon/eachEpList?toonNum=27">
                                    <img width=458px height=359px src="images/indeximage/king.jpg" alt="">
                                    </a>
                                </div>
                                

                                    <div class="meta-top d-flex justify-content-center">
                                        <a href="#" style="font-size:20px; color: grey;">복학왕</a>
                                    </div>
                                    <a class="d-block" href="single-blog.html">
                                     
                                    </a>
                                
                            </div>
               
                        </div>
                        <div class="col-12 col-md-6 col-lg-6 col-xl-12">
                            <div class="single-blog style-three">
                                <div class="thumb">
                                <a href="/toon/eachEpList?toonNum=49">
                                    <img width=458px height=359px src="images/indeximage/독립.jpg" alt="">
                                    </a>
                                </div>
                              

                                    <div class="meta-top d-flex justify-content-center">
                                        <a href="#" style="font-size:20px; color: grey;">독립일기</a>
                                    </div>
                                    <a class="d-block" href="single-blog.html">
                    
                                    </a>
                              
                            </div>    
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>


  <!--================ Daily section start =================-->  

    <div class="three-block  area-padding">
        <div class="container">
            <div class="row">
                <div class="area-heading">
                    <h3>Daily Toon</h3>
                    <p>신의탑부터 싸움독학까지 일주일이 심심하지 않아요!</p>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-blog style-five">
                        <div class="thumb">
                        <h2>MON</h2>
                        <a href="/toon/eachEpList?toonNum=1">
                            <img class="img-fluid" src="https://shared-comic.pstatic.net/thumb/webtoon/183559/thumbnail/thumbnail_IMAG10_9a752bec-9ebd-4214-9449-28cf4defc650.jpg" alt="">
                            <a href="/toon/eachEpList?toonNum=1">
                        </div>
                      
                            <div class="meta-top d-flex">
                                <a href="https://shared-comic.pstatic.net/thumb/webtoon/183559/thumbnail/thumbnail_IMAG10_9a752bec-9ebd-4214-9449-28cf4defc650.jpg" style="font-size:20px;">신의탑</a>
                              
                            </div>
                            <a class="d-block" href="single-blog.html">
                                
                            </a>
                           
                        
                    </div> 

                </div> 

                <div class="col-lg-4">
                    <div class="single-blog style-five">
                        <div class="thumb">
                        <h2>TUE</h2>
                        <a href="/toon/eachEpList?toonNum=16">
                            <img class="img-fluid" src="https://shared-comic.pstatic.net/thumb/webtoon/743139/thumbnail/thumbnail_IMAG10_df1a8c2f-63c4-44e1-b1f5-907c41c13243.jpg" alt="">
                            </a>
                        </div>
                      
                            <div class="meta-top d-flex">
                                <a href="https://shared-comic.pstatic.net/thumb/webtoon/743139/thumbnail/thumbnail_IMAG10_df1a8c2f-63c4-44e1-b1f5-907c41c13243.jpg" style="font-size:20px;">한림체육관</a>
                             
                            </div>
                            <a class="d-block" href="single-blog.html">
                                
                            </a>
                          
                       
                    </div> 

                </div> 
&emsp;
                <div class="col-lg-4">
                    <div class="single-blog style-five">
                        <div class="thumb">
                         <h2>WEN</h2>
                         <a href="/toon/eachEpList?toonNum=25">
                            <img class="img-fluid" src="https://shared-comic.pstatic.net/thumb/webtoon/670143/thumbnail/thumbnail_IMAG10_d2f956f7-2541-4b97-b933-e4aaa2564d14.jpg" alt="">
                            </a>
                        </div>
                        
                            <div class="meta-top d-flex">
                                <a href="https://shared-comic.pstatic.net/thumb/webtoon/670143/thumbnail/thumbnail_IMAG10_d2f956f7-2541-4b97-b933-e4aaa2564d14.jpg" style="font-size:20px;">헬퍼2: 킬베로스</a>
                               
                            </div>
                            <a class="d-block" href="single-blog.html">
                               
                            </a>
                          

                       
                    </div> 
                </div> 
 &emsp;              
              <div class="col-lg-4">
                    <div class="single-blog style-five">
                        <div class="thumb">
                         <h2>THU</h2>
                         <a href="/toon/eachEpList?toonNum=38">
                            <img class="img-fluid" src="https://shared-comic.pstatic.net/thumb/webtoon/570503/thumbnail/thumbnail_IMAG10_023d23be-91f9-46c5-a1ff-152d6238e892.jpg" alt="">
                            </a>
                        </div>
                       
                            <div class="meta-top d-flex">
                                <a href="https://shared-comic.pstatic.net/thumb/webtoon/570503/thumbnail/thumbnail_IMAG10_023d23be-91f9-46c5-a1ff-152d6238e892.jpg" style="font-size:20px;">연애혁명</a>
                              
                            </div>
                            <a class="d-block" href="single-blog.html">
                               
                            </a>
                          
                        
                    </div> 
&emsp;
                </div> 
                 <div class="col-lg-4">
                    <div class="single-blog style-five">
                        <div class="thumb">
                         <h2>FRI</h2>
                         <a href="/toon/eachEpList?toonNum=50">
                            <img class="img-fluid" src="https://shared-comic.pstatic.net/thumb/webtoon/641253/thumbnail/thumbnail_IMAG10_d4d1a799-d193-4e5a-9b46-6dffcead862a.jpg" alt="">
                            </a>
                        </div>
                        
                            <div class="meta-top d-flex">
                                <a href="#" style="font-size:20px;">외모지상주의</a>
                                
                            </div>
                            <a class="d-block" href="single-blog.html">
                               
                            </a>
                           
                       
                    </div> 
            &emsp;
                </div> 
                 <div class="col-lg-4">
                    <div class="single-blog style-five">
                        <div class="thumb">
                         <h2>SAT</h2>
                         <a href="/toon/eachEpList?toonNum=62">
                            <img class="img-fluid" src="https://shared-comic.pstatic.net/thumb/webtoon/650305/thumbnail/title_thumbnail_20161209212128_t83x90.jpg" alt="">
                            </a>
                        </div>
                        
                            <div class="meta-top d-flex">
                                <a href="#" style="font-size:20px;">호랑이형님</a>
                    
                            </div>
                            <a class="d-block" href="single-blog.html">
                            </a>
                        
                    </div> 
            &emsp;
                </div> 
                 <div class="col-lg-4">
                    <div class="single-blog style-five">
                        <div class="thumb">
                          <h2>SUN</h2>
                          <a href="/toon/eachEpList?toonNum=74">
                            <img class="img-fluid" src="https://shared-comic.pstatic.net/thumb/webtoon/736277/thumbnail/thumbnail_IMAG10_3ff8475e-6085-4188-a359-920a8801b419.jpg" alt="">
                          </a>
                        </div>
                        
                            <div class="meta-top d-flex">
                                <a href="https://shared-comic.pstatic.net/thumb/webtoon/736277/thumbnail/thumbnail_IMAG10_3ff8475e-6085-4188-a359-920a8801b419.jpg" style="font-size:20px;">싸움독학</a>
                               
                            </div>
                            <a class="d-block" href="single-blog.html">
                              
                            </a>
                           
                        
                    </div> 

                </div>                
            </div>
        </div>
    </div>


    <!--================ daily  section end =================-->  




   <!--================ Genre section start =================-->  

    <div class="latest-news  area-padding-bottom">
        <div class="container">
            <div class="row">
                <div class="area-heading">
                    <h3>GENRE</h3>
                    <p>판타지냐 액션이냐 그것이 문제로다..! </p>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="single-blog style-five">
                        <div class="thumb">
                         <a href="/toon/eachEpList?toonNum=52">
                            <img width=555px height=602px src="images/indeximage/dead.jpg" alt="">
                            </a>
                        </div>
                        <div class="short_details">
                            <div class="meta-top d-flex">
                                <a style="font-size:20px;" href="/toon/eachEpList?toonNum=52">데드퀸 - Fantasy</a>
                            </div>
                            <a class="d-block" href="single-blog.html">
                                <h4>절망에 빠져 죽음이 임박했을때, 진짜 여왕이 재림한다! 하이브 세계관의 장대한 끝, 데드퀸</h4>
                            </a>
                           
                        </div>
                    </div> 

                </div> 

                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="single-blog style-five small">
                                <div class="thumb">
                                  <a href="/toon/eachEpList?toonNum=39">
                                    <img width=262px height=212px src="images/indeximage/duna.jpg" alt="">
                                    </a>
                                </div>
                                
                                    <div class="meta-top d-flex">
                                        <a style="font-size:20px;" href="/toon/eachEpList?toonNum=39">이두나 -Romance</a>
                                    </div>
                                    <a class="d-block" href="single-blog.html">
                                        <h4 style="font-size:10px;">(구)아이돌, 첫사랑, 소개팅녀까지 한 집에 모였다!
<나노리스트> 민송아 작가의 두근두근 누나 리스트!</h4>
                                    </a>
                                    
                               
                            </div> 
                        </div>

                        <div class="col-lg-6">
                            <div class="single-blog style-five small">
                                <div class="thumb">
                                  <a href="/toon/eachEpList?toonNum=28">
                                    <img width=262px height=212px src="images/indeximage/mojyo.jpg" alt="">
                                    </a>
                                </div>
                                
                                    <div class="meta-top d-flex">
                                        <a style="font-size:20px;" href="/toon/eachEpList?toonNum=28">모죠의 일기 - Comedy</a>
                                    </div>
                                    <a class="d-block" href="single-blog.html">
                                        <h4 style="font-size:10px;">소신있는 취향과 내성적인 성향.
훌륭한 집순이 모죠의 은밀한 비밀들</h4>
                                    </a>
                                   
                            </div> 
                        </div>

                        <div class="col-lg-6">
                            <div class="single-blog style-five small">
                                <div class="thumb">
                                  <a href="/toon/eachEpList?toonNum=37">
                                    <img width=262px height=212px src="images/indeximage/boxer.jpg" alt="">
                                    </a>
                                </div>
                                
                                    <div class="meta-top d-flex">
                                        <a style="font-size:20px;" href="/toon/eachEpList?toonNum=37">더 복서 - Action</a>
                                    </div>
                                    <a class="d-block" href="single-blog.html">
                                        <h4 style="font-size:10px;">재능있는 복서를 찾던 전설적인 트레이너 K는 기묘한 소년을 발견한다.
그의 충격적인 재능은 과연 축복일까, 저주일까?!</h4>
                                    </a>
                                 
                            </div> 
                        </div>

                        <div class="col-lg-6">
                            <div class="single-blog style-five small">
                                <div class="thumb">
                                  <a href="/toon/eachEpList?toonNum=15">
                                    <img width=262px height=212px src="images/indeximage/gun.png" alt="">
                                    </a>
                                </div>
                              
                                    <div class="meta-top d-flex">
                                        <a style="font-size:20px;" href="/toon/eachEpList?toonNum=15">엽총소년 - Thriller</a>
                                    </div>
                                    <a class="d-block" href="single-blog.html">
                                        <h4 style="font-size:10px;">약자에서 영웅이 될 수밖에 없었던 소년 '한규환',
그리고 그 소년을 영웅으로 만들어줄 엽총 한 자루가 눈앞에 있다.
글로벌 누적 조회수 12억 뷰를 기록한 <스위트홈>의 프리퀄 대공개!</h4>
                                    </a>
                                   
                            </div> 
                            
                        </div>          
                    </div>               
                </div> 

            </div>
        </div>
    </div>


    <!--================ Genre section end =================--> 


    <!--================ Finished section start ================-->  

    <section class="editors_pick area-padding">
        <div class="container">
            <div class="row">
                <div class="area-heading">
                    <h3>Finished</h3>
                    <p>아닛! 이 웹툰이 벌써 끝나다니?!</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5 col-xl-6">
                    <div class="single-blog">
                        <div class="thumb">
                        <a href="/toon/eachEpList?toonNum=103">
                            <img width=555px height=594px src="images/indeximage/yumi.jpg" alt="">
                            </a>
                        </div>
                        <div class="short_details pad_25 ">
                            <div class="meta-top d-flex">
                                <a href="/toon/eachEpList?toonNum=103">유미의 세포들</a>
                            </div>
                            <a class="d-block" href="single-blog.html">
                                <h4>유미는 지금 무슨 생각을 하고 있을까? 그녀의 머릿속에서 바쁘게 움직이는 세포들 이야기!</h4>
                            </a>
                            
                        </div>
                    </div>    
                </div>
                <div class="col-lg-7 col-xl-6">
                    <div class="single-blog row no-gutters style-four m_b_30">
                        <div class="col-12 col-sm-7">
                            <div class="short_details padd_left_0">
                                <div class="meta-top d-flex">
                                    <a href="/toon/eachEpList?toonNum=86">고수</a>
                                </div>
                                <a class="d-block" href="single-blog.html">
                                    <h4 class="font-20"><용비불패> 최강의 콤비가 무협의 전설을 다시 쓰다!
천하제일의 고수 강룡. 그리고 수많은 다른 고수들의 이야기.</h4>
                                </a>
                                
                            </div>  
                        </div>  
                        <div class="col-12 col-sm-5">
                            <div class="thumb">
                             <a href="/toon/eachEpList?toonNum=86">
                                <img  width=264px height=300px src="images/indeximage/gosu.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div> 

                    <div class="single-blog row no-gutters style-four">
                        <div class="col-12 col-sm-5">
                            <div class="thumb">
                             <a href="/toon/eachEpList?toonNum=88">
                                <img  width=264px height=300px src="images/indeximage/money.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-12 col-sm-7">
                            <div class="short_details padd_right_0">
                                <div class="meta-top d-flex">
                                    <a href="/toon/eachEpList?toonNum=88">머니게임</a>
                                </div>
                                <a class="d-block" href="single-blog.html">
                                    <h4 class="font-20">게임 일수 100일. 총 상금 448억. 적용 물가 1000배.
당신은 얼마를 벌어 나갈수 있습니까? </h4>
                                </a>
                                
                            </div>  
                        </div>  
                    </div>
                </div>
            </div>
           	
        </div>
    </section>


    <!--================ Finished section end ================-->    




    <!-- ================ 나머지 Starts ================= -->  

  <%--   <section class="instagram">
        <div class="row no-gutters">
            <div class="col-2">
                <a href=""><img width=220px height=200px src="images/instagram/1.jpg" alt=""></a>
            </div>
            <div class="col-2">
                <a href=""><img width=220px height=200px src="images/instagram/2.jpg" alt=""></a>
            </div>
            <div class="col-2">
                <a href=""><img width=220px height=200px src="images/instagram/3.jpg" alt=""></a>
            </div>
            <div class="col-2">
                <a href=""><img width=220px height=200px src="images/instagram/4.jpg" alt=""></a>
            </div>
            <div class="col-2">
                <a href=""><img width=220px height=200px src="images/instagram/5.jpg" alt=""></a>
            </div>
            <div class="col-2">
                <a href=""><img width=220px height=200px src="images/instagram/6.jpg" alt=""></a>
            </div>
            <div class="col-2">
                <a href=""><img width=220px height=200px src="images/instagram/6.jpg" alt=""></a>
            </div>
        </div>
    </section> --%>

    <!-- ================ 나머지 Area End ================= -->  


    <!-- ================ start footer Area ================= -->
   <c:import url="./fragments/footer.jsp"></c:import>
   <!-- ================ End footer Area ================= -->

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/stellar.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/contact.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/theme.js"></script>


</body>
</html>