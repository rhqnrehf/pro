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

<link rel="stylesheet" href="/Project_Spao/admin/common/css/admin_user.css?v=200912161200" type="text/css">


<title>회원 리스트</title>

<div class="wintitle"><img src="/Project_Spao/admin/images/common/bul_title_popup.gif"> 회원 리스트</div>

<form name="dataForm" action="./" method="post" autocomplete="off">
<input type="hidden" name="act" value="common.popup_user_list">
<input type="hidden" name="ch" value="pop">
<input type="hidden" name="mode" value="">
<input type="hidden" name="page" value="1">
<input type="hidden" name="oc" value="user_join_date">
<input type="hidden" name="os" value="desc">
<input type="hidden" name="user_id_list" value="love,moon">

<!--Begin-->
<!-- 전송리스트 -->
<div class="boxContainer" style="margin:20px 0 0 0;">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tbody><tr>
            <td class="left"> 
            	<span class="bul">총 :</span> <span class="fc_red_b">${size} 명</span></td>
            <td align="right">
				<select style="width:95px;" id="list_num" name="list_num">
					<option value="5">전부 출력</option>
				</select>
            </td>
        </tr>
    </tbody></table>
</div>


<!--리스트-->
<!--테이블 header-->
<div class="bgtbheader01" style="margin:10px 0 0 0;">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tablelistH31">
    <colgroup><col width="30">
    <col width="30%">
    <col width="30%">
    <col width="*">
    </colgroup><thead>
        <tr>
            <th class="thL"></th>
            <th>아이디(이름)</th>
            <th>이메일</th>
            <th class="thR">휴대전화번호</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="memberDTO" items="${list}" varStatus="i">
       	 <tr>
    	<td align="center" class="tdL">${i.count}</td>
    	<td align="center" class="tdL"><a href="#" ui_user="${memberDTO.id}" user_id="${memberDTO.id}">${memberDTO.id} (${memberDTO.name})</a></td>
    	<td align="center" class="tdL">${memberDTO.email1}@${memberDTO.email2}</td>
    	<td align="center" class="tdR">${memberDTO.phoneNumber}</td>
    	</tr>
    </c:forEach>

 </tbody>
</table>
</div>  

<!-- 페이징 -->
<div class="alignCenter">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tbody><tr>
    	<td align="center">
			<span class="paging"><a href="/admin/?act=common.popup_user_list&amp;ch=pop&amp;user_id_list=love%2Cmoon&amp;page=1" class="first"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrLL.gif" border="0" align="absmiddle"></a><a href="/admin/?act=common.popup_user_list&amp;ch=pop&amp;user_id_list=love%2Cmoon&amp;page=1" class="pre"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrL.gif" border="0" align="absmiddle"></a><a href="/admin/?act=common.popup_user_list&amp;ch=pop&amp;user_id_list=love%2Cmoon&amp;page=1" class="on"> 1 </a><a href="/admin/?act=common.popup_user_list&amp;ch=pop&amp;user_id_list=love%2Cmoon&amp;page=1" class="next"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrR.gif" border="0" align="absmiddle"></a><a href="/admin/?act=common.popup_user_list&amp;ch=pop&amp;user_id_list=love%2Cmoon&amp;page=1" class="last"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrRR.gif" border="0" align="absmiddle"></a></span>        </td>
	</tr>
</tbody></table>
</div>

<div class="boxContainer02" style="padding:10px;">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tbody><tr>
        <td width="100%" align="center">
			<a href="#" id="close"><img src="/Project_Spao/admin/images/button/btn_ok01.gif"></a>
        </td>
	</tr>
</tbody></table>
</div>

</form>
<!--End-->

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
 START 2018-11-22 21:16:41
 INIT            : 0.01332
 EXEC            : 0.01351
 LAYOUT          : 0.00045
 END             : 0.00164
---------------------------
 TOTAL           : 0.02892
---------------------------
--></div>
<div class="ui_user_box" id="__ui_user_layer" style="display: none;"><table border="0" cellspacing="0" cellpadding="0"><tbody><tr><td class="lt"></td><td class="t"></td>			<td class="rt"></td></tr><tr><td class="l"><img src="/Project_Spao/admin/images/layer/common/layer_leftcenter.gif"></td><td class="content"><div class="ui_user_item"><a class="ui_user_link" name="info" href="#">회원정보 열람</a></div><div class="ui_user_item"><a class="ui_user_link" name="memo" href="#">쪽지보내기</a></div><div class="ui_user_item"><a class="ui_user_link" name="email" href="#">이메일 보내기</a></div><div class="ui_user_item"><a class="ui_user_link" name="sms" href="#">SMS 보내기</a></div></td><td class="r"></td></tr><tr><td class="lb"></td><td class="b"></td><td class="rb"></td></tr></tbody></table></div>
<script type="text/javascript">
	$("#close").click(function(){
			window.close();
	});
	
	$("#popup_close").click(function(){
		window.close();
	});
</script>
</body></html>