<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tbody><tr>
								<td width="12"><img src="/Project_Spao/admin/images/common/body_corner_LeftTop.gif"></td>
								<td class="bgbodyTop"><img src="/Project_Spao/admin/images/common/body_corner_MiddleTop.gif"></td>
								<td width="22"><img src="/Project_Spao/admin/images/common/body_corner_RightTop.gif"></td>
							</tr>
							<tr>
								<td class="bgbodyleft"></td>
								<td class="bgbodymiddle">


<!--path-->
<div class="pathContainer"><img src="/Project_Spao/admin/images/common/bul_06.gif">
	회원관리 &gt; 회원이용도 &gt; <strong>적립금 로그</strong>
</div>


<!--title(회원이용도)-->
<div class="maintitle01">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tbody><tr>
        <td class="title" valign="bottom" style="padding-top:10px;"><img src="/Project_Spao/admin/images/user/bul_title.gif"> 회원이용도</td>
        <td align="right" valign="bottom">
        </td>
    </tr>
</tbody></table>
</div>

<div class="AreaW95 pa_l_20">

<div class="subtitle"><img src="/Project_Spao/admin/images/user/bul_subtitle.gif"> 적립금 로그 </div>
<form name="form_mile" method="post" autocomplete="off">
<input type="hidden" name="act" value="user.user_access_mile">
<input type="hidden" name="ch" value="user">
<input type="hidden" name="oc" value="mile_log_date">
<input type="hidden" name="os" value="desc">
<input type="hidden" name="mode" value="">


<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
    <tbody><tr><td colspan="2" class="top4"></td></tr>
	<tr>
		<td class="label" width="120">적립금 구분</td>
		<td class="box text">
        	<input type="radio" id="mile_log_amount" name="mile_log_amount" value="0" checked="checked"> 전체
        </td>    
    </tr>
    <tr>
    	<td class="label">조건검색</td>
        <td class="box text">
        	<select id="mode" name="mode" style="width:70px;">
            	<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="log_memo">내용</option>
            </select>
            <input type="text" id="keyword" name="keyword" value="" class="inputbox" size="20">
        </td>
    </tr>
</tbody></table>

<div class="alignCenter">
	<input type="image" src="/Project_Spao/admin/images/button/btn_Search.gif" id="submit" name="submit" mode="search">
</div>

<!-- 적립금 리스트 -->
<div class="boxContainer">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tbody><tr>
            <td class="left" style="padding:5px 0 5px 10px;">
            	<table cellpadding="0" cellspacing="0" border="0">
                	<tbody><tr>
                        <td>
							<span class="fc_red_b">지급총액 : 4,000 / 사용총액 : 0</span>
                        </td>
                    </tr>
                </tbody></table>
            </td>
            <td align="right">
            	<select id="list_num" name="list_num">
                    <option value="5">5개 출력</option>
                    <option value="10">10개 출력</option>
                    <option value="20">20개 출력</option>
                    <option value="50">50개 출력</option>
                    <option value="100">100개 출력</option>
                </select>&nbsp;
            </td>
        </tr>
    </tbody></table>
</div>

<!--정렬-->
<div class="alignContainer">
    <table cellpadding="0" cellspacing="0" border="0">
        <tbody><tr>
             <td class="bul04">
                정렬 :
                등록일 
                <a href="#" id="change_order00" oc="mile_log_date" os="asc"><img src="/Project_Spao/admin/images/button/btn_arrowUp.gif"></a> 
                <a href="#" id="change_order01" oc="mile_log_date" os="desc"><img src="/Project_Spao/admin/images/button/btn_arrowDown_on.gif"></a>  
                |
                금액 
                <a href="#" id="change_order02" oc="mile_log_amount" os="asc"><img src="/Project_Spao/admin/images/button/btn_arrowUp.gif"></a> 
                <a href="#" id="change_order03" oc="mile_log_amount" os="desc"><img src="/Project_Spao/admin/images/button/btn_arrowDown.gif"></a>
            </td>
            <td width="10"></td>
            <td><a href="#" id="change_order4" oc="mile_log_seq" os="desc"><img src="/Project_Spao/admin/images/button/btn_reset.gif"></a></td>
        </tr>
    </tbody></table>
</div>


<!--테이블 header-->
<div class="bgtbheader01">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tablelistH31">
    <colgroup><col width="5%">
    <col width="15%">
    <col width="10%">
	<col width="10%">
	<col width="10%">
    <col width="*">
	<col width="5%">
    <col width="15%">
    </colgroup><thead>
        <tr>
            <th class="thL">번호</th>
            <th>거래시각</th>
            <th>아이디</th>
            <th>이름</th>
			<th>금액</th>
            <th>내역</th>
			<th>보기</th>
            <th class="thR">처리자</th>
        </tr>
    </thead>
   <tbody>
	    	<tr>
        	<td class="tdL" align="center">4</td>
        	<td class="tdL" align="center">2009.11.16 11:15</td>
            <td class="tdL" align="center"><a href="#" class="fc_blue" user_id="love" ui_user="love"><u>love</u></a></td>
            <td class="tdL" align="center"><a href="#" class="fc_blue" user_id="love" ui_user="love"><u>신사임당</u></a></td>
			<td class="tdL" align="right">1,000</td>
            <td class="tdL" align="center">회원가입 축하 적립금</td>
            <td class="tdL" align="center">
							</td>
            <td class="tdR" align="center"></td>
        </tr>
	    	<tr>
        	<td class="tdL" align="center">3</td>
        	<td class="tdL" align="center">2009.11.16 11:13</td>
            <td class="tdL" align="center"><a href="#" class="fc_blue" user_id="moon" ui_user="moon"><u>moon</u></a></td>
            <td class="tdL" align="center"><a href="#" class="fc_blue" user_id="moon" ui_user="moon"><u>황진이</u></a></td>
			<td class="tdL" align="right">1,000</td>
            <td class="tdL" align="center">회원가입 축하 적립금</td>
            <td class="tdL" align="center">
							</td>
            <td class="tdR" align="center"></td>
        </tr>
	    	<tr>
        	<td class="tdL" align="center">2</td>
        	<td class="tdL" align="center">2009.11.16 11:12</td>
            <td class="tdL" align="center"><a href="#" class="fc_blue" user_id="lee" ui_user="lee"><u>lee</u></a></td>
            <td class="tdL" align="center"><a href="#" class="fc_blue" user_id="lee" ui_user="lee"><u>이몽룡</u></a></td>
			<td class="tdL" align="right">1,000</td>
            <td class="tdL" align="center">회원가입 축하 적립금</td>
            <td class="tdL" align="center">
							</td>
            <td class="tdR" align="center"></td>
        </tr>
	    	<tr>
        	<td class="tdL" align="center">1</td>
        	<td class="tdL" align="center">2009.11.16 11:10</td>
            <td class="tdL" align="center"><a href="#" class="fc_blue" user_id="hong" ui_user="hong"><u>hong</u></a></td>
            <td class="tdL" align="center"><a href="#" class="fc_blue" user_id="hong" ui_user="hong"><u>홍길동</u></a></td>
			<td class="tdL" align="right">1,000</td>
            <td class="tdL" align="center">회원가입 축하 적립금</td>
            <td class="tdL" align="center">
							</td>
            <td class="tdR" align="center"></td>
        </tr>
	    </tbody>
</table>    
</div>

<!-- 페이징 -->
<div class="alignCenter">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tbody><tr>
    	<td align="center">
			<span class="paging"><a href="/admin/?act=user.user_access_mile&amp;ch=user&amp;page=1" class="first"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrLL.gif" border="0" align="absmiddle"></a><a href="/admin/?act=user.user_access_mile&amp;ch=user&amp;page=1" class="pre"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrL.gif" border="0" align="absmiddle"></a><a href="/admin/?act=user.user_access_mile&amp;ch=user&amp;page=1" class="on"> 1 </a><a href="/admin/?act=user.user_access_mile&amp;ch=user&amp;page=1" class="next"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrR.gif" border="0" align="absmiddle"></a><a href="/admin/?act=user.user_access_mile&amp;ch=user&amp;page=1" class="last"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrRR.gif" border="0" align="absmiddle"></a></span>        </td>
	</tr>
</tbody></table>
</div>

</form>

</div>
								</td>
								<td class="bgbodyright"></td>
							</tr>
							<tr>
								<td><img src="/Project_Spao/admin/images/common/body_corner_LeftBottom.gif"></td>
								<td class="bgbodyBottom"><img src="/Project_Spao/admin/images/common/body_corner_MiddleBottom.gif"></td>
								<td><img src="/Project_Spao/admin/images/common/body_corner_RightBottom.gif"></td>
							</tr>
						</tbody></table>
						<script type="text/javascript">
						$(document).ready(function(){
							//회원리스트 굵게표시 Start
							$("#leftmenu .bgmenu .submenu li").removeAttr("class");
							$("#leftmenu .bgmenu .submenu #memberReserveLog").addClass("select");
							//회원리스트 굵게표시 END
						});
						</script>