<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SPAO OneClick</title>
<link rel="stylesheet" href="../css/oneclick.css">
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css"> -->
<!-- <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script> -->
<script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
<!-- <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript" src="../js/jquery.xdomainrequest.js"></script>
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
<script src="../js/common.js"></script><!-- 공통 스크립트 -->
<script src="../js/searchAddr.js"></script><!-- 주소찾기 스크립트 -->
<script src="../js/jquery.modalLayer.js"></script><!-- 모달팝업 -->
    
</head>
<body class="popScroll">
    	<div id="popWrapper">
			



<script type="text/javascript">

$(document).ready(function () {

    $("#searchKeyword").keydown(function (key) {
        if (key.keyCode == 13) {
        	searchAddr();
        }
    });

});



function searchAddr() {
	var cityNm = $("#select-item1 option:selected").val();
	var schNm = $("#searchKeyword").val();  //동,읍,면
	
	if (cityNm == "") {
		alert("시/도를 선택해주세요.");
		return;
	}
	if (schNm == "") {
		alert("동/읍/면을 입력해주세요.");
		return;
	}
	
	// 주소찾기
	searchPostNo("../post/checkPost.do", cityNm, schNm);  //->searchAddr.js 로
}

function searchAddrCallBack(result) {
	 var strHtml = "";
	 var obj=result;
	 
	 if (obj.list.length > 0) {
		 for (var i=0; i<obj.list.length; i++) {
			 	var address=obj.list[i].sido+" "+obj.list[i].sigungu+" "+obj.list[i].yubmyundong+" "
			 	+obj.list[i].roadname+" "+obj.list[i].ri+" "
				+obj.list[i].buildingname;
				 strHtml += "<tr>";
				 strHtml += "<td><span>"+obj.list[i].zipcode +"</span></td>";
				 strHtml += "<td class='taL'><a href='#'>"+address+"</a></td>";
				 strHtml += "</tr>";
			
		 }
		 
		 if (strHtml == "") {
			 strHtml += "<tr>";
			 strHtml += "<td colspan='2' class='result_none'>";
			 strHtml += "<p class='taC'>우편번호 검색 결과가 없습니다.<br>동/읍/면을 입력해 주세요</p>";
			 strHtml += "</tr>";
		 }
	 } else {
		 strHtml += "<tr>";
		 strHtml += "<td colspan='2' class='result_none'>";
		 strHtml += "<p class='taC'>우편번호 검색 결과가 없습니다.<br>동/읍/면을 입력해 주세요</p>";
		 strHtml += "</tr>";
	 }
	 
	 $("#tbody_addr").html("");
	 $("#tbody_addr").append(strHtml);
	 $("#div_addrList").css("display", "block");
}



</script>
<div class="popupBox">
	<div class="popTitle taC"><h1>주소검색</h1></div>
	<div class="popContent">
		<p class="cntGuide taC">원하는 주소 검색방법을 선택해 주세요.</p>
		
		<div class="tabBox pop mt30">
			<ul class="srchTabMenu">
				<li><h2><a href="#" class="current">지번 주소로 찾기</a></h2></li>
				<li><h2><a href="../join/searchRoadAddr.do">도로명 주소로 찾기</a></h2></li>
			</ul>
			<div class="viewDiv">
				<p class="guideTxt">찾고자 하는 지역의 동(읍/면)명을 입력해 주세요. <br><span class="f_point">예) 삼성동</span></p>
				<div class="addrSearch">
					<fieldset>
						<legend class="blind">주소 찾기</legend>
						<div class="selectBox w222">
							<label for="select-item1">시/도 선택</label>
							<select class="select" id="select-item1">
							</select>
						</div><!-- // selectBox -->
					<input type="text" id="searchKeyword" name="searchKeyword" class="input_text w216" placeholder="동/읍/면" title="동/읍/면">
				</fieldset>
			</div><!-- // addrSearch -->

			<div class="btnDiv taC mt20">
				<button type="button" class="btn blue pop" onclick="javascript:searchAddr();"><span>조회</span></button>
			</div>
			
			<div id="div_addrList" style="display:none">
				<p class="guideTxt mt20">범위에 해당하는 주소를 선택하세요.</p>
				<div class="boardList headFix mt10">
					<div class="listHead"></div>
					<div class="scrollBody">
						<table cellspacing="0" summary="우편번호, 주소">
							<caption>목록</caption>
							<colgroup>
								<col width="110px">
								<col width="*">
							</colgroup>
							<thead>
								<tr>
									<th class="postNum"><div class="th_inner">우편번호</div></th>
									<th class="addr"><div class="th_inner">주소</div></th>
								</tr>
							</thead>
							<tbody id="tbody_addr">
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
		</div><!-- // viewDiv -->
	</div><!-- // tabBox -->

</div><!-- // popContent -->
	
</div>

		</div>
    
</body>
</html>