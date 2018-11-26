<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="p3p" content="CP=&quot;CAO DSP AND SO&quot; policyref=&quot;/w3c/p3p.xml&quot;">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#popup_close").click(function(){
		window.close();
	});
});
</script>
<title>Mall Admin : ♣ Spao Mall ♣</title>
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
		<td class="bgbodymiddle"><jsp:include page="${memberView}"></jsp:include></td>
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
 START 2018-11-23 17:14:49
 INIT            : 0.00929
 EXEC            : 0.01494
 LAYOUT          : 0.00031
 END             : 0.00152
---------------------------
 TOTAL           : 0.02606
---------------------------
--></div></body></html>