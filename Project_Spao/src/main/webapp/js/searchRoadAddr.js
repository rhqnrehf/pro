$(document).ready(function(){
	var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	   
	   for(var i=0;i<area0.length;i++){
		   $(".addrSearch .selectBox #select-item1").append($("<option>",{
			   value:area0[i],
			   text:area0[i],
		   }));
	   }
	
	   $(".addrSearch .selectBox #select-item1").change(function(){  //시도 변경이벤트
		  var sido=$(this).val();
		  $("#label_sigungu").text("");
		  $(".addrSearch .selectBox #select-item12 option").remove();
		 
		  if(sido=="시/도 선택"){
			  $("#label_sigungu").text("시/군/구 선택");
			  return;
		  }
		  else if(sido=="서울특별시"){
			  for(var i=0;i<area1.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area1[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area1[i],
					  text:area1[i],
				  }));
			  }
		  }
		  
		  else if(sido=="인천광역시"){
			  for(var i=0;i<area2.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area2[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area2[i],
					  text:area2[i],
				  }));
			  }
		  }else if(sido=="대전광역시"){
			  for(var i=0;i<area3.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area3[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area3[i],
					  text:area3[i],
				  }));
			  }
			  
		  }else if(sido=="광주광역시"){
			  for(var i=0;i<area4.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area4[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area4[i],
					  text:area4[i],
				  }));
			  }
			  
		  }else if(sido=="대구광역시"){
			  for(var i=0;i<area5.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area5[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area5[i],
					  text:area5[i],
				  }));
			  }
		  }else if(sido=="울산광역시"){
			  for(var i=0;i<area6.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area6[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area6[i],
					  text:area6[i],
				  }));
			  }
		  }else if(sido=="부산광역시"){
			  for(var i=0;i<area7.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area7[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area7[i],
					  text:area7[i],
				  }));
			  }
		  }else if(sido=="경기도"){
			  for(var i=0;i<area8.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area8[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area8[i],
					  text:area8[i],
				  }));
			  }
		  }else if(sido=="강원도"){
			  for(var i=0;i<area9.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area9[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area9[i],
					  text:area9[i],
				  }));
			  }
		  }else if(sido=="충청북도"){
			  for(var i=0;i<area10.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area10[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area10[i],
					  text:area10[i],
				  }));
			  }
		  }else if(sido=="충청남도"){
			  for(var i=0;i<area11.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area11[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area11[i],
					  text:area11[i],
				  }));
			  }
		  }else if(sido=="전라북도"){
			  for(var i=0;i<area12.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area12[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area12[i],
					  text:area12[i],
				  }));
			  }
		  }else if(sido=="전라남도"){
			  for(var i=0;i<area13.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area13[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area13[i],
					  text:area13[i],
				  }));
			  }
		  }else if(sido=="경상북도"){
			  for(var i=0;i<area14.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area14[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area14[i],
					  text:area14[i],
				  }));
			  }
		  }else if(sido=="경상남도"){
			  for(var i=0;i<area15.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area15[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area15[i],
					  text:area15[i],
				  }));
			  }
		  }else if(sido=="제주도"){
			  for(var i=0;i<area16.length;i++){
				  if(i==0){
					  $("#label_sigungu").text(area16[i]);
				  }
				  $(".addrSearch .selectBox #select-item12").append($("<option>",{
					  value:area16[i],
					  text:area16[i],
				  }));
			  }
		  }
	   }); //change
	   
	   $(document).on("click",".taL a",function(){      //동적으로 생성된 태그에 이벤트
			var addr1=$(this).text().replace(/	/g, '');       //집주소 중간 탭 제거
			$(opener.document).find("#td_addr #addr").val($(this).text()); //클릭한 a링크 후손태그 찾아서  집주소 얻어옴

			window.close();
			$(opener.document).find("#addrDetail").focus();
		});
});

function searchPostNo(url,city,guNm,roadNm){
	$.ajax({
		type : 'POST',
		async:true,
		url : url,
		data:{
			sido : city,
			sigungu :guNm,
			roadname:roadNm
		},
		dataType : "json",
		success : function(data){
			searchAddrCallBack(data);  //콜백함수 searchAddr
		}
	}); //ajax
}


