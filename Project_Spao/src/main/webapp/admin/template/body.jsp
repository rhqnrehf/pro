<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- begin of Body -->
<td valign="top">
<div class="mainbodylayout">
	<table cellpadding="0" cellspacing="0" border="0" width="1000">
		<colgroup><col width="198">
		<col width="802">
		</colgroup><tbody><tr>
			<!--begin of Body left-->
			<td class="mainleftlayout" valign="top">

				<!--내정보부분-->
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody><tr>
						<td class="boxTop"><strong>관리자님</strong> 환영합니다.</td>
					</tr>
					<tr>
						<td class="boxMiddle">
							<ul>
								<li>관리자등급</li>
								<li class="buln">: <strong>
								<c:choose>
									<c:when test="${spaoAdminDTO.title==1}">
										최상위 관리자
									</c:when>
									<c:otherwise>관리자</c:otherwise>
								</c:choose>
								<!-- 관리자 등급 --></strong></li>
								<li>관리자 별명 : ${spaoAdminDTO.name}</li> <!-- 관리자 아이디 -->
								<li>도메인</li>
								<li class="buln">: <span title="쇼핑몰주소">쇼핑몰주소</span></li>
								<c:if test="${spaoAdminDTO.title==1}">
									<li>Admin 관리 <a href="#"><img src="images/button/btn_setup.gif" class="floatR"></a></li>
									<li class="buln">:최상위 관리자한테만보임 </li>
								</c:if>
							</ul>


						</td>
					</tr>
					<tr>
						<td><img src="images/main/bg_leftmenu_bottom.gif"></td>
					</tr>
				</tbody></table>

				
			</td>
			<!--End of Body left-->
			<!--begin of Body right-->
			<td valign="top">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody><tr>
						<td><img src="images/main/bg_bodyrightTop.gif"></td>
					</tr>
					<tr>
						<td class="bodyrightlayout">

							<table cellpadding="0" cellspacing="0" border="0" width="802">
								<colgroup><col width="599">
								<col width="203">
								</colgroup><tbody><tr>
									<td class="bodyrightContainer" valign="top">
										<table cellpadding="0" cellspacing="0" border="0">
											<colgroup><col width="360">
											<col width="227">
											</colgroup><tbody><tr>
												<td>
													<div class="bg_title01">쇼핑몰 현황</div>
													<table cellpadding="0" cellspacing="0" border="0" class="shoppingmallinfo">
														<colgroup><col width="87">
														<col width="63">
														<col width="64">
														<col width="57">
														<col width="62">
														</colgroup><thead>
															<tr><th>항목</th>
															<th class="today">오늘</th>
															<th>어제</th>
															<th>지난주</th>
															<th>이번달</th>
														</tr></thead>
														<tbody>
															<tr>
																<td class="title">주문금액(원)</td>
																<td><strong>0</strong></td>
																<td>0</td>
																<td>0</td>
																<td class="rborder">0</td>
															</tr>
															<tr>
																<td class="title">주문 수(건)</td>
																<td><strong>0</strong></td>
																<td>0</td>
																<td>0</td>
																<td class="rborder">0</td>
															</tr>
															<tr>
																<td class="title">매출액(원)</td>
																<td><strong>0</strong></td>
																<td>0</td>
																<td>0</td>
																<td class="rborder">0</td>
															</tr>
															<tr>
																<td class="title">신규회원(명)</td>
																<td><strong>0</strong></td>
																<td>0</td>
																<td>0</td>
																<td class="rborder">0</td>
															</tr>
															<tr>
																<td class="title">방문자 수(명)</td>
																<td><strong>0</strong></td>
																<td>0</td>
																<td>0</td>
																<td class="rborder">0</td>
															</tr>
															<tr>
																<td class="title">새 등록 글(건)</td>
																<td><strong>0</strong></td>
																<td>0</td>
																<td>0</td>
																<td class="rborder">0</td>
															</tr>
															<tr>
																<td class="title">1:1문의(건)</td>
																<td><strong>0</strong></td>
																<td>0</td>
																<td>0</td>
																<td class="rborder">0</td>
															</tr>
														</tbody>
													</table>
												</td>

											</tr>
										</tbody></table>

																				
																				<!--주문처리별현황 START-->
										<div id="main_module01" value="ORDER" style="background-color:#FFFFFF;">
											<div class="bg_title02">
												<table cellpadding="0" cellspacing="0" border="0" width="542">
													<tbody><tr>
														<td><a href="?act=buy.buy_main&amp;ch=buy">주문처리별 현황</a></td>
														<td align="right">
															<span id="main_module_handler01" style="cursor:pointer;"><img src="images/main/btn_move.gif"></span>
														</td>
													</tr>
												</tbody></table>
											</div>
											<table cellpadding="0" cellspacing="0" border="0" class="buyprocess" height="80">
												<tbody><tr height="50">
													<td class="f01" width="66">입금<br>대기</td>
													<td class="f01" width="66">입금<br>완료</td>
													<td class="f01" width="66">배송<br>준비</td>
													<td class="f01" width="66">배송중</td>
													<td class="f02" width="66">오늘<br>배송완료</td>
													<td class="f03" width="66">주문<br>취소</td>
													<td class="f03" width="66">환불중</td>
													<td class="f03" width="66">반품중</td>
													<td class="f03" width="56">교환중</td>
												</tr>
												<tr height="30">
													<td class="f04"><a href="?act=buy.buy_pay_wait_list&amp;ch=buy">0건</a></td>
													<td class="f04"><a href="?act=buy.buy_pay_ok_list&amp;ch=buy">0건</a></td>
													<td class="f04"><a href="?act=buy.buy_dlv_wait_list&amp;ch=buy">0건</a></td>
													<td class="f04"><a href="?act=buy.buy_dlv_ing_list&amp;ch=buy">0건</a></td>
													<td class="f04"><a href="?act=buy.buy_dlv_ok_list&amp;ch=buy">0건</a></td>
													<td class="f04"><a href="?act=buy.buy_cancel_list&amp;ch=buy">0건</a></td>
													<td class="f04"><a href="?act=buy.buy_refund_list&amp;ch=buy">0건</a></td>
													<td class="f04"><a href="?act=buy.buy_return_wait_list&amp;ch=buy">0건</a></td>
													<td class="f04"><a href="?act=buy.buy_exch_wait_list&amp;ch=buy">0건</a></td>
												</tr>
											</tbody></table>
										</div>
										<!--주문처리별현황 END-->

										
																				<!--Best of Best START-->
										<div id="main_module05" value="BEST" style="background-color:#FFFFFF;">
											<div class="bg_title02">
												<table cellpadding="0" cellspacing="0" border="0" width="542">
													<tbody><tr>
														<td><a href="?act=goods&amp;ch=goods">Best of Best</a></td> <!-- 상품관리 주소 -->
														<td align="right">
															<span id="main_module_handler05" style="cursor:pointer;"><img src="images/main/btn_move.gif"></span>
														</td>
													</tr>
												</tbody></table>
											</div>
											<table cellpadding="0" cellspacing="0" border="0">
												<colgroup><col width="281">
												<col width="10">
												<col width="286">
												</colgroup><tbody><tr valign="top">
													<td>
														<ul class="roundbox">
															<li><img src="images/main/bg_roundbox_left.gif"></li>
															<li class="text" style="width:269px">인기상품 Best 5</li>
															<li><img src="images/main/bg_roundbox_right.gif"></li>
														</ul>
														<div class="bestlist">
															<table cellpadding="0" cellspacing="0" border="0">
																<colgroup><col width="27">
																<col width="146">
																<col width="28">
																<col width="34">
																<col width="46">
																</colgroup><thead>
																	<tr><th>순위</th>
																	<th>상품명</th>
																	<th>조회</th>
																	<th>주문</th>
																	<th class="noborder">매출액</th>
																</tr></thead>
																<tbody>
																	<tr>
																	<!--  
																		Ajax활용 인기상품 Best5
																		<td class="rank"><img src="images/common/icon_num01_01.gif"></td>
																		<td class="title"><a href="/?act=shop.goods_view&amp;GS=30" target="good_view" title="오선스니커즈">오선스니커즈</a></td>
																		<td class="num">114</td>
																		<td class="num">1</td>
																		<td class="num">26,000</td>
																	-->
																	</tr>
																</tbody>
															</table>
														</div>
													</td>
													<td></td>
													<td>
														<ul class="roundbox">
															<li><img src="images/main/bg_roundbox_left.gif"></li>
															<li class="text" style="width:273px">단골고객 Best 5</li>
															<li><img src="images/main/bg_roundbox_right.gif"></li>
														</ul>
														<div class="bestlist">
															<table cellpadding="0" cellspacing="0" border="0">
																<colgroup><col width="27">
																<col width="150">
																<col width="35">
																<col width="34">
																<col width="46">
																</colgroup><thead>
																	<tr><th>순위</th>
																	<th>고객명</th>
																	<th>로그인</th>
																	<th>주문</th>
																	<th class="noborder">매출액</th>
																</tr></thead>
																<tbody>
															</tbody>
															</table>
														</div>
													</td>
												</tr>
											</tbody></table>
										</div>
										<!--Best of Best END-->
										
																				
										<br>

									</td>
									<!--begin of banner 우측--> 
									<td align="center" valign="top">


									</td>
									<!--End of banner-->
								</tr>
							</tbody></table>

						</td>
					</tr>
					<tr>
						<td><img src="images/main/bg_bodyrightBottom.gif"></td>
					</tr>
				</tbody></table>



			</td>
			<!--End of Body right-->
		</tr>
	</tbody></table>
</div>
</td>
<!-- End of Body -->