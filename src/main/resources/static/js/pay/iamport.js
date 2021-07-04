/*
 * var : 변수 재선언 가능/변수 재할당 가능/
 * let : 변수 재선언 불가/변수 재할당 가능/
 * const 변수 재선언 불가/변수 재선언 가능/
 
 *controller에 보낼 임의의 form 데이터 */
let curpoint = parseInt(document.getElementById("cur-point").value,10);
let chargePoint = parseInt(document.querySelector('input[name="point"]:checked').value,10);
var totalPoint = curpoint + chargePoint;
document.getElementById("total-point").innerText = totalPoint + ' P';

let orderName = document.getElementById("user-name").value;
let orderEmail = document.getElementById("user-email").value;
let orderPhone = document.getElementById("user-phone").value;

//radio 버튼 체크 여부 가져오기 
$("input[name='point']").click(function(){
	chargePoint = parseInt(document.querySelector('input[name="point"]:checked').value,10);
	var totalPoint = curpoint + chargePoint;
	document.getElementById("total-point").innerText = totalPoint + ' P';
});
	

//agree-charge시 버튼 활성화 하기
$("#agree-charge").click(function(){
	let agreechk=$("#agree-charge").prop("checked");
	
    if(agreechk){ 
        $("#start-charge").prop("disabled",false);
    }
    else{
        $("#start-charge").prop("disabled",true);
    }
});
/*iamport 실행하기 ajax 재전송*/
$("#start-charge").click(function () {
	//폼 정보 가져오기 (hidden 요소로 감춰 두기)
	//필요한 정보 : 충전 원하는 포인트 ,  email, name , phone, 
	var chargePoint = document.querySelector('input[name="point"]:checked').value;
	chargePoint = parseInt(chargePoint); //int로 변환
	
	
	var IMP = window.IMP;
	IMP.init('imp51768187');
	IMP.request_pay({
	pg: 'html5_inicis', 
	
	pay_method: 'card',
	
	merchant_uid:'merchant_' + new Date().getTime(),
	
	name: 'HSTOON:ToonPoint', //결제창에서 보여질 이름
	amount: chargePoint, //가격, 충전 할 금액 
	buyer_email: orderEmail,
	buyer_name: orderName,
	buyer_tel: orderPhone,
	buyer_addr: 'memberAddress',
	buyer_postcode: '07930',
	m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	
	}, function (rsp) {
		if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	       // msg += '고유ID : ' + rsp.imp_uid;
	       // msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	       // msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        var contents = '포인트 충전 :' + rsp.paid_amount + 'P';
	        var send = { username: orderName, point: rsp.paid_amount, contents : contents }
	       
	        $.ajax({
	        	type : 'POST',
	        	data : JSON.stringify(send),
	        	contentType: 'application/json',
	      		dataType : 'text',
	        	url : 'point/getPoint',/* POST 요청하기*/
	        	success : function(res) {
			        alert("포인트 적립 완료");
					window.location.href="/member/myPage";
				}, 
				error: function(request, status, error) {
					alert("전송실패");
				}
				}).done(function(data) {
		        	console.log(data);
		        	});
		}
		else {
			var msg = '결제에 실패하였습니다.';
			msg += '사유 : ' + rsp.error_msg;
		}
		alert(msg);
	});
});	