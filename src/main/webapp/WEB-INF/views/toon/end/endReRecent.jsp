<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- BootStrap -->    
<!--     <link rel="icon" href="images/favicon.png" type="image/png">  위에 로고-->
    <c:import url="../../fragments/bootstrap.jsp"></c:import>
    <title>WebToon</title>
   
   
    <link rel="stylesheet" href="../../css/header.css">
  	<link rel="stylesheet" href="../../css/endRe.css">
</head>
<body>
	<c:import url="../../fragments/header.jsp"></c:import>


	<div class="view_type">	
	<table>
		<tr>
			<td><button type="button" class="btn btn-outline-primary" onclick="location.href='endRe'">조회순</button></td>
			<td><button type="button" class="btn btn-outline-info" onclick="location.href='endReRecent'">업데이트순</button></td>
			<td><button type="button" class="btn btn-outline-dark""	onclick="location.href='endReAver'">별점순</button></td>
		</tr>
	</table>
	</div>
		<br><br>
		
	<div class="latest-news  area-padding-bottom">
        <div class="container">
            <div class="row">
                <div class="area-heading">
                    <h3>완결웹툰</h3>
                    <p>오늘뭐하지? 여유로운일상에 정주행으로 Jump!</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="single-blog style-five">
                        <div class="thumb">
                         <a href="/toon/endEpList?toonNum=103">
                            <img width=555px height=602px src="../../images/indeximage/yumi.jpg" alt="">
                            </a>
                        </div>
                        <div class="short_details">
                            <div class="meta-top d-flex">
                                <a style="font-size:20px;" href="/toon/endEpList?toonNum=103">유미의 세포들</a>
                            </div>
                                <h4>유미는 지금 무슨 생각을 하고 있을까?
그녀의 머릿속에서 바쁘게 움직이는 세포들 이야기!</h4>
                            
                           
                        </div>
                    </div> 
                </div> 
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="single-blog style-five small">
                                <div class="thumb">
                                  <a href="/toon/endEpList?toonNum=86">
                                    <img width=262px height=212px src="../../images/indeximage/gosu.jpg" alt="">
                                    </a>
                                </div>
                                
                                    <div class="meta-top d-flex"><br>
                                        <a style="font-size:20px;" href="/toon/endEpList?toonNum=86">고수</a>
                                    </div>
                                         <h4 style="font-size:15px;">용비불패 최강의 콤비가 무협의 전설을 다시 쓰다!
천하제일의 고수 강룡. 그리고 수많은 다른 고수들의 이야기.</h4>
                                   
                                    
                               
                            </div> 
                        </div>
                        <div class="col-lg-6">
                            <div class="single-blog style-five small">
                                <div class="thumb">
                                  <a href="/toon/endEpList?toonNum=88">
                                    <img width=262px height=212px src="../../images/indeximage/money.jpg" alt="">
                                    </a>
                                </div>
                                
                                    <div class="meta-top d-flex"><br>
                                        <a style="font-size:20px;" href="/toon/endEpList?toonNum=88">머니 게임</a>
                                    </div>
                                        <h4 style="font-size:15px;">게임 일수 100일. 총 상금 448억. 적용 물가 1000배.
당신은 얼마를 벌어 나갈수 있습니까?</h4>
                                    
                                   
                            </div> 
                        </div>
                        <div class="col-lg-6">
                            <div class="single-blog style-five small">
                                <div class="thumb">
                                  <a href="/toon/endEpList?toonNum=89">
                                    <img width=262px height=212px src="../../images/indeximage/min.jpg" alt="">
                                    </a>
                                </div>
                                
                                    <div class="meta-top d-flex"><br>
                                        <a style="font-size:20px;" href="/toon/endEpList?toonNum=89">민간인 통제구역</a>
                                    </div>
                                        <h4 style="font-size:15px;">GP 그 이면에 감춰져있던 차마 말하지 못했던 이야기들.
진실은 감출수록 좋다.</h4>
                                    
                                 
                            </div> 
                        </div>
                        <div class="col-lg-6">
                            <div class="single-blog style-five small">
                                <div class="thumb">
                                  <a href="/toon/endEpList?toonNum=93">
                                    <img width=262px height=212px src="../../images/indeximage/dorong.jpg" alt="">
                                    </a>
                                </div>
                              
                                    <div class="meta-top d-flex"><br>
                                        <a style="font-size:20px;" href="/toon/endEpList?toonNum=93">도롱이</a>
                                    </div>
                                         <h4 style="font-size:15px;">유일무이 이무기 백정 집에서 태어난 권삼복!
처음으로 자연산 이무기와 마주하게 된다.</h4>
                                    
                                   
                            </div> 
                            
                        </div>          
                    </div>               
                </div> 
            </div>
        </div>
        
        	<div class="end">
		<c:set var="i" value="0" /> <c:set var="j" value="3" />			
			<ul>
				<c:forEach items="${end}" var="end" >
					<li style="float: left; margin: 30px;"><a href="/toon/endEpList?toonNum=${end.toonNum}">
					<img width=130px height=130px src=${end.titleImg}></a><br><br><h3>${end.toonTitle}</h3></li>
				</c:forEach>
			</ul>
	</div>
        
        
        
    </div>
	
	
</body>
</html>