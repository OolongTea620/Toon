
let defaultStr = 0; //기본 소장권 갯수
let curpoint = $('#cur-point').val();
let ticketstock = $('#ticket-stock').val();

//만화 관련 정보
let tNum= $('#toon-num').val();//toonNum 읽기
let usernamep = $('#user-name').val(); //username
let toonTitle = $('#toon-Title').val();
 
var checkresult; //useTicket Check 뒤 받는 것 : 0 or 1이다
var url = ""; // 문자열 받기

let eachEpNump;
let epNump;


//유효성 검사
//빈 단어 검사
function isEmpty(str){
	if(typeof str == "undefined" || str == null || str == ""){
		 return true;
	}else{
		 return false ;
	}
           
}
//빈 곳에 값 넣기
function nvl(str, defaultStr){
         
        if(typeof str == "undefined" || str == null || str == "")
            str = defaultStr ;
         
        return str ;
}

function checkpoint(text){
	if(isEmpty(text)){
		text =nvl(text, defaultStr);
		//alert("text : "+ text);
		return text;
	}else{
		//alert("text : "+ text);
		return text;
	}
}
//포인트, 소장권 확인하기 
ticketstock = parseInt(checkpoint(ticketstock),10);
curpoint = parseInt(checkpoint(curpoint),10);
$('#ticket-stock').val(ticketstock);
//alert($('#ticket-stock').val());
// 변수형 검사하기 -> 둘 다 number
//alert("curpoint : " + curpoint + " typeOf point :" + typeof curpoint + 
//"/ stock : "+ticketstock +res + typeof ticketstock);


function countCheck(sort,standnum){
	
	var isTrue;
	if(sort < standnum){
		isTrue = false;
	}else{
		isTrue = true;
	}
	return !!(isTrue);
}

//포인트(200이상) + 소장권 갯수(1 이상) 검사 ,boolean 
let pCheck = countCheck(curpoint,200);
let stCheck = countCheck(ticketstock,1);


function gotolocation(path){
	//window.location.href="/point/charge";
	location.href=path;
}

//함수 가동 prg
function executeFunction(func){
	return func();
}

function comfFunction(text,func){
	if (confirm(text)) {
		 // 포인트 차감 + 소장권 1 구매
		executeFunction(func);
    }else {
    	alert("아니오선택");
    }
}

/*ajax function*/


//티켓 1개 차감 및 소장권 입력 ep이동 ajax
function getTicketAjax(){
	epNum = "";
	var send = { username: usernamep, epNum: epNump , toonNum: tNum , eachEpNum: eachEpNump};
	$.ajax({
		type : 'POST',
		data : JSON.stringify(send),
		async: false,
		contentType: 'application/json',
		dataType : 'text',
		url : '/point/getNuseTicket', //요청 할 내용
		success: function(res){
			url = "";
			url = res; //결과 할당
			//alert("소장권을 차감합니다");
			gotolocation(url);
			//window.location.href= url;
		},
		error : function(request, status, error){
			var tempPage = "toon/endEpList?toonNum="+tNum;
			url = tempPage;
		}
	}).done(function(url){
	});
}

//포인트 차감 및 티켓 구입하기 
function usePointtoGetTicket(){
	var cont = "소장권 구매"+toonTitle+"1개";
	var send = { username: usernamep, toonNum: tNum , contents :cont};
	$.ajax({
		type : 'POST',
		data : JSON.stringify(send),
		async: false,
		contentType: 'application/json',
		dataType : 'text',
		url : '/point/directGetTicket', //요청 할 내용
		success: function(res){
			url = "";
			url = res; //결과 할당
			
			if(url != '0'){
				//alert("ajax 통신 성공");
				//alert(url);
				//alert("소장권 구입 성공");
				var text ="소장권을 구입했습니다\n바로 열람하시겠습니까?";
				comfFunction(text,getTicketAjax);
			}
		},
		error : function(request, status, error){
			//alert("ajax통신 실패");
			var tempPage = "endEpList?toonNum="+tNum;
			alert("구매에 실패했습니다\n관리자에게 문의바랍니다.");
			url = tempPage;
			gotolocation(url);
		}
	}).done(function(url){
		
	});
}


//티켓 소장 여부 체크 
function checkUseTicket(epNump,eachEpNump){
	
	//보낼 데이터 : username , epNum ,toonNum
	var send = { username: usernamep, toonNum : tNum, epNum: epNump, eachEpNum : eachEpNump};
	$.ajax({
		type : 'POST',
		data : JSON.stringify(send),
		async: false,
		contentType: 'application/json',
		dataType : 'text',
		url : '/point/checkTicket', //요청 할 내용
		success: function(res){
			//alert("ajax 통신 성공");
			result = res; //결과 할당
			
		},
		error : function(request, status, error){
			//alert("ajax통신 실패");
			alert("구입에 실패했습니다");
		}
	}).done(function(result){
		//alert(result);
		if(result == '0'){
			alert("열람이력이 없습니다");
			if(stCheck){ //소장권 충분
				var text ="소장권을 사용하시겠습니까?";
				comfFunction(text,getTicketAjax);
			}else{ //소장권 안충분
				if(pCheck){
					var text = "포인트로 구입할수 있습니다\n 소장권을 하나 구입할까요?";
					comfFunction(text,usePointtoGetTicket);
				}else{
					if (confirm("포인트가 부족합니다 \n충전 페이지로 이동합니다")) {
						 window.location.href = "point/charge";
    				}else { 
 					}
				}
			}	
		}else{
			alert("소장권이 있습니다 페이지를 이동합니다");
			url = result;
			//alert(url);
			gotolocation(url);
		}
	}); 
}/*end*/


function clickATag(epNump1,eachEpNump1){
	//alert("함수실행");
	//alert(epNump1 + ':::'+eachEpNump1);
	//전역변수 할당
	epNump = epNump1;
	eachEpNump=eachEpNump1;
	//alert(epNump+":::"+eachEpNump);
	if(isEmpty(usernamep)){
		var text = "소장권을 구입하거나 사용할려면 \n 로그인이 필요합니다";
		if (confirm(text)) {
			//alert("예 선택"); // 로그인 페이지로 이동하기
			var path ="/member/login";
			gotolocation(path);
    	}else { // 현재 페이지 유지
    		
    	}
	}else{
		checkUseTicket(epNump,eachEpNump);
	}
}

/*end ajax function*/
//checkUseTicket();
/*end ajax function*/
/*ajax 통신자체는 비동기라서 통신 뒤 무언가를 하고 싶다면 collback 함수에서 실행된다*/ 
//선택한 영역의 div 이벤트 걸기 받을 것 선택한 영역의 : toonNum , eachepNum 받기  