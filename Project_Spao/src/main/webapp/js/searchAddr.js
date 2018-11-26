$(document).ready(function(){
	var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	   for(var i=0;i<area0.length;i++){
		   $(".addrSearch .selectBox #select-item1").append($("<option>",{
			   value:area0[i],
			   text:area0[i],
		   }));
	   }
	   
	   $(document).on("click",".taL a",function(){      //동적으로 생성된 태그에 이벤트
			var addr1=$(this).text().replace(/	/g, '');       //집주소 중간 탭 제거
			$(opener.document).find("#td_addr #addr").val($(this).text()); //클릭한 a링크 후손태그 찾아서  집주소 얻어옴

			window.close();
			$(opener.document).find("#addrDetail").focus();
		});
});
function searchPostNo(url,city,sch){
	$.ajax({
		type : 'POST',
		async:true,
		url : url,
		data:{
			sido : city,
			dong :sch,
		},
		dataType : "json",
		success : function(data){
			searchAddrCallBack(data);  //콜백함수 searchAddr
		}
	}); //ajax
}

