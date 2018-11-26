<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="p3p" content="CP=&quot;CAO DSP AND SO&quot; policyref=&quot;/w3c/p3p.xml&quot;">
<script type="text/javascript">
function resize(){
	resizeTo(616,450);
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


<div class="wintitle"><img src="/Project_Spao/admin/images/common/bul_title_popup.gif"> 적립금 지급/차감</div>



<div class="AreaW95 pa_l_20">


<div class="subtitle"><img src="/Project_Spao/admin/images/user/bul_subtitle.gif"> 적립금 지급/차감하기</div>


<!--Begin-->      
<form name="dataForm" action="./" method="post" autocomplete="off">
<c:forEach var="str" items="${users}">
	<input type="hidden" name="id" value="${str}"/>  <!-- 유저이름 히든값 -->
</c:forEach>
	<input type="hidden" id="min" value="${min}"/>  <!-- 현재 선택된 유저중 제일 적은 금액을 적립하고있는금액 -->


<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
	<colgroup><col width="120">
	<col width="*">
	</colgroup><tbody><tr><td colspan="2" class="top4"></td></tr>
	<tr>
		<td class="label">대상회원</td>
		<td class="box text">
			<span class="fc_red_b">${userTotal}</span>명<br>
				아이디 : <strong><c:forEach var="str" items="${users}" varStatus="i">
					${str}&nbsp;  <c:if test="${!i.last}">|&nbsp;</c:if>
				</c:forEach> </strong>
		</td>
	</tr>
	<tr>
		<td class="label" width="120">적립금형태</td>
		<td class="box text">
			<input type="radio" name="mile_log_type" value="0" checked="checked"> 지급
			<input type="radio" name="mile_log_type" value="1"> 차감
		</td>
	</tr>
	<tr>
		<td class="label">지급(차감)액</td>
		<td class="box text"><input type="text" id="mile_log_amount" name="mile_log_amount" class="inputbox2" style="widht:200px;">
		&nbsp;<input type="button" id="check_mile" value="금액확정(수정불가)" >
		<div id="checkRe"></div>
		</td>
	</tr>
	<tr>
		<td class="label">사유(내역)</td>
		<td class="box text"><textarea class="textarea" id="mile_log_memo" name="mile_log_memo" style="width:95%;height:55px;"></textarea></td>
	</tr>
</tbody></table>


<div class="alignCenter">
	<a href="#" id="submit1"><img src="/Project_Spao/admin/images/user/btn_ok.gif"></a>
	<a href="#" id="close"><img src="/Project_Spao/admin/images/user/btn_cancel.gif"></a>
</div>                       

</form>
<!--End-->



</div>
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


<!--
---------------------------
 START 2018-11-21 18:16:56
 INIT            : 0.01396
 EXEC            : 0.08664
 LAYOUT          : 0.00044
 END             : 0.00132
---------------------------
 TOTAL           : 0.10236
---------------------------
--></div>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit1").on("click",function(){
		if($("#mile_log_amount").val()==""){
			alert("금액을 써주세요");
		}else if($("#mile_log_memo").val().length<3){
			alert("사유를 제대로 입력해주세요.");
		}else if($("#check_mile").prop("disabled")==false){
			alert("금액을 확정 체크 해주세요.");
		}else{
			if (confirm("위 적립금을 지급하시겠습니까?") == true){    //확인
				var items=[];
				$("input[name=id]").each(function(){
					items.push($(this).val().trim());
				});
				  $.ajax({
				      url:'reserveGive.do', // 요청 할 주소
				      async:true,// false 일 경우 동기 요청으로 변경
				      type:'GET', // GET, PUT
				      data: {
				          users:items,  //유저 목록 
				          onOff:$("input:radio[name=mile_log_type]:checked").val(),  //지급 차감 여부 1 or 0
				          reserve:$("#mile_log_amount").val(), //액수
				          reservelog:$("#mile_log_memo").val() //사유
				      },// 전송할 데이터
				      dataType:'text',// xml, json, script, html
				      success:function(jqXHR) {
						if(jqXHR=="success"){
							alert("적립금을 지급하였습니다.");
						}else if(jqXHR=="fail"){
							alert("적립금을 지급 실패하였습니다. DB문제");
							window.close();
						}
				      },// 요청 완료 시
				      error:function(jqXHR) {
				    	  alert("알수없는에러\n"+jqXHR);
				    	  window.close();
				      }// 요청 실패
				  }); //ajax
			}else{   //취소
				
			}
		}
	});
	
	$("#check_mile").click(function(){
		$("#checkRe").empty();
		if($("input[name=mile_log_type]:checked").val()==1){
			if($("#min").val()-$("#mile_log_amount").val()<0){
				$("#mile_log_amount").val("");
				$("#checkRe").html("회원의 적립금은 -로 갈수없습니다. 다시 입력하세요.").css("color","red");
				$("#mile_log_amount").focus();
			}else{
				$("#check_mile").prop("disabled",true).hide();
			}
		}else{
			$("#check_mile").prop("disabled",true).hide();
		}
	});
	
	$("#popup_close").click(function(){
		window.close();
	});
	
	$("#close").click(function(){
		if(confirm("종료하시겠습니까? 취소를 누르면 내용만 초기화됩니다.")){
			window.close();
		}else{
			$("#check_mile").prop("disabled",false).show();
			$("#mile_log_memo").val("");
			$("#mile_log_amount").val("");
		}
	});

});
</script>
</body></html>