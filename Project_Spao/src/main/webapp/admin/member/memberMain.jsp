<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tbody><tr>
						<td width="12"><img src="images/common/body_corner_LeftTop.gif"></td>
						<td class="bgbodyTop"><img src="images/common/body_corner_MiddleTop.gif"></td>
						<td width="22"><img src="images/common/body_corner_RightTop.gif"></td>
					</tr>
					<tr>
						<td class="bgbodyleft"></td>
						<td class="bgbodymiddle">

<!--path-->
<div class="pathContainer"><img src="images/common/bul_06.gif">
	회원/메일/SMS &gt; <strong>메인</strong>
</div>


<!--title(회원관리)-->
<div class="maintitle"><img src="images/user/bul_title.gif"> 회원 관리</div>



<div class="AreaW95 pa_l_20">


<!-- 회원통계 -->
<div class="subtitle"><img src="images/user/bul_subtitle.gif"> 회원통계</div>

	<table cellpadding="0" cellspacing="1" border="0" width="100%" class="tbstyleE">
		<colgroup><col width="20%">
		<col width="80%">
		</colgroup><tbody><tr><td colspan="2" class="top5"></td></tr>
		<tr>
			<td class="label"><img src="images/user/icon_main_dot.gif">신규회원 통계</td>
			<td class="text">
				오늘 <a href="#" id="view_user01" mode="join" term="today">${todayJoinCount}명</a> / 
				이번달 <a href="#" id="view_user04" mode="join" term="this_month">${monthJoinCount}명</a>
			</td>
		</tr>
		<tr>
			<td class="label"><img src="images/user/icon_main_dot.gif">회원등급</td>
			<td class="text">
				<table cellpadding="0" cellspacing="0" border="0" class="tbstyle02" width="100%">					
					<colgroup><col width="200">
					<col width="*">
					</colgroup><tbody><tr>
						<td class="label05">회원구분</td>
						<td class="label05">인원</td>
					</tr>
																										<tr>
						<td class="box08" align="center"><span class="fc_black">일반회원</span></td>
						<td class="box08" align="left"><span><strong>${memberCount}</strong> 명</span></td>
					</tr>
									</tbody></table>
				<br>
				<span class="fc_blue">* 등급관리는 <a href="?act=shop.user_policy_level&amp;ch=shop" class="fc_blue"><u>상점관리&gt;회원관련설정&gt;회원등급설정</u></a> 에서 해주시기 바랍니다.</span>
			</td>
		</tr>
	</tbody></table>

<!-- 회원 이벤트 -->
<div class="subtitle"><img src="images/user/bul_subtitle.gif"> 회원 이벤트</div>

	<table cellpadding="0" cellspacing="1" border="0" width="100%" class="tbstyleE">
		<colgroup><col width="20%">
		<col width="80%">
		</colgroup><tbody><tr><td colspan="2" class="top5"></td></tr>
		<tr>
			<td class="label"><img src="images/user/icon_main_dot.gif">생일</td>
			<td class="text ">오늘 <a href="#" id="view_user05" mode="birth" term="today">${todayBirthCount}명</a> / 이번 달 <a href="#" id="view_user07" mode="birth" term="this_month">${monthBirthCount}명</a></td>
		</tr>
		<tr>
			<td class="label"><img src="images/user/icon_main_dot.gif">결혼 기념일</td>
			<td class="text">오늘 <a href="#" id="view_user08" mode="wedding" term="today">${todayAnniversaryCount}명</a> / 이번 달 <a href="#" id="view_user10" mode="wedding" term="this_month">${monthAnniversaryCount}명</a></td>
		</tr>
	</tbody></table>

</div> <!-- 회원 이벤트 END -->
								</td>
								<td class="bgbodyright"></td>
							</tr>
							<tr>
								<td><img src="images/common/body_corner_LeftBottom.gif"></td>
								<td class="bgbodyBottom"><img src="images/common/body_corner_MiddleBottom.gif"></td>
								<td><img src="images/common/body_corner_RightBottom.gif"></td>
							</tr>
						</tbody></table>
