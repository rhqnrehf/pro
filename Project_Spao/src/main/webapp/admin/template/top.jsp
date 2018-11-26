<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>



<td height="100" valign="top">
<link type="text/css" href="common/css/admin_general.css?v=200912161200" rel="stylesheet"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<table cellpadding="0" cellspacing="0" border="0">
    <tbody><tr>
        <td valign="top" width="198"><a href="main.do"><img src="images/common/admin_logo.gif" onerror="this.src='images/common/admin_logo.gif';" width="198" height="74"></a></td>
        <td align="right" width="802">
            <div class="topbtnContainer">
            	<table cellpadding="0" cellspacing="0" border="0">
                	<tbody><tr>
                        <td width="25"></td>
                    	<td><a href="/Project_Spao/admin/data/manual/rainbow_manual.zip"><img src="images/button/btn_manual.gif"></a></td>
                        <td width="10"></td>						
                        <td width="25"></td>
                        <td><a href="#" target="_blank"><img src="images/button/btn_myshopmall.gif" class="space"></a></td> <!-- 사용자 쇼핑몰 -->
                        <td><a href="/Project_Spao/admin/loginForm.do"><img src="images/button/btn_logout.gif" class="space"></a></td> <!-- 로그아웃 -->
                    </tr>
                </tbody></table>
            </div>
            <div id="top_menu" class="topmenu">
            <!-- 상점관리 	<a href="?act=shop.shop_main&amp;ch=shop"><img name="shop" src="/admin/images/common/top_menu_shop_n.gif"></a>-->
           <!-- 주문 배송관리 <a href="?act=buy.buy_main&amp;ch=buy"><img name="buy" src="images/common/top_menu_buy_n.gif"></a> -->
            <!-- 이벤트     <a href="?act=event.event_main&amp;ch=event"><img name="event" src="images/common/top_menu_event_n.gif"></a> -->
           		<a href="?act=goods&amp;ch=goods"><img name="goods" src="images/common/top_menu_goods_n.gif"></a> <!-- 상품관리 -->
                <a href="member.do"><img name="user" src="images/common/top_menu_member_n.gif"></a> <!-- 회원관리 -->
            </div>
        </td>
    </tr>
    <tr height="24">
    	<td><div id="top_clock" class="dateContainer">2018.11.16 (금) 오후8:12</div></td>
        <td>
        	<table cellpadding="0" cellspacing="0" border="0">
            	<tbody><tr>
                	<td height="3"></td>
                </tr>
                <tr>
                	<td width="12"></td>
                    <td class="fc_white" width="65"><img src="images/common/bul_01.gif" class="imgAM"> 회원CRM</td>
                    <td><input id="user_crm_keyword" type="text" class="tibox"> <a href="#" id="btn_user_crm"><img src="images/button/btn_TopSearch.gif"></a></td>
                    <td width="20"></td>
                    <!-- FTP<td><a href="#" onclick="Durian.openWebFTP(''); return false;"><img src="images/button/btn_FTP.gif"></a></td> -->
                    <td class="fc_whites" width="430"></td>
                </tr>
            </tbody></table>
        </td>
    </tr>
</tbody></table>
</td>

<div id="layout_user_crm" style="display:none; position:absolute; width:700px; left:215px; top:103px; padding:20px; border:5px solid #777777; background-color:#FFFFFF; z-index:1000;">
<%-- 아이디체크위해 항상 어드민페이지에 인클루드되어있는 top.jsp에서 if else 태그사용함 --%>
<c:choose> 
	<c:when test="${adminId ne null && fn:length(adminId)>30}"></c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("로그인 해주세염");
			location.href="/Project_Spao/admin/loginForm.do"
		</script>
	</c:otherwise>
</c:choose>

</div>
<div id="layout_post_it" style="display:none; position:absolute; width:500px; left:420px; top:103px; padding:20px; border:5px solid #777777; background-color:#FFFFFF; z-index:1000;"></div>					</td>

<div id="layout_user_crm" style="display:none; position:absolute; width:700px; left:215px; top:103px; padding:20px; border:5px solid #777777; background-color:#FFFFFF; z-index:1000;"></div>

<div id="layout_post_it" style="display:none; position:absolute; width:500px; left:420px; top:103px; padding:20px; border:5px solid #777777; background-color:#FFFFFF; z-index:1000;"></div>
