<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	회원관리 &gt; 회원이용도 &gt; <strong>적립금 순위</strong>
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

<div class="subtitle"><img src="/Project_Spao/admin/images/user/bul_subtitle.gif"> 적립금 순위</div>

<input type="hidden" name="act" value="user.user_access_mile_keep">
<input type="hidden" name="ch" value="user">
<input type="hidden" name="oc" value="user_id">
<input type="hidden" name="os" value="desc">
<input type="hidden" name="mode" value="">
<input type="hidden" name="user_level_search" value="">

<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">  
	<tbody><tr><td colspan="2" class="top4"></td></tr>
    <tr>
		<td class="label" width="120">보유 적립금</td>
		<td class="box text">
			<input type="text" id="user_stat_smile" name="user_stat_smile" class="inputbox2" size="15"> 원 에서
            <input type="text" id="user_stat_emile" name="user_stat_emile" class="inputbox2" size="15"> 원 까지
		</td>
    </tr>
	<tr>
		<td class="label">검색 키워드</td>
		<td class="box text">
        	<select name="sc" style="width:70px;">
            	<option value="user_id">아이디</option>
				<option value="user_name">이름</option>
            </select>
			<input type="text" id="ss" name="ss" value="" class="inputbox" size="20">
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
                    	<td width="100%">총 <span class="fc_red"><strong>4</strong></span> 인이 검색 되었습니다.</td>
                    </tr>
                </tbody></table>
            </td>
			<td align="right">
            	<select id="list_num" name="list_num" mode="0">
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
				현재보유액
                <a href="#" id="change_order00" oc="user_stat_mile" os="asc"><img src="/Project_Spao/admin/images/button/btn_arrowUp.gif"></a> 
                <a href="#" id="change_order01" oc="user_stat_mile" os="desc"><img src="/Project_Spao/admin/images/button/btn_arrowDown.gif"></a>
				|
				총지급액
                <a href="#" id="change_order02" oc="user_stat_mile_plus" os="asc"><img src="/Project_Spao/admin/images/button/btn_arrowUp.gif"></a> 
                <a href="#" id="change_order03" oc="user_stat_mile_plus" os="desc"><img src="/Project_Spao/admin/images/button/btn_arrowDown.gif"></a>
				|
                총사용액
                <a href="#" id="change_order04" oc="user_stat_mile_minus" os="asc"><img src="/Project_Spao/admin/images/button/btn_arrowUp.gif"></a> 
                <a href="#" id="change_order05" oc="user_stat_mile_minus" os="desc"><img src="/Project_Spao/admin/images/button/btn_arrowDown.gif"></a>  
            </td>
            <td width="10"></td>
            <td><a href="#" id="change_order06" oc="user_id" os="desc"><img src="/Project_Spao/admin/images/button/btn_reset.gif"></a></td>
        </tr>
    </tbody></table>
</div>


<!--테이블 header-->
<div class="bgtbheader01">
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tablelistH31">
    <colgroup><col width="10%">
    <col width="20%">
    <col width="10%">
    <col width="15%">
    <col width="15%">
    <col width="15%">
    <col width="15%">
    </colgroup><thead>
        <tr>
            <th class="thL">번호</th>
            <th>아이디</th>
            <th>이름</th>
			<th>등급</th>
            <th>보유적립금</th>
            <th>지급적립금</th>
			<th class="thR">사용적립금</th>
		</tr>
    </thead>
    <tbody>
    <c:forEach var="spaoRankReserveDTO" items="${list}">
    	   <tr>
        	<td class="tdL" align="center">${spaoRankReserveDTO.rn }</td>
        	<td class="tdL" align="center"><a href="#" class="fc_blue" id="view_buy000" user_id="${spaoRankReserveDTO.id}"><u>${spaoRankReserveDTO.id }</u></a></td>
        	<td class="tdL" align="center">${spaoRankReserveDTO.name}</td>
            <td class="tdL" align="center">일반회원</td>
            <td class="tdL" align="center"><span class="fc_blue"><fmt:formatNumber value="${spaoRankReserveDTO.userReserve}" pattern="#,###"></fmt:formatNumber> </span>
            </td><td class="tdL" align="center"><span class="fc_blue"><fmt:formatNumber value="${spaoRankReserveDTO.giveReserve}" pattern="#,###"></fmt:formatNumber> </span></td>
            <td class="tdR" align="center"><span class="fc_red"><fmt:formatNumber value="${spaoRankReserveDTO.useReserve}" pattern="#,###"></fmt:formatNumber></span></td>
		</tr>
    </c:forEach>
			</tbody>
</table>    
</div>
<br>

<!-- 페이징 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr>
		<td width="100%" align="center"><span class="paging"><a href="/admin/?act=user.user_access_mile_keep&amp;ch=user&amp;page=1" class="first"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrLL.gif" border="0" align="absmiddle"></a><a href="/admin/?act=user.user_access_mile_keep&amp;ch=user&amp;page=1" class="pre"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrL.gif" border="0" align="absmiddle"></a><a href="/admin/?act=user.user_access_mile_keep&amp;ch=user&amp;page=1" class="on"> 1 </a><a href="/admin/?act=user.user_access_mile_keep&amp;ch=user&amp;page=1" class="next"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrR.gif" border="0" align="absmiddle"></a><a href="/admin/?act=user.user_access_mile_keep&amp;ch=user&amp;page=1" class="last"><img src="/Project_Spao/admin/images/default/button/btn_navi_arrRR.gif" border="0" align="absmiddle"></a></span></td>
	</tr>
</tbody></table>
<br>

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
							$("#leftmenu .bgmenu .submenu #memberRank").addClass("select");
							//회원리스트 굵게표시 END
						});
						</script>