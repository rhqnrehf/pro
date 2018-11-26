<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- begin of Body -->
<link rel="stylesheet" href="common/css/admin_user.css?v=200912161200" type="text/css">
<script>
$(document).ready(function(){
	//Left 회원관리메뉴 이벤트 Start
	$("#leftmenu .bgmenu .mainmenu img").on("click",function(){
		if($(this).attr("src")=="images/user/icon_menu_minus.gif"){
			$(this).attr("src","images/user/icon_menu_plus.gif");
			$(this).parent().next().css("display","none");
		}else{
			$(this).attr("src","images/user/icon_menu_minus.gif");
			$(this).parent().next().removeAttr("style");	
		}
	});
	$("#leftmenu .bgmenu .mainmenu span a").on("click",function(){
		if($(this).parent().prev().attr("src")=="images/user/icon_menu_minus.gif"){
			$(this).parent().prev().attr("src","images/user/icon_menu_plus.gif");
			$(this).parent().parent().next().css("display","none");
		}else{
			$(this).parent().prev().attr("src","images/user/icon_menu_minus.gif");
			$(this).parent().parent().next().removeAttr("style");
		}
	});
	//Left 회원관리메뉴 이벤트 END
});
</script>
<td valign="top" align="left">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
					<td valign="top" width="198">

<div id="leftmenu_fold" style="display:none;">
	<a href="#" id="btn_menuopen"><img src="images/button/btn_menuopen.gif" class="btnmenuopen"></a>
</div>

<div id="leftmenu">
	<table cellpadding="0" cellspacing="0" border="0">
    	<tbody><tr>
        	<td><a href="?act=user.user_main&amp;ch=user"><img src="images/user/sub_leftmenu_Top.gif"></a>
				<a href="#" id="btn_menufold"><img src="images/button/btn_menufold.gif" class="btnmenufold"></a>
            </td>
        </tr>
        <tr>
        	<td class="bgmenu">
            	<div class="mainmenu" on="0"><img src="images/user/icon_menu_minus.gif" style="cursor: pointer;"> <span><a href="#">회원 관리</a></span></div>
				<ul class="submenu">
					<li id="memberList" class=""><a href="memberList.do">회원 리스트</a></li>
				</ul>
								
            	<div class="mainmenu" on="0"><img src="images/user/icon_menu_minus.gif" style="cursor: pointer;"> <span><a href="#">회원이용도</a></span></div>
				<ul class="submenu">
					<li id="memberReserveLog" class=""><a href="memberReserveLog.do">적립금 로그</a></li>
					<li id="memberRank" class=""><a href="#">적립금 순위</a></li>
				</ul>
            </td>
        </tr>
        <tr>
        	<td><img src="images/user/sub_leftmenu_Bottom.png" class="png"></td>
        </tr>
    </tbody></table>
</div>

</td>
					<td valign="top" align="left">

						<!--// BODY START //-->
						<div id="bodyContainer">
							<jsp:include page="${member}"></jsp:include>
						</div>
						<!--// BODY END //-->

					</td>
				</tr>
			</tbody></table>
		</td>
<!-- End of Body -->