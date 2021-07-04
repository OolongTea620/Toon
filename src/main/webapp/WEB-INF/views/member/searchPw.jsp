<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <c:import url="../fragments/bootstrap.jsp"></c:import>
    <title>search pw</title>
   
   	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
   	 <c:import url="../fragments/bootstrap.jsp"></c:import>
     <link rel="stylesheet" href="/css/header.css">
     <link rel="stylesheet" href="/css/loginsearchpw.css">
     
	
</head>
<body>
<form id="frm" action="./searchPw"  method="post">
    <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                    
                </div>
                <h1>Do you want to reset your password?</h1>
                <p>In computer security, logging in is the process by which an individual gains access to a computer system by identifying and authenticating themselves.</p>
            </div>
            <div class="login-form-left-side">
                <div class="login-top-wrap">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
  					<path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
					</svg></a>
                    <span>Do you want to find your ID?</span>
                    <button class="create-account-btn shadow-light"><a href="/member/searchId">Forgot ID?</a></button>
                </div>
                <div class="login-input-container">
                    <div class="login-input-wrap input-id">
                        <i class="far fa-envelope"></i>
                        <input placeholder="Username" type="text" id="username" name="username" aria-describedby="idlHelp" maxlength="13">
                        <small id="idlHelp"	class="form-text text-muted">
							회원의 아이디를 숫자와 영어로 정확하게 입력하세요.
						</small>
                    </div>
                    <div class="login-input-wrap input-password">
                        <i class="fas fa-phone"></i>
                        <input placeholder="Phone Number" type="text" id="phone" name="phone" type="tell" onKeyup="inputPhoneNumber(this);" onkeypress='handlerNum();' maxlength="13">
                    </div>
                     <small id="idlHelp" class="form-text text-muted">
							회원의 휴대폰 번호를 숫자로 정확하게 입력하세요.
					</small>
					<div class="form-group" id= phoneResult></div>
                    
                </div>
                <div class="login-btn-wrap">
                    <input type="button" id="btn" value="Reset password" class="btn btn-primary" >
                    <a href="/member/memberJoinCheck">Sign Up</a>
                </div>
            </div>
        </div>
    </div>
</form>

	<script type="text/javascript">
	
	let phone = document.getElementById("phone");
	let phoneCheckResult = false;
	let	username = document.getElementById("username");	
	
	function inputPhoneNumber(obj) {
		
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";
	    
	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	        
	    }

	    obj.value = phone;
	}
	
	$( "#phone").on("blur keyup", function() {
		$(phone).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
	});
	
	function  handlerNum(){
		 E = window.event;
		 if(E.keyCode >47 && E.keyCode <58){   
		  if(E.keyCode == 48){
		   if(document.eduReg.ATTENDANT.value == "" ) E.returnValue=false;
		   else return;
		   }else return;
		 }else{
		  E.returnValue=false;
		 }
		}
	
	phone.addEventListener("blur", function(){
		let message  = "폰 번호는 숫자만 입력가능합니다.";
		let c = "r3";
		
		let phone = $("#phone").val();
		let phoneTrim = $.trim(phone);
		
		if(phoneTrim.length==13){
			message = "올바르게 입력되었습니다.";
			c = "r2";
			phoneCheckResult=true;
		} else {
			message = "010-0000-0000 형식으로 작성하세요";
			c = "r1";
			phoneCheckResult = false;
		}
		
		let phoneResult = document.getElementById("phoneResult");
		phoneResult.innerHTML=message;
		phoneResult.setAttribute("class", c);
		
	});
	

	$("#username").keyup(function(event){

		if (!(event.keyCode >=37 && event.keyCode<=40)) {

		var inputVal = $(this).val();

		$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));

		}

	});
	
	
		$("#btn").click(function() {

			var username = $("#username").val();
			var phone = $("#phone").val();
			if (phone == "" || username == "") {
				swal("정보를 입력해주시기 바랍니다.", "You clicked the button!", "warning");
			} else {
				$.ajax({
					type : 'POST',
					url : 'searchPw',
					data : {
						phone : phone, //주는사람
						username : username,
					},

					dataType : 'text',
					success : function(data) {
						msg = data;
						swal(msg);
						message = $("message").val("principal.password");
					}

				})
			}

		})
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    
</body>
</html>