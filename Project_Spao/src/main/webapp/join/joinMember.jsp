<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="No-Cache"> 
<title>SPAO OneClick</title>

<link rel="stylesheet" href="../css/oneclick.css">
<link rel="stylesheet" href="../css/jquery-confirm.css">
<!-- <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script> -->
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<!-- <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<!-- <script type="text/javascript" src="/js/jquery.xdomainrequest.js"></script> -->
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->

<script src="../js/common.js"></script><!-- 공통 스크립트 -->
<script src="../js/jquery.modalLayer.js"></script><!-- 모달팝업 -->
<script src="../js/placeholder.js"></script><!-- 공통 스크립트 -->
<script src="../js/jquery-confirm.js"></script><!-- confirm -->

</head>

<body>
	    <div id="wrapper">


	        

<div id="header">
	<div class="topHead">

		<h1>SPAO RETAIL OneClick</h1>
		<!-- div class="gnb">
			<ul class="gnbList">
				<li id="li_introduction"><a href="/introduction/intro">이랜드리테일 원클릭 소개</a></li>
				<li id="li_terms"><a href="/terms/memberShipClubTerms">약관</a></li>
				<li id="li_member"><a href="/member/updateMember">회원정보</a></li>
				<li id="li_cs"><a href="/cs/noticeList">고객센터</a></li>
			</ul>
		</div --><!-- gnb -->
	</div><!-- // topHead -->
</div><!-- // header -->


	        <div id="container">
				<div class="lineMap">
					<!-- div class="path" id="header_path">
						<a href="/"><span class="home">HOME</span></a>
					</div -->
				</div><!-- // lineMap -->
	
				<div class="contentWrap">
					<!-- tiles:insertAttribute name="left" / -->

					



 
<script type="text/javascript">
var submitCnt = 0;
var siteCode = "10";
var invalidAccess = false;
var checkUnload = true;
$(document).ready(function () {
	
	if (invalidAccess) {
		alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
		location.replace("/");
	}
	
	
	
	$('.open_modal').modalLayer();
	customRadio();
	
	// Path 및 LeftTitle 설정
	$("#li_member > a").addClass("current");
	$("#li_joinMember > a").addClass("current");
	var strHtml = "<a href='/member/updateMember'><span>회원정보</span></a><span class='current'>회원가입</span>";
	$("#header_path").append(strHtml);
	$("#leftTitle").text("회원가입");
	
	// 연월일 생성
	setSelectBox("","","");
	
	// 본인인증 휴대폰 번호 세팅
	var phoneNumber = "";
	if (phoneNumber != "") {
		var num1 = phoneNumber.substring(0,3);
		var num2 = phoneNumber.substring(3,7);
		var num3 = phoneNumber.substring(7,11);
		
		$("#label_mobile").text(num1);
		$("#mobile").val(num1);
		$("#phoneNumber2").val(num2);
		$("#phoneNumber3").val(num3);
	}
	
	
	$("#webId").blur(function() {
		$("#td_webId > em").remove();
	});
	// 비밀번호 입력시 웹아이디 validation 메세지 삭제 (유효한 아이디 입니다 일경우만)
	$("#password").focusin(function() {
		if ($("#td_webId > em").hasClass("valid")) {
			$("#td_webId > em").remove();
		}
	});
	
	// 패스워드 유효성 검사
	$("#password").blur(function() {
		if ($("#password").val() != "") {
			$("#em_pwdValidMsg").html("");
			var pwdCheck = validatePassword($("#password").val(), $("#webId").val());
			if (!pwdCheck) {
				$("#hidPwdCheck").val(pwdCheck);
				$("#password").val("");
				$("#confirmPassword").val("");
			}
		}
	});
	
	// 패스워드 재입력 유효성 검사
	$("#confirmPassword").blur(function() {
		if ($("#confirmPassword").val() != "") {
			if ($("#password").val() != $("#confirmPassword").val()) {
				var strHtml = "<em class='fail'>비밀번호가 같지 않습니다.</em>";
				$("#em_pwdValidMsg2").html("");
		 		$("#em_pwdValidMsg2").append(strHtml);
		 		$("#hidPwdCheck").val(false);
		 		$("#confirmPassword").val("");
			} else {
				$("#em_pwdValidMsg2").html("");
				$("#hidPwdCheck").val(true);
			}		
		} 
	});
	
	// 휴대폰 번호 유효성 검사
	$("#phoneNumber2").blur(function() {
		if ($("#phoneNumber2").val() != "") {
			if ("010" == $("#mobile").val()) {
				if ($("#phoneNumber2").val().length < 4) {
					strHtml = "<em class='fail'>핸드폰 번호 자리수가 부족합니다.</em>";
					$("#td_phone > em").remove();
					$("#td_phone").append(strHtml);
					$("#phoneNumber2").focus();
					return;
				}
			} else {
				if ($("#phoneNumber2").val().length < 3) {
					strHtml = "<em class='fail'>핸드폰 번호 자리수가 부족합니다.</em>";
					$("#td_phone > em").remove();
					$("#td_phone").append(strHtml);
					$("#phoneNumber2").focus();
					return;
				}
			}
			$("#td_phone > em").remove();
		} 
	});
	
	// 휴대폰 번호 유효성 검사
	$("#phoneNumber3").blur(function() {
		if ($("#phoneNumber3").val() != "") {
			if ($("#phoneNumber3").val().length < 4) {
				strHtml = "<em class='fail'>핸드폰 번호 자리수가 부족합니다.</em>";
				$("#td_phone > em").remove();
				$("#td_phone").append(strHtml);
				$("#phoneNumber3").focus();
				return;
			}
		}
		$("#td_phone > em").remove();
	});
	
	
	$("#input_email1").blur(function() {
		if ($("#input_email1").val() == "") {
			strHtml = "<em class='fail'>이메일을 입력해 주세요.</em>";
			$("#td_email > em").remove();
			$("#td_email").append(strHtml);
// 			$("#input_email1").focus();
			return;
		}
		$("#td_email > em").remove();
	});
	
	
	
	$("#input_email2").blur(function() {
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if ($("#input_email1").val() != "" && $("#input_email2").val() != "") {
			if(!reg_email.test($("#input_email1").val() +"@"+ $("#input_email2").val()))
			{
				strHtml = "<em class='fail'>잘못된 이메일 형식입니다.</em>";
				
				$("#td_email > em").remove();
				$("#td_email").append(strHtml);
// 				$("#input_email2").focus();
				return;
			}
			$("#td_email > em").remove();
		}
	});


    $('input[type="text"]').keydown(function() {
        if (event.keyCode === 13) {
            event.preventDefault();
        }
    });
    $('input[type="password"]').keydown(function() {
        if (event.keyCode === 13) {
            event.preventDefault();
        }
    });

});



/**
 *  연월일 생성 및 생년원일 디폴트 처리
 */
function setSelectBox(param1, param2, param3) {
	// 생년월일 slectBox 설정
	var toDay = new Date();
	var year  = toDay.getFullYear();
	
	var strYear = "";
	var strMonth = "";
	var strDay = "";
	
	// 년도 설정
	for (var i=year; i>=1900; i--) {
		strYear += "<option value='" + i + "' >" + i + "</option>";
	}
	
	// 월, 일 설정
	for (var i=1; i<=31; i++) {
		var val = "";
		if (i < 10) {
			val = "0" + new String(i);
		} else {
			val = new String(i);
		} 
		
		strDay += "<option value='" + val + "'>" + val + "</option>";
		
		if (i < 13) {
			strMonth += "<option value='" + val + "'>" + val + "</option>";	
		}
	}
	
	if (param1 == "" && param2 == "" && param3 == "") {
		$("#year").append(strYear);
		$("#month").append(strMonth);
		$("#day").append(strDay);
		$("#m_year").append(strYear);
		$("#m_month").append(strMonth);
		$("#m_day").append(strDay);
		
		$("#child_year1").append(strYear);
		$("#child_month1").append(strMonth);
		$("#child_day1").append(strDay);
		
		
		
		// 본인인증으로부터 받은 생년월일 세팅
		var birth = "19990421";
		if (birth != "") {
			$("#year").val(birth.substring(0,4));
			$("#month").val(birth.substring(4,6));
			$("#day").val(birth.substring(6,8));
			$("#label_year").text(birth.substring(0,4));
			$("#label_month").text(birth.substring(4,6));
			$("#label_day").text(birth.substring(6,8));
		} else {
			$("#year").val("1980");
			$("#month").val("01");
			$("#day").val("01");
			$("#label_year").text("1980");
			$("#label_month").text("01");
			$("#label_day").text("01");
		}

	} else {
		$("#"+param1).html(strYear);
		$("#"+param2).html(strMonth);
		$("#"+param3).html(strDay);
	}
}




/**
 * 아이디 중복 체크
 */
 function isCheckId() {
	var inputWebId = $("#webId").val();
	var regType1 = /^[a-z]+[a-z-_0-9]{4,19}$/g;
	
	if (inputWebId == "") {
		var strHtml = "<em class='fail'>아이디를 입력해주세요.</em>";
		// valdation 이전 메세지 삭제
		 $("#td_webId > em").remove();
		// valdation 메세지 삽입
		 $("#td_webId").append(strHtml);
		 $("#hidIdCheck").val("");
		 return;
	}
	
	if (!regType1.test(inputWebId)) { 
		 var strHtml = "<em class='fail'>아이디는 영어소문자로 시작되어야 하며 영어소문자, 숫자, _ (언더바)를 사용하여 5~20자로 구성할 수 있습니다.</em>";
		// valdation 이전 메세지 삭제
		 $("#td_webId > em").remove();
		// valdation 메세지 삽입
		 $("#td_webId").append(strHtml);
		 $("#hidIdCheck").val("");
		 return;
	}
	 
	$.ajax({
		type : "GET",
		url : '../join/isCheckId.do?webId=' + inputWebId,
		async : true,
		cache : false,
		dataType:"json",
		success : function(result) {  
			idCheckResult(result.isCheckId);
		},
		error : function(e) {
			alert(e.responseText);
		}
	});
 }
 
 function idCheckResult(param) {
	 
	 // 중복된 아이디
	 var strHtml = "";
	 

	 
	 if (param) {  //true가 오면 중복
		 strHtml = "<em class='fail'>이미 사용중인 아이디입니다.</em>";
		 $("#hidIdCheck").val(false);
	 } else {
		 strHtml = "<em class='valid'>사용 가능한 아이디입니다.</em>";
		 $("#hidIdCheck").val(true);
	 }
	 // valdation 이전 메세지 삭제
	 $("#td_webId > em").remove();
	// valdation 메세지 삽입
	 $("#td_webId").append(strHtml);
 }
 
 /**
  * 입력폼 validation
  */
 function validationCheck() {  //다음 클릭시(회원가입 다음)
	 var strHtml = "";
	 
	 //아이디 중복체크 한번 더 한다
	 
	 
	 if($("#webName").val().length<2){
	 		strHtml="<em class='fail'>이름을 전부 입력하세요.</em>";
	 		$("#td_webName > em").remove();
			 $("#td_webName").append(strHtml);
			 $("#webName").focus();
			 return;
	 }else{
		 $("#td_webName > em").remove();
		 isCheckId();
	 }
	 
	 if($("#hidIdCheck").val().trim() == "false"){
		 strHtml = "<em class='fail'>이미 사용중인 아이디입니다.</em>";
		 $("#td_webId > em").remove();
		// valdation 메세지 삽입
		 $("#td_webId").append(strHtml);
		 $("#webId").focus();
		 $("#hidIdCheck").val("");
		 return;
	 };

	if ($("#webId").val().trim() == "") {
		strHtml = "<em class='fail'>아이디를 입력해 주세요.</em>";
		$("#td_webId").append(strHtml);
		$("#webId").focus();
		return;
	}
	if ($("#hidIdCheck").val().trim() == "") {
		strHtml = "<em class='fail'>아이디 중복 체크를 해주세요.</em>";
		$("#td_webId").append(strHtml);
		$("#webId").focus();
		return;
	}

	if (!validatePassword($("#password").val(), $("#webId").val())) {
		return;
	}
	
	if ($("#password").val().trim() == "") {
		strHtml = "<em class='fail'>비밀번호를 입력해 주세요.</em>";
		$("#em_pwdValidMsg").html("");
		$("#em_pwdValidMsg").append(strHtml);
		$("#password").focus();
		return;
	}
	if ($("#hidPwdCheck").val().trim() == "" || !$("#hidPwdCheck").val().trim()) {
		strHtml = "<em class='fail'>비밀번호를 입력해 주세요.</em>";
		$("#em_pwdValidMsg2").html("");
		$("#em_pwdValidMsg2").append(strHtml);
		$("#confirmPassword").focus();
		return;
	}
	
	if ($("#password").val().trim() != $("#confirmPassword").val().trim()) {
		var strHtml = "<em class='fail'>비밀번호가 같지 않습니다.</em>";
		$("#em_pwdValidMsg2").html("");
 		$("#em_pwdValidMsg2").append(strHtml);
 		$("#hidPwdCheck").val(false);
 		$("#confirmPassword").focus();
 		return;
	} 	
	
//	var password = $("#password").val();
	birth.push($("#year option:selected").val(), $("#month option:selected").val()+$("#day option:selected").val());
	phone.push($("#phoneNumber2").val(), $("#phoneNumber3").val());
	
	
	if ($("#year").val() == "") {
		$("#td_birth > em").remove();
		strHtml = "<em class='fail'>생년월일을 입력해 주세요.</em>";
		$("#td_birth").append(strHtml);
		$("#year").focus();
		return;
	}
	
	if ($("#month").val() == "") {
		$("#td_birth > em").remove();
		strHtml = "<em class='fail'>생년월일을 입력해 주세요.</em>";
		$("#td_birth").append(strHtml);
		$("#month").focus();
		return;
	}
	
	if ($("#day").val() == "") {
		$("#td_birth > em").remove();
		strHtml = "<em class='fail'>생년월일을 입력해 주세요.</em>";
		$("#td_birth").append(strHtml);
		$("#day").focus();
		return;
	}
	
	
	if ($("#phoneNumber2").val() == "") {
		strHtml = "<em class='fail'>핸드폰 번호를 입력해 주세요.</em>";
		
		$("#td_phone > em").remove();
		$("#td_phone").append(strHtml);
		$("#phoneNumber2").focus();
		return;
	}
	if ("010" == $("#mobile").val()) {
		if ($("#phoneNumber2").val().length < 4) {
			strHtml = "<em class='fail'>핸드폰 번호 자리수가 부족합니다.</em>";
			$("#td_phone > em").remove();
			$("#td_phone").append(strHtml);
			$("#phoneNumber2").focus();
			return;
		}
	}
	
	if ($("#phoneNumber3").val().length < 4) {
		strHtml = "<em class='fail'>핸드폰 번호 자리수가 부족합니다.</em>";
		$("#td_phone > em").remove();
		$("#td_phone").append(strHtml);
		$("#phoneNumber3").focus();
		return;
	}
	
	if ($("#phoneNumber3").val() == "") {
		strHtml = "<em class='fail'>핸드폰 번호를 입력해 주세요.</em>";
		$("#td_phone > em").remove();
		$("#td_phone").append(strHtml);
		$("#phoneNumber3").focus();
		return;
	}
	
	if ($("#addr").val() == "") {
		strHtml = "<em class='fail'>주소를 입력해 주세요.</em>";
		$("#td_addr > em").remove();
		$("#td_addr").append(strHtml);
		$("#addrDetail").focus();
		return;
	}
	
	if ($("#input_email1").val() == "" && $("#input_email2").val() == "") {
		strHtml = "<em class='fail'>이메일을 입력해 주세요.</em>";
		$("#td_email > em").remove();
		$("#td_email").append(strHtml);
		$("#input_email1").focus();
		return;
	} else {
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(!reg_email.test($("#input_email1").val() +"@"+ $("#input_email2").val()))
		{
			strHtml = "<em class='fail'>잘못된 이메일 형식입니다.</em>";
			
			$("#td_email > em").remove();
			$("#td_email").append(strHtml);
			$("#input_email1").focus();
			return;
		}
	}
	
	// 이메일 Length 체크( 50 Byte )
	if (($("#input_email1").val() +"@"+ $("#input_email2").val()).length > 50) {
		strHtml = "<em class='fail'>이메일은 50자까지 입력 가능합니다.</em>";
		$("#td_email > em").remove();
		$("#td_email").append(strHtml);
		$("#input_email1").focus();
		return;
	}

	
	// 결혼 기념일 validation (기혼이면서 셀렉트박스 선택한 값이 있을때)
	if ($("#wedding").parent("span").hasClass("selected")) {
		var weddingdayCnt = 0;
		
		var selWedYear = $("#m_year").val();
		var selWedMonth = $("#m_month").val();
		var selWedDay = $("#m_day").val();
		if (selWedYear != null && selWedYear != "" && selWedYear != "선택") {
			weddingdayCnt++;
		}
		if (selWedMonth != null && selWedMonth != "" && selWedMonth != "선택") {
				weddingdayCnt++;
		}		
		if (selWedDay != null && selWedDay != "" && selWedDay != "선택") {
			weddingdayCnt++;
		}
		if (weddingdayCnt < 3 && weddingdayCnt > 0) {
			alert("결혼기념일을 확인해주세요");
			if (selWedYear == "선택") {
				$("#m_year").focus();
			} else if (selWedMonth == "선택") {
				$("#m_month").focus();
			} else {
				$("#m_day").focus();
			}
			return;
		} 
	}
	
	setHiddenValue();
	
	// submit
	submitCnt++;
	if (submitCnt == 1) {
		checkUnload = false;
		document.joinForm.submit();
	}
 }  //function 다음클릭시
 
 /**
  * 히든값 설정
  */
  function setHiddenValue() {
	 	$("#hidName").val($("#webName").val());

	 
	 	// 양력, 음력 설정
	 	if ($("input[name=solarLunar]:checked").attr("id") == "solar") {
	 		$("#hidBirthUnar").val("1");  //양력
		} else  {
			$("#hidBirthUnar").val("0");  //음력
		}
 
		// 생년월일 히든값 처리
		$("#hidBirth").val($("#year option:selected").val()+$("#month option:selected").val()+$("#day option:selected").val());
		
		// 핸드폰 번호 히든값 처리
		$("#hidPhone").val($("#mobile option:selected").val() + $("#phoneNumber2").val() + $("#phoneNumber3").val());  
		
		// 이메일 히든값 처리
		$("#hidEmail1").val($("#input_email1").val());
		$("#hidEmail2").val($("#input_email2").val());

		// 결혼 기념일
		if ($("#m_year option:selected").val() != "" && $("#m_month option:selected").val() !="" && $("#m_day option:selected").val() != "") {
			$("#hidWeddingDay").val($("#m_year option:selected").val() + $("#m_month option:selected").val() + $("#m_day option:selected").val());
		}else if($("#hidWeddingYn").val()=="N"){  //결혼안했음 0
			$("#hidWeddingDay").val("0");
		}
		$("#hidAddress1").val($("#addr").val());
		$("#hidAddress2").val($("#addrDetail").val());
		
		alert("이름: "+$("#webName").val());
		alert("아이디: "+$("#webId").val());
		alert("비밀번호: "+$("#password").val());
		alert("생년월일: "+$("#hidBirth").val());
		alert("생년월일 양력 음력: "+$("#hidBirthUnar").val());
		alert("폰번호: "+$("#hidPhone").val());
		alert("주소1: "+$("#hidAddress1").val());
		alert("상세주소: "+$("#hidAddress2").val());
		alert("이메일: "+$("#hidEmail1").val());
		alert("이메일2: "+$("#hidEmail2").val());
		alert("결혼유무: "+$("#hidWeddingYn").val());
		alert("결혼기념일: "+$("#hidWeddingDay").val());

 };		


 /**
  * 주소 찾기 팝업 띄우기
  */
 function searchAddr() {
	 checkUnload = false;
	 openCommonPopup("../join/searchAddr.do", "", "560", "700", "주소찾기");
	 
 }

 
 
 /**
  * 이메일 주소 셀렉트 박스
  */
  function selectEmail(option) {
	 if (option.value != "") {
		 $("#input_email2").val(option.value);
		 $("#input_email2").addClass("disabled");
		 $("#input_email2").attr("disabled", true);
	 } else {
		 $("#input_email2").val("");
		 $("#input_email2").removeClass("disabled");
		 $("#input_email2").attr("disabled", false);
	 }
 }

 /**
  * 전화번호만 입력
  */
  function showKeyCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 9 || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
		{
			return;
		}
		else
		{
			return false;
		}
	}
 
 /**
  * 결혼 유무에 따라 결혼 기념일, 자녀수 노출
  */
 function isWeddingCheck(args) {
	 if ("single" == args) {
		$("#hidWeddingYn").val("N");
		$("#wedding_anniversary").hide();
	 } else {
		$("#hidWeddingYn").val("Y");
		$("#wedding_anniversary").show();

//		if ($("#corePartnerShip").parent("span").hasClass("selected")) {
//			$("#children_number").show();
//		}
		$("#children_number").hide();
	 }
	 
 }
 
 /**
  * 가입 취소
  */
  function cancelJoin() {
	 alert("회원가입을 취소하시겠습니까?");
	 location.href = "/";
 }

 
 $(window).load(function () {
	if("10" == siteCode) {
		$("#coreEmail").parent().addClass("disabled");
		$("#coreSms").parent().addClass("disabled");

		$("#epointEmail").parent().addClass("disabled");
		$("#epointSms").parent().addClass("disabled");
		$("#eatEmail").parent().addClass("disabled");
		$("#eatSms").parent().addClass("disabled");
		$("#elisEmail").parent().addClass("disabled");
		$("#elisSms").parent().addClass("disabled");
		$("#folderEmail").parent().addClass("disabled");
		$("#folderSms").parent().addClass("disabled");
	} else if ("20" == siteCode) {
		$("#retailMallEmail").parent().addClass("disabled");
		$("#retailMallSms").parent().addClass("disabled");
		 
		$("#epointEmail").parent().addClass("disabled");
		$("#epointSms").parent().addClass("disabled");
		$("#eatEmail").parent().addClass("disabled");
		$("#eatSms").parent().addClass("disabled");
		$("#elisEmail").parent().addClass("disabled");
		$("#elisSms").parent().addClass("disabled");
		$("#folderEmail").parent().addClass("disabled");
		$("#folderSms").parent().addClass("disabled");
	} else if ("60" == siteCode) {
		$("#retailMallEmail").parent().addClass("disabled");
		$("#retailMallSms").parent().addClass("disabled");
		$("#coreEmail").parent().addClass("disabled");
		$("#coreSms").parent().addClass("disabled");
		$("#eatEmail").parent().addClass("disabled");
		$("#eatSms").parent().addClass("disabled");
		$("#elisEmail").parent().addClass("disabled");
		$("#elisSms").parent().addClass("disabled");
		$("#folderEmail").parent().addClass("disabled");
		$("#folderSms").parent().addClass("disabled");
	} else if ("70" == siteCode) {
		$("#retailMallEmail").parent().addClass("disabled");
		$("#retailMallSms").parent().addClass("disabled");
		$("#coreEmail").parent().addClass("disabled");
		$("#coreSms").parent().addClass("disabled");
		$("#epointEmail").parent().addClass("disabled");
		$("#epointSms").parent().addClass("disabled");
		$("#elisEmail").parent().addClass("disabled");
		$("#elisSms").parent().addClass("disabled");
		$("#folderEmail").parent().addClass("disabled");
		$("#folderSms").parent().addClass("disabled");
	} else if ("80" == siteCode) {
		$("#retailMallEmail").parent().addClass("disabled");
		$("#retailMallSms").parent().addClass("disabled");
		$("#coreEmail").parent().addClass("disabled");
		$("#coreSms").parent().addClass("disabled");
		$("#epointEmail").parent().addClass("disabled");
		$("#epointSms").parent().addClass("disabled");
		$("#eatEmail").parent().addClass("disabled");
		$("#eatSms").parent().addClass("disabled");
		$("#folderEmail").parent().addClass("disabled");
		$("#folderSms").parent().addClass("disabled");
	} else if ("90" == siteCode) {
		$("#retailMallEmail").parent().addClass("disabled");
		$("#retailMallSms").parent().addClass("disabled");
		$("#coreEmail").parent().addClass("disabled");
		$("#coreSms").parent().addClass("disabled");
		$("#epointEmail").parent().addClass("disabled");
		$("#epointSms").parent().addClass("disabled");
		$("#eatEmail").parent().addClass("disabled");
		$("#eatSms").parent().addClass("disabled");
		$("#elisEmail").parent().addClass("disabled");
		$("#elisSms").parent().addClass("disabled");
	}

});


	// 영문/숫자 외 몇 문자를 제외한 글자 제거.
	function emailCheckRemove(obj) {
		email_regex = /^[a-zA-Z0-9._-]+$/i; // [영문/숫자]
		var tmp_email = obj.value;
		if (!email_regex.test(tmp_email)) {
			obj.value = tmp_email.replace(/[^a-zA-Z0-9._-]/gi,"");
		}
	}	
	
function goToMainPage() {
	checkUnload = false;
	location.href = "/member/sessionInvalidate?pageType=join";
} 

function getStoreCode(option) {
	var regionNm = option.value;

	$("#label_store").text("지점");
	$("#storeCodeList").html("");

	if (regionNm == null || regionNm == "") {
		$("#label_store").text("지점");
		$("#storeCodeList").html("");
		return;
	}

	// 지점찾기
	searchStoreCodeNm("", regionNm);
}

function getStoreCodeCallBack(result) {
	var obj = JSON.parse(result);
	var strHtml = "";
	 
	if (obj.arrStoreList.length > 0) {
		for (var i=0; i<obj.arrStoreList.length; i++) {
			strHtml += "<option value='"+obj.arrStoreList[i].STORE_CODE+"'>"+obj.arrStoreList[i].STORE_NAME+"</option>";
		}
	
		$("#storeCodeList").html("");
		$("#storeCodeList").append(strHtml);

		$("#label_store").text(obj.arrStoreList[0].STORE_NAME);
		$("#storeCodeList").val(obj.arrStoreList[0].STORE_CODE).attr("selected", true);

	}

}

</script>


<script>
    $(window).on("beforeunload", function(event){
        if(checkUnload && !invalidAccess) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
    });
</script>




<div class="content">
	
		
			<h3><span class="en">SPAO MALL</span> 회원가입</h3>
		
		
		
		
		
		
		
	
	<div class="stepBox">
		<ol>
			<li class="on"><span>STEP 01</span>정보입력</li>
			<li><span>STEP 02</span>가입완료</li>
		</ol>
	</div><!-- // stepBox -->
	
	<!-- 기본정보 -->
	<form action="../join/joinMemberSuccess.do" name="joinForm" id="joinForm" method="POST">
	<input type="hidden" name="" value="">
	<div class="fieldDiv mt30">
		<fieldset>
			<legend class="tit_bl">기본정보</legend>
			<p class="guide">(<span class="ns">*</span>)표시는 필수입력항목입니다.</p>
			<div class="fieldTable mt10">
				<table cellspacing="0" summary="이름, 회원아이디, 비밀번호, 비밀번호재입력, 생년월일, 핸드폰번호, 주소, 이메일">
					<!-- 2016-02-19 수정 -->
						<colgroup>
							<col class="col180">
							<col class="col590">
						</colgroup>
					<!-- // 2016-02-19 수정 -->

						<tbody>
							<tr>
								<th scope="row"><div class="tit">이름 <span class="ns" title="필수입력">*</span></div></th>
								<td id="td_webName"><input type="text" id="webName" name="webName" class="input_text w390" title="이름 입력" isplaceholderinited="true"></td>
							</tr>
							<tr>
								<th scope="row"><div class="tit">회원아이디 <span class="ns" title="필수입력">*</span></div></th>
								<td id="td_webId">
									<input type="text" id="webId" name="webId" class="input_text w390" title="아이디 입력" isplaceholderinited="true">
									<button type="button" class="btn grey" onclick="javascript:isCheckId()"><span>아이디 중복체크</span></button>
								</td>
							</tr>
							<tr>
								<th scope="row"><div class="tit">비밀번호 <span class="ns" title="필수입력">*</span></div></th>
								<td>
									<input type="password" id="password" name="password" class="input_text w390" title="비밀번호 입력" isplaceholderinited="true">
									<div id="em_pwdValidMsg"></div>
									<em class="warn">연속적인 숫자나 생일, 전화번호등 추측하기 쉬운 개인정보 및 아이디와 비슷한 전화번호 사용을 피하시기 바랍니다.<br>비밀번호는 영대문자, 영소문자, 숫자, 특수문자 중 3종류 이상을 조합하여, 총 8~16자리로 구성하셔야 합니다.</em>
								</td>
							</tr>
							<tr>
								<th scope="row"><div class="tit">비밀번호재입력 <span class="ns" title="필수입력">*</span></div></th>
								<td id="td_confirmPassword">
									<input type="password" id="confirmPassword" name="confirmPassword" class="input_text w390" title="비밀번호 재입력" isplaceholderinited="true">
									<div id="em_pwdValidMsg2"></div>
								</td>
								
							</tr>
							<tr>
								<th scope="row"><div class="tit">생년월일 <span class="ns" title="필수입력">*</span></div></th>
								<td id="td_birth">
									<div class="selectBox">
										<label for="year" id="label_year">1999</label>
										<select class="select" id="year" onchange="chgYear(this.value);">
											<option value="">선택</option>
										<option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option><option value="1904">1904</option><option value="1903">1903</option><option value="1902">1902</option><option value="1901">1901</option><option value="1900">1900</option></select>
									</div><!-- // selectBox-->
									<span class="br">년</span>
									<div class="selectBox">
										<label for="month" id="label_month">04</label>
										<select class="select" id="month" onchange="chgMonth(this.value, true);">
											<option value="">선택</option>
										<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
									</div><!-- // selectBox-->
									<span class="br">월</span>
									<div class="selectBox">
										<label for="day" id="label_day">21</label>
										<select class="select" id="day" onchange="chgDay(this.value, true);">
											<option value="">선택</option>
										<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
									</div><!-- // selectBox-->
									<span class="br">일</span>
									<div class="birth_select">
										<span class="customRadio selected"><input type="radio" id="solar" name="solarLunar" class="radioBtn" checked=""></span><label for="birth3" class="label_txt m1">양력</label>
										<span class="customRadio"><input type="radio" id="lunar" name="solarLunar" class="radioBtn"></span><label for="birth4" class="label_txt">음력</label>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><div class="tit">핸드폰번호 <span class="ns" title="필수입력">*</span></div></th>
								<td id="td_phone">
									<div class="selectBox">
										<label for="mobile" id="label_mobile">010</label>
										<select class="select" id="mobile" title="핸드폰번호">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
									</div><!-- // selectBox-->
									<span class="br">-</span>
									<input type="text" id="phoneNumber2" name="phoneNumber2" class="input_text w110" maxlength="4" title="중간자리" onkeydown="return showKeyCode(event)" isplaceholderinited="true">
									<span class="br">-</span>
									<input type="text" id="phoneNumber3" name="phoneNumber3" class="input_text w110" maxlength="4" title="뒷자리" onkeydown="return showKeyCode(event)" isplaceholderinited="true">
								</td>
							</tr>
							<tr>
								<th scope="row">
								<div class="tit">주소 <span class="ns" title="필수입력">*</span></div>
								<p><div class="tit">싱세주소 <span class="ns" title="필수입력">*</span></div></p>
								</th>
								<td id="td_addr">
									<input type="text" id="addr" name="addr" class="input_text w390 disabled" disabled="" title="주소" value="" isplaceholderinited="true"><button onclick="javascript:searchAddr(); return false;" class="btn grey"><span>주소찾기</span></button>
									<div class="mt10"><input type="text" id="addrDetail" name="addrDetail" class='input_text w390' title="상세주소" value="" isplaceholderinited="true"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><div class="tit">이메일 <span class="ns" title="필수입력">*</span></div></th>
								<td id="td_email">
									<input type="text" id="input_email1" name="email_id" class="input_text w180" title="이메일주소" style="ime-mode: disabled;" onkeyup="emailCheckRemove(this);" onblur="emailCheckRemove(this);" isplaceholderinited="true">
									<span class="br m1">@</span>
									<input type="text" id="input_email2" name="email_addr" class="input_text w180" style="ime-mode: disabled;" onkeyup="emailCheckRemove(this);" onblur="emailCheckRemove(this);" isplaceholderinited="true">
									<div class="selectBox m2 w140">
										<label for="select-item">직접입력</label>
										<select class="select" id="select-item" onchange="javascript:selectEmail(this);">
											<option value="">직접입력</option>
				                            <option value="naver.com">naver.com</option>
				                            <option value="gmail.com">gmail.com</option>
				                            <option value="icloud.com">icloud.com</option>
				                            <option value="nate.com">nate.com</option>
				                            <option value="hanmail.net">hanmail.net</option>
				                            <option value="hotmail.com">hotmail.com</option>
				                            <option value="yahoo.com">yahoo.com</option>
										</select>
									</div><!-- // selectBox-->
								</td>
							</tr>
							
						</tbody>
				</table>
			</div><!-- // fieldTable-->
		</fieldset>
	</div><!-- // fieldDiv :: 기본정보 -->
	<!-- 부가정보 -->
	<div class="fieldDiv mt30">
	<fieldset>
		<legend class="tit_bl">부가정보</legend>
		<div class="fieldTable mt10">
			<table cellspacing="0" summary="전화번호, 결혼유무, 결혼기념일, 자녀수">
				<!-- 2016-02-19 수정 -->
				<colgroup>
					<col class="col180">
					<col class="col590">
				</colgroup>
				<!-- // 2016-02-19 수정 -->
					<tbody>
						<tr id="tr_isWedding">
							<th scope="row"><div class="tit">결혼유무</div></th><!-- // 2016-02-19 수정 -->
							<td>
								<div class="chk">
									
										<span class="customRadio selected"><input type="radio" id="wedding" name="isWedding" class="radioBtn" checked="" onclick="isWeddingCheck('wedding');"></span>
									
									<label for="wedding" class="label_txt">기혼</label>
									
										<span class="customRadio"><input type="radio" id="single" name="isWedding" class="radioBtn" onclick="isWeddingCheck('single');"></span>
									
									<label for="single" class="label_txt">미혼</label>
								</div>
							</td>
						</tr>
						<tr id="wedding_anniversary">
							<th scope="row"><div class="tit">기념일</div></th><!-- // 2016-02-19 수정 -->
							<td>
								<div class="selectBox">
									<label for="m_year" id="label_m_year">선택</label>
									<select class="select" id="m_year" onchange="chgWedYear(this.value);">
										<option value="">선택</option>
									<option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option><option value="1904">1904</option><option value="1903">1903</option><option value="1902">1902</option><option value="1901">1901</option><option value="1900">1900</option></select>
								</div><!-- // selectBox-->
								<span class="br">년</span>
								<div class="selectBox">
									<label for="m_month" id="label_m_month">선택</label>
									<select class="select" id="m_month" onchange="chgWedMonth(this.value, true);">
										<option value="">선택</option>
									<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
								</div><!-- // selectBox-->
								<span class="br">월</span>
								<div class="selectBox">
									<label for="m_day" id="label_m_day">선택</label>
									<select class="select" id="m_day">
										<option value="">선택</option>
									<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
								</div><!-- // selectBox-->
								<span class="br">일</span>
							</td>
						</tr>
					</tbody>
			</table>
		</div><!-- // fieldTable-->
	</fieldset>
</div>
<!-- // fieldDiv :: 부가정보 -->



<!-- Hidden Value //S -->
<input type="hidden" id="hidIdCheck" name="hidIdCheck">
<input type="hidden" id="hidPwdCheck" name="hidPwdCheck">

<input type="hidden" id="hidName" name="name">      <!-- 이름 -->
<input type="hidden" id="hidBirth" name="birth">   <!-- 생년월일 19990421 -->
<input type="hidden" id="hidBirthUnar" name="birthUnar">  <!-- 양력음력 1이면 양력 // 0이면 음력 -->
<input type="hidden" id="hidPhone" name="phone">   <!-- 폰번호 01094563821 -->

<input type="hidden" id="hidAddress1" name="address1">  <!-- 주소 -->
<input type="hidden" id="hidAddress2" name="address2">  <!-- 상세주소 -->

<input type="hidden" id="hidEmail1" name="email1">   <!-- 이메일 앞  -->
<input type="hidden" id="hidEmail2" name="email2">	<!-- 이메일 뒤 -->
<!-- 부가정보 -->
<input type="hidden" id="hidWeddingYn" name="weddingYn" value="Y"> <!-- 결혼유무 -->
<input type="hidden" id="hidWeddingDay" name="weddingDay">  <!-- 결혼기념일 -->
<!-- Hidden Value //E -->
<!-- 
컨트롤러에서 받아야될 정보 12가지 
아이디와 비밀번호 빼고 전부 히든값으로 가져옴
이름,
아이디,
비밀번호,
생년월일,
생년월일 양력음력 0 // 1,
폰번호,
주소1,
상세주소2,
이메일,
이메일2,
결혼유무 Y // N,
결혼 기념일,
 -->



</form>
	<div class="btnDiv taC mt30">
		<a href="#cancel_join" class="btn white large open_modal"><span>가입취소</span></a>
		<button onclick="javascript:validationCheck(); return false;" class="btn blue large"><span>다음</span></button>
	</div>


	<div class="layerPop modal" id="cancel_join" aria-hidden="true" aria-labelledby="modalTitle2" role="alertdialog" aria-live="polit" style="top: 241px; left: 443px; display: none;">
		<div class="popupBox w420">
			<div class="popContent taC">
				회원가입을 취소하시겠습니까?
			</div><!-- // popContent -->
			<div class="btnDiv taC">
				<button type="button" class="btn white pop closeModalLayer"><span>취소</span></button>
				<button type="button" class="btn blue pop" onclick="javascript:goToMainPage(); return false;"><span>확인</span></button>
			</div>
			<button type="button" class="btn_popClose closeModalLayer"><span class="blind">팝업닫기</span></button>
		</div><!-- // popupBox -->
	</div>
</div>




					
				</div><!-- // contentWrap -->
	
			</div><!-- // container -->

	        <!-- tiles:insertAttribute name="footer" / -->
		</div>
    
</body>
</html>