package member.bean;

import lombok.Data;

@Data
public class MemberPaging {
	private int currentPage;//현재 페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//한페이지에 몇개의 유저를
	private int totalA;//총유저수
	private StringBuffer pagingHTML;

	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//

		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		pagingHTML.append("<a class='first' href='memberList.do?pg="+(1)+"'><img src='images/default/button/btn_navi_arrLL.gif' border='0' align='absmiddle'></a>");
		if(startPage > pageBlock)
			pagingHTML.append("<a class='pre' href='memberList.do?pg="+(startPage-1)+"'><img src='images/default/button/btn_navi_arrL.gif' border='0' align='absmiddle'></a>");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='on' href='memberList.do?pg="+i+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='nomal' href='memberList.do?pg="+i+"'>"+i+"</a>");
		}
		
		if(endPage < totalP)
			pagingHTML.append("<a class='next' href='memberList.do?pg="+(endPage+1)+"'><img src='images/default/button/btn_navi_arrR.gif' border='0' align='absmiddle'></a>");
		pagingHTML.append("<a class='last' href='memberList.do?pg="+(totalP)+"'><img src='images/default/button/btn_navi_arrRR.gif' border='0' align='absmiddle'></a>");
	}
}
