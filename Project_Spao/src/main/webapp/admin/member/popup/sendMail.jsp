<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="p3p" content="CP=&quot;CAO DSP AND SO&quot; policyref=&quot;/w3c/p3p.xml&quot;">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Mall Admin : ♣ SPAO Mall ♣</title>
<link rel="stylesheet" href="/Project_Spao/admin/common/css/admin_general.css?v=200912161200" type="text/css">
<style type="text/css">
@media print {
	.no_print {display:none;}
}
</style>
<link type="text/css" rel="stylesheet" media="all" href="/Project_Spao/common/js/cheditor/css/ui.css"></head>
<body class="popupbg">
<!-- hidden -->
<c:forEach var="memberDTO" items="${list}">
	<input type="hidden" class="userEmail" value="${memberDTO.email1}@${memberDTO.email2}">
	<input type="hidden" class="userId" value="${memberDTO.id}">
</c:forEach>

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

<link rel="stylesheet" href="/Project_Spao/admin/common/css/admin_user.css?v=200912161200" type="text/css">


<div class="wintitle"><img src="/Project_Spao/admin/images/common/bul_title_popup.gif"> 메일 보내기</div>



<div class="AreaW95 pa_l_20">

<!--메일보내기-->
<div class="subtitle"><img src="/Project_Spao/admin/images/user/bul_subtitle.gif"> 메일 발송</div>

<!--Begin-->
<form name="dataForm" action="./" method="post" enctype="multipart/form-data" autocomplete="off">

<table cellpadding="0" cellspacing="0" border="0" class="tbstyleB" width="100%">
	<tbody><tr><td colspan="2" class="top4"></td></tr>
	<tr>
		<td class="label" width="120">선택회원</td>
		<td class="box text">
		<c:choose>
			<c:when test="${size>1}">
				<strong style="font-weight: bold; color: red;">${size} 명</strong>
				<a id="detail" href="#"><img src="/Project_Spao/admin/images/button/btn_detail.gif"></a>
			</c:when>
			<c:otherwise>
				아이디 : <a id="detail" href="#"><strong>${list.get(0).id}</strong></a> , 이메일 : <strong>${list.get(0).email1}@${list.get(0).email2}</strong>
			</c:otherwise>
		</c:choose>
			</td>
	</tr>
	<tr>
		<td class="label">제목</td>
		<td class="box text">
			<input type="text" id="mail_send_title" name="mail_send_title" value="" class="inputbox" size="50">
					</td>
	</tr>
		<tr>
		<td class="label">내용</td>
		<td class="box text">
			<textarea id="mail_send_content" name="mail_send_content" class="textarea" style="width: 98%; height: 400px; display: none;"></textarea><div class="cheditor-popupModalBackground" id="popupModalBackground"></div>

			<div class="cheditor-editarea-wrapper" style="overflow: hidden;">
			<textarea rows="20" cols="86" id="maill"></textarea>
			</div>
			<div class="cheditor-modify-block" style="display: none;"></div><div class="cheditor-tag-path"><span class="cheditor-status-bar">&lt;html&gt; &lt;body&gt;</span></div>
			<div class="cheditor-viewmode"><div class="cheditor-tab-rich" title="입력 모드" alt="" mode="rich">&nbsp;</div><div class="cheditor-tab-code-off" title="HTML 편집" alt="" mode="code">&nbsp;</div>
			<div class="cheditor-fullscreen" title="전체 화면" alt="" mode="fullscreen">&nbsp;</div></div><div class="cheditor-popup-window" onselectstart="return false"><div class="cheditor-popup-drag-handle"><div class="cheditor-popup-titlebar"><label class="cheditor-popup-title"></label></div></div><div class="cheditor-popup-cframe"></div></div><iframe style="display: none; width: 1px; height: 1px; visibility: hidden;"></iframe></div>
					</td>
	</tr>
	</tbody></table>

<div class="alignCenter">
	<a href="#" id="send_mail"><img src="/Project_Spao/admin/images/user/btn_Send.gif"></a>
	<a href="#" id="close"><img src="/Project_Spao/admin/images/user/btn_cancel.gif"></a>
</div>
        
</form> 





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
 START 2018-11-22 19:26:33
 INIT            : 0.01384
 EXEC            : 0.01808
 LAYOUT          : 0.00044
 END             : 0.00191
---------------------------
 TOTAL           : 0.03428
---------------------------
-->
<script type="text/javascript">
$(document).ready(function(){
	$("#close").click(function(){
		if(confirm("종료하시겠습니까? 취소를 누르면 내용만 초기화됩니다.")){
			window.close();
		}else{
			$("#maill").val("");
			$("#mail_send_title").val("");
		}
	});
	
	$("#popup_close").click(function(){
		window.close();
	});
	
	$("#send_mail").click(function(){  //메일보내기 START
		var userEmail=[];
		$(".userEmail").each(function() {
			userEmail.push($(this).val());
		})
		$.ajax({
		      url:'multiEmailSend.do', // 요청 할 주소
		      async:true,// false 일 경우 동기 요청으로 변경
		      type:'GET', // GET, PUT
		      data: {
		          "userEmail":userEmail,
		          "content":$("#maill").val(),
		          "subject":$("#mail_send_title").val(),
		      },// 전송할 데이터
		      dataType:'text',// xml, json, script, html
		      success:function(jqXHR) {
		    	  if(jqXHR=="fail"){
		    		  alert("이메일보내기 실패했습니다.");
		    		  window.close();
		    	  }else{
		    		  alert("이메일 보내기 성공");
		    		  window.close();
		    	  }
		    	  
		      }// 요청 완료 시
		  });
	});   //메일보내기 STOP
	

	
	$("#detail").click(function(){
		var userId=[];
		$(".userId").each(function() {
			userId.push($(this).val());
		});
		window.open("userList.do?userId="+userId,"_blank","top=0,left=0,width="+600+",height="+400+",toolbar=no,status=no,scrollbars=no,resizable=no");
	});

});
</script>

</body></html>