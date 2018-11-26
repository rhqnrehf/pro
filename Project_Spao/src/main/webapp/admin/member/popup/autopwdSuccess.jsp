<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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



<div class="wintitle"><img src="/Project_Spao/admin/images/common/bul_title_popup.gif">  회원 비밀번호 변경</div>

<form name="form_user" method="post" autocomplete="off">

<table width="100%" cellpadding="0" cellspacing="1" border="0" class="tbstyle02">
	<colgroup><col width="*">
	</colgroup><tbody><tr>
		<td>
			${param.id}님의 비밀번호가 자동생성되었습니다.<br>
			변경된 비밀번호는 관리자가 확인할 수 없으며, 회원 본인의 메일주소 또는 SMS로만 안내됩니다.
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" id="email_use_flag" name="email_use_flag" value="1" checked="checked"> 안내메일 발송<br>
		</td>
	</tr>
</tbody></table>

<div class="alignCenter">
	<img src="/Project_Spao/admin/images/user/btn_ok.gif" id="submit1" style="cursor: pointer;">
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
<!-- setHidden -->
<input type="hidden" id="id" value="${param.id}"/>
<input type="hidden" id="pwd" value="${pwd}">
</div>
<div style="display:none;"><!--
---------------------------
 START 2018-11-20 21:44:52
 INIT            : 0.01363
 EXEC            : 0.08396
 LAYOUT          : 0.00060
 END             : 0.00143
---------------------------
 TOTAL           : 0.09962
---------------------------
--></div>
<script type="text/javascript">
$(document).ready(function(){
	var id=$("#id").val();
	var pwd=$("#pwd").val();
	var error=${error};
	if(error==true){  //true 비밀번호 변경도중 에러 
		alert("비밀번호 변경도중 에러");
		window.close();
	}
	$("#submit1").on("click",function(){
		if (confirm("이메일로 보내시겠습니까") == true){    //확인
			  $.ajax({
			      url:'emailSend.do', // 메일보내기
			      async:true,// false 일 경우 동기 요청으로 변경
			      type:'GET', // GET, PUT
			      data: {
			          "id":id,
			          "subject":"패스워드 관리자 재설정",
			          "content":'회원님의 비밀번호는 '+pwd +' 입니다',
			      },// 전송할 데이터
			      dataType:'text',// xml, json, script, html
			      success:function(jqXHR) {
			    	  if(jqXHR.trim()=="success"){
			    		  alert("회원 이메일로 보냈습니다");
			    		  window.close();
			    	  }else if(jqXHR.trim()=="fail"){
				    	  alert("이메일 보내기실패 DB예외  "+jqXHR);
				    	  window.close();
			    	  }
			      },// 요청 완료 시
			      error:function(jqXHR) {
			    	  alert("알수없는에러\n"+jqXHR);
			    	  window.close();
			      }// 요청 실패
			  }); //ajax
		}else{   //취소
			//window.close();
		}
	});
	
	$("#email_use_flag").click(function(){
		return false;
	});
	
	$("#popup_close").click(function(){
		window.close();
	});
});
</script>

</body>