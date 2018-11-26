<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<link rel="stylesheet" href="/Project_Spao/admin/common/css/admin_user.css?v=200912161200" type="text/css">


<!--title(회원상세정보)-->
<div class="wintitle"><img src="/Project_Spao/admin/images/common/bul_title_popup.gif"> 회원 상세정보</div>

<div class="maintitle01">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tbody><tr>
		<td width="20"></td>
		<td align="left" valign="middle">
		<span class="fc_red_b">${memberDTO.name}(${memberDTO.id})</span> 님의  회원정보입니다.
		</td>
		<td align="right" valign="bottom">
			<!--탭-->
			<table cellpadding="0" cellspacing="0" border="0" class="tab02">
				<tbody><tr>
					<td><a href="#" class="tabon"><p class="tabL"></p><p class="tabM">회원정보</p><p class="tabRR"></p></a></td>
					<td><a href="#" class="taboff"><p class="tabL"></p><p class="tabM">주문정보</p><p class="tabRR"></p></a></td>
					<td><a href="#" class="taboff"><p class="tabL"></p><p class="tabM">적립금</p><p class="tabRR"></p></a></td>
					<td><a href="#" class="taboff"><p class="tabL"></p><p class="tabM">1:1문의</p><p class="tabRR"></p></a></td>
					<td><a href="#" class="taboff"><p class="tabL"></p><p class="tabM">커뮤니티</p><p class="tabRR"></p></a></td>
					<td><a href="#" class="taboff"><p class="tabL"></p><p class="tabM">방문로그</p><p class="tabRR"></p></a></td>
				</tr>
			</tbody></table>
			
		</td>
	</tr>
</tbody></table>
</div>

<div class="AreaW95 pa_l_20">

<form name="form_user" method="post" autocomplete="off">

<!--회원정보-->
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tbody><tr>
		<td><div class="subtitle">&nbsp;<img src="/Project_Spao/admin/images/user/bul_subtitle.gif"> 회원 기본정보</div></td>
		<td align="right"><a href="#" id="edit_user" user_id="love"><img src="/Project_Spao/admin/images/button/btn_userinfo_edit.gif"></a></td>
	</tr>
</tbody></table>

<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
	<colgroup><col width="150">
	<col width="*">
	</colgroup><tbody><tr><td colspan="2" class="top4"></td></tr>
	<tr>
		<td class="label">이름(아이디)</td>
		<td class="box text"><span style="font-size:14px;"><strong>${memberDTO.name}</strong> (<span class="fc_blue_b">${memberDTO.id}</span>)</span> <a href="#" id="send_memo" user_id="love"><img src="/Project_Spao/admin/images/common/icon_memo.gif"></a>
		<a href="#" id="edit_passwd" name="edit_passwd" user_id="love"><img src="/Project_Spao/admin/images/button/btn_pwdChange.gif"></a></td>
	</tr>

	<tr>
		<td class="label">나이/생일</td>
		<td class="box text">${age} 세  /${memberDTO.birth}</td>
	</tr>
	<tr>
		<td class="label">이메일</td>
		<td class="box text">
			<a href="#" id="send_email0"><span style="font-size:14px;">${memberDTO.email1}@${memberDTO.email2}</span></a> 
			&nbsp;
			<a href="#" id="send_email1"><img src="/Project_Spao/admin/images/common/icon_email.gif"></a>
		</td>
	</tr>
	<tr>
		<td class="label">주소</td>
		<td class="box text">
			${memberDTO.address1}&ensp;${memberDTO.address2}    
			<a href="#" id="edit_addr"><img src="/Project_Spao/admin/images/button/btn_addrChange.gif"></a></td>
	</tr>
	<tr>
		<td class="label">휴대폰 / 일반전화</td>
		<td class="box text">휴대폰:${memberDTO.phoneNumber } <span style="font-size:14px;"></span></td>
	</tr>
	<tr>
		<td class="label">회원등급</td>
		<td class="box text">일반회원</td>
	</tr>
</tbody></table>

<!--회원이용정보-->
<div class="subtitle">&nbsp;<img src="/Project_Spao/admin/images/user/bul_subtitle.gif"> 회원 이용정보</div>
<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
	<colgroup><col width="150">
	<col width="*">
	</colgroup><tbody><tr><td colspan="2" class="top4"></td></tr>
	<tr>
		<td class="label">가입일</td>
		<td class="box04 text pa_l_10"> <span style="font-size:14px;">${memberDTO.logtime}</span>
		 <span class="fc_s"><span class="fc_blue">(마지막 로그인: ${spaoComDTO.visit} <a href="?act=user.user_info_detail_visitlog&amp;ch=pop&amp;user_id=love"><img src="/Project_Spao/admin/images/button/btn_visitLog.gif"></a> / 로그인 횟수:${spaoComDTO.hit } 회)</span></span></td>
	</tr>
	<tr>
		<td class="label">주문총액</td>
		<td class="box04 text pa_l_10"> <a href="#"><span style="font-size:14px;">${spaoComDTO.orderTotal}</span> 원</a> <span class="fc_s"><span class="fc_blue">(주문횟수 : ${spaoComDTO.orderHit } 건 / 취소.반품.환불.교환 : 0 회 <a href="#"><img src="/Project_Spao/admin/images/button/btn_orderInfo.gif"></a>)</span></span>
		</td>
	</tr>
	<tr>
		<td class="label">적립금</td>
		<td class="box04 text pa_l_10"> <a href="#"><span class="fc_blue"><u>${spaoComDTO.reserve} 원</u></span></a></td>
	</tr>
	<tr>
		<td class="label">커뮤니티</td>
		<td class="box04 text pa_l_10">1:1 문의 (<a href="?act=user.user_info_detail_qna&amp;ch=pop&amp;user_id=love"><span class="fc_blue"><u>0 건</u></span></a>)  상품문의 (<a href="?act=user.user_info_detail_bbs&amp;ch=pop&amp;user_id=love&amp;bbs_code=goods_qna"><span class="fc_blue"><u>0 건</u></span></a>) 사용후기 (<a href="?act=user.user_info_detail_bbs&amp;ch=pop&amp;user_id=love&amp;bbs_code=user_review"><span class="fc_blue"><u>1 건</u></span></a>)
		</td>
	</tr>
	<tr>
		<td class="label">장바구니</td>
		<td class="box04 text pa_l_10">장바구니: 상품 (<a href="#" target="_blank"><span class="fc_blue"><u>0 개</u></span></a>)  </td>
	</tr>
</tbody></table>
</form>


<div class="subtitle">&nbsp;<img src="/Project_Spao/admin/images/user/bul_subtitle.gif"> 관리자 운영메모</div>

<form name="form_memo" method="post" autocomplete="off">

<div class="graybox">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tbody><tr>
			<td><textarea name="admin_memo_content" class="textarea" style="width:99%;height:55px;"></textarea></td>
			<td width="74" align="right"><a href="#" id="write"><img src="/Project_Spao/admin/images/button/btn_regist04.gif"></a></td>
		</tr>
	</tbody></table>
</div>


<!--관리자 코멘트 리스트-->
<div class="bgtbheader">
<input type="hidden" id="userId" value="${memberDTO.id }">
<input type="hidden" id="adminId" value="${adminId}">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tablelistH41">
	<colgroup><col width="*">
	<col width="150">
	<col width="100">
	<col width="80">
	</colgroup><thead>
		<tr>
			<th class="thL">내용</th>
			<th>작성시각</th>
			<th>작성자</th>
			<th class="thR">삭제</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${list eq null}">
		<tr>
			<td colspan="10" class="tdR" align="center" height="28">관리자 메모가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${list ne null }">
		<c:forEach var="spaoAdminMemoDTO" items="${list}">
		<tr>
			<td class="tdR" align="center" height="28">${spaoAdminMemoDTO.content}</td>
			<td class="tdR" align="center" height="28">${spaoAdminMemoDTO.logtime}</td>
			<td class="tdR" align="center" height="28">${spaoAdminMemoDTO.adminId}</td>
			<td class="tdR" align="center" height="28">
			<a href="#" class="deleteB"><img src="/Project_Spao/admin/images/button/deleteB.jpg"></a>
			<input type="hidden" value="${spaoAdminMemoDTO.userId}">
			</td>
		</tr>
		</c:forEach>
	</c:if>
		<tr>
		<td colspan="10" class="tdR" align="center" height="28"></td>
	</tr>
	</tbody>
</table>

</div>
<br>
<div class="alignCenter">
	<a href="#" id="close"><img src="/Project_Spao/admin/images/user/btn_close.gif"></a>
</div>
</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#close").click(function(){
		window.close();
	});
	$("#write").click(function(){
		var adminId=$(".bgtbheader #adminId").val();
		var userId=$(".bgtbheader #userId").val();
		var content=$(".graybox textarea[name=admin_memo_content]").val();
		if($(".graybox textarea[name=admin_memo_content]").val()==""){
			alert("내용을 입력하세요");
		}else{
		  $.ajax({
		      url:'adminMemo.do', // 요청 할 주소
		      async:true,// false 일 경우 동기 요청으로 변경
		      type:'GET', // GET, PUT
		      data: {
		          "adminId":adminId,
		          "content":content,
		          "userId":userId
		      },// 전송할 데이터
		      dataType:'text',// xml, json, script, html
		      beforeSend:function(jqXHR) {},// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
		      success:function(jqXHR) {
		    	  if(jqXHR=="fail"){
		    		  alert("실패 DB문제");
		    	  }else{
		    		  alert("성공");
		    		  location.reload();
		    	  }
		    	 
		      },// 요청 완료 시
		      error:function(jqXHR) {
		    	  alert("알수없는 오류");
		    	  
		      },// 요청 실패.
		      complete:function(jqXHR) {}// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
		  }); //ajax
		} //else
	});
	
	$(".tablelistH41 .deleteB").click(function(){
		var adminId=$(this).parent().prev().html().trim();
		var content=$(this).parent().prev().prev().prev().html().trim();
		var userId=$(this).next().val();
		  $.ajax({
		      url:'adminMemoDelete.do', // 요청 할 주소
		      async:true,// false 일 경우 동기 요청으로 변경
		      type:'GET', // GET, PUT
		      data: {
		          "adminId":adminId,
		          "content":content,
		          "userId":userId
		      },// 전송할 데이터
		      dataType:'text',// xml, json, script, html
		      beforeSend:function(jqXHR) {},// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
		      success:function(jqXHR) {
		    	  if(jqXHR=="fail"){
		    		  alert("실패 DB문제");
		    	  }else{
		    		  alert("성공");
		    		  location.reload();
		    	  }
		    	 
		      },// 요청 완료 시
		      error:function(jqXHR) {
		    	  alert("알수없는 오류");
		    	  
		      },// 요청 실패.
		      complete:function(jqXHR) {}// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
		  }); //ajax
	});
});
</script>
