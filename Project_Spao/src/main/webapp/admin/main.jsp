<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="p3p" content="CP=&quot;CAO DSP AND SO&quot; policyref=&quot;/w3c/p3p.xml&quot;">
<link rel="stylesheet" href="common/css/admin_main.css?v=200912161200" type="text/css">

<title>Mall Admin : ♣ Rainbow Mall ♣</title>

</head>
<body class="mainlayout">
<div>
<table border="0" cellpadding="0" cellspacting="0" width="100%" height="100%"  >
	<tbody>
	<tr>	<!-- TOP,BODY Center -->
		<td valign="top">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tbody>
				<tr>	<!-- top -->
				<jsp:include page="template/top.jsp" />
				</tr> <!-- top -->
				
				<tr>	<!-- center -->
					<jsp:include page="${display}"></jsp:include>
				</tr> <!-- center -->
			</tbody>
		</table>
		</td>  <!-- top.body END -->
	</tr>

		<tr><!-- Bottom -->
			<td>
				<div class="bottomlayout">
					<jsp:include page="template/bottom.jsp"></jsp:include>
				</div>
			</td>
		</tr><!-- Bottom -->
	</tbody>
</table>
</div>

<div style="display:none;"><!--
---------------------------
 START 2018-11-16 21:30:52
 INIT            : 0.00339
 EXEC            : 0.00963
 LAYOUT          : 0.00011
 END             : 0.01377
---------------------------
 TOTAL           : 0.02692
---------------------------
--></div>
<div id="__calendar__" style="position: absolute; display: none;"><table id="__calendar_box" class="calendar" width="260" border="0" cellspacing="0" cellpadding="0" use_image_year="false" use_image_month="true" use_image_day="false" img_base="/images/default/common/cal_yun2">
	<tbody><tr>
		<td height="50" align="center" valign="top" background="images/default/common/cal_yun2/top.gif">
			<table width="240" border="0" cellspacing="0" cellpadding="0">
				<tbody><tr>
					<td width="156">
						<table width="55" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;">
							<tbody><tr>
								<td id="__calendar_prev_year" class="calendar_prev_year"><img src="images/default/common/cal_yun2/btn_prev.gif" width="6" height="10"></td>
								<td align="center" id="__calendar_year" class="year">2009</td>
								<td align="right" id="__calendar_next_year" class="calendar_next_year"><img src="images/default/common/cal_yun2/btn_next.gif" width="6" height="10"></td>
							</tr>
						</tbody></table>
					</td>
					<td width="156" align="right" valign="top">
					</td>
				</tr>
			</tbody></table>
		</td>
	</tr>

	<tr>
		<td style="font-size:10px;"><img src="images/default/common/cal_yun2/bottom.gif" width="260" height="10"></td>
	</tr>
</tbody></table>
</div>
</body>
</html>


