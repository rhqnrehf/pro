<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="p3p" content="CP=&quot;CAO DSP AND SO&quot; policyref=&quot;/w3c/p3p.xml&quot;">
<script type="text/javascript">
function resize(){
	resizeTo(616,270);
}
window.onresize=resize; //resize 함수를 가르킴
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Mall Admin : ♣ SPAO Mall ♣</title>
<link rel="stylesheet" href="/Project_Spao/admin/common/css/admin_general.css?v=200912161200" type="text/css">
<style type="text/css">
@media print {
	.no_print {display:none;}
}
</style>

</head>
<body class="popupbg">
<input type="hidden" id="id" value="${param.id}">
<div id="popupbodyContainer">
<div class="maintitle">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tbody><tr>
			<td class="title">&nbsp;</td>
			<td align="right" class="no_print">
				<a href="#" id="popup_close"><img src="/Project_Spao/admin/images/button/btn_popupClose.gif"></a>
			</td>
		</tr>
	</tbody></table>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tbody><tr height="15">
		<td width="10" valign="top"><img src="/Project_Spao/admin/images/common/popup_corner_LeftTop.gif" class="imgAT"></td>
		<td class="bgbodyTop"><img src="/Project_Spao/admin/images/common/popup_corner_MiddleTop.gif" class="imgAT"></td>
		<td width="10" valign="top"><img src="/Project_Spao/admin/images/common/popup_corner_RightTop.gif" class="imgAT"></td>
	</tr>
	<tr>
		<td class="bgbodyleft"></td>
		<td class="bgbodymiddle">


<div class="wintitle"><img src="/Project_Spao/admin/images/common/bul_title_popup.gif">  회원 비밀번호 변경</div>

<form name="form_user" method="post" autocomplete="off">

<strong>※ 회원 본인이 비밀번호를 문의하시는 경우 비밀번호를 자동으로 생성할 수 있습니다.</strong><br>
(정보통신부 개인정보 보호 권고사항에 따라 임시 비밀번호를 자동생성하시는 것을 권장해 드립니다.)
			   
<!--비밀번호자동생성버튼-->
<div class="alignCenter">
	<a href="#" id="submit1"><img src="/Project_Spao/admin/images/user/btn_pwdAutoAdd.gif"></a>
</div>

</form>

		</td>
		<td class="bgbodyright"></td>
	</tr>
	<tr>
		<td><img src="/Project_Spao/admin/images/common/popup_corner_LeftBottom.gif" class="imgAB"></td>
		<td class="bgbodyBottom"><img src="/Project_Spao/admin/images/common/popup_corner_MiddleBottom.gif" class="imgAB"></td>
		<td><img src="/Project_Spao/admin/images/common/popup_corner_RightBottom.gif" class="imgAB"></td>
	</tr>
</tbody></table>
</div>
<div style="display:none;"><!--
---------------------------
 START 2018-11-20 20:52:23
 INIT            : 0.01369
 EXEC            : 0.01195
 LAYOUT          : 0.00043
 END             : 0.00111
---------------------------
 TOTAL           : 0.02718
---------------------------
--></div>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit1").click(function(){
		if (confirm("비밀번호를 변경하시겠습니까?") == true){    //확인
			$("#submit1").off();
			  $.ajax({
			      url:'changePwd.do', // 요청 할 주소
			      async:true,// false 일 경우 동기 요청으로 변경
			      type:'POST', // GET, PUT
			      data: {
			          id:$("#id").val()
			      },// 전송할 데이터
			      dataType:'html',// xml, json, script, html
			      success:function(jqXHR) {
			    	  $("body").html(jqXHR);
			      },// 요청 완료 시
			      error:function(jqXHR) {
			    	  alert("알수없는에러\n"+jqXHR);
			    	  window.close();
			      }// 요청 실패
			  }); //ajax
		}else{   //취소
			
		}

	});
	$("#popup_close").click(function(){
		window.close();
	});

});
</script>
</body></html>