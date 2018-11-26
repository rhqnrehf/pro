<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	회원/메일/SMS &gt; 회원관리 &gt; <strong>회원 리스트</strong>
</div>

<!--title(회원 리스트)-->
<div class="maintitle"><img src="images/user/bul_title.gif"> 회원 리스트</div>

<div class="AreaW95 pa_l_20">

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tbody><tr>
		<td><div class="subtitle"><img src="images/user/bul_subtitle.gif"> <span id="sub_title">기본검색</span></div></td>
		<td align="right" valign="bottom" style="padding-bottom:5px;">
			<a href="#" id="search_mode1" name="search_basic" mode="1"><img src="images/button/btn_basicSearch.gif"></a>
		</td>
	</tr>
</tbody></table>

<!--Begin of 기본검색-->
<div id="div_search_mode1" style="">


<form action="memberList.do" method="GET" id="searchForm">
	<table cellpadding="0" cellspacing="1" id="table1" width="100%" border="0" class="tbstyleB">
			<colgroup><col width="120">
		</colgroup><tbody><tr><td colspan="4" class="top4"></td></tr>
		<tr>
			<td class="label">검색 키워드</td>
			<td colspan="3" class="box text">
				<select name="mode" style="width:80px;">
					<option value="name" selected="selected">이름</option>
					<option value="id">아이디</option>
					<option value="email">이메일</option>
					<option value="phoneNumber">휴대폰</option>
				</select>
				<input type="text" id="keyword" name="keyword" class="inputbox" style="width:145px;">
				</td>
			</tr>
	</tbody></table>
</form>

<div class="alignCenter">
	<input type="image" src="images/button/btn_Search.gif" id="submit1" name="submit1">
</div>

</div>
<!--End of 기본검색-->

<!-- 총합,출력수 -->
<div class="boxContainer">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tbody><tr>
			<td class="left"><span class="bul">검색결과: </span><span class="fc_red"><strong>${resultTotal}</strong> 명</span>, 
				<span class="bul">총회원수: </span><span class="fc_red"><strong>${totalUser}</strong> 명</span> 
				</td>
			<td align="right">
				<select id="list_num_select" name="list_num_select" mode="1">
					<option value="5">5개 출력</option>
					<option value="10">10개 출력</option>
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
				가입일(고정) 
				<a href="#" id="change_order00" oc="user_join_date" os="desc"><img src="images/button/btn_arrowUp_on.gif"></a> 
				<a href="#" id="change_order01" oc="user_join_date" os="asc"><img src="images/button/btn_arrowDown.gif"></a>  



			</td>
			<td width="10"></td>
			<td><a href="#" id="change_order16" oc="user_join_date" os="asc"><img src="images/button/btn_reset.gif"></a></td>
		</tr>
	</tbody></table>
</div>



<!-- 검색결과 -->
<div class="bgtbheader">
<table id="table4" width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelistH41">
	<colgroup>
	<col width="20">
	<col width="40">
	<col width="70">
	<col width="66">
	<col width="60">
	<col width="87">
	<col width="50">
	<col width="70">
	<col width="58">
	<col width="55">
	<col width="60">
	<col width="45">
	</colgroup><thead>
		<tr>
			<th class="thL" style="height:28px;"><input type="checkbox" id="check_user_id" name="check_user_id" value="" mode="table"></th>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>회원등급</th>
			<th>가입일</th>
			<th>방문수</th>
			<th>비번변경/로그인</th>
			<th>적립금</th>
			<th>주문횟수</th>
			<th>주문총액</th>
			<th>CRM</th>
		</tr>
	</thead>

	<tbody>
	<c:forEach var="memberPagingDTO" items="${list}" varStatus="i">
	<tr>
		<td class="tdL" height="28" align="center"><input type="checkbox" name="user_idCheck" value="${memberPagingDTO.id}" mode="table"></td>
		<td class="tdL" align="center"><a href="#" ui_user_ip="${memberPagingDTO.id}">${i.count}</a></td>
		<td class="tdL" align="center"><a href="#" ui_user="${memberPagingDTO.id}" user_id="${memberPagingDTO.id}">${memberPagingDTO.name}</a></td>
		<td class="tdL" align="center"><a href="#" ui_user="${memberPagingDTO.id}" user_id="${memberPagingDTO.id}">${memberPagingDTO.id}</a></td>
		<td class="tdL" align="center"><span class="fc_s">일반회원</span></td>
		<td class="tdL" align="center">${memberPagingDTO.logtime}</td>
		<td class="tdL" align="center"><span class="fc_s">${memberPagingDTO.hit}</span></td>
		<td class="tdL" align="left">

		<a href="#" id="edit_passwd003" class="edit_passwd003" user_id="${memberPagingDTO.id}"><img src="images/button/btn_pwd.gif" title="비밀번호 변경"></a>

		<a href="#" id="user_autologin003" user_id="${memberPagingDTO.id}"><img src="images/common/icon_login.gif" title="회원 아이디로 로그인"></a>
		
		</td>
		<td class="tdL" align="center"><a href="#" id="view_mile003" user_id="${memberPagingDTO.id}"><span class="fc_s"><span class="fc_blue"><u>${memberPagingDTO.reserve}원</u></span></span></a></td>
		<td class="tdL" align="center"><span class="fc_s"><span class="fc_blue">${memberPagingDTO.orderHit} 회</span></span></td>
		<td class="tdL" align="center"><a href="#" id="view_buy003" user_id="${memberPagingDTO.id}"><span class="fc_s"><span class="fc_blue"><u>${memberPagingDTO.orderTotal} 원</u></span></span></a></td>
		<td class="tdR" align="center"><a href="#" class="view_user003" id="view_user003" user_id="${memberPagingDTO.id}"><img src="images/button/btn_view01.gif"></a></td>
	</tr>
	</c:forEach>
			</tbody>
</table>
</div>
<!-- End of 검색결과 -->
<br>

<!-- 페이징 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr>
		<td width="50%" align="center">
		<span class="paging">
		${mp.pagingHTML}
		</span>
		</td>
	</tr>
</tbody></table>


<!-- 일괄처리 -->
<div class="subtitle"><img src="images/user/bul_subtitle.gif"> 회원 일괄처리 <span class="fc_s"><span class="fc_blue">(선택한 회원을)</span></span></div>
<div class="boxContainer02" style="padding:10px;">
<table cellpadding="0" cellspacing="0" border="0">
	<tbody><tr>
		<td align="center">
			<a href="#" id="send_email"><img src="images/button/btn_sendmail.gif" alt="메일발송"></a>
			<a href="#" id="give_mile"><img src="images/button/btn_fund.gif" alt="적립금 지급"></a>
			<a href="#" id="secede_user"><img src="images/button/btn_leave.gif" alt="탈퇴처리"></a>
		</td>
	</tr>
</tbody></table>
</div>
<br>


</div>
						</td>
						<td class="bgbodyright"></td>
					</tr>
					<tr>
						<td><img src="images/common/body_corner_LeftBottom.gif"></td>
						<td class="bgbodyBottom"><img src="images/common/body_corner_MiddleBottom.gif"></td>
						<td><img src="images/common/body_corner_RightBottom.gif"></td>
					</tr>
				</tbody></table>
						
<script>
	$(document).ready(function(){
		//회원리스트 굵게표시 Start
		$("#leftmenu .bgmenu .submenu li").removeAttr("class");
		$("#leftmenu .bgmenu .submenu #memberList").addClass("select");
		//회원리스트 굵게표시 END
		
		//체크박스 Start
		$("#check_user_id").change(function(){		
			if($("#check_user_id").prop("checked")){
				$("input[name=user_idCheck]").prop("checked",true);
			}else{
				$("input[name=user_idCheck]").prop("checked",false);
			}
		});
		//체크박스 END
		
		//회원 일괄처리 Start
		$(".boxContainer02 #send_email").click(function(){
			var items=[];
			
			$('input[name=user_idCheck]:checked').each(function(){
				items.push($(this).val());
			});
			if(items.length<1){
				alert("자료를 선택하세요");
			}
			else{
				window.open("member/popup/sendMail.do?users="+items,"_blank","top=0,left=0,width="+750+",height="+635+",toolbar=no,status=no,scrollbars=no,resizable=no");
			}
		});
		
		$(".boxContainer02 #give_mile").click(function(){
			var items=[];
			
			$('input[name=user_idCheck]:checked').each(function(){
				items.push($(this).val());
			});
			if(items.length<1){
				alert("자료를 선택하세요");
			}
			else{
				window.open("member/popup/reserve.do?users="+items,"_blank","top=0,left=0,width="+600+",height="+400+",toolbar=no,status=no,scrollbars=no,resizable=no");
			}
		});
		
		$(".boxContainer02 #secede_user").click(function(){
			var items=[]; //체크된값을의 value을 집어넣음 userid
			$('input[name=user_idCheck]:checked').each(function(){
				items.push($(this).val().trim());
			});
			if(items.length<1){
				alert("자료를 선택하세요");
			}
			else{
				if (confirm("선택된 회원을 탈퇴 하시겠습니까?") == true){    //확인
					  $.ajax({
					      url:"secede.do", // 메일보내기
					      async:true,// false 일 경우 동기 요청으로 변경
					      type:'GET', // GET, PUT
					      data: {
					    	  'users':items
					      },// 전송할 데이터
					      dataType:'text',// xml, json, script, html
					      success:function(jqXHR) {
					    	  if(jqXHR.trim()=="success"){
									alert("삭제완료");
									location.reload();
					    	  }else if(jqXHR.trim()=="fail"){
					    		 	 alert("삭제실패 DB예외");
					    	  }
					      },// 요청 완료 시
					      error:function(jqXHR) {
					    	  alert("알수없는에러\n"+jqXHR);
					      }// 요청 실패
					  }); //ajax
				}else{   //취소
				}
			}
		});
		//회원 일괄처리 END
		
		//자동 비밀번호 설정 STart
		$(".edit_passwd003").click(function(){
			var id=$(this).attr("user_id");  
			window.open("member/popup/autopwd.do?id="+id,"_blank","top=0,left=0,width="+600+",height="+200+",toolbar=no,status=no,scrollbars=no,resizable=no");
		});
		//자동비번 END
		
		$(".view_user003").click(function(){
			var id=$(this).attr("user_id"); 
			window.open("member/popup/memberViewMain.do?id="+id,"_blank","top=0,left=0,width="+850+",height="+600+",toolbar=no,status=no,scrollbars=yes,resizable=no");
		});
		
		
		//검색 Start
		$("#submit1").click(function(){
			var mode=$("select[name=mode] option:selected").val();
			var keyword=$("#keyword").val();
			if(keyword.length<1){
				alert("키워드를 입력해주세요");
			}else{
				$("#searchForm").submit();
			}

			
		});
		//검색 End
	});
</script>